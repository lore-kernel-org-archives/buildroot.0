From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 23 Apr 2019 22:41:13 +0200
Subject: [Buildroot] [PATCH v1] package/libinput: bump version to 1.13.1
Message-ID: <20190423204113.20563-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 - for changelog see [1] and [2]
 - removed 0001-meson.build-enable-CPP-include-check-only-in-case-CP.patch
   (upstream applied, see [3])

[1] https://lists.freedesktop.org/archives/wayland-devel/2019-March/040363.html
[2] https://lists.freedesktop.org/archives/wayland-devel/2019-April/040403.html
[3] https://gitlab.freedesktop.org/libinput/libinput/commit/4516ba977c1e22d01da4cc50a8ebffa5d11d73f1

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...le-CPP-include-check-only-in-case-CP.patch | 54 -------------------
 package/libinput/libinput.hash                | 10 ++--
 package/libinput/libinput.mk                  |  2 +-
 3 files changed, 6 insertions(+), 60 deletions(-)
 delete mode 100644 package/libinput/0001-meson.build-enable-CPP-include-check-only-in-case-CP.patch

diff --git a/package/libinput/0001-meson.build-enable-CPP-include-check-only-in-case-CP.patch b/package/libinput/0001-meson.build-enable-CPP-include-check-only-in-case-CP.patch
deleted file mode 100644
index 341f6eb11d..0000000000
--- a/package/libinput/0001-meson.build-enable-CPP-include-check-only-in-case-CP.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 3656db7fd23d166238cb8816c0d097095911b3fc Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Sat, 12 Jan 2019 10:22:38 +0100
-Subject: [PATCH] meson.build: enable CPP include check only in case CPP
- compiler is available
-
-Drop hard meson C++/CPP dependency, only needed for the build-time
-header inclusion test, build the test only in case C++/CPP compiler
-is available.
-
-Upstream: https://gitlab.freedesktop.org/libinput/libinput/commit/4516ba977c1e22d01da4cc50a8ebffa5d11d73f1
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
-[Rebased on 1.12.6, add upstream link]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
----
- meson.build | 16 +++++++++-------
- 1 file changed, 9 insertions(+), 7 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 8127c674..86960d84 100644
---- a/meson.build
-+++ b/meson.build
-@@ -1,4 +1,4 @@
--project('libinput', 'c', 'cpp',
-+project('libinput', 'c',
- 	version : '1.12.6',
- 	license : 'MIT/Expat',
- 	default_options : [ 'c_std=gnu99', 'warning_level=2' ],
-@@ -642,12 +642,14 @@ executable('test-build-linker',
- 	   include_directories : [includes_src, includes_include],
- 	   dependencies : [ dep_libinput, dep_libinput_util ],
- 	   install : false)
--# test including from C++
--executable('test-build-cxx',
--	   'test/build-cxx.cc',
--	   dependencies : [dep_udev],
--	   include_directories : [includes_src, includes_include],
--	   install : false)
-+# test including from C++ (in case CPP compiler is available)
-+if add_languages('cpp', required: false)
-+	executable('test-build-cxx',
-+		   'test/build-cxx.cc',
-+		   dependencies : [dep_udev],
-+		   include_directories : [includes_src, includes_include],
-+		   install : false)
-+endif
-
- # This is the test suite runner, we allow disabling that one because of
- # dependencies
---
-2.20.1
-
diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 15be6d71e2..a8f9c10690 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2019-January/039864.html
-md5 8cf10cc0fdfab865b105dd28283fa0fd libinput-1.12.6.tar.xz
-sha1 e3044cd2073312c24a315df1be4aa38da6bb2bbd libinput-1.12.6.tar.xz
-sha256 12b4023a3fc683d3d8127db573bdf925a2ef366615042f69c87e57c32a50f45d libinput-1.12.6.tar.xz
-sha512 02ad90c77a0c8c27fd96ec34e1546c5f0947ced49bad386372c1ef7c41b3b2157c39020f0766f20aaf2ab3c97128567e169279bea21115ced39499dda325d2ef libinput-1.12.6.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2019-April/040403.html
+md5 869a7e68c4290d99868500a369645def libinput-1.13.1.tar.xz
+sha1 a0338e5f2ff2cecbb88f91e5bf363f9b66770be2 libinput-1.13.1.tar.xz
+sha256 e1d487d478ee2bb118890a64211c2b7f2348aaed7363b214bed4d642274841ab libinput-1.13.1.tar.xz
+sha512 a19deec802e704038df0901c103a82a3370f56e0299f4cc1b6aa84c1832a66fb638e6f9d0fa708b51df6c3b939cdc1271e4ff547c645c566be03dce0bc9ff7e0 libinput-1.13.1.tar.xz

 # License files
 sha256 70d5b1dfe5a9c50a1f2ea91b1c2b1c85d876c5c92339585edbb85cf69e945e14 COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 450fd26a24..f497b1b677 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-LIBINPUT_VERSION = 1.12.6
+LIBINPUT_VERSION = 1.13.1
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
--
2.21.0
