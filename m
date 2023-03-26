Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01829C7619A
	for <buildroot@archiver.kernel.org>; Sun, 26 Mar 2023 21:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80E8D80D2A;
	Sun, 26 Mar 2023 21:23:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80E8D80D2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xjqvsjADp4-k; Sun, 26 Mar 2023 21:23:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44D1D8109A;
	Sun, 26 Mar 2023 21:23:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44D1D8109A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1011F1BF309
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 21:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDBFD80D2A
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 21:23:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDBFD80D2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bxr8LQ6DUNYi for <buildroot@lists.busybox.net>;
 Sun, 26 Mar 2023 21:23:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F72980D1B
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F72980D1B
 for <buildroot@buildroot.org>; Sun, 26 Mar 2023 21:23:31 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 d11-20020a05600c3acb00b003ef6e6754c5so711986wms.5
 for <buildroot@buildroot.org>; Sun, 26 Mar 2023 14:23:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679865810;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tv3zykUAD/XCUOXuDecoZQRuKDuvWNnOxcfko2vJGLM=;
 b=fWnRb+QZ3IDzUU3RUUFEvveTWBFwBq6tuJ4Wl5rN5RJmfUiw2vHSmBjU+oJMExw2VX
 T+YCUh97jmhILAzDpMZ9RNchotugHrYf33JKaWjFMZM36IhDg8NRxRsF1TTJmRs9sffk
 OhUaxOlmWIYkN9H5RzyvQYytjLNKuUCGLKL6gjwIqNmBsHbR1Cvln9Gy5nQjH4/hdoO6
 YMLNOVTbsirJP6pKfiMGpxSglI0F5M50XGnmY3tCccZ6oHX3pZN6zmm5u3W0wTL3wnC9
 UHz19DB59rhlqBQy+acq/fBYoh0kGZSjVyJ94bl2//K9XFihY3tjD2uQlheU70hDn//B
 EGEQ==
X-Gm-Message-State: AO0yUKWriijPB8zb1YIDcNId2sm6Vn7eGH8vKbftdaZZoobGC2TpRnZ1
 PCvuoww7MJvzd98wJ68qFpK1SkVo/0g=
X-Google-Smtp-Source: AK7set93ozPHT26hBF7YwVK+6IrYuZzCMxF1/ZHdzPyTVFLnGYmQssQ13Mdz5gsTfpUmjFrtBcX+6g==
X-Received: by 2002:a7b:c398:0:b0:3ed:da87:3349 with SMTP id
 s24-20020a7bc398000000b003edda873349mr7463989wmj.1.1679865809567; 
 Sun, 26 Mar 2023 14:23:29 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 o39-20020a05600c512700b003edddae1068sm6640963wms.9.2023.03.26.14.23.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Mar 2023 14:23:29 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Mar 2023 23:23:27 +0200
Message-Id: <20230326212327.754174-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679865810;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tv3zykUAD/XCUOXuDecoZQRuKDuvWNnOxcfko2vJGLM=;
 b=XUkcf7M9nE5RD9VbIT6niEJl69+9wvew712ddb9F6z0lmhL67r7MH9gaAt3x4VbjNs
 Vb6VfQUZlPIdwXQHC8ndP6BNGfj3FCPwFG6t2J86nl7ip6Xx5uEP45CiVNE+jlv4bAAx
 7OQ5AL6XGAeYQ5Cx5ryU9sAZhZD5qa312P0Zot2I50ZJqLdQ7Y0R895QNI2Xk6SJVYQF
 dWGMpRwctTnNFBDIUA6i0L6c0GQgbPlTigqQ9k5HEl0Mmrrn1pQLWfdX1iwrA1RQzVlg
 y3LKHWZSygB1bxxC05P12KP5rFsKtCGg4bzeDFsIw1uWCNmbcAcFn5KWYslnK2Y5qXaL
 dItw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XUkcf7M9
Subject: [Buildroot] [PATCH 1/1] package/libmemcached: bump to version 1.1.4
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Switch to an active fork
- Switch to cmake-package
- Drop all patches (not needed anymore)
- Use LICENSE file instead of COPYING as COPYING is now a symlink to
  LICENSE
- Handle libevent and openssl dependencies

