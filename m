Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DD4C27C53
	for <buildroot@archiver.kernel.org>; Sun, 16 Jun 2024 18:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A38014054C;
	Sun, 16 Jun 2024 18:07:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PtT-ZkogqFTJ; Sun, 16 Jun 2024 18:07:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF86940577
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF86940577;
	Sun, 16 Jun 2024 18:07:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 520871BF2BD
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 18:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D62180F32
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 18:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YLgtCwP1DMpd for <buildroot@lists.busybox.net>;
 Sun, 16 Jun 2024 18:07:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3B57F80EC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B57F80EC6
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B57F80EC6
 for <buildroot@buildroot.org>; Sun, 16 Jun 2024 18:07:51 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-35f1a7386d5so3330310f8f.3
 for <buildroot@buildroot.org>; Sun, 16 Jun 2024 11:07:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718561269; x=1719166069;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DLuQ4x8Ey9MlX2egANCSh2PqHWybw7GhXgSviqEpxrg=;
 b=q+dSx21hmAn2OWDlVCxBaKmmkw5u5YB6GYFNECiO2DGhoxyP5I/tlMmZVo9LaX7JUF
 UyurI4VE1BsjT4bvLpgeC93Wv276XGczEwfMw6RNWq0a1XWuWx3HfNlwPMAZW72DqGP1
 qrWdrhcyG5HNvQM7wUQM4yXpcnDXb/6BqrVxMOyXzIAuj/NqePLHeOBcMjsS9EjuUM7N
 5GAF0hR0DrhpyZ3+vf5/3VJzt08NS603OgeG4tPvZLo/k/YfFlIUlhA5fKairucM3Haf
 NCM8Tit2Osj9jr4C2K4sGPWbz/92lhUKY3K/OYz6X/JMkC8FY88stBMIdPpMofZmiyku
 FKNg==
X-Gm-Message-State: AOJu0YxzLPXnsR2LxyGj8v6W1q0nlmXQlHKtLYS0LX6WhRf9BhPLNaMz
 6Lw3ydAJfygWKKatcfDho4/jXcO3Y00WJcfTi1Qw8tTViigmX4z9ZJBiCQ==
X-Google-Smtp-Source: AGHT+IELHr04nGFj104+iN/TWliBQoNP2vGq4FyamVwkmpv3jIwpbNdpGgqDBOqX8ONeo/xmHlbtmA==
X-Received: by 2002:adf:eccc:0:b0:35f:2197:dbff with SMTP id
 ffacd0b85a97d-3607a7b65fdmr4595564f8f.24.1718561269127; 
 Sun, 16 Jun 2024 11:07:49 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36075093a4asm10079012f8f.21.2024.06.16.11.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jun 2024 11:07:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jun 2024 20:07:42 +0200
Message-ID: <20240616180742.4000901-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718561269; x=1719166069; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DLuQ4x8Ey9MlX2egANCSh2PqHWybw7GhXgSviqEpxrg=;
 b=kC7NyDTzo/nhCYqfR1vNBFbgbwgHGC2fBAeTMgQzCSH9V+HQUIhlklWz8MRVFi1tla
 pb35gxHNn9UH4OgNd/aZsmECzHtdGigpgoxMdUJ5t97MkBYrduGKDEUdp4U2S4Bg1/jv
 0Z/zUDQy1bZFvJIMpCIpIBU2HCXt3RwRaRsd46HTOAFuo1pOMMvXfVNw2oDF8F80G7dh
 JQ+4Xy+DI9Cbc+dL1Bo8SFGEzz70m0WqKpF8AHLEHyLUoxSgVQg5gMjEzm1+PjV6wj0V
 xfTbz2b0UXixchhBlJH/au3BKXhQH3pSIeQA1ea1BmY4qmOATNN7FSYdmVzNap3WQqOG
 /65Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kC7NyDTz
Subject: [Buildroot] [PATCH 1/1] package/beecrypt: drop package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As advocated by Yann E. Morin [1], drop beecrypt as package is not
maintained anymore.

This will also avoid the following build failure with gcc 14:

blockmode.c: In function 'blockEncryptCTR':
blockmode.c:162:42: error: implicit declaration of function 'swapu32' [-Wimplicit-function-declaration]
  162 |                                 buf[i] = swapu32(fdback[j]);
      |                                          ^~~~~~~

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20240615204233.3339310-1-fontaine.fabrice@gmail.com

