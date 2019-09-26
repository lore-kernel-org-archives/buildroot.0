From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Sep 2019 10:40:36 +0200
Subject: [Buildroot] [git commit branch/2019.08.x] package/libcamera: link
 with atomic when needed
Message-ID: <20190926083532.E49FC8F7C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dde51f1a35724e2bf9005f11b6fb05245775ac75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Fixes:
 - http://autobuild.buildroot.org/results/1f0b8338f5f39aa86b9d432598dae2f53c5f7c84

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1e0dfcd50a49f3667d4f11c339c6dd6586100df5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ra-meson.build-link-with-atomic-when-need.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/libcamera/0001-src-libcamera-meson.build-link-with-atomic-when-need.patch b/package/libcamera/0001-src-libcamera-meson.build-link-with-atomic-when-need.patch
new file mode 100644
index 0000000000..8c34497db4
--- /dev/null
+++ b/package/libcamera/0001-src-libcamera-meson.build-link-with-atomic-when-need.patch
@@ -0,0 +1,28 @@
+From 85b7aeef3c7765c5ba7e525c63a4c0f807f0bfc8 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 5 Sep 2019 10:24:31 +0200
+Subject: [PATCH] src/libcamera/meson.build: link with atomic when needed
+
+Fixes:
+ - http://autobuild.buildroot.org/results/1f0b8338f5f39aa86b9d432598dae2f53c5f7c84
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/libcamera/meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/libcamera/meson.build b/src/libcamera/meson.build
+index c5d8f11..0706a08 100644
+--- a/src/libcamera/meson.build
++++ b/src/libcamera/meson.build
+@@ -99,6 +99,7 @@ version_cpp = vcs_tag(command : [gen_version, meson.build_root()],
+ libcamera_sources += version_cpp
+ 
+ libcamera_deps = [
++    cc.find_library('atomic', required: false),
+     cc.find_library('dl'),
+     libudev,
+     dependency('threads'),
+-- 
+2.23.0.rc1
+
