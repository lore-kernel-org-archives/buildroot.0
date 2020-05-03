From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  4 May 2020 01:07:53 +0200
Subject: [Buildroot] [PATCH 3/4] package/libpng: enable neon support for
 aarch64
In-Reply-To: <20200503230754.3071098-1-romain.naour@gmail.com>
References: <20200503230754.3071098-1-romain.naour@gmail.com>
Message-ID: <20200503230754.3071098-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

NEON support is enabled by default on aarch64, so we
can enable it unconditionaly.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/libpng/libpng.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 5c30a4f9ad..1a83c7e712 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -15,7 +15,7 @@ LIBPNG_DEPENDENCIES = host-pkgconf zlib
 HOST_LIBPNG_DEPENDENCIES = host-pkgconf host-zlib
 LIBPNG_CONFIG_SCRIPTS = libpng$(LIBPNG_SERIES)-config libpng-config
 
-ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
+ifeq ($(BR2_ARM_CPU_HAS_NEON)$(BR2_aarch64),y)
 LIBPNG_CONF_OPTS += --enable-arm-neon
 else
 LIBPNG_CONF_OPTS += --disable-arm-neon
-- 
2.25.4
