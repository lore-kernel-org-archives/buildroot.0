Return-Path: <SRS0=3r6m=NL=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9649AC4338F
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 08:00:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 616E660FF2
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 08:00:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 616E660FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 176D84070F;
	Fri, 20 Aug 2021 08:00:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id boXJYhED1pNO; Fri, 20 Aug 2021 08:00:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48E584071B;
	Fri, 20 Aug 2021 08:00:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B7B11BF3A6
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 08:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8AA5A613AB
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 08:00:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 18-TGaVzRy-d for <buildroot@lists.busybox.net>;
 Fri, 20 Aug 2021 07:59:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 662EB605C5
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 07:59:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 0FC108D6B2; Fri, 20 Aug 2021 07:59:13 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 20 Aug 2021 09:58:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 66eb8cd0fb8de2f033ba03a57e82a64f49f6eff6
X-Git-Newrev: e24c5731536a9820b6f42293551c582e2f47cc23
X-Patchwork-Hint: ignore
Message-Id: <20210820075913.0FC108D6B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmcrypt: drop package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=e24c5731536a9820b6f42293551c582e2f47cc23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop libmcrypt which is a cryptographic package that is not maintained
anymore. Here is an extract of https://en.wikipedia.org/wiki/Mcrypt:
"The last update to libmcrypt was in 2007, despite years of unmerged
patches. These facts have led security experts to declare mcrypt
abandonware and discourage its use in new development.".

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                   | 10 ++++++++++
 package/Config.in                  |  1 -
 package/libmcrypt/0001-nocxx.patch | 15 ---------------
 package/libmcrypt/Config.in        |  7 -------
 package/libmcrypt/libmcrypt.hash   |  3 ---
 package/libmcrypt/libmcrypt.mk     | 15 ---------------
 6 files changed, 10 insertions(+), 41 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 7cb0c40782..68c9f3ca49 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,16 @@ endif
 
 comment "Legacy options removed in 2021.08"
 
+config BR2_PACKAGE_LIBMCRYPT
+	bool "libmcrypt package was removed"
+	select BR2_LEGACY
+	help
+	  This package has been removed as "the last update to libmcrypt
+	  was in 2007, despite years of unmerged patches. These facts
+	  have led security experts to declare mcrypt abandonware and
+	  discourage its use in new development" (extract from
+	  https://en.wikipedia.org/wiki/Mcrypt).
+
 config BR2_PACKAGE_MCRYPT
 	bool "mcrypt package was removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 6fcdcc38d7..4d323d440f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1376,7 +1376,6 @@ menu "Crypto"
 	source "package/libgpgme/Config.in"
 	source "package/libkcapi/Config.in"
 	source "package/libksba/Config.in"
-	source "package/libmcrypt/Config.in"
 	source "package/libmhash/Config.in"
 	source "package/libnss/Config.in"
 	source "package/libolm/Config.in"
diff --git a/package/libmcrypt/0001-nocxx.patch b/package/libmcrypt/0001-nocxx.patch
deleted file mode 100644
index b1c28713a1..0000000000
--- a/package/libmcrypt/0001-nocxx.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-libmcrypt doesn't use C++ so remove the check.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura libmcrypt-2.5.8.orig/configure.in libmcrypt-2.5.8/configure.in
---- libmcrypt-2.5.8.orig/configure.in	2013-01-07 12:20:44.332200669 -0300
-+++ libmcrypt-2.5.8/configure.in	2013-01-07 12:20:50.405390565 -0300
-@@ -19,7 +19,6 @@
- 
- AC_PROG_MAKE_SET
- 
--AC_PROG_CXX
- AC_PROG_CC
- AC_PROG_CPP
- AC_PROG_INSTALL
diff --git a/package/libmcrypt/Config.in b/package/libmcrypt/Config.in
deleted file mode 100644
index 784d2c2af6..0000000000
--- a/package/libmcrypt/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_LIBMCRYPT
-	bool "libmcrypt"
-	help
-	  libmcrypt is a library that provides uniform interface to
-	  access several encryption algorithms.
-
-	  http://mcrypt.sourceforge.net/
diff --git a/package/libmcrypt/libmcrypt.hash b/package/libmcrypt/libmcrypt.hash
deleted file mode 100644
index 30b57522b8..0000000000
--- a/package/libmcrypt/libmcrypt.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  e4eb6c074bbab168ac47b947c195ff8cef9d51a211cdd18ca9c9ef34d27a373e  libmcrypt-2.5.8.tar.gz
-sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING.LIB
diff --git a/package/libmcrypt/libmcrypt.mk b/package/libmcrypt/libmcrypt.mk
deleted file mode 100644
index e93f0136b3..0000000000
--- a/package/libmcrypt/libmcrypt.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# libmcrypt
-#
-################################################################################
-
-LIBMCRYPT_VERSION = 2.5.8
-LIBMCRYPT_SITE = http://downloads.sourceforge.net/project/mcrypt/Libmcrypt/$(LIBMCRYPT_VERSION)
-LIBMCRYPT_AUTORECONF = YES
-LIBMCRYPT_INSTALL_STAGING = YES
-LIBMCRYPT_LICENSE = LGPL-2.1
-LIBMCRYPT_LICENSE_FILES = COPYING.LIB
-LIBMCRYPT_CONFIG_SCRIPTS = libmcrypt-config
-
-$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
