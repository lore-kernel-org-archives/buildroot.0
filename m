Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB4BE937E4
	for <buildroot@archiver.kernel.org>; Sun, 12 Apr 2026 13:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C76B61654;
	Sun, 12 Apr 2026 13:52:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a-dmSE7BuAiH; Sun, 12 Apr 2026 13:52:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50CF86164A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776001966;
	bh=UhysBtxTeIR4elHdlOvaKTpOAsdbxrcijfOA0fRYXjk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Jj1QPyV5JiKQdSdZyj9lXVzGT62gzEHwQ/4sV5sQ3HDJGqOIVzMAuXEVvHwaVQVq9
	 8HosJ06e2M8nMmOEX7Dk8w/KehSwuqA0kTJcU0L++mBDVMV5T9jWpaj+mW95O7TWAD
	 bjqRMFTn8/p+yn07rIE0rvyHTYiVDiUcknxgsrHFIPja9042hRK+0Xctg+tGvwbtok
	 i7Y6WZnLR4pxn4ENqhlsDI+b4CpO21teSwlvX3k2oK/fPdKdRbySF8xYGYR0MlnjlV
	 jpuTA5qegQzyJ7vFT1PxOR/OW6t4Qb8Y6YS5NWiu9zAA0EUNmtsorXKYkEznG90feU
	 yk20cqFIyT23g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50CF86164A;
	Sun, 12 Apr 2026 13:52:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E9AAB237
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 13:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF3F842329
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 13:52:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C6UKHdhNTueN for <buildroot@buildroot.org>;
 Sun, 12 Apr 2026 13:52:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00F9B42328
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00F9B42328
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 13:52:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7DDE081057; Sun, 12 Apr 2026 13:52:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Apr 2026 15:48:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8c655ac80ce3beca4669436a3a23dab83cd14865
X-Git-Newrev: 2078ff1c32d13d8177dce96d4f3be4e116ff82a5
X-Patchwork-Hint: ignore
Message-Id: <20260412135243.7DDE081057@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnupg2: bump to version 2.5.18
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2078ff1c32d13d8177dce96d4f3be4e116ff82a5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For release notes, see:
https://dev.gnupg.org/T7999

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gnupg2/gnupg2.hash | 4 ++--
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index 07eb84a8ee..d607e9bb86 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  ee0bc59eadf258b6d92131911b5dca6cabc89419  gnupg-2.5.17.tar.bz2
-sha256  2c1fbe20e2958fd8fb53cf37d7c38e84a900edc0d561a1c4af4bc3a10888685d  gnupg-2.5.17.tar.bz2
+sha1  91c523b172763621c69c0a213bc01b67b37d2298  gnupg-2.5.18.tar.bz2
+sha256  0dbd64e0322fe1a4813360d46539d5f8daf4a8fa235cf5fce464e8b0214a7e4f  gnupg-2.5.18.tar.bz2
 # Locally calculated
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index dd2fd0b0f0..1f7ff43e07 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.5.17
+GNUPG2_VERSION = 2.5.18
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
