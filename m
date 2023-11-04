Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F5EC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 21:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A4A281DE1;
	Sat,  4 Nov 2023 21:46:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A4A281DE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iVlcu1ErKaT9; Sat,  4 Nov 2023 21:46:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF02B81F6A;
	Sat,  4 Nov 2023 21:46:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF02B81F6A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B39E51BF5A7
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BA69403BE
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:46:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BA69403BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ggxCeBGP18Sb for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 21:46:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0911F40273
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 21:46:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0911F40273
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E895C8678B; Sat,  4 Nov 2023 21:46:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 22:44:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: de377bd313ef673a620b8cbbda3437d3ca5ab55c
X-Git-Newrev: 160f0e4b5f161d1966a70ad36679a9f5e9dfa9d3
X-Patchwork-Hint: ignore
Message-Id: <20231104214611.E895C8678B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpam-tacplus: bump to version
 1.7.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=160f0e4b5f161d1966a70ad36679a9f5e9dfa9d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Use official tarball
- Drop patch (already in version)
- Add patch to fix build failure
- The site that was used, https://github.com/jeroennijhof/pam_tacplus,
  now redirects to https://github.com/kravietz/pam_tacplus, so used
  this new site

https://github.com/kravietz/pam_tacplus/blob/v1.7.0/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 .../0001-Add-an-option-to-disable-Werror.patch     | 55 ----------------------
 .../0001-Remove-conflicting-man-flag.patch         | 23 +++++++++
 package/libpam-tacplus/Config.in                   |  2 +-
 package/libpam-tacplus/libpam-tacplus.hash         |  2 +-
 package/libpam-tacplus/libpam-tacplus.mk           |  8 ++--
 6 files changed, 29 insertions(+), 62 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index ff26d44a0a..a126d93901 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -720,7 +720,6 @@ package/liboping/0003-Fix-compile-break-with-GCC-7-buffer-overflow-with-snprintf
 package/liboping/0004-Fix-compile-error-on-GCC-7.patch Upstream
 package/liboping/0005-src-oping.c-always-use-s-style-format-for-printf-sty.patch Upstream
 package/libp11/0001-src-p11_attr.c-fix-build-with-gcc-4.8.patch Upstream
-package/libpam-tacplus/0001-Add-an-option-to-disable-Werror.patch Upstream
 package/libplatform/0001-cmake-require-c-11-as-the-minimum-standard.patch Upstream
 package/libpng/0001-Disable-pngfix-and-png-fix-itxt.patch Upstream
 package/libpthsem/0001-fix-build-on-linux-3.x-host.patch Upstream
