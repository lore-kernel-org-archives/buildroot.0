Return-Path: <SRS0=/juA=P6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7301DC433F5
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 20:05:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7B45610A8
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 20:05:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D7B45610A8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 823524059D;
	Thu, 11 Nov 2021 20:05:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2mCu9YCHDXUl; Thu, 11 Nov 2021 20:05:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E372A4059A;
	Thu, 11 Nov 2021 20:05:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6FD271BF9D1
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 20:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A1E8403EB
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 20:04:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0uXP5zl4omAD for <buildroot@lists.busybox.net>;
 Thu, 11 Nov 2021 20:04:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2022640226
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 20:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636661081;
 bh=csysZjh9k/S6M9leELyS8UBbn/zUkW9b4Mxpa+PapYU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=l2NyWwHLPhFD8eJQSIlVf3+AFyUuLzoJdZ1uKazDBvwBy1VQT8NOAI3NrS6bQFjMi
 ltSAnDHbm29g4s6FjVPRzW+aGQQQJLDfBBUZKWbW9OtDHnu/Xi3QxtaS8Wd8A0Yrty
 nfwU36ux1UEzKQtoZs3PeUmaBB/C+ED62WCXdBoU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.16]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MMXQF-1n1xYE0N7v-00JXI8; Thu, 11
 Nov 2021 21:04:41 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 11 Nov 2021 21:04:36 +0100
Message-Id: <20211111200439.15379-4-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211111200439.15379-1-ps.report@gmx.net>
References: <20211111200439.15379-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:/ZkNF2IFJDeKUFzZ8X4k79g/1ApgUs+6fyljAyi1iCmYMEEOrou
 hWcAzgBHyJcH6/nNHgqU1J9LXtuOrsExPZD/Kc6TvhhjwXpvXNFRCfUnXJKLazwkYbr6Bik
 ZN2D2PAMu4bFh7BYLPWSiZ359CRPjUGBGKjhgve4cwg2BAQ+P+GTigJ51cblR5PrIpg+gcS
 zyxiyDdKBNYevPNr1HYoA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UHUUQvGd050=:ox7TX+9ubv07V/PrV0ZT/N
 fxs7bDUIYj5wwTLwWhvGoOPONM9X7GI3J22PwOK3mbeFH0IJXlLHLFouSXSdYvmnz0FbRzxR2
 aQggARrE7UotNCMwtm8vh/DguXCHnhYXejr6OX23TiGJbjpdE0H+yi2+niC+k/rCfYjiE0e2G
 C7GkkZvP6jXvl4F0F5MTK57k6mylBJJKYgx8y4MjOK1qeAgGLFZurrw09ZqgNwvkrxupsxUUY
 xAxjqecgOGtPg31Vx6nwv6Mqz3QBtDzV95h/gj+PK6NoErtEen0rIfUqKZ6ZxRZsG+j9rALn/
 intrfI08Pog+gHK5j4HemJFaf5xODXgPgG4dssw36LokvYmQzY6YyiqxXdP5RPJbSYYz+2tze
 RqKOBoHzZQaOjEDL0Lwy2zpT9ZHrtr+zEdxtJL1kz1FOdQw+oMAOdNeH5N6Q0b49UpJz8oLVw
 4GJ34FA7wTM9K/A7Snogr51qob/eExc0k8JG7tA01s+qEUI8caBXpKuL+7A0YuhQ1ieDMlDKo
 qn6ov2Ip8VKefI80fUJHuiuJv76L2HfIbhdftZkaRqHgdnE9wVb2DiA1GIh7zqIUjuHT1zOJV
 48Gc9gJ6m2vL+UF2npN70RELFGSXVPpRroE+RGnkx/IBeGfX3sMKQ8H417zvB5wWIr+CutasT
 969qXyr5Z/TrUxZhxUx2jE745Ocv8S7eal+slo5Wm0mG4bjjKMtwOv3AVQ/r60FTOVTOanjZP
 4ObJ0jaRSyXSKrdx88XDYSyY+jrxh1U4hO4LmwpUsp2RGBcV+hGVq3FLY+XyVNOnRI6+29OSQ
 L4XIWFYhgBgZnjQIe4iuH2YBB5dXsbhy2++9bQ/9dGN7tfQAQzGT+7/P+MJ5HvJHgdJaDanhw
 J3H5E+1dVuQlWpSvG7zpl0pncfLgxyn/FL1H2nktQ6BeFlkkMQ/6j4AhkIB4rOEDGkmoOi2Qq
 M1y9m2AjjVNGHiQXGhzTMCqJIzdumHGLxXhuRfAMH+cG2dXpuJrzbBKLPXSe2FSV46+2z6r8O
 d0I091hG3tk8Do0eg/nMxDuZpYR020W8scb3lSh6/2hJGVMpgncytcKXj83ZSW/ry8YelL9WD
 PjAjC/X1Yy3JH8=
Subject: [Buildroot] [PATCH/next v1 4/7] package/rpi-bt-firmware: bump
 version to 3888ba2
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog (since 883b726):

  - 3e020f7 Add 43436S firmware
            Future Zero 2 W boards will have an alternative version of 43436
            that should have different firmware, named brcmfmac43436s-sdio.

  - 3888ba2 Merge pull request #18 from HiassofT/43436S

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/rpi-bt-firmware/rpi-bt-firmware.hash | 2 +-
 package/rpi-bt-firmware/rpi-bt-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-bt-firmware/rpi-bt-firmware.hash b/package/rpi-bt-firmware/rpi-bt-firmware.hash
index 3f37d964d0..7e60aa4632 100644
--- a/package/rpi-bt-firmware/rpi-bt-firmware.hash
+++ b/package/rpi-bt-firmware/rpi-bt-firmware.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0e7fcfe75a8990815a184dc55f8fdf5d0644d351a15a7aef865ff90ff4ca8eb4  rpi-bt-firmware-883b72628de1d7efa45b421da0cbf175ac2374f8.tar.gz
+sha256  9bd61431d42322eb0610bd7eed218da255c4472efc203be4332a0872bb562ade  rpi-bt-firmware-3888ba29898bb3f056d5f1eb283cb8de4c533bef.tar.gz
 sha256  b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d  LICENCE.broadcom_bcm43xx
diff --git a/package/rpi-bt-firmware/rpi-bt-firmware.mk b/package/rpi-bt-firmware/rpi-bt-firmware.mk
index 13358b4fda..8d658ce435 100644
--- a/package/rpi-bt-firmware/rpi-bt-firmware.mk
+++ b/package/rpi-bt-firmware/rpi-bt-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_BT_FIRMWARE_VERSION = 883b72628de1d7efa45b421da0cbf175ac2374f8
+RPI_BT_FIRMWARE_VERSION = 3888ba29898bb3f056d5f1eb283cb8de4c533bef
 RPI_BT_FIRMWARE_SITE = $(call github,LibreELEC,brcmfmac_sdio-firmware-rpi,$(RPI_BT_FIRMWARE_VERSION))
 RPI_BT_FIRMWARE_LICENSE = PROPRIETARY
 RPI_BT_FIRMWARE_LICENSE_FILES = LICENCE.broadcom_bcm43xx
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
