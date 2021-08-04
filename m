Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCCC1C43216
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 14:40:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 881EF60F94
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 14:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 881EF60F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 590D040664;
	Wed,  4 Aug 2021 14:40:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 03_DzxNZ48Gp; Wed,  4 Aug 2021 14:40:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B560C4065B;
	Wed,  4 Aug 2021 14:39:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C729E1BF5E9
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 14:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C465460659
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 14:39:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ff1h1-2TVfT for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 14:39:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22FE260606
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 14:39:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B28D18B56D; Wed,  4 Aug 2021 14:39:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 16:27:22 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 99cae5b4f5dce4973fd86fbaaf9c81c8cefb4298
X-Git-Newrev: d21e224efe2632a4541515967df8154100f0d154
X-Patchwork-Hint: ignore
Message-Id: <20210804143916.B28D18B56D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/linux-firmware:
 remove duplicated entries for brcmfmac4366b-pcie.bin and
 brcmfmac4366c-pcie.bin
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

commit: https://git.buildroot.net/buildroot/commit/?id=d21e224efe2632a4541515967df8154100f0d154
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Remove duplicated entries for brcmfmac4366b-pcie.bin and
brcmfmac4366c-pcie.bin (present since addition with
commit ca6e3f4b900a2cca605d44cffcc463db432ac0ac)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1ba6a3090547cbf1942078471d0d57c169f0022a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-firmware/linux-firmware.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 9adab67bf1..a621619624 100644
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
