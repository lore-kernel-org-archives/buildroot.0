Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D529FEB64DA
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 06:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55C3483F1A;
	Fri, 14 Jul 2023 06:44:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55C3483F1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y3-h7_8Rj9n1; Fri, 14 Jul 2023 06:44:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E07083CCE;
	Fri, 14 Jul 2023 06:44:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E07083CCE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B77DF1BF419
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 06:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9101260E6B
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 06:44:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9101260E6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6LorMaG0hC2Z for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 06:44:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E57960AF4
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E57960AF4
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 06:44:29 +0000 (UTC)
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout01.mail.de (Postfix) with ESMTP id 5BC1CA039A;
 Fri, 14 Jul 2023 08:44:27 +0200 (CEST)
Received: from smtp03.mail.de (smtp03.bt.mail.de [10.0.121.213])
 by postfix02.mail.de (Postfix) with ESMTP id 36B29A03C3;
 Fri, 14 Jul 2023 08:44:27 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp03.mail.de (Postfix) with ESMTPSA id D9C60A0253;
 Fri, 14 Jul 2023 08:44:25 +0200 (CEST)
To: buildroot@buildroot.org
Date: Fri, 14 Jul 2023 08:44:10 +0200
Message-Id: <20230714064413.11433-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 2571
X-purgate-ID: 154282::1689317067-4D7F8647-FD3DDC43/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1689317067;
 bh=fCQBtGBX6XxiSvpFsvGkTixnvmKDyjzQnN5AmWzbeVQ=;
 h=From:To:Cc:Subject:Date:Message-Id:From:To:CC:Subject:Reply-To;
 b=KlwTO7zbFwy8r6GLylU9igbEmpizP8VseoLG24phupxf2MDQgDw/Egok3ib+dJ3JP
 0kAMitotL2Wi1YsnXXODwWP1WTXQgtMobSc+7gDOqkYDyDNdruNvChgpsdWLjf+RaL
 yzpeLPkiiz/LjcSoOLRliKUQz6Ea0G3hItptGtIDYB38L5gyjBx214QPpnI/go+1/9
 s8qQ/BuDedr46ErwK5dQxLtryPJbXbYKgFi0aGUurvyGqR7R+r+JoNlz7W0gIR/PN3
 fvO2SMMPAUIgUgz24PdjKsmMidPdn53thCK1p9T4RAjU6SBJhknHPwr4Z6RTr74r1j
 cku1KGW3hP6ew==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=KlwTO7zb
Subject: [Buildroot] [PATCH v6 0/3] Add board support for Radxa Rock 5B
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
  package: add rockchip-rkbin package
  configs: add rock5b/rock5b_defconfig
  board/radxa/rock5b: Add sdcard image scripts

 DEVELOPERS                                 |  5 ++
 board/radxa/rock5b/boot.cmd                |  3 +
 board/radxa/rock5b/genimage.cfg            | 34 +++++++++++
 board/radxa/rock5b/linux.fragment          |  1 +
 board/radxa/rock5b/post-image.sh           | 20 +++++++
 board/radxa/rock5b/readme.txt              | 62 +++++++++++++++++++
 board/radxa/rock5b/rock5b.its              | 46 ++++++++++++++
 boot/uboot/Config.in                       |  9 +++
 boot/uboot/uboot.mk                        | 17 ++++++
 configs/rock5b_defconfig                   | 49 +++++++++++++++
 package/Config.in                          |  1 +
 package/rockchip-rkbin/Config.in           | 70 ++++++++++++++++++++++
 package/rockchip-rkbin/rockchip-rkbin.hash |  3 +
 package/rockchip-rkbin/rockchip-rkbin.mk   | 49 +++++++++++++++
 14 files changed, 369 insertions(+)
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
