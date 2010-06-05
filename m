From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 5 Jun 2010 09:00:32 +0200
Subject: [Buildroot] [git commit master] cdrkit: fix build on uClibc
Message-ID: <20100605070248.D497C5631@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1b9d9cbafde8c6687be9959493cad58d26d0546b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cdrkit unconditionally enables code using rcmd(3), which isn't available
on uClibc.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                    |    2 +-
 package/cdrkit/cdrkit-1.1.10-no-rcmd.patch |   22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+), 1 deletions(-)
 create mode 100644 package/cdrkit/cdrkit-1.1.10-no-rcmd.patch

diff --git a/CHANGES b/CHANGES
index 1f19a24..8649588 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,7 +2,7 @@
 
 	Fixes all over the tree.
 
-	Updated/fixed packages: libidn, netperf
+	Updated/fixed packages: cdrkit, libidn, netperf
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/cdrkit/cdrkit-1.1.10-no-rcmd.patch b/package/cdrkit/cdrkit-1.1.10-no-rcmd.patch
new file mode 100644
index 0000000..294779f
--- /dev/null
+++ b/package/cdrkit/cdrkit-1.1.10-no-rcmd.patch
@@ -0,0 +1,22 @@
+[PATCH] fix build with uClibc
+
+cdrkit unconditionally enables code using rcmd(3), which isn't available
+on uClibc.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ include/xconfig.h.in |    1 -
+ 1 file changed, 1 deletion(-)
+
+Index: cdrkit-1.1.10/include/xconfig.h.in
+===================================================================
+--- cdrkit-1.1.10.orig/include/xconfig.h.in
++++ cdrkit-1.1.10/include/xconfig.h.in
+@@ -187,7 +187,6 @@
+  *	they are placed before the large file tests.
+  */
+ 
+-#define HAVE_RCMD 1		/* rcmd() is present in libc/libsocket */
+ #define HAVE_SOCKET 1		/* socket() is present in libc/libsocket */
+ #define HAVE_SOCKETPAIR 1		/* socketpair() is present in libc/libsocket */
+ #define HAVE_GETSERVBYNAME 1	/* getservbyname() is present in libc/libsocket */
-- 
1.6.3.3
