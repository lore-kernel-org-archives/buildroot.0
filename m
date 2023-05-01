Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671FEC77B61
	for <buildroot@archiver.kernel.org>; Mon,  1 May 2023 16:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E886160F2F;
	Mon,  1 May 2023 16:26:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E886160F2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3D1C2jQ44SZz; Mon,  1 May 2023 16:26:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 218E860736;
	Mon,  1 May 2023 16:26:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 218E860736
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C8661BF420
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 16:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1544A81FB6
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 16:26:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1544A81FB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dq-2vvMzrJFj for <buildroot@lists.busybox.net>;
 Mon,  1 May 2023 16:26:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B1A3818A7
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B1A3818A7
 for <buildroot@buildroot.org>; Mon,  1 May 2023 16:26:23 +0000 (UTC)
Received: from localhost.localdomain ([146.241.104.90])
 by Aruba Outgoing Smtp  with ESMTPSA
 id tWM0pNZiHIzkbtWM0pQonn; Mon, 01 May 2023 18:26:21 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon,  1 May 2023 18:26:19 +0200
Message-Id: <20230501162619.1260325-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfAnzRoB3cAiP8tsN/uEp4iGipTUjTiX7NLjj7WMN9/bRfcAkSyOMKsTke/aI7uM0C5i7Zfnom1PrUjYiHtP5hEDYexh1hGqmBTn4Ry/Aet4EJBeVvhpH
 ue085XA8V/AL5qyd6hCuh46FzcTGxsaOM0Di2HW9TO4hXUMLOYcWos7qh9kPGlVfGDlj3RA2238T+bam5wQ1JVUh3ZPSnalYCt/212GrXFA6c5JoZ7vy2L6Y
 kzl+Qf0So9g4lbPzvrSRnvYbtTziJ4e9uxF4PzoUSnYDxnzQkAuNXma11Ofo1J7GaMUsiQhk5YPbd21ENz/LeHaVFi4o+/v55COT7k5r0yHFtL3lsjJ6XagF
 ubB9xP7RJij/E5BlJceV6pKan2I8CQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1682958381; bh=sFgLCdPckWYoDkDMly5bGvbIlViWifGqOYSv2mIfdwE=;
 h=From:To:Subject:Date:MIME-Version;
 b=eGgTmJBlEkalU3X26KXXzgHKGyI89+JvJ5Kf0sGL5GgamTIS+/WRWggT4BQ0OqQUh
 PWVolC+tvN8VOrm4+JsgFJYJkksVLphMWLwsEJRvpHOCxCWisw/ZQY22GyHBFauPRb
 m+2amtwGwTmWI1b50H+k3yE40aYWdjI6LdtQohIga6delWtseU5fmUnDc9MPvFM9bJ
 LXxQ5eV3li316lYqjgVLiQZXGPo1wYxaVlACCy1dSG/5zqmscJlIlQmudM3ryXpRcc
 7rE6La1gLJr0OcxNJLYNVFNkztBu5pLm25nymeeIQgXRAURa6Of15Sr8PivWDsqden
 oW3coZszw2K3g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=eGgTmJBl
Subject: [Buildroot] [PATCH] configs/stm32f429_disco_xip_defconfig: fix
 runtime error due to low ram space and bump to linux version 6.1.27
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Christophe Priouzeau <christophe.priouzeau@foss.st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

After booting Linux the userspace is unusable since every command issued,
that is a symlink to busybox, fails because of no free ram. So let's
disable IIO in linux.config to give some more ram to userspace.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/stmicroelectronics/stm32f429-disco/linux.config | 4 ----
 configs/stm32f429_disco_xip_defconfig                 | 2 +-
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/board/stmicroelectronics/stm32f429-disco/linux.config b/board/stmicroelectronics/stm32f429-disco/linux.config
index 7b5c60f180..02d9c2d1e0 100644
--- a/board/stmicroelectronics/stm32f429-disco/linux.config
+++ b/board/stmicroelectronics/stm32f429-disco/linux.config
@@ -95,10 +95,6 @@ CONFIG_STM32_MDMA=y
 CONFIG_SYNC_FILE=y
 # CONFIG_VIRTIO_MENU is not set
 # CONFIG_VHOST_MENU is not set
-CONFIG_IIO=y
-CONFIG_IIO_BUFFER=y
-CONFIG_IIO_TRIGGERED_BUFFER=y
-CONFIG_IIO_STM32_TIMER_TRIGGER=y
 # CONFIG_FILE_LOCKING is not set
 # CONFIG_DNOTIFY is not set
 # CONFIG_INOTIFY_USER is not set
diff --git a/configs/stm32f429_disco_xip_defconfig b/configs/stm32f429_disco_xip_defconfig
index 872e4b6a30..1aea741f7e 100644
--- a/configs/stm32f429_disco_xip_defconfig
+++ b/configs/stm32f429_disco_xip_defconfig
@@ -6,7 +6,7 @@ BR2_ENABLE_LTO=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.10"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.27"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f429-disco/linux.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
