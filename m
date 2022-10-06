Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 007D2C433FE
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 20:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5550E83FF6;
	Thu,  6 Oct 2022 20:02:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5550E83FF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FVgfpTU7SJRE; Thu,  6 Oct 2022 20:02:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E46683FEC;
	Thu,  6 Oct 2022 20:02:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E46683FEC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 98A0E1BF3C8
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 20:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80DAC83FEC
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 20:02:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80DAC83FEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wK5irdpOt63a for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 20:02:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A76B983FA8
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 20:02:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A76B983FA8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 84FA186AC5; Thu,  6 Oct 2022 20:02:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 6 Oct 2022 22:02:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9e698c552bab51703014788ac1d61893868ee316
X-Git-Newrev: 8f088e6841d2b338037d25e50aaf8fc28b8fb384
X-Patchwork-Hint: ignore
Message-Id: <20221006200251.84FA186AC5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/octavo_osd32mp1_red: update BSP
 components
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8f088e6841d2b338037d25e50aaf8fc28b8fb384
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update description:
  TF-A to v2.4-stm32mp-r1
  U-boot to version v2020.10-stm32mp-r2.1
  Linux to v5.10-stm32mp-r2.1

This patch also updates U-boot to to use FIP image.

Reference:

  https://octavosystems.com/octavo_products/osd32mp1-red/

The device tree blobs, and the U-boot patches come from Octavo System:

  https://github.com/octavosystems/meta-octavo-osd32mp1

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/octavo/osd32mp1-red/genimage.cfg             |    8 +-
 ...d32mp1-red.dts => stm32mp157c-osd32mp1-red.dts} |  591 +++---
 .../linux-dts/stm32mp157c-osd32mp1-red.dtsi        | 2077 --------------------
 .../overlay/boot/extlinux/extlinux.conf            |    2 +-
 ...0001-Add-OSD32MP1-RED-Device-Tree-support.patch | 1180 ++++++-----
 ...32mp15_trusted_defconfig-disable-environm.patch |   47 +-
 ...x4Gb-1066-binG.dtsi => osd32mp1_ddr_1x4Gb.dtsi} |   12 +-
 .../tfa-dts/stm32mp157c-osd32mp1-red-fw-config.dts |    6 +
 ...d32mp1-red.dts => stm32mp157c-osd32mp1-red.dts} |  672 +++----
 configs/octavo_osd32mp1_red_defconfig              |   24 +-
 10 files changed, 1308 insertions(+), 3311 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
