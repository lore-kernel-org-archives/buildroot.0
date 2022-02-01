Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D5CC433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 18:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54142404E0;
	Tue,  1 Feb 2022 18:34:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u8PPO9NmM3a7; Tue,  1 Feb 2022 18:34:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 469E040361;
	Tue,  1 Feb 2022 18:34:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 159AA1BF5D7
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 18:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02D20400C4
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 18:33:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Um2x8QIqKsn for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 18:33:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD7E440361
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 18:33:35 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Exy8nuBUiroAhExyAnYlHF; Tue, 01 Feb 2022 19:33:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643740414; bh=nM1SLqfYnjZnGpQla7en+iv1bdtYs+A1PaKhZIyiD44=;
 h=From:To:Subject:Date:MIME-Version;
 b=RWDgxB8+XJHpSFSWySzWtYnCy2JuYnkCxLFnRZWPlhpiVW0H92yQ0BJ07V6ot2o0g
 6jn3Kr+GyoaEx2MZLu4ZXuWkzCxvhdphNJrMdoZ4bUeD24DTfIXF2oZ0xtjLjgM/F+
 cecyjfJjCLhg4rW6BVHlfIeOPapd/SU/kYKikqH1GlGNd5c/otbh6Z8wa1/dJzwvuh
 bQHk8g3fjxuVOkbcYIyMLyd7Aj2OJgmKtyl9/AdEOYS2KPjxcwxhJo+JyD8Dt+xKff
 2nfdfCofqgmhcucoaaNHm9IEmXB8pVzn7U3UmAGjkTiv/QyRLySuFe5cVPDeqbt1D3
 ojvedASgJF+nA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  1 Feb 2022 19:33:29 +0100
Message-Id: <20220201183331.4009320-5-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201183331.4009320-1-giulio.benetti@benettiengineering.com>
References: <20220201183331.4009320-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfC/FFKJlHXGVwhg9dFfDiK8o605a8j5bt/124Gh8sBDuc1BIbVtiYjrSjHUbmasK8PculABdkOlQVTSBJQC0DX1679x7/99dWydiw+avr3n2SdLCRNvh
 c6tveytfvKIm2Y0FRM+s5p1hOJOj9SuLMAhfbDcdqXZhq0ZE5toPmZ7XtPVzIdet3vamd954eNhApmgmnTM6OAXHieAqNMJiCiIj5hwkQKtDTrPqF0h7uoxG
 484TEuQWiXiuzguyjOt9p0bujdzsFkkk/W0QK2lv8iLdOU/HR1LJZCffLVlaBL+H65bZO2iSTYI49zoTCsN1udyqMis+tU/yTofR6hkvzgjbxWB8mmdBc+q6
 64BrK+y0BRTq9KTTp8T6htFz1KH61tLZxexmdfynXKWb8GBRberAwmNAocKG59QZyG9XfYam/7WiNB8d3u9RobY+PPbv4A==
Subject: [Buildroot] [PATCH 4/6]
 configs/microchip_sama5d2_icp_mmc_dev_defconfig: linux needs host openssl
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
https://gitlab.com/ymorin/buildroot/-/jobs/2035821096

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/microchip_sama5d2_icp_mmc_dev_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/microchip_sama5d2_icp_mmc_dev_defconfig b/configs/microchip_sama5d2_icp_mmc_dev_defconfig
index 052d9e032c..27d1d3409d 100644
--- a/configs/microchip_sama5d2_icp_mmc_dev_defconfig
+++ b/configs/microchip_sama5d2_icp_mmc_dev_defconfig
@@ -16,6 +16,7 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,li
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d2_icp"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_LINUX_TOOLS_IIO=y
 BR2_PACKAGE_BZIP2=y
 BR2_PACKAGE_XZ=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
