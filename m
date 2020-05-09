From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 22:22:20 +0200
Subject: [Buildroot] [git commit branch/next] package/libpng: enable neon
 support for aarch64
Message-ID: <20200509200753.3FB369120F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a0da84d32fa0ce1b819ace42b70d6acf980adc62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

NEON support is enabled by default on aarch64, so we
can enable it unconditionaly.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
