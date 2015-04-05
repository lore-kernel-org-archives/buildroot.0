From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Apr 2015 18:12:56 +0200
Subject: [Buildroot] [git commit] libtirpc: turn last patch into a Git
	formatted patch
Message-ID: <20150405161344.1DEE381941@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=47e9cde426e20866701e6bcad42882151f3c64cb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit modifies the last libtirpc patch to be a Git formatted
patch, i.e that can easily be imported using 'git am'.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-config-needs-pthread-as-private-library.patch} |   23 ++++++++++++++-----
 1 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/package/libtirpc/0007-needs-pthread.patch b/package/libtirpc/0007-pkg-config-needs-pthread-as-private-library.patch
similarity index 50%
rename from package/libtirpc/0007-needs-pthread.patch
rename to package/libtirpc/0007-pkg-config-needs-pthread-as-private-library.patch
index 6cdf98a..f83b9e2 100644
--- a/package/libtirpc/0007-needs-pthread.patch
+++ b/package/libtirpc/0007-pkg-config-needs-pthread-as-private-library.patch
@@ -1,4 +1,7 @@
-pkg-config: needs pthread as private library
+From 308705710d40ced3ea2a913d24ab99cc61bef01f Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sun, 5 Apr 2015 18:11:25 +0200
+Subject: [PATCH] pkg-config: needs pthread as private library
 
 libtirpc needs pthreads. This is automatically pulled in when linking
 with the shared library, thanks to the DT_NEEDED ELF tags.
@@ -9,17 +12,25 @@ required libraries.
 Thus, add -pthread to the private libraries in the pkg-config file.
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
 ---
 Patch sent upstream:
     http://sourceforge.net/p/libtirpc/mailman/message/33072076/
 
-diff -durN libtirpc-0.2.4.orig/libtirpc.pc.in libtirpc-0.2.4/libtirpc.pc.in
---- libtirpc-0.2.4.orig/libtirpc.pc.in	2013-12-09 21:59:51.000000000 +0100
-+++ libtirpc-0.2.4/libtirpc.pc.in	2014-11-23 14:02:58.677760108 +0100
-@@ -8,4 +8,5 @@
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ libtirpc.pc.in | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libtirpc.pc.in b/libtirpc.pc.in
+index ec4cf75..1dc85ea 100644
+--- a/libtirpc.pc.in
++++ b/libtirpc.pc.in
+@@ -8,4 +8,5 @@ Description: Transport Independent RPC Library
  Requires:
  Version: @PACKAGE_VERSION@
  Libs: -L at libdir@ -ltirpc
 +Libs.private: -pthread
  Cflags: -I at includedir@/tirpc
+-- 
+2.1.0
+
