Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B48C433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 23:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1042A40321;
	Tue,  1 Feb 2022 23:04:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xabywydv85QN; Tue,  1 Feb 2022 23:04:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50C4040319;
	Tue,  1 Feb 2022 23:04:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F1E8E1BF97F
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 23:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D846640319
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 23:04:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2la8Jn--8OT4 for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 23:04:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp4.osuosl.org (Postfix) with ESMTP id DEBF64030D
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 23:04:17 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id F2C7n0nERroAhF2C8nakRN; Wed, 02 Feb 2022 00:04:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643756656; bh=nM1SLqfYnjZnGpQla7en+iv1bdtYs+A1PaKhZIyiD44=;
 h=From:To:Subject:Date:MIME-Version;
 b=hDjB6zQ6x2Dr7KqiaFXDTjnHRk4HVEF23mLdgt11Qf8tC4MC3wo4CSkylpCrVaUiB
 gTGuZmRDfjv6+mnmitHsYYPw0/JIXp0X9XVA9vxj8vqzGQO46nHJrhcWp+2+lm7SBG
 4P3DOa60hzT2sTDQ1Na4f3nPyr7/MsVQogu7hen7OMADKskDqQbr9xC0x7uLBSqEYr
 fmA7Vbg1Xj7PIacSc6dWPclcCIdaqkHV1IaJhuuw6jUk+ZIZEGtqX4ijdNzxnSsdGT
 FXU0BhsWS8/7MXnB2ZDyPofTUW7FJ+jr+0+2CfNQuHZ1iFGdRglIAdOetj4b/uIfY7
 nyyEDYh/veSvA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  2 Feb 2022 00:04:12 +0100
Message-Id: <20220201230414.4144930-5-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201230414.4144930-1-giulio.benetti@benettiengineering.com>
References: <20220201230414.4144930-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfHcR2BLKoT6oQKVgMe9yoTE50fR0sDxD+MkuTlVBsLhDw6+j3B6OavjWM6vUJ6yjssdOQQExCYfN4DB723A1EER5eb61jjud23bvpaOb6llutKe4HQD+
 oxXX9SOh4k0ZTiTPbB++smfWKNFfL8E7ucF6LMCouKC8SaOFuGx+R5GkDIKRC9stWBsIFx/hJnnlrb80y6LjNG1T2gl/CE9QVQerZTmWQgkyAz8JlhuWuzHy
 SluzTeO89y71TFw6ag3J624wB/L0GIhNtlh5XO7VPqDTRFlf6I9QEE25TnO52ExIMuDsbaxyRNZWuI0jMZKKbX/UueRunyl8rGRdvApS3Argod28duqYW60+
 AGWy420srDtD0yAjpZL78cxXaU4/keUGJv57eJBR+mASGxTcM1FSWFsghb6bDjSiORP+vukWjAmkpnxnlzMEaCCJ6Nv5FA==
Subject: [Buildroot] [PATCH v2 4/6]
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
