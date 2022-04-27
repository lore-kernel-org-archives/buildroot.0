Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388FAC433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 14:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98ED141936;
	Wed, 27 Apr 2022 14:37:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ywVf56A4EvGc; Wed, 27 Apr 2022 14:37:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF8E641889;
	Wed, 27 Apr 2022 14:37:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8C5661BF870
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 14:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A2A981325
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 14:37:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dd6smI8x-nKI for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 14:37:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E638081320
 for <buildroot@busybox.net>; Wed, 27 Apr 2022 14:37:29 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id i5so2761112wrc.13
 for <buildroot@busybox.net>; Wed, 27 Apr 2022 07:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QZlj7RvOCy1XZG4DfESmzM5wUStk2uoIbqY6k0CN+4s=;
 b=cn/eZRZztytT/XbAZw9KVuupbrQ7Dih6823zixbgbSIBIXL/eB3jJccJQW6FdslRaQ
 iKkCSCFZ6faUssD0YgQkrx2NDwkK2h2xAYJocCj+FVW/cqzer1H4YW3XC2Heu+321C8z
 OATjDXKnmStvFR5FfaDceqNiKPMHBJrlmASdzCHuTMNI+7pXBcgjeqvdN6Q6dEdeJemN
 JK7aOTHUUrsS0c+rxUqCxrk0qGX8uF7VioVUpamh73OOg78sUgcZIZ85zMTV3+Iz8KCq
 2D3BjLnNSVlOgFvysvfz6mAEew6QlPPq3N3SJfliNGEXir/sdJ0ZVxMZP4U9QKAlYAoe
 zJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QZlj7RvOCy1XZG4DfESmzM5wUStk2uoIbqY6k0CN+4s=;
 b=oQWmjy3wZE5Iq1XjwP4dAJILwsbH7By242qsF6vXWCjUx1pFvwUh6hp5YtIsSn85iv
 LkxFcagq0ZRUL4yXaMoyQ+bcU1JHlJOhmF4+wQMSM5byKGXO4tA5p2K3xCXUjb3iCxsB
 w5V9XR7cl0y38IupcUUuWEmTK4lgqJ/QZMRot6mh8r62zeeoSIM6izCOfc2yiz+QGJoc
 J/Ubl0EsPMa72iz25m0yzYqsEa7wEpVXB++7kZKznT0HkP4Pyvkuri9XeuRrIXebR8NJ
 TeNoRGGMRT3VJf/d3i5YEeGSlTpgOU916NTFW4S+qp61yB26yXT0k++evoA74L0+WdK7
 hLXA==
X-Gm-Message-State: AOAM532gnrMgaiDbkcjF94Ig3Gxyr3m7Wj62noswS+WwFvWnNzS+Cc81
 UCf6Beiv0DrhoXxH8EcZFTBCAa5CovQ=
X-Google-Smtp-Source: ABdhPJyN/YkiwYtg3AWCnxC9F30hUZ7VhP2KebGue/o+er64W9l18Pyy2jS9Fl2PAkOCARJ53vk6Ow==
X-Received: by 2002:a05:6000:10a:b0:20a:e2aa:6848 with SMTP id
 o10-20020a056000010a00b0020ae2aa6848mr7992978wrx.464.1651070248045; 
 Wed, 27 Apr 2022 07:37:28 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a05600c35d400b00393f02839fasm1788789wmq.12.2022.04.27.07.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 07:37:27 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 27 Apr 2022 16:37:12 +0200
Message-Id: <20220427143712.55713-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/olimex_stmp157: bump Linux and U-Boot
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
 configs/olimex_stmp157_olinuxino_lime_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/olimex_stmp157_olinuxino_lime_defconfig b/configs/olimex_stmp157_olinuxino_lime_defconfig
index f9b31bbdc..a63394fa0 100644
--- a/configs/olimex_stmp157_olinuxino_lime_defconfig
+++ b/configs/olimex_stmp157_olinuxino_lime_defconfig
@@ -16,8 +16,8 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/stmp1_olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/OLIMEX/linux-olimex.git"
-# branch release-20220321-v5.10.105
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="82a1d20f488b895ffe817c5692a631237e257b7d"
+# branch release-20220413-v5.10.105
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="d417808c240d55576ee76e5cbb40413ad444ecfd"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/olimex/stmp1_olinuxino/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -34,8 +34,8 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/OLIMEX/u-boot-olinuxino.git"
-# release-20211130, based on 2021.04
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="1c29714bc643c299e2ed4ba870be8d4538124144"
+# release-20220413, based on 2021.04
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="b39c5a7c93a2d8efaecc9cad4284378af857c3f7"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="STM32-OLinuXino-LIME"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
