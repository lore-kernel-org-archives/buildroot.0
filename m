Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD9BCD5BAB
	for <buildroot@archiver.kernel.org>; Thu, 13 Nov 2025 09:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3229740D3B;
	Thu, 13 Nov 2025 09:53:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xplgyF8EzQ_i; Thu, 13 Nov 2025 09:53:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 015B940D54
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 015B940D54;
	Thu, 13 Nov 2025 09:53:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B067158
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A40B8409EC
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:53:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uIsQdV_o4-Ui for <buildroot@buildroot.org>;
 Thu, 13 Nov 2025 09:53:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 875DE40A10
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 875DE40A10
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:53:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 846EF845F5; Thu, 13 Nov 2025 09:53:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 13 Nov 2025 10:46:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 37d3a2dee346267df51627fc31829da47e568b7c
X-Git-Newrev: db7b3ea057e900e28c59ca8934f0e64927eb1348
X-Patchwork-Hint: ignore
Message-Id: <20251113095342.846EF845F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/expect: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=db7b3ea057e900e28c59ca8934f0e64927eb1348
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Package is unmaintained and causes build errors with gcc >= 14.x:
https://sourceforge.net/p/expect/bugs/107

Fixes:
https://autobuild.buildroot.net/results/425/425dadaa4a75eae9331351172839402a197749a5/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |   2 -
 Config.in.legacy                                   |   6 ++
 package/Config.in                                  |   1 -
 package/expect/0001-enable-cross-compilation.patch | 120 ---------------------
 .../expect/0002-allow-tcl-build-directory.patch    |  34 ------
 package/expect/Config.in                           |   7 --
 package/expect/expect.hash                         |   4 -
 package/expect/expect.mk                           |  21 ----
 8 files changed, 6 insertions(+), 189 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 713b9d9a07..f1a089aac5 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -361,8 +361,6 @@ package/exim/0001-Build-buildconfig-for-the-host.patch lib_patch.Upstream
 package/exim/0002-Don-t-make-backup-copies-of-installed-files.patch lib_patch.Upstream
 package/exim/0003-Skip-version-check-and-symlink-installation.patch lib_patch.Upstream
 package/exim/S86exim lib_sysv.Indent lib_sysv.Variables
-package/expect/0001-enable-cross-compilation.patch lib_patch.Upstream
-package/expect/0002-allow-tcl-build-directory.patch lib_patch.Upstream
 package/fail2ban/S60fail2ban Shellcheck lib_sysv.Variables
 package/fakedate/fakedate Shellcheck
 package/falcosecurity-libs/0001-cmake-Permit-setting-GRPC_CPP_PLUGIN.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 6562046378..36ff082164 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_PACKAGE_EXPECT
+	bool "expect has been removed"
+	select BR2_LEGACY
+	help
+	  expect is unmaintained and has been removed
+
 config BR2_PACKAGE_BCTOOLBOX
 	bool "bctoolbox has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 0de585ff9c..6ea9bf176d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1524,7 +1524,6 @@ endif
 	source "package/tcl/Config.in"
 if BR2_PACKAGE_TCL
 menu "Tcl libraries/modules"
-	source "package/expect/Config.in"
 	source "package/tcllib/Config.in"
 endmenu
 endif