https://awesomized.github.io/libmemcached/ChangeLog-1.1.html#v-1-1-4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmemcached/0001-disable-tests.patch | 42 -------------------
 .../libmemcached/0002-disable-sanitizer.patch | 25 -----------
 .../0003-move-ac_config_aux_dir.patch         | 25 -----------
 .../0004-disable-doc-and-man.patch            | 37 ----------------
 .../0005-fix-pointer-comparaison.patch        | 30 -------------
 package/libmemcached/Config.in                |  2 +-
 package/libmemcached/libmemcached.hash        |  6 +--
 package/libmemcached/libmemcached.mk          | 39 +++++++++--------
 8 files changed, 25 insertions(+), 181 deletions(-)
 delete mode 100644 package/libmemcached/0001-disable-tests.patch
 delete mode 100644 package/libmemcached/0002-disable-sanitizer.patch
 delete mode 100644 package/libmemcached/0003-move-ac_config_aux_dir.patch
 delete mode 100644 package/libmemcached/0004-disable-doc-and-man.patch
 delete mode 100644 package/libmemcached/0005-fix-pointer-comparaison.patch

diff --git a/package/libmemcached/0001-disable-tests.patch b/package/libmemcached/0001-disable-tests.patch
deleted file mode 100644
index 6128306787..0000000000
--- a/package/libmemcached/0001-disable-tests.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-Disable the tests, cuts build time by half and avoids build issues
-with extra dependencies.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura libmemcached-1.0.18.orig/Makefile.am libmemcached-1.0.18/Makefile.am
---- libmemcached-1.0.18.orig/Makefile.am	2014-07-19 09:24:45.246418899 -0300
-+++ libmemcached-1.0.18/Makefile.am	2014-07-19 09:25:12.701349345 -0300
-@@ -1,6 +1,6 @@
- # vim:ft=automake
- 
--ACLOCAL_AMFLAGS= -I m4 -I libtest/m4
-+ACLOCAL_AMFLAGS= -I m4
- AM_YFLAGS= -d
- 
- # includes append to these:
-@@ -45,8 +45,6 @@
- include libmemcached-1.0/include.am
- else
- 
--include libtest/include.am
--
- include libhashkit-1.0/include.am
- include libmemcached-1.0/include.am
- 
-@@ -76,7 +74,6 @@
- include libmemcachedinternal/util/include.am
- include rpm/include.mk
- include support/include.am
--include tests/include.am
- include util/include.am
- include win32/include.am
- 
-@@ -103,7 +100,7 @@
- 	@echo "Files that need to be either removed or checked in:"
- 	@bzr unknowns
- 
--clean-local: clean-libtest-check clean-docs-check clean-rpm
-+clean-local: clean-docs-check clean-rpm
- 
- 
- lcov: lcov-clean check
diff --git a/package/libmemcached/0002-disable-sanitizer.patch b/package/libmemcached/0002-disable-sanitizer.patch
deleted file mode 100644
index 108da22550..0000000000
--- a/package/libmemcached/0002-disable-sanitizer.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Disable sanitizer checks, they're busted.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura libmemcached-1.0.18.orig/m4/ax_harden_compiler_flags.m4 libmemcached-1.0.18/m4/ax_harden_compiler_flags.m4
---- libmemcached-1.0.18.orig/m4/ax_harden_compiler_flags.m4	2014-11-13 08:07:09.011614311 -0300
-+++ libmemcached-1.0.18/m4/ax_harden_compiler_flags.m4	2014-11-13 08:07:52.406092440 -0300
-@@ -222,8 +222,6 @@
- #         GCC 4.5 removed this.
- #         _APPEND_COMPILE_FLAGS_ERROR([-Wunreachable-code])
- 
--          _SET_SANITIZE_FLAGS
--
-           AS_IF([test "x$ax_enable_debug" = xno],
-             [AS_IF([test "x$ac_cv_vcs_checkout" = xyes],
-               [AS_IF([test "x${host_os}" != "xmingw"],
-@@ -337,8 +335,6 @@
-                 _APPEND_COMPILE_FLAGS_ERROR([-fstack-protector-all])
-                 ])])])])
- 
--          _SET_SANITIZE_FLAGS
--
-           AS_IF([test "x$ac_cv_warnings_as_errors" = xyes],
-                 [AX_APPEND_FLAG([-Werror])])
-           AC_LANG_POP([C++])
diff --git a/package/libmemcached/0003-move-ac_config_aux_dir.patch b/package/libmemcached/0003-move-ac_config_aux_dir.patch
deleted file mode 100644
index 790aa93d29..0000000000
--- a/package/libmemcached/0003-move-ac_config_aux_dir.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Move AC_CONFIG_AUX_DIR up a few lines so the autotools can find it
-
-This patch is based on the same solution adopted by Debian:
-
-  https://lists.debian.org/debian-release/2014/11/msg01231.html
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-diff -rup a/configure.ac b/configure.ac
---- a/configure.ac	2014-02-09 11:52:42.000000000 +0000
-+++ b/configure.ac	2015-01-06 15:07:10.003074775 +0000
-@@ -13,11 +13,12 @@ m4_include([version.m4])
- AC_PREREQ([2.61])
- AC_INIT([libmemcached],VERSION_NUMBER,[http://libmemcached.org/])
- 
-+AC_CONFIG_AUX_DIR([build-aux])
-+
- # Setup the compilers early on
- AC_PROG_CC([cc gcc clang])
- AC_PROG_CXX([c++ g++ clang++])
- 
--AC_CONFIG_AUX_DIR([build-aux])
- AC_CONFIG_MACRO_DIR([m4])
- 
- AC_CANONICAL_HOST
diff --git a/package/libmemcached/0004-disable-doc-and-man.patch b/package/libmemcached/0004-disable-doc-and-man.patch
deleted file mode 100644
index 9605095899..0000000000
--- a/package/libmemcached/0004-disable-doc-and-man.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 6c01bd3562cc18fbafdf950bbeb73a399c1adcdd Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Tue, 12 May 2015 00:00:02 +0200
-Subject: [PATCH] disable doc and man
-
-WARNING: master file /home/naourr/git/buildroot/test/libmemcached-bfin/build/libmemcached-1.0.18/docs/index.rst not found
-
-Exception occurred:
-  File "/usr/lib/python2.7/site-packages/sphinx/environment.py", line 1213, in get_doctree
-    f = open(doctree_filename, 'rb')
-IOError: [Errno 2] No such file or directory: '/home/naourr/buildroot-test/test/libmemcached-bfin/build/libmemcached-1.0.18/man/.doctrees/hashkit_create.doctree'
-The full traceback has been saved in /tmp/sphinx-err-JCIsnB.log, if you want to report the issue to the developers.
-Please also report this if it was a user error, so that a better error message can be provided next time.
-Either send bugs to the mailing list at <http://groups.google.com/group/sphinx-dev/>,
-or report them in the tracker at <http://bitbucket.org/birkenfeld/sphinx/issues/>. Thanks!
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- Makefile.am | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 7f44102..cb7d058 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -55,8 +55,6 @@ endif
- include libmemcachedutil-1.0/include.am
- 
- include clients/include.am
--include docs/include.am
--include man/include.am
- 
- if BUILD_LIBMEMCACHED_PROTOCOL
- include example/include.am
--- 
-1.9.3
-
diff --git a/package/libmemcached/0005-fix-pointer-comparaison.patch b/package/libmemcached/0005-fix-pointer-comparaison.patch
deleted file mode 100644
index c9f8dd19cf..0000000000
--- a/package/libmemcached/0005-fix-pointer-comparaison.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Fix pointer comparaison
-
-opt_servers is a pointer, not a boolean, so testing against false to
-know if the pointer is NULL no longer works with the more strict gcc
-7.x checks.
-
-[Taken from http://pkgs.fedoraproject.org/cgit/rpms/libmemcached.git/plain/libmemcached-build.patch.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-diff -up ./clients/memflush.cc.old ./clients/memflush.cc
---- ./clients/memflush.cc.old	2017-02-12 10:12:59.615209225 +0100
-+++ ./clients/memflush.cc	2017-02-12 10:13:39.998382783 +0100
-@@ -39,7 +39,7 @@ int main(int argc, char *argv[])
- {
-   options_parse(argc, argv);
- 
--  if (opt_servers == false)
-+  if (!opt_servers)
-   {
-     char *temp;
- 
-@@ -48,7 +48,7 @@ int main(int argc, char *argv[])
-       opt_servers= strdup(temp);
-     }
- 
--    if (opt_servers == false)
-+    if (!opt_servers)
-     {
-       std::cerr << "No Servers provided" << std::endl;
-       exit(EXIT_FAILURE);
diff --git a/package/libmemcached/Config.in b/package/libmemcached/Config.in
index 4af2b3b0e7..57c0cb466b 100644
--- a/package/libmemcached/Config.in
+++ b/package/libmemcached/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_LIBMEMCACHED
 	  It has been designed to be light on memory usage, thread safe,
 	  and provide full access to server side methods.
 
-	  http://libmemcached.org/libMemcached.html
+	  https://awesomized.github.io/libmemcached
 
 comment "libmemcached needs a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libmemcached/libmemcached.hash b/package/libmemcached/libmemcached.hash
index ccc31ee7ed..cb9daa8ae8 100644
--- a/package/libmemcached/libmemcached.hash
+++ b/package/libmemcached/libmemcached.hash
@@ -1,5 +1,5 @@
-# From https://launchpad.net/libmemcached/1.0/1.0.18/+download/libmemcached-1.0.18.tar.gz/+md5
-md5  b3958716b4e53ddc5992e6c49d97e819  libmemcached-1.0.18.tar.gz
+# Locally computed
+sha256  c477e1f6510e1dc698e84f3717ce690a8f65b94c616ecaa62306cce0f5e3116a  libmemcached-1.1.4.tar.gz
 
 # Hash for license file:
-sha256  4e9032d0f539276db05519ee3d09ca6167d2134ec91c556e8c80ef3efe633fd2  COPYING
+sha256  65013ec8b416f28ae838ed3f23ea3ae47e5dbc70fe8492f39338e389a7970fd9  LICENSE
diff --git a/package/libmemcached/libmemcached.mk b/package/libmemcached/libmemcached.mk
index 24955266d3..35be750f6c 100644
--- a/package/libmemcached/libmemcached.mk
+++ b/package/libmemcached/libmemcached.mk
@@ -4,26 +4,29 @@
 #
 ################################################################################
 
-LIBMEMCACHED_VERSION_MAJOR = 1.0
-LIBMEMCACHED_VERSION = $(LIBMEMCACHED_VERSION_MAJOR).18
-LIBMEMCACHED_SITE = http://launchpad.net/libmemcached/$(LIBMEMCACHED_VERSION_MAJOR)/$(LIBMEMCACHED_VERSION)/+download
-LIBMEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99' \
-	ax_cv_check_cflags__Werror__fmudflapth=no \
-	ax_cv_check_cxxflags__Werror__fmudflapth=no
-LIBMEMCACHED_CONF_OPTS = --disable-dtrace
+LIBMEMCACHED_VERSION = 1.1.4
+LIBMEMCACHED_SITE = \
+	$(call github,awesomized,libmemcached,$(LIBMEMCACHED_VERSION))
+LIBMEMCACHED_CONF_OPTS = -DENABLE_DTRACE=OFF
 LIBMEMCACHED_INSTALL_STAGING = YES
-LIBMEMCACHED_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBEVENT),libevent)
-# For 0001-disable-tests.patch and 0002-disable-sanitizer.patch
-LIBMEMCACHED_AUTORECONF = YES
+LIBMEMCACHED_DEPENDENCIES = host-bison host-flex
 LIBMEMCACHED_LICENSE = BSD-3-Clause
-LIBMEMCACHED_LICENSE_FILES = COPYING
+LIBMEMCACHED_LICENSE_FILES = LICENSE
+LIBMEMCACHED_CPE_ID_VENDOR = awesome
+LIBMEMCACHED_CPE_ID_PRODUCT = libmemcached
 
-ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
-LIBMEMCACHED_CONF_ENV += \
-	ax_cv_check_cflags__Werror__fPIE=no \
-	ax_cv_check_cflags__Werror__pie=no \
-	ax_cv_check_cxxflags__Werror__fPIE=no \
-	ax_cv_check_cxxflags__Werror__pie=no
+ifeq ($(BR2_PACKAGE_LIBEVENT),y)
+LIBMEMCACHED_DEPENDENCIES += libevent
+LIBMEMCACHED_CONF_OPTS += -DENABLE_MEMASLAP=ON
+else
+LIBMEMCACHED_CONF_OPTS += -DENABLE_MEMASLAP=OFF
 endif
 
-$(eval $(autotools-package))
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBMEMCACHED_DEPENDENCIES += openssl
+LIBMEMCACHED_CONF_OPTS += -DENABLE_OPENSSL_CRYPTO=ON
+else
+LIBMEMCACHED_CONF_OPTS += -DENABLE_OPENSSL_CRYPTO=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
