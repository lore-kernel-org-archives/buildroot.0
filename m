From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 15 Sep 2013 20:48:05 +0200
Subject: [Buildroot] [git commit] squid: fix build failure after bump
Message-ID: <20130915185135.D13E29B750@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=710e0b4d69c2fd334cfdda0bbd5e35545e4414a6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add missing patch, fixes:
http://autobuild.buildroot.net/results/f6a/f6a6dd1f3138406d1daa31e5e4ff5d5026b3c069/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/squid/squid-02-atomic-cross.patch |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/package/squid/squid-02-atomic-cross.patch b/package/squid/squid-02-atomic-cross.patch
new file mode 100644
index 0000000..c1b59dc
--- /dev/null
+++ b/package/squid/squid-02-atomic-cross.patch
@@ -0,0 +1,17 @@
+AC_RUN_IFELSE is bad for cross compiling, switch to AC_COMPILE_IFELSE
+since it's enough for this test.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura squid-3.3.9.orig/configure.ac squid-3.3.9/configure.ac
+--- squid-3.3.9.orig/configure.ac	2013-09-13 09:15:32.473365627 -0300
++++ squid-3.3.9/configure.ac	2013-09-13 13:27:06.829711487 -0300
+@@ -392,7 +392,7 @@
+ dnl Check for atomic operations support in the compiler
+ dnl
+ AC_MSG_CHECKING([for GNU atomic operations support])
+-AC_RUN_IFELSE([AC_LANG_PROGRAM([[
++AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
+     int n = 0;
+ ]],[[
+     __sync_add_and_fetch(&n, 10); // n becomes 10
