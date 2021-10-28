Return-Path: <SRS0=8Zio=PQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5F67C433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 17:18:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B446C610D2
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 17:17:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B446C610D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B53E4018D;
	Thu, 28 Oct 2021 17:17:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f5U40uZXHXDO; Thu, 28 Oct 2021 17:17:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 688FF4016B;
	Thu, 28 Oct 2021 17:17:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C779D1BF2F6
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 17:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B523D4016B
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 17:17:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4cre2ehtFtNe for <buildroot@lists.busybox.net>;
 Thu, 28 Oct 2021 17:17:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx.msync.work (hh0.msync.work [95.217.35.189])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 74785402D3
 for <buildroot@buildroot.org>; Thu, 28 Oct 2021 17:17:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E09B217F0C0; Thu, 28 Oct 2021 17:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
 t=1635440999; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=dDpqTx9qPERYzpfptkqeFZS5QuUuhbKrQ91OgunHDsY=;
 b=OCM07ZtKzfzySow3TPIxHDF5d2hZNcNt7A0WKp19XX5iXrrZFr1fxPMCFHP7qGKuJFUxOK
 93toAoaonA2uETROKm39mbaGgfQDRGUg/7JcnNhbf+cY88AYsHp76fq1MHWF/LNmirZn/p
 EHPmQtfcQkngjRdWc2x2ww8itGhSjrCfmwH4EOLdTIqra8v5bM9jP/b9MRD0P5cM7DlbTV
 xee8oylx04RVVbHRIBSOCll7/a74qE50AXnyLmW4Wfi8yt8vw3Hg8VR7GnJEpJXpWCOgu2
 TQfbha+of5mzNBX2jim9SR4s1W7fE/MowynprGaEHsW/ekyMNImf/aGORyL2oQ==
To: buildroot@buildroot.org
Date: Thu, 28 Oct 2021 20:08:02 +0300
Message-Id: <20211028170800.3880491-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/armbian-firmware: bump to commit
 5d685ad233b4dfd03a4d025fa0061f6b0f850cb3
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
From: Vyacheslav Bocharov via buildroot <buildroot@buildroot.org>
Reply-To: Vyacheslav Bocharov <adeep@lexina.in>
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update package/armbian-firmware to latest commit.
Update files for Realtek 8822CS WiFi/BT combo chip.

Signed-off-by: Vyacheslav Bocharov <adeep@lexina.in>

---
 package/armbian-firmware/armbian-firmware.hash | 2 +-
 package/armbian-firmware/armbian-firmware.mk   | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/armbian-firmware/armbian-firmware.hash b/package/armbian-firmware/armbian-firmware.hash
index 16bc1a2978..5ef875dbea 100644
--- a/package/armbian-firmware/armbian-firmware.hash
+++ b/package/armbian-firmware/armbian-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  2e61dc5e43f6011868417504f6633e6de6c220ee48fba3b58823e4ce33a6b933  armbian-firmware-a1df8ab2ffbac51a8260905dd841bf825cf1bc53-br1.tar.gz
+sha256  725b1f65a5947f053a593f917f91c6634d496c92af6180845cc3679d1377ab79  armbian-firmware-5d685ad233b4dfd03a4d025fa0061f6b0f850cb3-br1.tar.gz
diff --git a/package/armbian-firmware/armbian-firmware.mk b/package/armbian-firmware/armbian-firmware.mk
index 68adab4714..5d945548f2 100644
--- a/package/armbian-firmware/armbian-firmware.mk
+++ b/package/armbian-firmware/armbian-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARMBIAN_FIRMWARE_VERSION = a1df8ab2ffbac51a8260905dd841bf825cf1bc53
+ARMBIAN_FIRMWARE_VERSION = 5d685ad233b4dfd03a4d025fa0061f6b0f850cb3
 ARMBIAN_FIRMWARE_SITE = https://github.com/armbian/firmware
 ARMBIAN_FIRMWARE_SITE_METHOD = git
 
@@ -39,7 +39,9 @@ endif
 ifeq ($(BR2_PACKAGE_ARMBIAN_FIRMWARE_RTL8822CS),y)
 ARMBIAN_FIRMWARE_FILES += \
 	rtlbt/rtl8822cs_config \
-	rtlbt/rtl8822cs_fw
+	rtlbt/rtl8822cs_fw \
+	rtl_bt/rtl8822cs_config.bin \
+	rtl_bt/rtl8822cs_fw.bin
 endif
 
 # XR819 WiFi firmware
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
