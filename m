From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Sep 2019 22:10:10 +0200
Subject: [Buildroot] [git commit] package/libcamera: bump to version
 448393f77ec9e37cb807e8e8d35c1a4877d253d4
Message-ID: <20190919201621.C400D8EC02@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc0e9bef63eecc8fb0c4f1422504a18d9d47227a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to the latest version of libcamera, including a fix for toolchains
which require libatomic to be linked manually.

The patch which handles this locally is therefore removed.

Since the last version update, the option to disable building of the
unit tests has been renamed from '-Dtests=' to '-Dtest='

This is updated accordingly.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ra-meson.build-link-with-atomic-when-need.patch | 28 ----------------------
 package/libcamera/libcamera.hash                   |  2 +-
 package/libcamera/libcamera.mk                     |  4 ++--
 3 files changed, 3 insertions(+), 31 deletions(-)

diff --git a/package/libcamera/0001-src-libcamera-meson.build-link-with-atomic-when-need.patch b/package/libcamera/0001-src-libcamera-meson.build-link-with-atomic-when-need.patch
deleted file mode 100644
index 8c34497db4..0000000000
--- a/package/libcamera/0001-src-libcamera-meson.build-link-with-atomic-when-need.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 85b7aeef3c7765c5ba7e525c63a4c0f807f0bfc8 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 5 Sep 2019 10:24:31 +0200
-Subject: [PATCH] src/libcamera/meson.build: link with atomic when needed
-
-Fixes:
- - http://autobuild.buildroot.org/results/1f0b8338f5f39aa86b9d432598dae2f53c5f7c84
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/libcamera/meson.build | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/libcamera/meson.build b/src/libcamera/meson.build
-index c5d8f11..0706a08 100644
---- a/src/libcamera/meson.build
-+++ b/src/libcamera/meson.build
-@@ -99,6 +99,7 @@ version_cpp = vcs_tag(command : [gen_version, meson.build_root()],
- libcamera_sources += version_cpp
- 
- libcamera_deps = [
-+    cc.find_library('atomic', required: false),
-     cc.find_library('dl'),
-     libudev,
-     dependency('threads'),
--- 
-2.23.0.rc1
-
diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index fc0a21670e..6f721d87ee 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,3 +1,3 @@
-sha256 4073ee3429a28b19f65f1df107b87df9ee01e58dc3372fcc0fcafd3350a31c23  libcamera-caf25dc5cfd11b965316f02610d49ae3d886716b.tar.gz
+sha256 cbaa7e06059717f71b57f9c20135c86d5f121d9aab10bfc20513ba5d04478756  libcamera-448393f77ec9e37cb807e8e8d35c1a4877d253d4.tar.gz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  licenses/gnu-gpl-2.0.txt
 sha256 592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  licenses/gnu-lgpl-2.1.txt
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 62c48607d4..d209a38df3 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -5,10 +5,10 @@
 ################################################################################
 
 LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
-LIBCAMERA_VERSION = caf25dc5cfd11b965316f02610d49ae3d886716b
+LIBCAMERA_VERSION = 448393f77ec9e37cb807e8e8d35c1a4877d253d4
 LIBCAMERA_SITE_METHOD = git
 LIBCAMERA_DEPENDENCIES = udev
-LIBCAMERA_CONF_OPTS = -Dtests=false -Ddocumentation=false
+LIBCAMERA_CONF_OPTS = -Dtest=false -Ddocumentation=false
 LIBCAMERA_INSTALL_STAGING = yes
 LIBCAMERA_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (utils)
 LIBCAMERA_LICENSE_FILES = \
