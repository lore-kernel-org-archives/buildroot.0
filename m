Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 196DDC433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 23:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B500D60B52;
	Tue,  1 Feb 2022 23:04:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bt2pVDEOJYqP; Tue,  1 Feb 2022 23:04:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6F9060767;
	Tue,  1 Feb 2022 23:04:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 596E21BF3BE
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 23:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB63240500
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 23:04:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qtam80DEO6nZ for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 23:04:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CA7040017
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 23:04:17 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id F2C7n0nERroAhF2C7nakQh; Wed, 02 Feb 2022 00:04:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643756656; bh=7wPBZLufMgkus4nm3cjNKtx0f62GbpeaK+cJHYN17Ls=;
 h=From:To:Subject:Date:MIME-Version;
 b=gVSZwb54rnLWx8N1v6tjwC6z1XoUs+lXAkTs7kywB4xPKFvFn1nlmbg5JYezaftAq
 oBaHXMYa0klyx8uclZOpYPvC5FRjyyAkP4knYy9c15RJmNtYWZcfnnxxLxg9ixNPkv
 PMy1t0nFBq80vZWnQ4bGWRL4HaQaE3eDBfpQIGml0XEbKECMd30BAEhgiIrEsIhvLn
 6rdzFSDV7frBNlZtIZfFdqJnPkql8QxVvJ9/xVS62+/cL6qmSS9HunHPMJftyw226g
 4x5ISHBh4SI3HSeAOVCqoKVl10LgR34L9ZwWYBGMccuT7ctsItJoxu1wwahE5UU7kV
 gDobhT3fP4SOw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  2 Feb 2022 00:04:09 +0100
Message-Id: <20220201230414.4144930-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201230414.4144930-1-giulio.benetti@benettiengineering.com>
References: <20220201230414.4144930-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfHcR2BLKoT6oQKVgMe9yoTE50fR0sDxD+MkuTlVBsLhDw6+j3B6OavjWM6vUJ6yjssdOQQExCYfN4DB723A1EER5eb61jjud23bvpaOb6llutKe4HQD+
 oxXX9SOh4k0ZTiTPbB++smfWKNFfL8E7ucF6LMCouKC8SaOFuGx+R5GkDIKRC9stWBsIFx/hJnnlrb80y6LjNG1T2gl/CE9QVQerZTmWQgkyAz8JlhuWuzHy
 SluzTeO89y71TFw6ag3J624wB/L0GIhNtlh5XO7VPqDTRFlf6I9QEE25TnO52ExIMuDsbaxyRNZWuI0jMZKKbX/UueRunyl8rGRdvApS3Argod28duqYW60+
 AGWy420srDtD0yAjpZL78cxXaU4/keUGJv57eJBR+mASGxTcM1FSWFsghb6bDjSiORP+vukWjAmkpnxnlzMEaCCJ6Nv5FA==
Subject: [Buildroot] [PATCH v2 1/6] configs/bananapi_m2_ultra_defconfig:
 u-boot needs host python3 and host openssl
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
