Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E999CC433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 10:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84185414C6;
	Tue,  5 Apr 2022 10:37:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lNthg3fY9BCx; Tue,  5 Apr 2022 10:37:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5985E4149D;
	Tue,  5 Apr 2022 10:37:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9C50E1BF2C4
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 10:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BDBB827BB
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 10:37:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bbGWd_dy5Iuy for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 10:37:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD90882725
 for <buildroot@busybox.net>; Tue,  5 Apr 2022 10:37:48 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 v64-20020a1cac43000000b0038cfd1b3a6dso1274068wme.5
 for <buildroot@busybox.net>; Tue, 05 Apr 2022 03:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zGeMRXO0+LH07Cr1yDk6E3iHSjf4/lYYVyW2sEUg3HE=;
 b=QupymcBaZhpybJD9jvanamYEKHsr0hbB6Pkme+hINU9bGOPNUxVNysQmLAmbnmVO4k
 OM9KmUFUtB4JTGZTLwu3V2XevMCXslxCtUxYESUc1XQYv3MXGg3TX4ju7S5ri0v1qUbL
 OzrDPt75giLd9iNmW58iDdSutAxcRJy5yLqrCTcdN4UevwEaADDR5Cwco/xPiS6FWiah
 ZmcJ4tE/L8RSTnzyHRhqNTB5K0OzFbBb7xtxEoXvw9y8tfQappGe3lxm3tTZezcdr0bf
 WIuLbVzkpAuMnZFaUMqBU0ue0JWm/y3pNcmm5M9NE41Uwbsn/u9QYuHpiM8MSyIb/wRg
 5s2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zGeMRXO0+LH07Cr1yDk6E3iHSjf4/lYYVyW2sEUg3HE=;
 b=2ZNn2zBWIs+E+TjXZn3Yrwb1aYZWwuLOd4F0oXH+wzMONifJapgRNUsM02LkWl3ScU
 6c8tAK29jsa6UDVJl8lJ4CYYVDed51Mqw3Acps2T3kd2ajDgWZQTJdCpi8Q9aiTylF+4
 /AZlBDrkSEPQg/ZcXgyy01O0Q54QbquVtYQzBLJ780Qrcn6HV2niFx6RtZ5zL9bUnj3F
 yzO5tc/7jDnD7ZYZPs5GlUXP1nMFyPwvkcOsZ4gV4/BfeIaUTCay6tJq8EOxaiZ7kPCk
 EYLbXXBzIKStu2SBcdOoNK1B0ceZuTdSwALNC7hlYji9n+ILA7GR7Hoge5kWfjlwiQCy
 rFag==
X-Gm-Message-State: AOAM5301y7E3B3io7po4NMKWuJ3WzDsVrUoTawdCP3GCLbxvdpuNF5zx
 3WTIUDpe2X/3CFSk3Hd23Ojo3tFeyxg=
X-Google-Smtp-Source: ABdhPJzD/Gm5chfOhfXwcNBYO8n3b9tFjjfDk8umZRHkBadzoejONtrSSaULu+89V9rSa6rF2mzfDA==
X-Received: by 2002:a05:600c:1797:b0:38e:70fa:4e4f with SMTP id
 x23-20020a05600c179700b0038e70fa4e4fmr2547270wmo.30.1649155067044; 
 Tue, 05 Apr 2022 03:37:47 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 o11-20020adf9d4b000000b001f0077ea337sm11738170wre.22.2022.04.05.03.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 03:37:46 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  4 Apr 2022 20:35:35 +0200
Message-Id: <20220404183535.2392985-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/mx6cubox: bump Linux and U-Boot versions
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 configs/mx6cubox_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/mx6cubox_defconfig b/configs/mx6cubox_defconfig
index 6ea4f6e41..a9cea73fb 100644
--- a/configs/mx6cubox_defconfig
+++ b/configs/mx6cubox_defconfig
@@ -17,7 +17,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.32"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-cubox-i imx6dl-cubox-i-emmc-som-v15 imx6dl-cubox-i-som-v15 imx6dl-hummingboard imx6dl-hummingboard-emmc-som-v15 imx6dl-hummingboard-som-v15 imx6q-cubox-i imx6q-cubox-i-emmc-som-v15 imx6q-cubox-i-som-v15 imx6q-hummingboard imx6q-hummingboard-emmc-som-v15 imx6q-hummingboard-som-v15"
@@ -32,7 +32,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="mx6cuboxi"
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
