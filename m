Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EAE3C433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 18:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D545160F7B;
	Tue,  1 Feb 2022 18:33:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1DEU5bwGldFg; Tue,  1 Feb 2022 18:33:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18D4F60EE9;
	Tue,  1 Feb 2022 18:33:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9EBA31BF989
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 18:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A8088135B
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 18:33:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PzZGUDC_GEA5 for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 18:33:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8765E81354
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 18:33:35 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Exy8nuBUiroAhExyAnYlGt; Tue, 01 Feb 2022 19:33:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643740414; bh=i+llrIhN48tDLoygkKkWxZxZwRST0HRrG8ZUsbbstlA=;
 h=From:To:Subject:Date:MIME-Version;
 b=ZPIwqYv1GZzaCeSTWpYXayLktx6a9D1YuTQg5i7tjl48WuWsRkWhK2XjkFEgImVdy
 faV8wqDkgsm+NgeeEpkwc2bPL/+mkqEtomjt6cYfTEuaT9d4PtL86BPhguKqtaUcEZ
 hhA1TI2UmnyOSDCJ5yrlcip8+HDXxJKIdamrxVijLKiY6rLFhM6Om55F/wejVMSEOb
 mJ0LBR86WkeaboJXZ0As7nhgTpsLoatXRYvAOQum1SmCHisNE5bXh+u0pMnbzdqlSx
 OAxMlMhFvWlT9JqQNKcKl607imsLOrZTbj1yNf6Z9dJ57R3BtYDOBTl/vqPlLnP9cx
 3hQZtPX9UxZnA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  1 Feb 2022 19:33:28 +0100
Message-Id: <20220201183331.4009320-4-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201183331.4009320-1-giulio.benetti@benettiengineering.com>
References: <20220201183331.4009320-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfC/FFKJlHXGVwhg9dFfDiK8o605a8j5bt/124Gh8sBDuc1BIbVtiYjrSjHUbmasK8PculABdkOlQVTSBJQC0DX1679x7/99dWydiw+avr3n2SdLCRNvh
 c6tveytfvKIm2Y0FRM+s5p1hOJOj9SuLMAhfbDcdqXZhq0ZE5toPmZ7XtPVzIdet3vamd954eNhApmgmnTM6OAXHieAqNMJiCiIj5hwkQKtDTrPqF0h7uoxG
 484TEuQWiXiuzguyjOt9p0bujdzsFkkk/W0QK2lv8iLdOU/HR1LJZCffLVlaBL+H65bZO2iSTYI49zoTCsN1udyqMis+tU/yTofR6hkvzgjbxWB8mmdBc+q6
 64BrK+y0BRTq9KTTp8T6htFz1KH61tLZxexmdfynXKWb8GBRberAwmNAocKG59QZyG9XfYam/7WiNB8d3u9RobY+PPbv4A==
Subject: [Buildroot] [PATCH 3/6]
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
