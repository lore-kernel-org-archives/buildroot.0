From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 16 Jun 2017 06:32:59 +0300
Subject: [Buildroot] [PATCH 14/14] softether: no need to check for
	clock_gettime
In-Reply-To: <cover.1497583686.git.baruch@tkos.co.il>
References: <cover.1497583686.git.baruch@tkos.co.il>
Message-ID: <6f55ac227383749d0affcd5113dcb21db5461d47.1497583686.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Buildroot no longer supports toolchains with glibc older than 2.17, so there
is no need to check whether librt is required for clock_* system calls.

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/softether/0006-librt.patch                 | 33 ----------------------
 ...onfig.patch => 0006-uclibc-ai-addrconfig.patch} |  0
 2 files changed, 33 deletions(-)
 delete mode 100644 package/softether/0006-librt.patch
 rename package/softether/{0007-uclibc-ai-addrconfig.patch => 0006-uclibc-ai-addrconfig.patch} (100%)

diff --git a/package/softether/0006-librt.patch b/package/softether/0006-librt.patch
deleted file mode 100644
index 661c960a95d6..000000000000
--- a/package/softether/0006-librt.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Downloaded from
-https://github.com/dajhorn/SoftEtherVPN/commit/9a8538a6f2287fe8bebd0a7185de408e31e5a7df
-
-Fixes
-http://autobuild.buildroot.net/results/48f/48f778a891e0bf6a60ed2e4bec057c338ec25ec9/
-and many others
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-
-From 9a8538a6f2287fe8bebd0a7185de408e31e5a7df Mon Sep 17 00:00:00 2001
-From: Darik Horn <dajhorn@vanadac.com>
-Date: Thu, 5 Jun 2014 21:02:02 -0400
-Subject: [PATCH] Add an explicit autoconf check for librt.
-
-The realtime extensions library is not automatically linked on Debian ARM
-platforms, so do an AC_CHECK_LIB for it in the configuration macro.
----
- configure.ac | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/configure.ac b/configure.ac
-index 165623a..6f85393 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -60,6 +60,7 @@ CC="$PTHREAD_CC"
- CFLAGS="$CFLAGS $PTHREAD_CFLAGS"
- LIBS="$PTHREAD_LIBS $LIBS"
- 
-+AC_CHECK_LIB([rt],[clock_gettime])
- 
- AX_CHECK_OPENSSL([
- 	AC_SUBST(OPENSSL_LIBS)
diff --git a/package/softether/0007-uclibc-ai-addrconfig.patch b/package/softether/0006-uclibc-ai-addrconfig.patch
similarity index 100%
rename from package/softether/0007-uclibc-ai-addrconfig.patch
rename to package/softether/0006-uclibc-ai-addrconfig.patch
-- 
2.11.0
