From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Oct 2012 11:21:43 +0200
Subject: [Buildroot] [PATCH] unionfs: add patch to disable search for the
	C++ compiler
Message-ID: <1350206503-22821-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes

  http://autobuild.buildroot.org/results/9c4a9897dda1b99cc7a57af605301b53ed32b95d/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/unionfs/unionfs-fuse-no-cxx-needed.patch |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 package/unionfs/unionfs-fuse-no-cxx-needed.patch

diff --git a/package/unionfs/unionfs-fuse-no-cxx-needed.patch b/package/unionfs/unionfs-fuse-no-cxx-needed.patch
new file mode 100644
index 0000000..56f7e24
--- /dev/null
+++ b/package/unionfs/unionfs-fuse-no-cxx-needed.patch
@@ -0,0 +1,19 @@
+By default, CMake assumes a project uses the C and C++ languages, so
+it checks for both the C and the C++ compiler to exist.
+
+However, unionfs-fuse is written purely in C, so checking for a C++
+compiler is useless, and even prevents unionfs-fuse from building
+properly on targets for which no C++ compiler is available.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/CMakeLists.txt
+===================================================================
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-project(unionfs-fuse)
++project(unionfs-fuse C)
+ 
+ cmake_minimum_required(VERSION 2.0)
+ INCLUDE (CheckIncludeFiles)
-- 
1.7.9.5
