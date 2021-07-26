Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7FCFC4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 14:26:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E2D760F42
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 14:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4E2D760F42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8BC3402E2;
	Mon, 26 Jul 2021 14:26:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZaPyyd6Ipnbp; Mon, 26 Jul 2021 14:26:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDC874029A;
	Mon, 26 Jul 2021 14:26:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6278A1BF36C
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 14:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F44B606A3
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 14:26:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=walle.cc
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Xf_6L0vtd0X for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 14:26:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C5959605C8
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 14:26:15 +0000 (UTC)
Received: from mwalle01.kontron.local (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 749E422239;
 Mon, 26 Jul 2021 16:26:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1627309572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=EPE76CsBacyquJW2xkbnxkZQ7fQMpb4a2rYFBifwrpw=;
 b=Z4TE8e29ofCCb9JxIlICWl/sJVW3FRn3mv2TIKV9Ca97ysFna6ooJCN/G6gpwEpAUDS7w8
 8Cn55MjRGAjB8FME/Obv3yuz51gtNhRiBqI5xsla+WxTKlT2Snlq3U7D9SDglYlxmXmLnG
 K9+ebW7xju/wEAZTqZqbA/DTH0ce4Lo=
From: Michael Walle <michael@walle.cc>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 16:26:06 +0200
Message-Id: <20210726142606.9932-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam: Yes
Subject: [Buildroot] [PATCH] package/mtd: bump to version 2.1.3
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>, Michael Walle <michael@walle.cc>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

See release announcement for changes:
https://lists.infradead.org/pipermail/linux-mtd/2021-July/087588.html

Signed-off-by: Michael Walle <michael@walle.cc>
---
We finally got an OTP erase ;))

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
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
