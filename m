Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45AC2C433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 18:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5EE281D02;
	Tue,  1 Feb 2022 18:34:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id udYQP1tFv4Af; Tue,  1 Feb 2022 18:34:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B3B081CA5;
	Tue,  1 Feb 2022 18:34:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B184C1BF5D7
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 18:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0364415BF
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 18:33:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3KOTth1g7kID for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 18:33:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C52D415B7
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 18:33:34 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Exy8nuBUiroAhExy9nYlGJ; Tue, 01 Feb 2022 19:33:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643740413; bh=7wPBZLufMgkus4nm3cjNKtx0f62GbpeaK+cJHYN17Ls=;
 h=From:To:Subject:Date:MIME-Version;
 b=QGZBieuQo9f4GmcqM7okJsAtCBhWqwzniX/+683O7cgYEfXxooddLj7CKTlI3Vykz
 +IlFmTF7pUqi04Kr03+Pe0OBr6zNqWvBcCmNrd7oMVhJNTqZP6rMf1uyMFNPSz94vb
 jkuzvm8IzZkQD6KgSxVwZ5o/ixyst/FwM81VSkp1nu3pBXNhG6jPN3q4lv46zhtuQY
 aTvjx8e7sA9ydoVOwhaKXxyUL5ml1Z67Y6NmjJYhbibpTmamYOxcBYsdC9FfOplpuH
 sM8z2+8ApToDi27j9mqT6gJLvmBOmRQYVFwSDq/qWqtUOhjisEPnzpuwn/6vSSbkk/
 9rv9f2/Nig8OA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  1 Feb 2022 19:33:26 +0100
Message-Id: <20220201183331.4009320-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201183331.4009320-1-giulio.benetti@benettiengineering.com>
References: <20220201183331.4009320-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfJmbze+p9u3tW3IQxDOcEZPa52uQOZdgfb7zLLBaCuddIP+FB0/nyD/20HXpnsZMyhx/56sCGCRQtAfwIDw1jVN2vpFtMydrNp3TID99lzhx4EwU5vSr
 iFIiGVp0UIDACxdg2F0VQiMMO51qepwSoUS8C23tHTbxWP8M/BQEfXceY+c9tS0OW8avFTPTGGK9BnKC6BCrEYVkYJKrIHHpXUaCWWzKOBZHeq410aUWr+JX
 UMGYdUqy9QonbpUKGJKUoXkVrjm8glrMEYF8DylXwzaBwKEh92Bzn1Dq70jkpBRbyjG4Yl1A9PBp06tvAzYR9HYwnJ0XsUEcKreo8sPhB2CbDB4+HzhWNpxk
 ZXM74aBwtXMDCz6z8Tb/BKihoNtT4GkkNLpDlnNn85xK9UO2H/OQfpxhvDLGFqQjdnVcU/KVE/fOflp9ez/nduNBs13W0Q==
Subject: [Buildroot] [PATCH 1/6] configs/bananapi_m2_ultra_defconfig: u-boot
 needs host python3 and host openssl
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
Cc: Eugen Hristev <eugen.hristev@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Lothar Felten <lothar.felten@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
https://gitlab.com/ymorin/buildroot/-/jobs/2035820967

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/bananapi_m2_ultra_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/bananapi_m2_ultra_defconfig b/configs/bananapi_m2_ultra_defconfig
index 67ecec424c..2ec0e60e8d 100644
--- a/configs/bananapi_m2_ultra_defconfig
+++ b/configs/bananapi_m2_ultra_defconfig
@@ -19,7 +19,9 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="bananapi_m2_berry"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