diff --git a/package/libpam-tacplus/0001-Add-an-option-to-disable-Werror.patch b/package/libpam-tacplus/0001-Add-an-option-to-disable-Werror.patch
deleted file mode 100644
index 80da2f35b4..0000000000
--- a/package/libpam-tacplus/0001-Add-an-option-to-disable-Werror.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 88c78901503d50d0a62d85c96994ca4d67ab61e0 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 13 Nov 2020 20:50:27 +0100
-Subject: [PATCH] Add an option to disable -Werror
-
-Allow the user to disable -Werror to avoid the following build failure
-with gcc 4.8:
-
-libtac/lib/magic.c:138:13: error: ignoring return value of 'read', declared with attribute warn_unused_result [-Werror=unused-result]
-             (void) read(rfd, &seed, sizeof(seed));
-             ^
-
-Fixes:
- - http://autobuild.buildroot.org/results/5c17226f12eba104d907693ec37fc101cc6d447f
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- Makefile.am  | 6 +++++-
- configure.ac | 3 +++
- 2 files changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 0be3cdb..4a137e9 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -8,7 +8,11 @@
- 
- ACLOCAL_AMFLAGS = -I config
- AUTOMAKE_OPTIONS = subdir-objects
--AM_CFLAGS = -Wall -Wextra -Werror
-+AM_CFLAGS = -Wall -Wextra
-+
-+if ENABLE_WERROR
-+AM_CFLAGS += -Werror
-+endif
- 
- if TACC
- bin_PROGRAMS = tacc
-diff --git a/configure.ac b/configure.ac
-index d0c5eba..dd8a966 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -100,6 +100,9 @@ AC_SUBST(pamdir)
- AC_ARG_ENABLE(doc, AS_HELP_STRING([--disable-doc], [do not build docs]))
- AM_CONDITIONAL(DOC, test "x$enable_doc" != "xno")
- 
-+AC_ARG_ENABLE(werror, AS_HELP_STRING([--disable-werror], [do not build with -Werror]))
-+AM_CONDITIONAL(ENABLE_WERROR, test "x$enable_werror" != "xno")
-+
- dnl --------------------------------------------------------------------
- dnl Switch for run-time debugging
- AC_ARG_ENABLE(runtime-debugging, [AS_HELP_STRING([--enable-runtime-debugging],
--- 
-2.28.0
-
diff --git a/package/libpam-tacplus/0001-Remove-conflicting-man-flag.patch b/package/libpam-tacplus/0001-Remove-conflicting-man-flag.patch
new file mode 100644
index 0000000000..a832366cb1
--- /dev/null
+++ b/package/libpam-tacplus/0001-Remove-conflicting-man-flag.patch
@@ -0,0 +1,23 @@
+From 104044848ffb0a283e1f1bf3466693fa4af450e9 Mon Sep 17 00:00:00 2001
+From: Pawel Krawczyk <p+github@krvtz.net>
+Date: Mon, 7 Nov 2022 22:10:52 +0000
+Subject: [PATCH] Remove conflicting man flag
+
+Upstream: https://github.com/kravietz/pam_tacplus/commit/104044848ffb0a283e1f1bf3466693fa4af450e9
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Makefile.am | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index a481d7a..ef2b92b 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -15,7 +15,6 @@ bin_PROGRAMS = tacc
+ tacc_SOURCES = tacc.c
+ tacc_LDADD = libtac.la $(LTLIBINTL) $(LIB_CRYPTO)  $(LIB_GETRANDOM)
+ tacc_CFLAGS = $(AM_CFLAGS) -I $(top_srcdir)/libtac/include @rt_debug_defines@ -I $(top_srcdir)/lib
+-dist_man_MANS = tacc.1
+ man1_MANS = tacc.1
+ 
+ lib_LTLIBRARIES = libtac.la
diff --git a/package/libpam-tacplus/Config.in b/package/libpam-tacplus/Config.in
index 2d80809d3b..97e54a8f1b 100644
--- a/package/libpam-tacplus/Config.in
+++ b/package/libpam-tacplus/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_LIBPAM_TACPLUS
 	  management) and accounting (session management)performed
 	  using TACACS+ protocol designed by Cisco.
 
-	  https://github.com/jeroennijhof/pam_tacplus
+	  https://github.com/kravietz/pam_tacplus
diff --git a/package/libpam-tacplus/libpam-tacplus.hash b/package/libpam-tacplus/libpam-tacplus.hash
index 084a3e54a4..fc1db9fef7 100644
--- a/package/libpam-tacplus/libpam-tacplus.hash
+++ b/package/libpam-tacplus/libpam-tacplus.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  73961800dc0d5e422751ad4c9f09b1863ab33e381e0bdb2a1d0343dcfc30e44e  libpam-tacplus-1.6.1.tar.gz
+sha256  cf00e27b687c1fafe4b2cf35e648116e99e9c9832718a0d3b479bcf43370adf4  pam_tacplus-1.7.0.tar.gz
 sha256  b2b961f07e97c4fb78074276da304ea36b85dc299aae5efb79080cedaea3d5ac  COPYING
diff --git a/package/libpam-tacplus/libpam-tacplus.mk b/package/libpam-tacplus/libpam-tacplus.mk
index ff0dce9c0b..044b7207f9 100644
--- a/package/libpam-tacplus/libpam-tacplus.mk
+++ b/package/libpam-tacplus/libpam-tacplus.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBPAM_TACPLUS_VERSION = 1.6.1
-LIBPAM_TACPLUS_SITE = $(call github,jeroennijhof,pam_tacplus,v$(LIBPAM_TACPLUS_VERSION))
+LIBPAM_TACPLUS_VERSION = 1.7.0
+LIBPAM_TACPLUS_SOURCE = pam_tacplus-$(LIBPAM_TACPLUS_VERSION).tar.gz
+LIBPAM_TACPLUS_SITE = https://github.com/kravietz/pam_tacplus/releases/download/v$(LIBPAM_TACPLUS_VERSION)
 LIBPAM_TACPLUS_LICENSE = GPL-2.0+
 LIBPAM_TACPLUS_LICENSE_FILES = COPYING
 LIBPAM_TACPLUS_CPE_ID_VENDOR = pam_tacplus_project
@@ -13,8 +14,7 @@ LIBPAM_TACPLUS_CPE_ID_PRODUCT = pam_tacplus
 LIBPAM_TACPLUS_DEPENDENCIES = \
 	linux-pam \
 	$(if $(BR2_PACKAGE_OPENSSL),openssl)
-# Fetching from github, we need to generate the configure script
-# 0001-Add-an-option-to-disable-Werror.patch
+# We're patching Makefile.am
 LIBPAM_TACPLUS_AUTORECONF = YES
 LIBPAM_TACPLUS_INSTALL_STAGING = YES
 LIBPAM_TACPLUS_CONF_ENV = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
