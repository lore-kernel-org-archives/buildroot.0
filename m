Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E5EC0015E
	for <buildroot@archiver.kernel.org>; Sat, 15 Jul 2023 19:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D977819C8;
	Sat, 15 Jul 2023 19:47:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D977819C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QfroQgSJ952x; Sat, 15 Jul 2023 19:47:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 936268198D;
	Sat, 15 Jul 2023 19:47:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 936268198D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B57191BF2E5
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 19:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C2FF40945
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 19:47:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C2FF40945
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NnuOD-lqF0-y for <buildroot@lists.busybox.net>;
 Sat, 15 Jul 2023 19:47:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B16B40942
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B16B40942
 for <buildroot@buildroot.org>; Sat, 15 Jul 2023 19:47:44 +0000 (UTC)
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout01.mail.de (Postfix) with ESMTP id 5245DA034D;
 Sat, 15 Jul 2023 21:47:42 +0200 (CEST)
Received: from smtp01.mail.de (smtp01.bt.mail.de [10.0.121.211])
 by postfix03.mail.de (Postfix) with ESMTP id 31ACD801C7;
 Sat, 15 Jul 2023 21:47:42 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id BF069100135;
 Sat, 15 Jul 2023 21:47:41 +0200 (CEST)
To: buildroot@buildroot.org
Date: Sat, 15 Jul 2023 21:47:32 +0200
Message-Id: <20230715194735.15286-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 3445
X-purgate-ID: 154282::1689450462-3D7FE7B6-CCB960AB/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1689450462;
 bh=I6FMv3Fo1bdEl6HeGGhkctrkvSLdWZ74dQCrvgjnaoM=;
 h=From:To:Cc:Subject:Date:Message-Id:From:To:CC:Subject:Reply-To;
 b=SEJAB76fVzIu5lXiGf97sBVrZUFEgG+bI7JGey7AsrWDNc1vRphbksczF/inDaIju
 Hc1/D1o8ZDClR7Tpi/Ik8XSWCfCXDDFuN8VvniwL6A/Pv2vSmZ+iLZyZflQ6l/tHCO
 KWfDs1ajKcmAj5MYBakBzlhwbqIGHIHQuIsplyHVlvttzPcYoKZb9KrXC0nNNJCnWP
 J2iZEFrwtp0WGhsjQ1liDWbTA1STFDbk+rviYBizQXYFWiV++QFhtdVMjeWKe7QmIl
 toz/RqknO6cCg8fAuCJxBF7OLHA+hF6RCwLQI47IOU3cRHfJuU32L5ZofXl/V15zNM
 LNNmtj6Nylnsw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=SEJAB76f
Subject: [Buildroot] [PATCH v7 0/3] Add board support for Radxa Rock 5B
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Andreas Ziegler <br015@umbiko.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch series adds support for the Radxa Rock 5B board, featuring
the Rockchip RK3588 SoC. It adds a package for the Rockchip ATF binary
blobs, needed by U-Boot. It uses a modified Linux kernel from Radxa.
After build, a fit image with compressed kernel is generated, which is
then put into an SD card image alongside U-Boot and the root file
system.

The license of needed binary blobs is currently still unclear. I will
try to resolve this in the future. Untill then I still would like to
post the current version of this board support on the mailing list, so
that whoever wants can already review this and it can be picked up
more easily in the future.

v6 -> v7:

  - Improved commit titles and commit structure
  - uboot.mk: Fixed installation path for binary
  - Improved automatical pickup of Rockchip blobs by U-Boot
  - rockchip-rkbin.mk: Simplyfied binary selection and installation
  - rock5b_defconfig: removed unecessary configurations
  - post-image.sh: Exchanged own code by calling genimage support
    script
  - uboot.mk: Fixed UBOOT_MAKE_OPTS typo
  - uboot/Config.in: Removed futile default value
  - Fixed variable naming in uboot.mk and rockchip-rkbin.mk
  - Various further cleanups ...

v5 -> v6:

  - Bumps uboot version: now uses 2023.7 instead of release candidate
  - Fixes dependency error in uboot.mk
  - Improves rockchip-rkbin.mk: can now handle different rockchip blob
    file type extensions
  - Improves uboot.mk: can now handle different rockchip blob file
    type extensions
  - Improves rockchip-rkbin.mk: improved menuconfig menu
  - Improves post-image.sh: now automatically copies u-boot to
    BINARIES_DIR through uboot.mk
  - Improves genimage.cfg: removes unnecessary partition offsets
  - Improves boot command handling: now uses uboot.cmd instead of
    uboot fragment file

Kilian Zinnecker (3):
  package/rockchip-rkbin: new package
  boot/uboot: Add support for Rockchip binary blobs
  configs/rock5b: new defconfig

 DEVELOPERS                                 |  5 ++
 board/radxa/rock5b/boot.cmd                |  3 ++
 board/radxa/rock5b/genimage.cfg            | 34 ++++++++++++
 board/radxa/rock5b/linux.fragment          |  1 +
 board/radxa/rock5b/post-image.sh           |  6 +++
 board/radxa/rock5b/readme.txt              | 62 ++++++++++++++++++++++
 board/radxa/rock5b/rock5b.its              | 46 ++++++++++++++++
 boot/uboot/Config.in                       |  9 ++++
 boot/uboot/uboot.mk                        | 17 ++++++
 configs/rock5b_defconfig                   | 42 +++++++++++++++
 package/Config.in                          |  1 +
 package/rockchip-rkbin/Config.in           | 47 ++++++++++++++++
 package/rockchip-rkbin/rockchip-rkbin.hash |  2 +
 package/rockchip-rkbin/rockchip-rkbin.mk   | 46 ++++++++++++++++
 14 files changed, 321 insertions(+)
 create mode 100644 board/radxa/rock5b/boot.cmd
 create mode 100644 board/radxa/rock5b/genimage.cfg
 create mode 100644 board/radxa/rock5b/linux.fragment
 create mode 100755 board/radxa/rock5b/post-image.sh
 create mode 100644 board/radxa/rock5b/readme.txt
 create mode 100644 board/radxa/rock5b/rock5b.its
 create mode 100644 configs/rock5b_defconfig
 create mode 100644 package/rockchip-rkbin/Config.in
 create mode 100644 package/rockchip-rkbin/rockchip-rkbin.hash
 create mode 100644 package/rockchip-rkbin/rockchip-rkbin.mk

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
