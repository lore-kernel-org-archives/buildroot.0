Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108F4C433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 17:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB1E6408AE;
	Sun, 20 Mar 2022 17:10:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aukOEyvlgxUq; Sun, 20 Mar 2022 17:10:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF7C240869;
	Sun, 20 Mar 2022 17:10:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4B4FA1BF352
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47D7660AD7
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:10:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iaqhRlgMbptB for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 17:10:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82CC060670
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 17:10:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B9D98845A5; Sun, 20 Mar 2022 17:01:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 18:08:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 343d7940a4bbdd89933a29f9470cead6ff481a28
X-Git-Newrev: 0380696669621b48b4d9c770af3faf2d922ed57f
X-Patchwork-Hint: ignore
Message-Id: <20220320170115.B9D98845A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/octavo_osd32mp1_brk: new defconfig
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

commit: https://git.buildroot.net/buildroot/commit/?id=0380696669621b48b4d9c770af3faf2d922ed57f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds support to Octavo Systems BRK board. We use the TF-A,
U-Boot and Linux versions from ST, Device Trees from Octavo as well as
a U-Boot patch from Octavo.

Reference:

    https://octavosystems.com/octavo_products/osd32mp1-brk/

The device tree blobs come from Octavo System:

    https://github.com/octavosystems/OSD32MP1-BRK-device-tree.git

The uboot patches come from Octavo System:

    https://github.com/octavosystems/BRK_Developer_Package_patches/tree/master/u-boot-v2020.01-stm32mp

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |    4 +
 board/octavo/osd32mp1-brk/genimage.cfg             |   23 +
 .../linux-dts/stm32mp157c-osd32mp1-brk.dts         | 1167 ++++++++++
 .../overlay/boot/extlinux/extlinux.conf            |    4 +
 .../uboot/0001-osd32mp1-BRK-board-added.patch      | 2349 ++++++++++++++++++++
 board/octavo/osd32mp1-brk/readme.txt               |   35 +
 .../octavo/osd32mp1-brk/tfa-dts/osd32mp1_ddr.dtsi  |  119 +
 .../tfa-dts/stm32mp157c-osd32mp1-brk.dts           |  581 +++++
 configs/octavo_osd32mp1_brk_defconfig              |   60 +
 9 files changed, 4342 insertions(+)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
