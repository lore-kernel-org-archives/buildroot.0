Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7C7C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AD8E505F1;
	Fri, 28 Feb 2025 17:05:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vqENrT0Vjacp; Fri, 28 Feb 2025 17:05:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3293505F2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3293505F2;
	Fri, 28 Feb 2025 17:05:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E5F31DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D3BD42EA5
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PeShduV3jWIc for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98D6642EB4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98D6642EB4
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9285E87A09; Fri, 28 Feb 2025 16:30:20 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Jan 2025 22:36:15 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 75620b301f9e7d128afd6fd9a1d771a3b7567185
X-Git-Newrev: b04e77b900bfa89d538b6071b59de3dcf39e413c
X-Patchwork-Hint: ignore
Message-Id: <20250228163020.9285E87A09@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/fontconfig: bump to
 2.16.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b04e77b900bfa89d538b6071b59de3dcf39e413c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Announcements:
 2.16.0: https://lists.freedesktop.org/archives/fontconfig/2025-January/007143.html
 2.15.0: https://lists.freedesktop.org/archives/fontconfig/2023-December/007064.html

Some notes:

- The hash is no longer part of the announcement but
  can instead be found in the release archive.

- Switched to meson while at it.

- Dropped the patch, since it's part of the autotools.

- Dropped some configs args, --with-arch, --disable-static,
  since meson now handles the arch, and disable static as
  it has most probably not been needed anymore for years.
  Was part of commit dd4faf6f6f3fb32657b5d0c4fb72d15a7f571b2e.
  "cairo: add host version"

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...d-pthread-as-a-dependency-of-a-static-lib.patch | 43 ----------------------
 package/fontconfig/fontconfig.hash                 |  4 +-
 package/fontconfig/fontconfig.mk                   | 16 +++-----
 3 files changed, 7 insertions(+), 56 deletions(-)

diff --git a/package/fontconfig/0001-add-pthread-as-a-dependency-of-a-static-lib.patch b/package/fontconfig/0001-add-pthread-as-a-dependency-of-a-static-lib.patch
deleted file mode 100644
index c6aa514534..0000000000
--- a/package/fontconfig/0001-add-pthread-as-a-dependency-of-a-static-lib.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 40ec04a8bf36dd8d0aa3da98b167792ce2dcd114 Mon Sep 17 00:00:00 2001
-From: Silvan Scherrer <silvan.scherrer@aroa.ch>
-Date: Sun, 20 Sep 2020 12:52:08 +0200
-Subject: [PATCH] add pthread as a dependency of a static lib
-
-Downloaded from https://trac.netlabs.org/ports/changeset/2220
-
-Upstream: https://gitlab.freedesktop.org/fontconfig/fontconfig/-/merge_requests/121
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- configure.ac     | 2 ++
- fontconfig.pc.in | 4 ++--
- 2 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index f3189a7..594d6fd 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -690,6 +690,8 @@ fi
- have_pthread=false
- if test "$os_win32" = no; then
- 	AX_PTHREAD([have_pthread=true])
-+	AC_SUBST(PTHREAD_CFLAGS)
-+	AC_SUBST(PTHREAD_LIBS)
- fi
- if $have_pthread; then
- 	LIBS="$PTHREAD_LIBS $LIBS"
-diff --git a/fontconfig.pc.in b/fontconfig.pc.in
-index 61b35fb..f823bac 100644
---- a/fontconfig.pc.in
-+++ b/fontconfig.pc.in
-@@ -14,5 +14,5 @@ Version: @VERSION@
- Requires: @PKGCONFIG_REQUIRES@
- Requires.private: @PKGCONFIG_REQUIRES_PRIVATELY@
- Libs: -L${libdir} -lfontconfig
--Libs.private: @ICONV_LIBS@ @PKG_EXPAT_LIBS@
--Cflags: -I${includedir} @ICONV_CFLAGS@ @PKG_EXPAT_CFLAGS@
-+Libs.private: @ICONV_LIBS@ @PKG_EXPAT_LIBS@ @PTHREAD_LIBS@
-+Cflags: -I${includedir} @ICONV_CFLAGS@ @PKG_EXPAT_CFLAGS@ @PTHREAD_CFLAGS@
--- 
-2.27.0
-
diff --git a/package/fontconfig/fontconfig.hash b/package/fontconfig/fontconfig.hash
index a4f87caf1e..b9c95d40b2 100644
--- a/package/fontconfig/fontconfig.hash
+++ b/package/fontconfig/fontconfig.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/fontconfig/2023-January/006950.html
-sha256  dba695b57bce15023d2ceedef82062c2b925e51f5d4cc4aef736cf13f60a468b  fontconfig-2.14.2.tar.xz
+# From https://www.freedesktop.org/software/fontconfig/release/fontconfig-2.16.0.tar.xz.sha256sum
+sha256  6a33dc555cc9ba8b10caf7695878ef134eeb36d0af366041f639b1da9b6ed220  fontconfig-2.16.0.tar.xz
 
 # Locally calculated
 sha256  51a51aa9823704fd90bccc616cdd17ebabb5b2b3e9cbde886ca02c7002288067  COPYING
diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index 11758a4c80..b60086c9c8 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -4,11 +4,9 @@
 #
 ################################################################################
 
-FONTCONFIG_VERSION = 2.14.2
+FONTCONFIG_VERSION = 2.16.0
 FONTCONFIG_SITE = https://www.freedesktop.org/software/fontconfig/release
 FONTCONFIG_SOURCE = fontconfig-$(FONTCONFIG_VERSION).tar.xz
-# 0001-add-pthread-as-a-dependency-of-a-static-lib.patch
-FONTCONFIG_AUTORECONF = YES
 FONTCONFIG_INSTALL_STAGING = YES
 FONTCONFIG_DEPENDENCIES = freetype expat host-pkgconf host-gperf \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS),util-linux-libs,util-linux) \
@@ -21,12 +19,8 @@ FONTCONFIG_LICENSE_FILES = COPYING
 FONTCONFIG_CPE_ID_VALID = YES
 
 FONTCONFIG_CONF_OPTS = \
-	--with-arch=$(GNU_TARGET_NAME) \
-	--with-cache-dir=/var/cache/fontconfig \
-	--disable-docs
+	-Dcache-dir=/var/cache/fontconfig \
+	-Ddoc=disabled
 
-HOST_FONTCONFIG_CONF_OPTS = \
-	--disable-static
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+$(eval $(meson-package))
+$(eval $(host-meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
