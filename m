From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 10 Mar 2015 19:58:36 +0100
Subject: [Buildroot] [PATCH 1/2] package/softether: Fix compilation error
Message-ID: <1426013917-11263-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

/home/buildroot/instance-0/output/build/host-softether-16b713b98da8dba29f0f845d5a8c36d6f7c34824/src/Mayaqua/Unix.c:2066:
undefined reference to `clock_gettime'

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/softether/0006-librt.patch |   33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/softether/0006-librt.patch

diff --git a/package/softether/0006-librt.patch b/package/softether/0006-librt.patch
new file mode 100644
index 0000000..661c960
--- /dev/null
+++ b/package/softether/0006-librt.patch
@@ -0,0 +1,33 @@
+Downloaded from
+https://github.com/dajhorn/SoftEtherVPN/commit/9a8538a6f2287fe8bebd0a7185de408e31e5a7df
+
+Fixes
+http://autobuild.buildroot.net/results/48f/48f778a891e0bf6a60ed2e4bec057c338ec25ec9/
+and many others
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+
+From 9a8538a6f2287fe8bebd0a7185de408e31e5a7df Mon Sep 17 00:00:00 2001
+From: Darik Horn <dajhorn@vanadac.com>
+Date: Thu, 5 Jun 2014 21:02:02 -0400
+Subject: [PATCH] Add an explicit autoconf check for librt.
+
+The realtime extensions library is not automatically linked on Debian ARM
+platforms, so do an AC_CHECK_LIB for it in the configuration macro.
+---
+ configure.ac | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure.ac b/configure.ac
+index 165623a..6f85393 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -60,6 +60,7 @@ CC="$PTHREAD_CC"
+ CFLAGS="$CFLAGS $PTHREAD_CFLAGS"
+ LIBS="$PTHREAD_LIBS $LIBS"
+ 
++AC_CHECK_LIB([rt],[clock_gettime])
+ 
+ AX_CHECK_OPENSSL([
+ 	AC_SUBST(OPENSSL_LIBS)
-- 
1.7.10.4
