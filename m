From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 19 Sep 2017 18:14:21 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/libebur128: bump version to
	1.2.2, add hash
Message-ID: <20170919161421.31014-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream removed the speex dependency:
https://github.com/jiixyj/libebur128/commit/54d61fd072bc526c3c56c96dd7a3d0ef0678d5b0

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: removed speex dependency (Peter)

 package/libebur128/Config.in       | 1 -
 package/libebur128/libebur128.hash | 3 +++
 package/libebur128/libebur128.mk   | 3 +--
 3 files changed, 4 insertions(+), 3 deletions(-)
 create mode 100644 package/libebur128/libebur128.hash

diff --git a/package/libebur128/Config.in b/package/libebur128/Config.in
index 1a6a74363f..0d68b39d53 100644
--- a/package/libebur128/Config.in
+++ b/package/libebur128/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_LIBEBUR128
 	# build system has no support to disable shared linking
 	# leading to a build error with a static-only toolchain
 	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_SPEEX
 	help
 	  libebur128 is a library that implements the EBU R 128 standard
 	  for loudness normalization.
diff --git a/package/libebur128/libebur128.hash b/package/libebur128/libebur128.hash
new file mode 100644
index 0000000000..2b0d3e34c2
--- /dev/null
+++ b/package/libebur128/libebur128.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 1d0d7e855da04010a2432e11fbc596502caf11b61c3b571ccbcb10095fe44b43  libebur128-v1.2.2.tar.gz
+sha256 d6b4754bb67bdd08b97d5d11b2d7434997a371585a78fe77007149df3af8d09c  COPYING
diff --git a/package/libebur128/libebur128.mk b/package/libebur128/libebur128.mk
index f5ada311f7..24c2f2429a 100644
--- a/package/libebur128/libebur128.mk
+++ b/package/libebur128/libebur128.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-LIBEBUR128_VERSION = v1.1.0
+LIBEBUR128_VERSION = v1.2.2
 LIBEBUR128_SITE = $(call github,jiixyj,libebur128,$(LIBEBUR128_VERSION))
 LIBEBUR128_LICENSE = MIT
 LIBEBUR128_LICENSE_FILES = COPYING
 LIBEBUR128_INSTALL_STAGING = YES
-LIBEBUR128_DEPENDENCIES = speex
 
 $(eval $(cmake-package))
-- 
2.11.0
