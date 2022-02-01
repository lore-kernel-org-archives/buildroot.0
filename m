Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2641C433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 23:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CA5B83005;
	Tue,  1 Feb 2022 23:05:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p-QbFSTT2gkr; Tue,  1 Feb 2022 23:05:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB32E82ED2;
	Tue,  1 Feb 2022 23:05:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3A4F51BF2BD
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 23:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0EE1C4020B
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 23:04:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V_rrTHx-AzMm for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 23:04:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp2.osuosl.org (Postfix) with ESMTP id C095C404BB
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 23:04:18 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id F2C7n0nERroAhF2C8nakR9; Wed, 02 Feb 2022 00:04:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643756656; bh=i+llrIhN48tDLoygkKkWxZxZwRST0HRrG8ZUsbbstlA=;
 h=From:To:Subject:Date:MIME-Version;
 b=V2+lFUUCtoKUKMT1Ghz+MjzfHLU2whajb1jxbIgT69ASVkN712/eET/VmRAXCf82I
 VI370YD2VSc6JnHCZNf1cDl+fiEET6SrFlSuAadNXUuI3yQ/BWff4LFBfa7JfqT/v2
 xzli53Ldu37QiGSOvZY2loqn/nAKRKYL/s70o1S0jk8MeWiTLQgC/IL0faQ/KlWl1f
 8t3RpGuid6DdBb8oIcaTFBz/lD3tMFNMfZBHDt+eIT9TCwGqWAyWtQUDtukH8otYmW
 AKu8rswIhMP5Kbmaf55aE7JDpIe6uH00ROn7UYYHzCJyrZ+Ft830hIi/89jaMVDfrL
 iFGUzyVwgOx5Q==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  2 Feb 2022 00:04:11 +0100
Message-Id: <20220201230414.4144930-4-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201230414.4144930-1-giulio.benetti@benettiengineering.com>
References: <20220201230414.4144930-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfHcR2BLKoT6oQKVgMe9yoTE50fR0sDxD+MkuTlVBsLhDw6+j3B6OavjWM6vUJ6yjssdOQQExCYfN4DB723A1EER5eb61jjud23bvpaOb6llutKe4HQD+
 oxXX9SOh4k0ZTiTPbB++smfWKNFfL8E7ucF6LMCouKC8SaOFuGx+R5GkDIKRC9stWBsIFx/hJnnlrb80y6LjNG1T2gl/CE9QVQerZTmWQgkyAz8JlhuWuzHy
 SluzTeO89y71TFw6ag3J624wB/L0GIhNtlh5XO7VPqDTRFlf6I9QEE25TnO52ExIMuDsbaxyRNZWuI0jMZKKbX/UueRunyl8rGRdvApS3Argod28duqYW60+
 AGWy420srDtD0yAjpZL78cxXaU4/keUGJv57eJBR+mASGxTcM1FSWFsghb6bDjSiORP+vukWjAmkpnxnlzMEaCCJ6Nv5FA==
Subject: [Buildroot] [PATCH v2 3/6]
 configs/microchip_sama5d2_icp_mmc_defconfig: linux needs host openssl
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
https://gitlab.com/ymorin/buildroot/-/jobs/2035821094

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/microchip_sama5d2_icp_mmc_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/microchip_sama5d2_icp_mmc_defconfig b/configs/microchip_sama5d2_icp_mmc_defconfig
index 4bb3625f83..27ea4970f1 100644
--- a/configs/microchip_sama5d2_icp_mmc_defconfig
+++ b/configs/microchip_sama5d2_icp_mmc_defconfig
@@ -12,6 +12,7 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,li
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d2_icp"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
