From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:20:52 +0200
Subject: [Buildroot] [PATCH 23/69] libpng: add explicit dependencies for
	host variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-24-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/libpng/libpng.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 5f469af1659a..0dfc53590fac 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -12,6 +12,7 @@ LIBPNG_LICENSE = libpng license
 LIBPNG_LICENSE_FILES = LICENSE
 LIBPNG_INSTALL_STAGING = YES
 LIBPNG_DEPENDENCIES = host-pkgconf zlib
+HOST_LIBPNG_DEPENDENCIES = host-pkgconf host-zlib
 LIBPNG_CONFIG_SCRIPTS = libpng$(LIBPNG_SERIES)-config libpng-config
 LIBPNG_CONF_OPTS = $(if $(BR2_ARM_CPU_HAS_NEON),--enable-arm-neon=yes,--enable-arm-neon=no)
 
-- 
2.1.0
