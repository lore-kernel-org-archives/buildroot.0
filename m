Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBDBF531C7
	for <buildroot@archiver.kernel.org>; Mon, 13 Apr 2026 20:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 276DE41144;
	Mon, 13 Apr 2026 20:02:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id px9fKV3o8cO6; Mon, 13 Apr 2026 20:02:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADC9440FDD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776110565;
	bh=f5uMcG2oIyFL5HRSsNVQXoVYEQ2LfoVBaNN1I1T03zo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=e7W1F2iG7bSsfCOysg82O8bLAZqrvEjb5bkO7NN2wui14gzA4/z2j7Ho+JwHFwr8n
	 uT7HBtpyQ5k9lEmiZ6dWJGMCaQQLESrN0ek2cCT9FVznTT2MV9ffoEVI6hK1rLfQxx
	 ZhczgrZaS2ULpvbmrlbXJMyEd2nD5Jr5TdLQyPsbHus2GUeJk7V2qSStQrbyNnd8aF
	 Rlq14SqkCwbDJzDLZkqwqrKKGVEhM2kasQtAdRTonFml8CRF6OriZpkxaITJJfrvsw
	 7yL4bzrDSFbNfZDnDbz8Wxk5laaW7biR0bkikeGZ5OpUV3xO8udnzL6MHEn1OaC2Iz
	 /1XR963u3FeqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADC9440FDD;
	Mon, 13 Apr 2026 20:02:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D58A6196
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 20:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C568860EFA
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 20:02:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 704_fN_T3Qgr for <buildroot@buildroot.org>;
 Mon, 13 Apr 2026 20:02:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7C6260EA1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7C6260EA1
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 20:02:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 57EC6813E4; Mon, 13 Apr 2026 20:02:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 Apr 2026 21:59:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e2ace8475f0f142c1898d295751fb8a037ffd0b9
X-Git-Newrev: 329643baa5225f6262ed4411d4c1ca2829d46fdf
X-Patchwork-Hint: ignore
Message-Id: <20260413200241.57EC6813E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: Add option to
 install ath11k (WC68655) firmware
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
Content-Type: multipart/mixed; boundary="===============0525259755688799134=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0525259755688799134==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/329643baa5225f6262ed4411d4c1ca2829d46fdf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add firmware for Qualcomm WCN6855 WiFi 6E chip.

Signed-off-by: Mattias Walström <lazzer@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/linux-firmware/Config.in         | 6 ++++++
 package/linux-firmware/linux-firmware.mk | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 5ad4957756..58ba60e9c3 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -188,6 +188,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_10K_QCA998X
 	help
 	  Firmware files for the Atheros QCA988X module
 
+config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_11K_WCN6855
+	bool "Atheros 11k (WCN6855)"
+	help
+	  Firmware files for the Qualcomm WCN6855 WiFi 6E chip
+	  (ath11k driver, hw2.0).
+
 config BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX
 	bool "Broadcom BRCM bcm43xx"
 	select BR2_PACKAGE_LINUX_FIRMWARE_CYPRESS_CYW43XX
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 6561e1cd1b..4d7c608947 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -272,6 +272,12 @@ LINUX_FIRMWARE_FILES += ath10k/QCA988X/hw2.0/board.bin \
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.QualcommAtheros_ath10k
 endif
 
+# ath11k
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_11K_WCN6855),y)
+LINUX_FIRMWARE_DIRS += ath11k/WCN6855/hw2.0
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.QualcommAtheros_ath10k
+endif
+
 # sd8686 v8
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8686_V8),y)
 LINUX_FIRMWARE_FILES += libertas/sd8686_v8.bin libertas/sd8686_v8_helper.bin

--===============0525259755688799134==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0525259755688799134==--
