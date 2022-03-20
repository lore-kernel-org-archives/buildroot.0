Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A17A2C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 17:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50E088126A;
	Sun, 20 Mar 2022 17:10:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 44e6fWX2sSsB; Sun, 20 Mar 2022 17:10:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C18080C26;
	Sun, 20 Mar 2022 17:10:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 59C291BF973
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49C6E40869
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:10:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O-y-PHVa3Zh1 for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 17:10:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 940B540761
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 17:10:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id CDCD9845A6; Sun, 20 Mar 2022 17:01:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 18:08:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0380696669621b48b4d9c770af3faf2d922ed57f
X-Git-Newrev: 672807b815c315f1f67f465af1b6165acd01949b
X-Patchwork-Hint: ignore
Message-Id: <20220320170115.CDCD9845A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/octavo_osd32mp1_red: new defconfig
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

commit: https://git.buildroot.net/buildroot/commit/?id=672807b815c315f1f67f465af1b6165acd01949b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds support for the Octavo Systems RED board. We use the
TF-A, U-Boot and Linux versions from ST, Device Trees from Octavo, as
well as a U-Boot patch from Octavo.

Reference:

  https://octavosystems.com/octavo_products/osd32mp1-red/

The device tree blobs come from Octavo System:

  https://github.com/octavosystems/OSD32MP1-RED-Device-tree.git

The uboot patches come from Octavo System:

  https://github.com/octavosystems/osd32mp1-build-tools/tree/395ebd1f4832353c2bc66bbf3346b07d5243e44d/patches/u-boot-2018.11

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |    2 +
 board/octavo/osd32mp1-red/genimage.cfg             |   23 +
 .../octavo/osd32mp1-red/linux-dts/osd32mp1-red.dts | 1469 ++++++++++++++
 .../linux-dts/stm32mp157c-osd32mp1-red.dtsi        | 2077 ++++++++++++++++++++
 .../overlay/boot/extlinux/extlinux.conf            |    4 +
 ...0001-Add-OSD32MP1-RED-Device-Tree-support.patch | 1730 ++++++++++++++++
 ...32mp15_trusted_defconfig-disable-environm.patch |   32 +
 board/octavo/osd32mp1-red/readme.txt               |   37 +
 board/octavo/osd32mp1-red/tfa-dts/osd32mp1-red.dts |  615 ++++++
 .../stm32mp15-osd32mp1-ddr3-1x4Gb-1066-binG.dtsi   |  119 ++
 configs/octavo_osd32mp1_red_defconfig              |   60 +
 11 files changed, 6168 insertions(+)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
