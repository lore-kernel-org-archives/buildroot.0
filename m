From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 14 Oct 2012 11:38:48 +0200
Subject: [Buildroot] [git commit] unionfs: add patch to disable search for
	the C++ compiler
Message-ID: <20121014094026.479FB99866@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7b0e4f21d30cf115baa8b57a7edd7683d58ced6f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes

  http://autobuild.buildroot.org/results/9c4a9897dda1b99cc7a57af605301b53ed32b95d/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/unionfs/unionfs-fuse-no-cxx-needed.patch |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)

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
