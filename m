Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94044C433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 21:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B8B660B73;
	Tue, 28 Dec 2021 21:11:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X_VkAIbtht_x; Tue, 28 Dec 2021 21:11:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FC1060B69;
	Tue, 28 Dec 2021 21:11:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D8B8C1BF39D
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 21:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D57FF814BA
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 21:11:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hjVtpBWNFARo for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 21:11:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4504F8144A
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 21:11:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2824182AFE; Tue, 28 Dec 2021 21:05:21 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 22:09:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f877c668114c3dab465127a307b3268f1f34db5b
X-Git-Newrev: f60e1d125d4223355d4a790fbdded92c90a73e01
X-Patchwork-Hint: ignore
Message-Id: <20211228210521.2824182AFE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/armbian-firmware: bump to commit
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f60e1d125d4223355d4a790fbdded92c90a73e01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update package/armbian-firmware to latest commit.
Update files for Realtek 8822CS WiFi/BT combo chip.

Signed-off-by: Vyacheslav Bocharov <adeep@lexina.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
