From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Feb 2019 11:16:59 +0100
Subject: [Buildroot] [git commit branch/next] package/libinput: bump version
 to 1.12.6
Message-ID: <20190212101535.A87D6837F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c49c1579575c5653ecd608129a8cc0d8ceb86887
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Two quirks for specific devices, two little cleanups (for
details see [1])

- rebased 0001-meson.build-enable-CPP-include-check-only-in-case-CP.patch

[1] https://lists.freedesktop.org/archives/wayland-devel/2019-January/039864.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...son.build-enable-CPP-include-check-only-in-case-CP.patch | 13 +++++++++----
 package/libinput/libinput.hash                              | 10 +++++-----
 package/libinput/libinput.mk                                |  2 +-
 3 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/package/libinput/0001-meson.build-enable-CPP-include-check-only-in-case-CP.patch b/package/libinput/0001-meson.build-enable-CPP-include-check-only-in-case-CP.patch
index c9a0652e40..341f6eb11d 100644
--- a/package/libinput/0001-meson.build-enable-CPP-include-check-only-in-case-CP.patch
+++ b/package/libinput/0001-meson.build-enable-CPP-include-check-only-in-case-CP.patch
@@ -1,4 +1,4 @@
-From 57383dc900e76e65ce5e5dc95f776e086100344d Mon Sep 17 00:00:00 2001
+From 3656db7fd23d166238cb8816c0d097095911b3fc Mon Sep 17 00:00:00 2001
 From: Peter Seiderer <ps.report@gmx.net>
 Date: Sat, 12 Jan 2019 10:22:38 +0100
 Subject: [PATCH] meson.build: enable CPP include check only in case CPP
@@ -8,22 +8,27 @@ Drop hard meson C++/CPP dependency, only needed for the build-time
 header inclusion test, build the test only in case C++/CPP compiler
 is available.
 
+Upstream: https://gitlab.freedesktop.org/libinput/libinput/commit/4516ba977c1e22d01da4cc50a8ebffa5d11d73f1
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+[Rebased on 1.12.6, add upstream link]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
 ---
  meson.build | 16 +++++++++-------
  1 file changed, 9 insertions(+), 7 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index a9c7c185..8183822e 100644
+index 8127c674..86960d84 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -1,4 +1,4 @@
 -project('libinput', 'c', 'cpp',
 +project('libinput', 'c',
- 	version : '1.12.5',
+ 	version : '1.12.6',
  	license : 'MIT/Expat',
  	default_options : [ 'c_std=gnu99', 'warning_level=2' ],
-@@ -641,12 +641,14 @@ executable('test-build-linker',
+@@ -642,12 +642,14 @@ executable('test-build-linker',
  	   include_directories : [includes_src, includes_include],
  	   dependencies : [ dep_libinput, dep_libinput_util ],
  	   install : false)
diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 3ca3fd6771..15be6d71e2 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2019-January/039804.html
-md5  40dcc044443c9314537f605b6f30bf17 libinput-1.12.5.tar.xz
-sha1 7c0b75e8cf2f1747fb8ae69300acabd46f7a7f0d libinput-1.12.5.tar.xz
-sha256 7d4b6831010ef3bf69df4b41170047fa4325edef8ff5d2d28e78281af0687123 libinput-1.12.5.tar.xz
-sha512 9365b91b3ac2c4ff0f9927913242afac7677979682dd7b541001b13d09d7982acd854f6d348101cfa4b0854c6a92b4c683f62593a97870e32ae3d607eaeae3ff libinput-1.12.5.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2019-January/039864.html
+md5 8cf10cc0fdfab865b105dd28283fa0fd libinput-1.12.6.tar.xz
+sha1 e3044cd2073312c24a315df1be4aa38da6bb2bbd libinput-1.12.6.tar.xz
+sha256 12b4023a3fc683d3d8127db573bdf925a2ef366615042f69c87e57c32a50f45d libinput-1.12.6.tar.xz
+sha512 02ad90c77a0c8c27fd96ec34e1546c5f0947ced49bad386372c1ef7c41b3b2157c39020f0766f20aaf2ab3c97128567e169279bea21115ced39499dda325d2ef libinput-1.12.6.tar.xz
 
 # License files
 sha256 70d5b1dfe5a9c50a1f2ea91b1c2b1c85d876c5c92339585edbb85cf69e945e14 COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index bc4cc89825..450fd26a24 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.12.5
+LIBINPUT_VERSION = 1.12.6
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