diff --git a/package/expect/0001-enable-cross-compilation.patch b/package/expect/0001-enable-cross-compilation.patch
deleted file mode 100644
index fd31a01f11..0000000000
--- a/package/expect/0001-enable-cross-compilation.patch
+++ /dev/null
@@ -1,120 +0,0 @@
-From: Andrew Ruder <andrew.ruder@elecsyscorp.com>
-Subject: [PATCH] enable cross compilation for expect
-
-This patch was created by running ./configure on a modern Linux machine
-and inserting the results into the cross compilation section of
-each AC_MSG_CHECKING that bombed out with an error.
-
-Signed-off-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>
----
-
-Index: expect-5.45/configure.in
-===================================================================
---- expect-5.45.orig/configure.in	2013-11-14 07:59:58.732100595 -0600
-+++ expect-5.45/configure.in	2013-11-14 07:59:58.732100595 -0600
-@@ -481,7 +481,7 @@
- ,
- 	AC_MSG_RESULT(no)
- ,
--	AC_MSG_ERROR([Expect can't be cross compiled])
-+	AC_MSG_RESULT(no)
- )
- 
- AC_MSG_CHECKING([if any value exists for WNOHANG])
-@@ -506,7 +506,8 @@
- 	AC_MSG_RESULT(no)
- 	AC_DEFINE(WNOHANG_BACKUP_VALUE, 1)
- ,
--	AC_MSG_ERROR([Expect can't be cross compiled])
-+	AC_MSG_RESULT(yes)
-+	AC_DEFINE(WNOHANG_BACKUP_VALUE, 1)
- )
- 
- #
-@@ -574,7 +575,7 @@
- 	AC_DEFINE(REARM_SIG)
- ,
- 	AC_MSG_RESULT(no)
--, AC_MSG_WARN([Expect can't be cross compiled])
-+, AC_MSG_RESULT(no)
- )
- 
- # HPUX7 has trouble with the big cat so split it
-@@ -725,7 +726,7 @@
- ,
-         AC_MSG_RESULT(no)
- ,
--	AC_MSG_ERROR([Expect can't be cross compiled])
-+	AC_MSG_RESULT(no)
- )
- 
- # mach systems have include files for unimplemented features
-@@ -749,7 +750,9 @@
- ,
-         AC_MSG_RESULT(no)
- ,
--	AC_MSG_ERROR([Expect can't be cross compiled])
-+    AC_DEFINE(HAVE_TERMIO)
-+    PTY_TYPE=termios
-+	AC_MSG_RESULT(yes)
- )
- 
-   # now check for the new style ttys (not yet posix)
-@@ -771,7 +774,9 @@
-   ,
-         AC_MSG_RESULT(no)
-   ,
--	AC_MSG_ERROR([Expect can't be cross compiled])
-+        AC_DEFINE(HAVE_TERMIOS)
-+        PTY_TYPE=termios
-+        AC_MSG_RESULT(yes)
-   )
- fi
- 
-@@ -794,7 +799,7 @@
- ,
- 	AC_MSG_RESULT(no)
- ,
--	AC_MSG_ERROR([Expect can't be cross compiled])
-+	AC_MSG_RESULT(no)
- )
- 
- AC_MSG_CHECKING([if TIOCGWINSZ in termios.h])
-@@ -816,7 +821,7 @@
- ,
- 	AC_MSG_RESULT(no)
- ,
--	AC_MSG_ERROR([Expect can't be cross compiled])
-+	AC_MSG_RESULT(no)
- )
- 
- # finally check for Cray style ttys
-@@ -837,7 +842,7 @@
- ,
- 	AC_MSG_RESULT(no)
- ,
--	AC_MSG_ERROR([Expect can't be cross compiled])
-+	AC_MSG_RESULT(no)
- )
- 
- #
-@@ -869,7 +874,9 @@
- AC_HAVE_FUNCS(getpty)
- 
- # following test sets SETPGRP_VOID if setpgrp takes 0 args, else takes 2
--AC_FUNC_SETPGRP
-+cat >>expect_cf.h <<\_ACEOF
-+#define SETPGRP_VOID 1
-+_ACEOF
- 
- #
- # check for timezones
-@@ -889,7 +896,7 @@
- 	AC_MSG_RESULT(yes),
- 	AC_MSG_RESULT(no)
- ,
--	AC_MSG_ERROR([Expect can't be cross compiled])
-+	AC_MSG_RESULT(yes)
- )
- 
- 
diff --git a/package/expect/0002-allow-tcl-build-directory.patch b/package/expect/0002-allow-tcl-build-directory.patch
deleted file mode 100644
index 83ede7acb6..0000000000
--- a/package/expect/0002-allow-tcl-build-directory.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From: Andrew Ruder <andrew.ruder@elecsyscorp.com>
-Subject: [PATCH] Allow tcl build directory for linking
-
-Some small changes to use TCL_BUILD_LIB_SPEC instead of TCL_LIB_SPEC for
-linking against tcl directly out of its build directory.
-
-Signed-off-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>
----
-
-Index: expect-5.45/Makefile.in
-===================================================================
---- expect-5.45.orig/Makefile.in	2013-11-14 07:59:58.732100595 -0600
-+++ expect-5.45/Makefile.in	2013-11-14 07:59:58.732100595 -0600
-@@ -393,7 +393,7 @@
- 		@LDFLAGS_DEFAULT@ \
- 		-o expect exp_main_exp.o \
- 		@EXP_BUILD_LIB_SPEC@ \
--		@TCL_LIB_SPEC@ \
-+		@TCL_BUILD_LIB_SPEC@ \
- 		@TCL_DL_LIBS@ @PKG_LIBS@ @MATH_LIBS@ \
- 		@TCL_CC_SEARCH_FLAGS@ \
- 		@EXP_CC_SEARCH_FLAGS@
-Index: expect-5.45/tclconfig/tcl.m4
-===================================================================
---- expect-5.45.orig/tclconfig/tcl.m4	2010-11-09 13:42:10.000000000 -0600
-+++ expect-5.45/tclconfig/tcl.m4	2013-11-14 08:02:08.424100580 -0600
-@@ -412,6 +412,7 @@
-     AC_SUBST(TCL_LIB_FILE)
-     AC_SUBST(TCL_LIB_FLAG)
-     AC_SUBST(TCL_LIB_SPEC)
-+    AC_SUBST(TCL_BUILD_LIB_SPEC)
- 
-     AC_SUBST(TCL_STUB_LIB_FILE)
-     AC_SUBST(TCL_STUB_LIB_FLAG)
diff --git a/package/expect/Config.in b/package/expect/Config.in
deleted file mode 100644
index 67dfe643b2..0000000000
--- a/package/expect/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_EXPECT
-	bool "expect"
-	help
-	  Expect is a tool for automating interactive applications
-	  such as telnet, ftp, passwd, fsck, rlogin, ssh, tip, etc.
-
-	  https://core.tcl.tk/expect/
diff --git a/package/expect/expect.hash b/package/expect/expect.hash
deleted file mode 100644
index c4815abb07..0000000000
--- a/package/expect/expect.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# From https://sourceforge.net/projects/expect/files/Expect/5.45.4/expect5.45.4.tar.gz.SHA256
-sha256  49a7da83b0bdd9f46d04a04deec19c7767bb9a323e40c4781f89caf760b92c34  expect5.45.4.tar.gz
-# Locally calculated
-sha256  b2415b17dc8d9a287f4509047ef5ac3436baef7ba7c50faef5222dcdf61a2bab  README
diff --git a/package/expect/expect.mk b/package/expect/expect.mk
deleted file mode 100644
index 44bf74af46..0000000000
--- a/package/expect/expect.mk
+++ /dev/null
@@ -1,21 +0,0 @@
-################################################################################
-#
-# expect
-#
-################################################################################
-
-EXPECT_VERSION = 5.45.4
-EXPECT_SITE = https://sourceforge.net/projects/expect/files/Expect/$(EXPECT_VERSION)
-EXPECT_SOURCE = expect$(EXPECT_VERSION).tar.gz
-EXPECT_LICENSE = Public domain
-EXPECT_LICENSE_FILES = README
-
-# 0001-enable-cross-compilation.patch
-EXPECT_AUTORECONF = YES
-EXPECT_DEPENDENCIES = tcl
-EXPECT_CONF_OPTS = --with-tcl=$(BUILD_DIR)/tcl-$(TCL_VERSION)/unix
-
-# Since we don't want examples installed
-EXPECT_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-binaries
-
-$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