Fixes:
 - http://autobuild.buildroot.org/results/651e0e31305b1f211071d94ea74f7b7a5793b03e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |   3 -
 Config.in.legacy                              |   7 +
 package/Config.in                             |   1 -
 .../0001-cppglue.cxx-cplusplus-only.patch     |  28 ---
 package/beecrypt/0002-build-system.patch      | 173 ------------------
 ...3-don-t-check-for-cplusplus-compiler.patch |  27 ---
 package/beecrypt/Config.in                    |  10 -
 package/beecrypt/beecrypt.hash                |   3 -
 package/beecrypt/beecrypt.mk                  |  39 ----
 9 files changed, 7 insertions(+), 284 deletions(-)
 delete mode 100644 package/beecrypt/0001-cppglue.cxx-cplusplus-only.patch
 delete mode 100644 package/beecrypt/0002-build-system.patch
 delete mode 100644 package/beecrypt/0003-don-t-check-for-cplusplus-compiler.patch
 delete mode 100644 package/beecrypt/Config.in
 delete mode 100644 package/beecrypt/beecrypt.hash
 delete mode 100644 package/beecrypt/beecrypt.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index 7ff88cb837..441e0926bc 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -413,9 +413,6 @@ package/bctoolbox/0001-Fix-Libs.private-flags-for-mbedtls.patch lib_patch.Upstre
 package/bcusdk/0001-fd_set-requires-inclusion-of-sys-select.h.patch lib_patch.Upstream
 package/bcusdk/0002-eibd-fix-endless-recursion-when-using-USB-backends.patch lib_patch.Upstream
 package/bearssl/0001-Fix-missing-objdir-dependency.patch lib_patch.Upstream
-package/beecrypt/0001-cppglue.cxx-cplusplus-only.patch lib_patch.Upstream
-package/beecrypt/0002-build-system.patch lib_patch.Upstream
-package/beecrypt/0003-don-t-check-for-cplusplus-compiler.patch lib_patch.Upstream
 package/benejson/0001-c-std.patch lib_patch.Upstream
 package/benejson/0002-Use-print-as-a-function-for-Py3-compatibility.patch lib_patch.Upstream
 package/berkeleydb/0001-cwd-db_config.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 29c386bec4..697937fe47 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2024.08"
 
+config BR2_PACKAGE_BEECRYPT
+	bool "beecrypt package removed"
+	select BR2_LEGACY
+	help
+	  The beecrypt package was removed as it is not maintained
+	  anymore (no release since 2015).
+
 config BR2_PACKAGE_VERSAL_FIRMWARE
 	bool "versal-firmware has been replaced by xilinx-prebuilt"
 	select BR2_TARGET_XILINX_PREBUILT
diff --git a/package/Config.in b/package/Config.in
index 2f332e96d5..d197320eed 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1538,7 +1538,6 @@ endmenu
 
 menu "Crypto"
 	source "package/bearssl/Config.in"
-	source "package/beecrypt/Config.in"
 	source "package/botan/Config.in"
 	source "package/ca-certificates/Config.in"
 	source "package/cryptodev-linux/Config.in"
