Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F17BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 17:31:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 548C360F6B
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 17:31:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 548C360F6B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11F2A80D97;
	Sun, 14 Nov 2021 17:31:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qw93DbR1CtTE; Sun, 14 Nov 2021 17:31:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6805680D62;
	Sun, 14 Nov 2021 17:31:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C0901BF2BA
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 17:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C09980D62
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 17:31:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XjLaV-zrDFn3 for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 17:31:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from libero.it (smtp-16.italiaonline.it [213.209.10.16])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4CDE180D60
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 17:31:40 +0000 (UTC)
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it ([79.24.99.64])
 by smtp-16.iol.local with ESMTPA
 id mJLpm8CKm7VizmJLtmVOmp; Sun, 14 Nov 2021 18:31:37 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
 t=1636911097; bh=1RSVE0cv08Z2UWF6/KlCdZqwCwNqC9EM4GYpzcmBGFE=;
 h=From;
 b=B5rl2TQyYLlmQWrp/MMkxHRA8B6LgU7d+YT7Xi1E0aX4foSD9ivupVMFTiHa4XOaD
 /b80V86dqb5EVJr2G183tKlt1G4qmH2ma+DXqp2dxN2QAgETAZRYYCdlx0gVxnSMpm
 Yznc4NE766wa4SixPaqjyz4eIGSTL+Ku5JJVr7/ttEC5oRGfrjBaOoGp+6MFBxy/AS
 eEOhXeL+DpNZiQuuylTmX7WxepWQdZTpQZXhhRZN3q2DW9/SXfQ+X8ll25DnFYf2N0
 lcM4rvsvD4ytZE4YIVxizNHZ6kjUB3IT9fKbRP/7rUNF5RX+Onckzf72l5IPdzT0/L
 0GwJ7is1Ri6Bw==
X-CNFS-Analysis: v=2.4 cv=ftYZ2H0f c=1 sm=1 tr=0 ts=619147f9 cx=a_exe
 a=8X6arsqDvdvtpvHbdcPR/Q==:117 a=8X6arsqDvdvtpvHbdcPR/Q==:17
 a=e2X5L8jO6AHGwzUiFLIA:9
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 18:31:18 +0100
Message-Id: <20211114173122.16612-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
X-CMAE-Envelope: MS4xfMAj0wAer/hBhVlByM8VP0kXUbbF9F9oTwXM/yoHwFY4IjxFIrVGBqIzy3vXLeask6CTfLGNrHV2MpD5cwMOno8b6EkkFgYyJDjRuHQNdDclnPCkDjrx
 4GL1+cV4RkP4aP9YlQtff8EbCRDjsq5UTodbPWDnnMP73pXqG5FgRNe4d09/aAKj4yhQk+zslVItsxsgUCUo7Kg9shLVbF3IzqFv5Ip59fGdi0U0a5hdAsoF
 OLwM9xuTL6gop0P9hNTP+HG2Y3p8OkkjmvoMi3FKPorzo+/fza3oKJPSJ+jcNuXLi9QWdXEzd7SAg+/+93gwtZIs2uIdLS4U1e3Y17N5IBngru08EY3Z+xi8
 DBAkIsAM
Subject: [Buildroot] [v2,0/4] configs/stm32f429_disco: fix kernel bootup
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
From: Dario Binacchi via buildroot <buildroot@buildroot.org>
Reply-To: Dario Binacchi <dariobin@libero.it>
Cc: Lee Jones <lee.jones@linaro.org>,
 Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 Dario Binacchi <dariobin@libero.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Inspired by Arnout Vandecappelle's review of the kernel bootup fix patch
for the stm32f429-disco board I created this series which required the
afboot bootloader update and the kernel bootup fix for the
stm32f469_disco_xip_defconfig configuration. I therefore renamed the
configurations of the stm32f429 and stm32f469 boards to make them more
explicit.

Dario Binacchi (4):
  configs/stm32f469_xip_disco: fix kernel bootup
  boot/afboot-stm32: upgrade version
  configs/stm32f429_disco: fix kernel bootup
  configs/stm32f4{2|6}9_*_defconfig: rename configurations

 .../stm32f429-disco/flash.sh                  |   2 +-
 .../stm32f429-disco/linux.config              | 120 ++++++++++++++++++
 ...sco-don-t-force-init-in-chosen-boota.patch |  32 -----
 .../stm32f469-disco/{flash.sh => flash_sd.sh} |   0
 .../stm32f469-disco/flash_xip.sh              |   2 +-
 .../{linux.fragment => linux-sd.fragment}     |   0
 .../stm32f469-disco/linux-xip.config          |   8 +-
 ...32f469-i-Update-kernel-start-address.patch |  56 --------
 ...fault-dram-address-without-remapping.patch |  38 ------
 .../stm32f469-disco/readme.txt                |   4 +-
 .../stm32f469-disco/readme_xip.txt            |   2 +-
 boot/afboot-stm32/Config.in                   |  32 +++++
 boot/afboot-stm32/afboot-stm32.hash           |   2 +-
 boot/afboot-stm32/afboot-stm32.mk             |  18 ++-
 ...efconfig => stm32f429_disco_xip_defconfig} |  11 +-
 ...defconfig => stm32f469_disco_sd_defconfig} |   2 +-
 configs/stm32f469_disco_xip_defconfig         |   4 +-
 17 files changed, 187 insertions(+), 146 deletions(-)
 create mode 100644 board/stmicroelectronics/stm32f429-disco/linux.config
 delete mode 100644 board/stmicroelectronics/stm32f429-disco/patches/linux/0001-ARM-stm32f249-disco-don-t-force-init-in-chosen-boota.patch
 rename board/stmicroelectronics/stm32f469-disco/{flash.sh => flash_sd.sh} (100%)
 mode change 100644 => 100755 board/stmicroelectronics/stm32f469-disco/flash_xip.sh
 rename board/stmicroelectronics/stm32f469-disco/{linux.fragment => linux-sd.fragment} (100%)
 delete mode 100644 board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0001-stm32f469-i-Update-kernel-start-address.patch
 delete mode 100644 board/stmicroelectronics/stm32f469-disco/patches/linux/0001-Use-default-dram-address-without-remapping.patch
 rename configs/{stm32f429_disco_defconfig => stm32f429_disco_xip_defconfig} (63%)
 rename configs/{stm32f469_disco_defconfig => stm32f469_disco_sd_defconfig} (97%)

-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
