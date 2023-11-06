Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9050BC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 19:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CAF761249;
	Mon,  6 Nov 2023 19:38:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CAF761249
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FgW608LLqULY; Mon,  6 Nov 2023 19:38:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74106610F0;
	Mon,  6 Nov 2023 19:38:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74106610F0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7A3211BF951
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B11D4159B
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:38:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B11D4159B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nKGKaNo_S_eW for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 19:38:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C762400C5
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 19:38:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C762400C5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EDD1E86955; Mon,  6 Nov 2023 19:38:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 20:37:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3026934aa0a1a6b375d11e322b72476a7f6aedaf
X-Git-Newrev: ee389788af8e454251cbdb24d03710b3e1d83abc
X-Patchwork-Hint: ignore
Message-Id: <20231106193824.EDD1E86955@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/librtas: bump to version 2.0.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=ee389788af8e454251cbdb24d03710b3e1d83abc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version)
- host-pkgconf is a mandatory dependency to run autoreconf (even when
  cmocka-based tests are disabled) since
  https://github.com/ibm-power-utilities/librtas/commit/b62ecd42180d7ac7b32cac6a50802455850a857a

https://github.com/ibm-power-utilities/librtas/blob/v2.0.5/Changelog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 ...001-configure.ac-remove-LOCAL_CHECK_FLAGS.patch | 46 ----------------------
 package/librtas/librtas.hash                       |  2 +-
 package/librtas/librtas.mk                         |  3 +-
 4 files changed, 3 insertions(+), 49 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index a126d93901..ecf4ae9a85 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -726,7 +726,6 @@ package/libpthsem/0001-fix-build-on-linux-3.x-host.patch Upstream
 package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch Upstream
 package/libroxml/0001-src-roxml_mem.h-add-missing-extern.patch Upstream
 package/librsvg/0001-gdk-pixbuf-loader-Makefile.am-set-GDK_PIXBUF_MODULED.patch Upstream
-package/librtas/0001-configure.ac-remove-LOCAL_CHECK_FLAGS.patch Upstream
 package/librtlsdr/0001-Makefile.am-respect-DESTDIR-with-install-udev-rules.patch Upstream
 package/libselinux/0001-fix-musl-build.patch Upstream
 package/libselinux/0002-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch Upstream
diff --git a/package/librtas/0001-configure.ac-remove-LOCAL_CHECK_FLAGS.patch b/package/librtas/0001-configure.ac-remove-LOCAL_CHECK_FLAGS.patch
deleted file mode 100644
index dd5f944317..0000000000
--- a/package/librtas/0001-configure.ac-remove-LOCAL_CHECK_FLAGS.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 148712f8a559cc613236e9e72b3ce6c24b83c373 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sat, 23 Jul 2022 18:51:37 +0200
-Subject: [PATCH] configure.ac: remove LOCAL_CHECK_FLAGS
-
-These cause problems with Buildroot (the -fstack-protector-all check
-does only a compile test, it should do a link test), and generally the
-decision of using those flags or not should be left to Buildroot.
-
-An issue has been reported upstream at
-https://github.com/ibm-power-utilities/librtas/issues/25 to hopefully
-get a better solution.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- configure.ac | 14 --------------
- 1 file changed, 14 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index c3429e8..b7208ee 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -24,20 +24,6 @@ AC_TYPE_UID_T
- AC_TYPE_UINT32_T
- AC_TYPE_UINT64_T
- 
--AC_DEFUN([LOCAL_CHECK_FLAGS],[
--  AC_REQUIRE([AX_CHECK_LINK_FLAG])
--  AC_REQUIRE([AX_APPEND_COMPILE_FLAGS])
--  AC_LANG_PUSH([C])
--  AX_APPEND_COMPILE_FLAGS([-Wall])
--  AX_APPEND_COMPILE_FLAGS([-D_FORTIFY_SOURCE=2 -fstack-protector-all])
--  AX_APPEND_COMPILE_FLAGS([-fwrapv -fPIE -Wstack-protector])
--  AX_APPEND_COMPILE_FLAGS([--param=ssp-buffer-size=1])
--  AX_CHECK_LINK_FLAG([-z relro -z now])
--  AX_CHECK_LINK_FLAG([-pie])
--  AC_LANG_POP
--])
--LOCAL_CHECK_FLAGS
--
- LT_INIT
- LT_LANG([C])
- 
--- 
-2.37.1
-
diff --git a/package/librtas/librtas.hash b/package/librtas/librtas.hash
index 8d4c4e1912..6f8628cca8 100644
--- a/package/librtas/librtas.hash
+++ b/package/librtas/librtas.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1b951422ec9553fa9d5e5e158fd8e298f867f561189fff6817a9540d5661f145  librtas-2.0.3.tar.gz
+sha256  b4928b300350c12618563a051be01189275853fd8eacaac509c9aa1460991ec4  librtas-2.0.5.tar.gz
 sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING.LESSER
diff --git a/package/librtas/librtas.mk b/package/librtas/librtas.mk
index 458d7a0e47..804d6de191 100644
--- a/package/librtas/librtas.mk
+++ b/package/librtas/librtas.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-LIBRTAS_VERSION = 2.0.3
+LIBRTAS_VERSION = 2.0.5
 LIBRTAS_SITE = $(call github,ibm-power-utilities,librtas,v$(LIBRTAS_VERSION))
 LIBRTAS_LICENSE = LGPL-2.1+
 LIBRTAS_LICENSE_FILES = COPYING.LESSER
 LIBRTAS_INSTALL_STAGING = YES
 # From git
 LIBRTAS_AUTORECONF = YES
+LIBRTAS_DEPENDENCIES = host-pkgconf
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
