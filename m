From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 20 Apr 2020 18:59:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/libfuse3: fix build without C++
Message-ID: <20200420165955.1271763-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/a6e64213f2910b2b81e79cb1e96e558413d7f70a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...on.build-libfuse-is-a-C-only-project.patch | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/libfuse3/0001-meson.build-libfuse-is-a-C-only-project.patch

diff --git a/package/libfuse3/0001-meson.build-libfuse-is-a-C-only-project.patch b/package/libfuse3/0001-meson.build-libfuse-is-a-C-only-project.patch
new file mode 100644
index 0000000000..d50f7cccf2
--- /dev/null
+++ b/package/libfuse3/0001-meson.build-libfuse-is-a-C-only-project.patch
@@ -0,0 +1,33 @@
+From 6e0013f549b6b586e3943b76f9359b0aa98130c0 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 20 Apr 2020 18:41:58 +0200
+Subject: [PATCH] meson.build: libfuse is a C only project
+
+Do not mandate cpp otherwise build without a C++ compiler will fail on:
+
+../output-1/build/libfuse3-3.9.1/meson.build:1:0: ERROR: Unknown compiler(s): [['/home/buildroot/autobuild/instance-2/output-1/host/bin/microblazeel-buildroot-linux-uclibc-g++']]
+The follow exceptions were encountered:
+Running "/home/buildroot/autobuild/instance-2/output-1/host/bin/microblazeel-buildroot-linux-uclibc-g++ --version" gave "[Errno 2] No such file or directory: '/home/buildroot/autobuild/instance-2/output-1/host/bin/microblazeel-buildroot-linux-uclibc-g++'"
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a6e64213f2910b2b81e79cb1e96e558413d7f70a
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/libfuse/libfuse/pull/511]
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 69b3630..4428bdb 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1,4 +1,4 @@
+-project('libfuse3', ['cpp', 'c'], version: '3.9.1',
++project('libfuse3', ['c'], version: '3.9.1',
+         meson_version: '>= 0.42',
+         default_options: [ 'buildtype=debugoptimized' ])
+ 
+-- 
+2.25.1
+
-- 
2.25.1
