Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8096FC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:31:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4367860F02
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:31:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4367860F02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20F1F83C5F;
	Tue,  3 Aug 2021 22:31:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W3Wcf8cL0ObF; Tue,  3 Aug 2021 22:31:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1406183C59;
	Tue,  3 Aug 2021 22:31:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0FFF31BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D963C608EA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m0FZkfITtON6 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 305E760875
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7AE6187FC6; Tue,  3 Aug 2021 21:10:11 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 22:10:15 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5352a7710250e96ff99c11830af697101de3839e
X-Git-Newrev: 1ba6a3090547cbf1942078471d0d57c169f0022a
X-Patchwork-Hint: ignore
Message-Id: <20210803211011.7AE6187FC6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/linux-firmware: remove
 duplicated entries for brcmfmac4366b-pcie.bin and brcmfmac4366c-pcie.bin
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

commit: https://git.buildroot.net/buildroot/commit/?id=1ba6a3090547cbf1942078471d0d57c169f0022a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Remove duplicated entries for brcmfmac4366b-pcie.bin and
brcmfmac4366c-pcie.bin (present since addition with
commit ca6e3f4b900a2cca605d44cffcc463db432ac0ac)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/linux-firmware.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 90a38196fb..9f3f4e8635 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -618,15 +618,13 @@ endif
 
 # brcm4366b1
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM4366B1),y)
-LINUX_FIRMWARE_FILES += \
-	brcm/brcmfmac4366b-pcie.bin brcm/brcmfmac4366b-pcie.bin
+LINUX_FIRMWARE_FILES += brcm/brcmfmac4366b-pcie.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.broadcom_bcm43xx
 endif
 
 # brcm4366c0
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM4366C0),y)
-LINUX_FIRMWARE_FILES += \
-	brcm/brcmfmac4366c-pcie.bin brcm/brcmfmac4366c-pcie.bin
+LINUX_FIRMWARE_FILES += brcm/brcmfmac4366c-pcie.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.broadcom_bcm43xx
 endif
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
