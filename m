Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2CE8EB64DC
	for <buildroot@archiver.kernel.org>; Sun,  9 Jul 2023 12:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 500F9813CB;
	Sun,  9 Jul 2023 12:34:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 500F9813CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fOz8_8P9PJZj; Sun,  9 Jul 2023 12:34:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82EAC8140E;
	Sun,  9 Jul 2023 12:34:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82EAC8140E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 699141BF57C
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 12:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5B4940570
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 12:34:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5B4940570
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yjP94aA_uhVH for <buildroot@lists.busybox.net>;
 Sun,  9 Jul 2023 12:34:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B398A4059D
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B398A4059D
 for <buildroot@buildroot.org>; Sun,  9 Jul 2023 12:34:05 +0000 (UTC)
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout02.mail.de (Postfix) with ESMTP id DFD7DA0420;
 Sun,  9 Jul 2023 14:34:03 +0200 (CEST)
Received: from smtp01.mail.de (smtp01.bt.mail.de [10.0.121.211])
 by postfix02.mail.de (Postfix) with ESMTP id C3338A00E2;
 Sun,  9 Jul 2023 14:34:03 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 10427100136;
 Sun,  9 Jul 2023 14:34:00 +0200 (CEST)
To: buildroot@buildroot.org
Date: Sun,  9 Jul 2023 14:33:52 +0200
Message-Id: <20230709123355.17002-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1959
X-purgate-ID: 154282::1688906043-5CFFF7B6-3EAD6D6C/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1688906043;
 bh=SE5WDXUr9CWr+0H7vNEJpNDsEopzpaqObq5R5CClqNE=;
 h=From:To:Cc:Subject:Date:Message-Id:From:To:CC:Subject:Reply-To;
 b=AehRH5JVELohDu/3SQCwsPjSWHS8PH4PSLVbKwdbv4Xi/2/DESHtPo+vRX7bVVp/J
 CwrOwP4L4n8zd+W4cSHGAvcESntBEN/DBqmUdbktLt2eTcNf0/Y6xqWhxhPSlZzZxF
 olztyYkLaAS9WbmNhrIT7MswQxs0yTfhAzObD4RK3V9YeZofnllzNenjGOoxPgHi7J
 CM9pwryOEU3ZqUsRcOcf+gYHmp+BrRLEMDPDlvTEo0LiL41p2CrkEfedh7BKDWqoMk
 TNWvgPeFr4sW3Kt/PhF/U5OOHK4Xai2gzm/k0FkL3N4e7KNrjciaCxIHWf6u53Py1Y
 41JBteGAhU+Xw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=AehRH5JV
Subject: [Buildroot] [PATCH v5 0/3] Add board support for Radxa Rock 5B
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

Kilian Zinnecker (3):
  package: add rockchip-rkbin package
  configs: add rock5b/rock5b_defconfig
  board/radxa/rock5b: Add sdcard image scripts

 DEVELOPERS                                 |  5 ++
 board/radxa/rock5b/genimage.cfg            | 36 +++++++++++++
 board/radxa/rock5b/linux.fragment          |  1 +
 board/radxa/rock5b/post-image.sh           | 24 +++++++++
 board/radxa/rock5b/readme.txt              | 61 +++++++++++++++++++++
 board/radxa/rock5b/rock5b.its              | 46 ++++++++++++++++
 board/radxa/rock5b/uboot.fragment          |  3 ++
 boot/uboot/Config.in                       |  9 ++++
 boot/uboot/uboot.mk                        | 14 +++++
 configs/rock5b_defconfig                   | 47 ++++++++++++++++
 package/Config.in                          |  1 +
 package/rockchip-rkbin/Config.in           | 62 ++++++++++++++++++++++
 package/rockchip-rkbin/rockchip-rkbin.hash |  3 ++
 package/rockchip-rkbin/rockchip-rkbin.mk   | 46 ++++++++++++++++
 14 files changed, 358 insertions(+)
 create mode 100644 board/radxa/rock5b/genimage.cfg
 create mode 100644 board/radxa/rock5b/linux.fragment
 create mode 100755 board/radxa/rock5b/post-image.sh
 create mode 100644 board/radxa/rock5b/readme.txt
 create mode 100644 board/radxa/rock5b/rock5b.its
 create mode 100644 board/radxa/rock5b/uboot.fragment
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
