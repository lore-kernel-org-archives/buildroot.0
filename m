Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BE9C433FE
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 20:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DBD28401B;
	Thu,  6 Oct 2022 20:03:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DBD28401B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nJ5JX1MDrPD9; Thu,  6 Oct 2022 20:03:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 221CE84015;
	Thu,  6 Oct 2022 20:03:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 221CE84015
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DE5B31BF3C8
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 20:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8AE8419D5
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 20:02:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8AE8419D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dqzwAe3cjXx9 for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 20:02:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B05E0419A9
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 20:02:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B05E0419A9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9991086A62; Thu,  6 Oct 2022 20:02:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 6 Oct 2022 22:02:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8f088e6841d2b338037d25e50aaf8fc28b8fb384
X-Git-Newrev: 04ae71b567587977be9d07ade764159b31f1f403
X-Patchwork-Hint: ignore
Message-Id: <20221006200251.9991086A62@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/octavo_osd32mp1_brk: update BSP
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

commit: https://git.buildroot.net/buildroot/commit/?id=04ae71b567587977be9d07ade764159b31f1f403
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update description:
  TF-A to v2.4-stm32mp-r1
  U-boot to version v2020.10-stm32mp-r2.1
  Linux to v5.10-stm32mp-r2.1

This patch also updates U-boot to to use FIP image.

Reference:

  https://octavosystems.com/octavo_products/osd32mp1-brk/

The device tree blobs, and the U-boot patches come from Octavo System:

  https://github.com/octavosystems/meta-octavo-osd32mp1

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/octavo/osd32mp1-brk/genimage.cfg             |    4 +-
 .../linux-dts/stm32mp157c-osd32mp1-brk.dts         |  809 ++++---
 ...0001-Add-OSD32MP1-BRK-device-tree-support.patch | 1509 +++++++++++++
 .../uboot/0001-osd32mp1-BRK-board-added.patch      | 2349 --------------------
 .../uboot/0002-Add-OSD32MP1-BRK-build-config.patch |  881 ++++++++
 .../{osd32mp1_ddr.dtsi => osd32mp1_ddr_1x4Gb.dtsi} |    2 +
 .../tfa-dts/stm32mp157c-osd32mp1-brk-fw-config.dts |    6 +
 .../tfa-dts/stm32mp157c-osd32mp1-brk.dts           |  502 ++---
 configs/octavo_osd32mp1_brk_defconfig              |   20 +-
 9 files changed, 3027 insertions(+), 3055 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
