Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7975C4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:55:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDB5460551
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:55:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EDB5460551
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3AED606BE;
	Sat, 24 Jul 2021 20:55:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mEG4MXR4KBFt; Sat, 24 Jul 2021 20:55:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21095606A7;
	Sat, 24 Jul 2021 20:55:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E82B31BF27E
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E451B606A7
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:55:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2y7AKf0O8cfo for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 20:55:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC0E06068C
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 20:55:40 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.181.181])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 7OgMmF4p21Kiz7OgMmFBdS; Sat, 24 Jul 2021 22:55:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1627160139; bh=Ns8axhKxKRwekcuzDRmSCT2uNCFCWL3i6AIea0SvuuU=;
 h=From:To:Subject:Date:MIME-Version;
 b=XMWj9wFj3mXwUZ622Rx5upmvmduSPGVINymp0Jm6BKlyjk6jJ9E15GsJN2kkH+dVf
 q28paa0qrL2HwH6ezim7v8AsHIl1TiLI8laBXkMBaESX/WoSwgPBNNhKxNP2J097vg
 gABKVDTKwU7JVon6ULwQUOaRMBs6H+AFdYL4B0s/uxnud8ao9rGIM1Jvrd23kuREKb
 7zZ4v52rzZhlka0FYpg6JphFmLgOz3jVCvko0NuxZC8P8eVMwXaE3YgMs5sSul4iyb
 m5FLQcB2XgDJlxCh4/1NgS1Z/odPkgOZv82T0DrHIcDuhlNFeQrPl7VNm351CFG7eP
 dcrgBGE7GaE8g==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 22:55:37 +0200
Message-Id: <20210724205537.764338-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfDzPwDthJ6FZX8fYeLnwLk8YcTmxoDFaq6z91MUlcd5gPDq7AUbCLx60iTB0Fpi8nFzGWZUGmjzr/FLX9ZLepByLA2kZDR5e00RxjQhm8LxATwxpN6P2
 HSyyUKi8xoy06HhrGTAkJm+5i22hw726uLnwNftUtU4UJdjBti19yT0ztibW8Z9LdwcnZVwtE/pX/SP9tx3gIWrT+/56KoFVZ52EnN1DxL17ebopGxMbhRtF
 NnptB+yN7InQXAxUftJMYxbr1Ge4N0E9eGAVoboTouU=
Subject: [Buildroot] [PATCH] package/libgeos: improve Config.in comments
 with binutils bugs
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

At the moment if package is not available due to binutils bugs comment
only states that it's not available because toolchain is missing C++,
wchar. But this is not correct, so let's add other 2 comments for the 2
binutils bugs and move dependencies to them.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libgeos/Config.in | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/libgeos/Config.in b/package/libgeos/Config.in
index 86a1cddcf3..949a5ff94a 100644
--- a/package/libgeos/Config.in
+++ b/package/libgeos/Config.in
@@ -13,7 +13,11 @@ config BR2_PACKAGE_LIBGEOS
 
 	  https://trac.osgeo.org/geos
 
-comment "libgeos needs a toolchain w/ C++, wchar, not binutils bug 21464, 27597"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		   BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464 || \
-		   BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
+comment "libgeos needs a toolchain w/ C++, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+
+comment "libgeos needs a toolchain not affected by BINUTILS bug 21464"
+	depends on BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
+
+comment "libgeos needs a toolchain not affected by BINUTILS bug 27597"
+	depends on BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
