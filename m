Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB28C001DF
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 18:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BDA0A40C53;
	Wed, 26 Jul 2023 18:15:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDA0A40C53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N4c9ERmwMZf9; Wed, 26 Jul 2023 18:15:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9F2540BD9;
	Wed, 26 Jul 2023 18:15:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9F2540BD9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9174F1BF421
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 18:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77DB182F57
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 18:14:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77DB182F57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EqKTGLw9SigX for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 18:14:40 +0000 (UTC)
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 87A1882F51
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 18:14:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87A1882F51
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout02.mail.de (Postfix) with ESMTP id ABD46A03B0;
 Wed, 26 Jul 2023 20:04:50 +0200 (CEST)
Received: from smtp04.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix02.mail.de (Postfix) with ESMTP id 8CE2BA03C3;
 Wed, 26 Jul 2023 20:04:50 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp04.mail.de (Postfix) with ESMTPSA id A08B9C003C;
 Wed, 26 Jul 2023 20:04:39 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed, 26 Jul 2023 20:04:30 +0200
Message-Id: <20230726180433.7561-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 3438
X-purgate-ID: 154282::1690394690-D8FFDC09-294A4423/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1690394690;
 bh=tikVVfMTEWyeaWV94dONMaFdRux+Og78T2vkNle/K3Q=;
 h=From:To:Cc:Subject:Date:Message-Id:From:To:CC:Subject:Reply-To;
 b=BfrwR+xvu404oxHSAiNPXczVKMGsZsfXIg4n+d6e1s6OQYpj2wO1TYZvXWF6eNW5f
 lE105JTUgokbLJmct8+dk2CZ5geaeJmnnpDO1kJjeOaowgK56Lz/DreRHxWgCqpFHG
 N7DMzApriGmoU4GAk2FzU9qTLwa/v2vqAq1F2RHno9ce8JVo29R6/gpDE9oWwG0BnB
 NZjRxaDtOuTAAU802b+DiZIcajoy15F7EPMr58a4dQEOa207G4e863b9cr9jXi3TSW
 EvVtlR2i1CV776nDflml02SPx04nCvIGczU4Q7chIIC4eQstAj9FduPvFMG+8Tn1YM
 mYJ3ioYQVuFKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=BfrwR+xv
Subject: [Buildroot] [PATCH v8 0/3] Add board support for Radxa Rock 5B
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

v7 -> v8:

  - Added reference to the now existing license file of the rkbin
    repository in the rockchip-rkbin.mk file
  - Bumped the version of the rockchip-rkbin git repository in the
    package (default version) and the rock5b_defconfig. Changed the
    binary blob filenames accordingly

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
