From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 26 Oct 2013 11:07:42 +0200
Subject: [Buildroot] [git commit] libpng: bump to version 1.6.6
Message-ID: <20131026093658.875F29BBC9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2e5f5b39962e755db89c75ad9b9ebae6f35f4367
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpng/libpng.mk |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index f5bf956..5ce828e 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,15 +4,16 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.4.12
-LIBPNG_SERIES = 14
-LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.bz2
+LIBPNG_VERSION = 1.6.6
+LIBPNG_SERIES = 16
+LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng${LIBPNG_SERIES}/$(LIBPNG_VERSION)
 LIBPNG_LICENSE = libpng license
 LIBPNG_LICENSE_FILES = LICENSE
 LIBPNG_INSTALL_STAGING = YES
 LIBPNG_DEPENDENCIES = host-pkgconf zlib
 LIBPNG_CONFIG_SCRIPTS = libpng$(LIBPNG_SERIES)-config libpng-config
+LIBPNG_CONF_OPT = $(if $(BR2_ARM_CPU_HAS_NEON),--enable-arm-neon=yes,--enable-arm-neon=no)
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