diff --git a/package/beecrypt/0001-cppglue.cxx-cplusplus-only.patch b/package/beecrypt/0001-cppglue.cxx-cplusplus-only.patch
deleted file mode 100644
index 298e3eba93..0000000000
--- a/package/beecrypt/0001-cppglue.cxx-cplusplus-only.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Makefile.am: Only compile/link cppglue.cxx if --with-cplusplus is used
-
-Bloats libbeecrypt for no use and breaks build on systems without a C++
-compiler.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- Makefile.am |    7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-Index: beecrypt-4.2.1/Makefile.am
-===================================================================
---- beecrypt-4.2.1.orig/Makefile.am
-+++ beecrypt-4.2.1/Makefile.am
-@@ -62,7 +62,12 @@
- 
- lib_LTLIBRARIES = libbeecrypt.la
- 
--libbeecrypt_la_SOURCES = aes.c base64.c beecrypt.c blockmode.c blockpad.c blowfish.c dhies.c dldp.c dlkp.c dlpk.c dlsvdp-dh.c dsa.c elgamal.c endianness.c entropy.c fips186.c hmac.c hmacmd5.c hmacsha1.c hmacsha224.c hmacsha256.c md4.c md5.c hmacsha384.c hmacsha512.c memchunk.c mp.c mpbarrett.c mpnumber.c mpprime.c mtprng.c pkcs1.c pkcs12.c ripemd128.c ripemd160.c ripemd256.c ripemd320.c rsa.c rsakp.c rsapk.c sha1.c sha224.c sha256.c sha384.c sha512.c sha2k32.c sha2k64.c timestamp.c cppglue.cxx
-+libbeecrypt_la_SOURCES = aes.c base64.c beecrypt.c blockmode.c blockpad.c blowfish.c dhies.c dldp.c dlkp.c dlpk.c dlsvdp-dh.c dsa.c elgamal.c endianness.c entropy.c fips186.c hmac.c hmacmd5.c hmacsha1.c hmacsha224.c hmacsha256.c md4.c md5.c hmacsha384.c hmacsha512.c memchunk.c mp.c mpbarrett.c mpnumber.c mpprime.c mtprng.c pkcs1.c pkcs12.c ripemd128.c ripemd160.c ripemd256.c ripemd320.c rsa.c rsakp.c rsapk.c sha1.c sha224.c sha256.c sha384.c sha512.c sha2k32.c sha2k64.c timestamp.c
-+
-+if WITH_CPLUSPLUS
-+libbeecrypt_la_SOURCES += cppglue.cxx
-+endif
-+
- libbeecrypt_la_DEPENDENCIES = $(BEECRYPT_OBJECTS)
- libbeecrypt_la_LIBADD = blowfishopt.lo mpopt.lo sha1opt.lo $(OPENMP_LIBS)
- libbeecrypt_la_LDFLAGS = -no-undefined -version-info $(LIBBEECRYPT_LT_CURRENT):$(LIBBEECRYPT_LT_REVISION):$(LIBBEECRYPT_LT_AGE)
diff --git a/package/beecrypt/0002-build-system.patch b/package/beecrypt/0002-build-system.patch
deleted file mode 100644
index 05746899ef..0000000000
--- a/package/beecrypt/0002-build-system.patch
+++ /dev/null
@@ -1,173 +0,0 @@
-Fix build with BR2_ENABLE_DEBUG=yes, no need for expert mode anymore
-
-Otherwise configure issues this error message:
-configure: error: --enable-debug cannot be used in conjunction with --enable-expert-mode
-
-Downloaded from Gentoo:
-http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-libs/beecrypt/files/beecrypt-4.2.1-build-system.patch?revision=1.2&view=markup
-
-This patch also removes the hard-coded CFLAGS provided by beecrypt in favour
-of the CFLAGS provided by buildroot.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
---- beecrypt-4.2.1/configure.ac
-+++ beecrypt-4.2.1/configure.ac
-@@ -11,7 +11,7 @@
- 
- # Checks for package options
- AC_ARG_ENABLE(expert-mode, [  --enable-expert-mode      follow user-defined CFLAGS settings [[default=no]]],[
--  ac_enable_expert_mode=yes
-+  ac_enable_expert_mode=$enableval
-   ],[
-   if test "X$CFLAGS" != "X"; then
-     echo "enabling expert mode"
-@@ -25,7 +25,7 @@
-   if test "$ac_enable_expert_mode" = yes; then
-     AC_MSG_ERROR([--enable-debug cannot be used in conjunction with --enable-expert-mode])
-   fi
--  ac_enable_debug=yes
-+  ac_enable_debug=$enableval
-   ],[
-   ac_enable_debug=no
-   ])
-@@ -456,7 +456,7 @@
-       ac_cv_python_include="-I`$PYTHON -c 'import distutils.sysconfig; print distutils.sysconfig.get_python_inc()'`"
-     ])
-     AC_CACHE_CHECK([where to install python libraries], ac_cv_python_libdir, [
--      ac_cv_python_libdir=`$PYTHON -c 'import distutils.sysconfig; print distutils.sysconfig.get_python_lib()'`
-+      ac_cv_python_libdir=`$PYTHON -c 'import distutils.sysconfig; print distutils.sysconfig.get_python_lib(1, 0)'`
-     ])
-   fi
- fi
---- beecrypt-4.2.1/acinclude.m4
-+++ beecrypt-4.2.1/acinclude.m4
-@@ -498,15 +498,6 @@ AC_DEFUN([BEE_GNU_CC],[
-     AC_SUBST(OPENMP_LIBS,"-lgomp")
-   fi
-   case $bc_target_arch in
--  x86_64 | athlon64 | athlon-fx | k8 | opteron | em64t | nocona)
--    CC="$CC -m64"
--    ;;
--  i[[3456]]86 | \
--  pentium* | \
--  athlon*)
--    CC="$CC -m32"
--    CCAS="$CCAS -m32"
--    ;;
-   ia64)
-     case $target_os in
-     # HP/UX on Itanium needs to be told that a long is 64-bit!
-@@ -525,17 +516,8 @@ AC_DEFUN([BEE_GNU_CC],[
-     aix*)
-       CC="$CC -maix64"
-       ;;
--    linux*)
--      CC="$CC -m64"
--      ;;
-     esac
-     ;;
--  sparc | sparcv8*)
--    CC="$CC -m32"
--    ;;
--  sparc64 | sparcv9*)
--    CC="$CC -m64"
--    ;;
-   esac
-   # Certain platforms needs special flags for multi-threaded code
-   if test "$ac_enable_threads" = yes; then
-@@ -646,14 +646,6 @@ dnl  BEE_GNU_CXX
- AC_DEFUN([BEE_GNU_CXX],[
-   AC_REQUIRE([AC_PROG_CXX])
-   case $bc_target_arch in
--  x86_64 | athlon64 | athlon-fx | k8 | opteron | em64t | nocona | core2)
--    CXX="$CXX -m64"
--    ;;
--  i[[3456]]86 | \
--  pentium* | \
--  athlon*)
--    CXX="$CXX -m32"
--    ;;
-   ia64)
-     case $target_os in
-     # HP/UX on Itanium needs to be told that a long is 64-bit!
-@@ -672,17 +664,8 @@ AC_DEFUN([BEE_GNU_CXX],[
-     aix*)
-       CXX="$CXX -maix64"
-       ;;
--    linux*)
--      CXX="$CXX -m64"
--      ;;
-     esac
-     ;;
--  sparc | sparcv8*)
--    CXX="$CXX -m32"
--    ;;
--  sparc64 | sparcv9*)
--    CXX="$CXX -m64"
--    ;;
-   esac
-   # Certain platforms needs special flags for multi-threaded code
-   if test "$ac_enable_threads" = yes; then
---- beecrypt-4.2.1/java/Makefile.am
-+++ beecrypt-4.2.1/java/Makefile.am
-@@ -26,7 +26,7 @@
- 
- INCLUDES = -I$(top_srcdir)/include
- 
--libaltdir=$(prefix)/lib@LIBALT@
-+libaltdir=$(libdir)
- 
- libalt_LTLIBRARIES = libbeecrypt_java.la
- 
---- beecrypt-4.2.1/acinclude.m4
-+++ beecrypt-4.2.1/acinclude.m4
-@@ -1589,20 +1589,5 @@
-   AC_SUBST(TYPEDEF_BC_THREADID_T,$bc_typedef_bc_threadid_t)
-   ])
--
--AH_BOTTOM([
--#if ENABLE_THREADS
--# ifndef _REENTRANT
--#  define _REENTRANT
--# endif
--# if LINUX
--#  define _LIBC_REENTRANT
--# endif
--#else
--# ifdef _REENTRANT
--#  undef _REENTRANT
--# endif
--#endif
--])
- 
- 
- dnl  BEE_THREAD_LOCAL_STORAGE
-@@ -1623,7 +1609,5 @@
-   ])
- 
- AH_BOTTOM([
--#if !ENABLE_THREAD_LOCAL_STORAGE
--# define __thread
--#endif
-+#include "config.threads.h"
- ])
---- beecrypt-4.2.1/config.threads.h
-+++ beecrypt-4.2.1/config.threads.h
-@@ -0,0 +1,16 @@
-+#if ENABLE_THREADS
-+# ifndef _REENTRANT
-+#  define _REENTRANT
-+# endif
-+# if LINUX
-+#  define _LIBC_REENTRANT
-+# endif
-+#else
-+# ifdef _REENTRANT
-+#  undef _REENTRANT
-+# endif
-+#endif
-+
-+#if !ENABLE_THREAD_LOCAL_STORAGE
-+# define __thread
-+#endif
diff --git a/package/beecrypt/0003-don-t-check-for-cplusplus-compiler.patch b/package/beecrypt/0003-don-t-check-for-cplusplus-compiler.patch
deleted file mode 100644
index 32f167996f..0000000000
--- a/package/beecrypt/0003-don-t-check-for-cplusplus-compiler.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-configure.ac: don't check for C++ compiler
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-
-diff -durN beecrypt-4.2.1-orig/configure.ac beecrypt-4.2.1/configure.ac
---- beecrypt-4.2.1-orig/configure.ac	2019-03-01 19:58:16.516117640 +0100
-+++ beecrypt-4.2.1/configure.ac	2019-03-01 21:10:17.707391803 +0100
-@@ -119,9 +119,6 @@
- 
- # Checks for C compiler and preprocessor
- AC_PROG_CC
--AC_PROG_CPP
--AC_PROG_CXX
--AC_PROG_CXXCPP
- AM_PROG_AS
- AC_PROG_LD
- AC_PROG_LN_S
-@@ -133,9 +130,6 @@
- AC_LANG_PUSH(C)
- AC_OPENMP
- AC_LANG_POP(C)
--AC_LANG_PUSH(C++)
--AC_OPENMP
--AC_LANG_POP(C++)
- 
- # Checks for compiler characteristics and flags
- if test "$ac_enable_expert_mode" = no; then
diff --git a/package/beecrypt/Config.in b/package/beecrypt/Config.in
deleted file mode 100644
index 9aec85afdb..0000000000
--- a/package/beecrypt/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-comment "beecrypt needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
-
-config BR2_PACKAGE_BEECRYPT
-	bool "beecrypt"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	help
-	  Beecrypt is a general-purpose cryptography library.
-
-	  http://beecrypt.sf.net
diff --git a/package/beecrypt/beecrypt.hash b/package/beecrypt/beecrypt.hash
deleted file mode 100644
index 2f84007b45..0000000000
--- a/package/beecrypt/beecrypt.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  286f1f56080d1a6b1d024003a5fa2158f4ff82cae0c6829d3c476a4b5898c55d  beecrypt-4.2.1.tar.gz
-sha256  512d2d21b6b3384ba64781abb0208a1b87740bc31e2df48e2b206ddb7e4d5779  COPYING.LIB
diff --git a/package/beecrypt/beecrypt.mk b/package/beecrypt/beecrypt.mk
deleted file mode 100644
index 20e1a122d0..0000000000
--- a/package/beecrypt/beecrypt.mk
+++ /dev/null
@@ -1,39 +0,0 @@
-################################################################################
-#
-# beecrypt
-#
-################################################################################
-
-BEECRYPT_VERSION = 4.2.1
-BEECRYPT_SITE = http://downloads.sourceforge.net/project/beecrypt/beecrypt/$(BEECRYPT_VERSION)
-BEECRYPT_AUTORECONF = YES
-BEECRYPT_INSTALL_STAGING = YES
-BEECRYPT_LICENSE = LGPL-2.1+
-BEECRYPT_LICENSE_FILES = COPYING.LIB
-BEECRYPT_CPE_ID_VALID = YES
-
-BEECRYPT_CONF_OPTS = \
-	--disable-expert-mode \
-	--without-java \
-	--without-python \
-	--disable-openmp \
-	--without-cplusplus
-
-# disable optimized m68k assembly as it doesn't compile for coldfire
-ifeq ($(BR2_m68k_cf),y)
-BEECRYPT_CONF_OPTS += --enable-debug
-endif
-
-# arm asm optimization doesn't work for thumb-only
-ifeq ($(BR2_arm):$(BR2_ARM_CPU_HAS_ARM),y:)
-BEECRYPT_CONF_OPTS += --enable-debug
-endif
-
-# automake/libtool uses the C++ compiler to link libbeecrypt because of
-# (the optional) cppglue.cxx. Force it to use the C compiler instead.
-define BEECRYPT_LINK_WITH_CC
-	$(SED) 's/--tag=CXX/--tag=CC/g' $(@D)/Makefile
-endef
-BEECRYPT_POST_CONFIGURE_HOOKS += BEECRYPT_LINK_WITH_CC
-
-$(eval $(autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
