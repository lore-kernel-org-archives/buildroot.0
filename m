Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547F3EB64D7
	for <buildroot@archiver.kernel.org>; Wed, 28 Jun 2023 15:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E889540570;
	Wed, 28 Jun 2023 15:13:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E889540570
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QcAnnUmPYreG; Wed, 28 Jun 2023 15:13:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D9164191F;
	Wed, 28 Jun 2023 15:13:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D9164191F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 52D8A1BF38D
 for <buildroot@lists.busybox.net>; Wed, 28 Jun 2023 15:13:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D342812B1
 for <buildroot@lists.busybox.net>; Wed, 28 Jun 2023 15:13:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D342812B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vfSU5WwTgAHM for <buildroot@lists.busybox.net>;
 Wed, 28 Jun 2023 15:13:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D81F810CD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D81F810CD
 for <buildroot@buildroot.org>; Wed, 28 Jun 2023 15:13:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 97635A4C0ACC;
 Wed, 28 Jun 2023 17:13:20 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37088)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qEWrA-0008UB-11;
 Wed, 28 Jun 2023 17:13:20 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 28 Jun 2023 17:13:20 +0200
Message-Id: <20230628151320.554700-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230628151320.554700-1-bernd@kuhls.net>
References: <20230628151320.554700-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1687965200;
 bh=Kw/43AzMkLrwQ9m2nVDldmcEKE40zMIO5w3NfU4ok+Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mqSCqzcn1pxDTUsV3FGHaMmF//uTi+DgTSdj1eMm59BrqTO3kjiUxQSF4pGNnYIuo
 Tzc1iICyJ6XHDeOjlsWh1bgMr7bxtBQuiDPJ6QY5UXM14fefoFPYuz/ZEqTuLDkeUB
 kR8UDyVCaNyHywWmLm4kxy72ODzYx2YCQDMu3/ZeThyKOXMB/6326TFRHKE/Giryh7
 peV7TJj0kdt1Abnv/7d6LGpx4DvWw8JabQYN3O1Y/zZdeZ1tzAGTh8sBJhGfTJ26vf
 GrIeAZPru3iV/rEg6ssKrNKyu9Zdk8skc3X7yOYtqgxPX9W6YOqVkqXLH9kkQP27NP
 wEHheJOP6OC7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=mqSCqzcn
Subject: [Buildroot] [PATCH 2/2] package/libbsd: bump version to 0.11.7
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://archive.hadrons.org/software/libbsd/libbsd-0.11.4.announce
https://archive.hadrons.org/software/libbsd/libbsd-0.11.5.announce
https://archive.hadrons.org/software/libbsd/libbsd-0.11.6.announce
https://archive.hadrons.org/software/libbsd/libbsd-0.11.7.announce

Removed patch which is included in upstream release:
https://gitlab.freedesktop.org/libbsd/libbsd/-/commit/873639ebb5bc3688e5e78d71e5c0c49469498f46

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  1 -
 ...01-src-local-elf.h-fix-big-endian-sh.patch | 39 -------------------
 package/libbsd/libbsd.hash                    |  6 ++-
 package/libbsd/libbsd.mk                      |  2 +-
 4 files changed, 5 insertions(+), 43 deletions(-)
 delete mode 100644 package/libbsd/0001-src-local-elf.h-fix-big-endian-sh.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 3c38e34eb7..a0a5cd893e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -693,7 +693,6 @@ package/libavl/0001-fix-makefile.patch Upstream
 package/libb64/0001-Integer-overflows.patch Upstream
 package/libb64/0002-Initialize-C++-objects.patch Upstream
 package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch Upstream
-package/libbsd/0001-src-local-elf.h-fix-big-endian-sh.patch Upstream
 package/libcdaudio/0001-libcdaudio-enable-autoreconf.patch Upstream
 package/libcec/0001-cecloader-h-fix-null-return.patch Upstream
 package/libcgi/0001-CMakeLists.txt-honour-BUILD_TESTING.patch Upstream
diff --git a/package/libbsd/0001-src-local-elf.h-fix-big-endian-sh.patch b/package/libbsd/0001-src-local-elf.h-fix-big-endian-sh.patch
deleted file mode 100644
index 8612d268f8..0000000000
--- a/package/libbsd/0001-src-local-elf.h-fix-big-endian-sh.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 93c9f8aa72349a4fe33e2a732100c76f3904eb80 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 7 Jun 2022 19:27:13 +0200
-Subject: [PATCH] src/local-elf.h: fix big endian sh
-
-Fix the following build failure with big endian sh (e.g. sh4aeb):
-
-In file included from nlist.c:44:
-nlist.c: In function '__elf_is_okay__':
-local-elf.h:223:25: error: 'ELFDATA2LMSB' undeclared (first use in this function); did you mean 'ELFDATA2LSB'?
-  223 | #define ELF_TARG_DATA   ELFDATA2LMSB
-      |                         ^~~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/2980fb79c208454195d77383f1ece9afbd7f981b
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.freedesktop.org/libbsd/libbsd/-/merge_requests/19]
----
- src/local-elf.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/local-elf.h b/src/local-elf.h
-index 1dd3b42..8c4794f 100644
---- a/src/local-elf.h
-+++ b/src/local-elf.h
-@@ -230,7 +230,7 @@
- #if defined(__LITTLE_ENDIAN__)
- #define ELF_TARG_DATA	ELFDATA2LSB
- #elif defined(__BIG_ENDIAN__)
--#define ELF_TARG_DATA	ELFDATA2LMSB
-+#define ELF_TARG_DATA	ELFDATA2MSB
- #else
- #error Unknown SH endianness
- #endif
--- 
-2.35.1
-
diff --git a/package/libbsd/libbsd.hash b/package/libbsd/libbsd.hash
index 17bb32e01c..6792f988d4 100644
--- a/package/libbsd/libbsd.hash
+++ b/package/libbsd/libbsd.hash
@@ -1,3 +1,5 @@
-# From https://lists.freedesktop.org/archives/libbsd/2021-February/000305.html
-sha512  a7015ea1ffa3766b1a4690526a25231898ad8275149b31fb6801082450172249997c36165626d101ffce53b59767a46676eebc0806426922fe4e773a0376c1f5  libbsd-0.11.3.tar.xz
+# From https://archive.hadrons.org/software/libbsd/libbsd-0.11.7.announce
+sha256  9baa186059ebbf25c06308e9f991fda31f7183c0f24931826d83aa6abd8a0261  libbsd-0.11.7.tar.xz
+sha512  51fda4724f41dd8a4628afd58c21236a7588d9045e337e06eeabf83805a9aaaa53705441ca901ad11f1c65f18e881523bdc97721a7d3d6a5cced27f2450d09a2  libbsd-0.11.7.tar.xz
+# Locally computed
 sha256  ff2fdeeb0fe8bcb9045fe91d69e8312a5b477c54db48dffe34dd1c0d730c5864  COPYING
diff --git a/package/libbsd/libbsd.mk b/package/libbsd/libbsd.mk
index 86df8a97a2..27937c4611 100644
--- a/package/libbsd/libbsd.mk
+++ b/package/libbsd/libbsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBSD_VERSION = 0.11.3
+LIBBSD_VERSION = 0.11.7
 LIBBSD_SOURCE = libbsd-$(LIBBSD_VERSION).tar.xz
 LIBBSD_SITE = https://libbsd.freedesktop.org/releases
 LIBBSD_LICENSE = BSD-2-Clause, BSD-3-Clause, BSD-4-Clause, BSD-5-Clause, \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
