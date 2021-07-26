Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 611DFC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:43:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AAAD6056C
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:43:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1AAAD6056C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAF97843CE;
	Wed,  4 Aug 2021 00:43:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kr0TCGzUojPm; Wed,  4 Aug 2021 00:43:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BF23843CA;
	Wed,  4 Aug 2021 00:43:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1437D1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77C1340F7C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 51POwKuSGfM8 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B978E40F7E
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1911C87E2D; Tue,  3 Aug 2021 21:10:20 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 22:08:53 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 991c33e61cbc161d2e4735919591157a61fe07fe
X-Git-Newrev: f1775574b86635f96409cf76bed2f9b0e5d7fc7c
X-Patchwork-Hint: ignore
Message-Id: <20210803211020.1911C87E2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mtd: bump to version
 2.1.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=f1775574b86635f96409cf76bed2f9b0e5d7fc7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

See release announcement for changes:
https://lists.infradead.org/pipermail/linux-mtd/2021-July/087588.html

Signed-off-by: Michael Walle <michael@walle.cc>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mtd/Config.in | 6 ++++++
 package/mtd/mtd.hash  | 4 ++--
 package/mtd/mtd.mk    | 4 +++-
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index 26b7797718..abfe806661 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -54,6 +54,9 @@ config BR2_PACKAGE_MTD_FLASH_OTP_LOCK
 config BR2_PACKAGE_MTD_FLASH_OTP_WRITE
 	bool "flash_otp_write"
 
+config BR2_PACKAGE_MTD_FLASH_OTP_ERASE
+	bool "flash_otp_erase"
+
 config BR2_PACKAGE_MTD_FLASH_UNLOCK
 	bool "flash_unlock"
 	default y
@@ -95,6 +98,9 @@ config BR2_PACKAGE_MTD_NANDWRITE
 	bool "nandwrite"
 	default y
 
+config BR2_PACKAGE_MTD_NANDFLIPBITS
+	bool "nandflipbits"
+
 config BR2_PACKAGE_MTD_NFTLDUMP
 	bool "nftldump"
 
diff --git a/package/mtd/mtd.hash b/package/mtd/mtd.hash
index fda5a6ea36..481788f844 100644
--- a/package/mtd/mtd.hash
+++ b/package/mtd/mtd.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.1.2.tar.bz2.asc
-sha256  8ad4c5f34716d40646aa28724a2f5616d325a6f119254f914e26976f1f76e9d6  mtd-utils-2.1.2.tar.bz2
+# ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.1.3.tar.bz2.asc
+sha256  11305a5daf6fc6ed85120695c8593290b577effb039adbfa63d35b4418ff5630  mtd-utils-2.1.3.tar.bz2
 sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 189736b877..a37594b164 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTD_VERSION = 2.1.2
+MTD_VERSION = 2.1.3
 MTD_SOURCE = mtd-utils-$(MTD_VERSION).tar.bz2
 MTD_SITE = ftp://ftp.infradead.org/pub/mtd-utils
 MTD_LICENSE = GPL-2.0
@@ -74,6 +74,7 @@ MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_OTP_DUMP)	+= flash_otp_dump
 MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_OTP_INFO)	+= flash_otp_info
 MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_OTP_LOCK)	+= flash_otp_lock
 MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_OTP_WRITE)	+= flash_otp_write
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_OTP_ERASE)	+= flash_otp_erase
 MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_UNLOCK)	+= flash_unlock
 MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_CHECK)	+= ftl_check
 MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_FORMAT)	+= ftl_format
@@ -114,6 +115,7 @@ MTD_TARGETS_$(BR2_PACKAGE_MTD_INTEGCK)		+= integck
 MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDBITERRS)	+= nandbiterrs
 MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDPAGETEST)	+= nandpagetest
 MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDSUBPAGETEST)	+= nandsubpagetest
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDFLIPBITS)	+= nandflipbits
 
 define MTD_INSTALL_TARGET_CMDS
 	$(foreach f,$(MTD_TARGETS_y), \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
