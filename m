Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D9AC636CD
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 08:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC5BA40F4E;
	Tue,  7 Feb 2023 08:21:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC5BA40F4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BD-BkJnXV2Lx; Tue,  7 Feb 2023 08:21:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D154C409F2;
	Tue,  7 Feb 2023 08:21:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D154C409F2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 63CD31BF30B
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 08:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D17D404F4
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 08:21:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D17D404F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BYvKtmBL2-mm for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 08:21:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AC78402E1
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0AC78402E1
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 08:21:49 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 m16-20020a05600c3b1000b003dc4050c94aso10770753wms.4
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 00:21:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ocuEGTgWk1Q+BgyB8uy/vGcS/YvzXC2WskOT/seJLAY=;
 b=Jc3mdyV96kMVydFLD5dp/jfQkBagkVPKVo4OLbKZ1wrzWRcxJci/DIMj11AJ0dk3Lf
 GqJWSXOsjXnBu6DMJgZ63PpE4m5wQdLI9tHzvHtm1ISFAlGC2PVT2DNECovuk4I9U+t+
 clPLsiQ4olDBa2cRxCRIp0W7sDtdY31hZZNUtHhOyTRuLvblNDbcqKuY8v3jX1nArBlV
 ZV1mrDfDRugdSZm+suaZodw0e5J5nwKkrn6bG5RI589R3QXG6CB+PJCm19v1QGoV6KF5
 Nth9Ut9VCsccoiehgJxFNEBTHdl9MtARSXSWoiUPBMoeky7JxvWe7Iro2L9wyekJkYLc
 t/wQ==
X-Gm-Message-State: AO0yUKUfwriczorMK35MVbYHh8nOssddxwSwD6D4l/vfTZi9Vqu+1PZb
 k9TEruMspHy1LHGfwZ1PfxqPCuCRvNtxU8Df+udpNw==
X-Google-Smtp-Source: AK7set9SPTHrIuZ7YwMOmnQX0m9dgSWRBe40uSK0yqeHeHkA3vpK21Ge2eD8eyIZt06UhO85Vt/HKg==
X-Received: by 2002:a05:600c:491d:b0:3dc:4316:52be with SMTP id
 f29-20020a05600c491d00b003dc431652bemr1389811wmp.10.1675758108086; 
 Tue, 07 Feb 2023 00:21:48 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. (mob-5-90-193-20.net.vodafone.it.
 [5.90.193.20]) by smtp.gmail.com with ESMTPSA id
 fc13-20020a05600c524d00b003db01178b62sm20246513wmb.40.2023.02.07.00.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 00:21:47 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 09:21:36 +0100
Message-Id: <20230207082136.90164-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ocuEGTgWk1Q+BgyB8uy/vGcS/YvzXC2WskOT/seJLAY=;
 b=J+C8w+p6tFpkJF2WVZhqUTX/oPiCHw5wUHwUF2BMWCmwnW1nD2bTq2kImGLBWYC+7J
 UHJgPqfKL4OuJjCqKkPVP4YLsiocz2dVYKT2tlqXjpezXWX3V3T6VbVw4jiVVA6KpaNz
 +fS1lW992AfTCIn8YA68RuPrNVr0q3LBiD4vY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=J+C8w+p6
Subject: [Buildroot] [PATCH v2 1/2] configs/beaglebone: bump Linux version
 to 5.10.162-ti-r56
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Lothar Felten <lothar.felten@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The previous version failed to boot from sd card with a log reported by
the document [1]. In my case it always failed, a 100% failure against
75% reported by the document.

Instead of adding the patch to fix the problem, I preferred to update
the kernel version.

Tested on beaglebone black.

[1] https://forum.beagleboard.org/t/5-10-x-beaglebone-black-fails-to-boot-from-sd-card/33297
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- bump version to 5.10.162-ti-r56.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 configs/beaglebone_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 639b491e9746..3ce5721265c3 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -20,7 +20,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beaglebone/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,5.10.30-ti-r3)/linux-5.10.30-ti-r3.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,5.10.162-ti-r56)/linux-5.10.162-ti-r56.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue am335x-boneblack-wireless am335x-bonegreen-wireless"
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
