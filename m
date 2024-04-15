Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88939C4345F
	for <buildroot@archiver.kernel.org>; Mon, 15 Apr 2024 12:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F2F4403B4;
	Mon, 15 Apr 2024 12:46:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kcuav5ru7zfW; Mon, 15 Apr 2024 12:46:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04EF24040B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04EF24040B;
	Mon, 15 Apr 2024 12:46:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AF95E1BF38E
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 12:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 996FB4040B
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 12:46:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zoQmkFdk7mN6 for <buildroot@lists.busybox.net>;
 Mon, 15 Apr 2024 12:46:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 055BF403B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 055BF403B4
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 055BF403B4
 for <buildroot@buildroot.org>; Mon, 15 Apr 2024 12:46:23 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4187731a6e1so2810775e9.2
 for <buildroot@buildroot.org>; Mon, 15 Apr 2024 05:46:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713185182; x=1713789982;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1bwo8VEWnFasWaF+GbGUpayXuEAV2zTdZbmV/mMnI7k=;
 b=UPHlJw1sLEp72CynU8cFSS0/OJ2u5aWXO8gW0h9k6pkxPLYgELo6xac82Jpn+bS57l
 irs2Y0Ylaz6JOqY+tvUJplIXacZWWRvj5H6eswfAqXIEEcnJWRoxrQWqxrfANeQDcHhf
 JOkl7oxOq2cP87glbsUL38atCdVIaVLM35YeqX723m3Lwhn6+j3q5f8fKPzri07LERhd
 sZt5/hH9ewS4uzJW7/0VFLbx7KTGEfx2RFq0sZ3KKl5PiRTiDzUgUTo7/hiA6FVql4x/
 oYjRYrDhVwZhjoSqsi/Invj3dH7BNE6MHx6l2+Al16O2/qSHFs9l5pA1gqEVsxPIZeHo
 XfLg==
X-Gm-Message-State: AOJu0Yw0WOZXEpu+dYYfs63ei5bHcDT/kO2O7NKplbfM7ntRo5LEYMOz
 AXlC2YAequylONrj9GP06P9QAhFty4/Rw9ntj04lXRbBII2Or9s5Jd6y2d9ll3XSwEM5ZrXIjbn
 FYJA=
X-Google-Smtp-Source: AGHT+IHSb9AAISzaGwwHonMMCCgQFrYAvvltzxZY3aLfWDpn6kuFNFoqfgKA9OaH0hDEDJ1ZIlJ2Mg==
X-Received: by 2002:a05:600c:1f93:b0:416:bc18:2a00 with SMTP id
 je19-20020a05600c1f9300b00416bc182a00mr7468033wmb.38.1713185181732; 
 Mon, 15 Apr 2024 05:46:21 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 ([176.201.31.28]) by smtp.gmail.com with ESMTPSA id
 fc16-20020a05600c525000b00417f65fb982sm13106579wmb.6.2024.04.15.05.46.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 05:46:21 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 15 Apr 2024 14:46:16 +0200
Message-ID: <20240415124616.3817152-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1713185182; x=1713789982;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1bwo8VEWnFasWaF+GbGUpayXuEAV2zTdZbmV/mMnI7k=;
 b=OwPgAAsvBUeygVrJGGyWDbAd/Tq2D/jJte4p1ODv+Eankf2a2JcANYKAfUlZe5UXAV
 R9a3SOMxAoVnuatqhzdFv9B6KbZq3Q7wXg+WSgbfmxiIGe2W6L1mXc46tlo7nkrpE7uW
 JODNwBSdPuw91P+Deg3HqrcyFp1Y8RA9bH8D0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=OwPgAAsv
Subject: [Buildroot] [PATCH 1/1] configs/ti_am62x_sk_defconfig: reorder
 defconfig
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
Cc: Xuanhao Shi <X15000177@gmail.com>, Romain Naour <romain.naour@smile.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch doesn't introduce any functional changes but reorganizes the
code to prevent the execution of the commands:

make ti_am62x_sk_defconfig
make savedefconfig

from showing a change in the defconfig.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 configs/ti_am62x_sk_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index 5c7b97b3b0b1..405016818438 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -3,8 +3,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_GLOBAL_PATCH_DIR="board/ti/am62x-sk/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/common/am6xx/post-build.sh"
-BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am625-sk.dtb -l am62x-sk-buildroot -r /dev/mmcblk1p2 -x earlycon=ns16550a,mmio32,0x02800000"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am625-sk.dtb -l am62x-sk-buildroot -r /dev/mmcblk1p2 -x earlycon=ns16550a,mmio32,0x02800000"
 BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am62x-sk/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
