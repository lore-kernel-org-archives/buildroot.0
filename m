Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E549EB64DC
	for <buildroot@archiver.kernel.org>; Fri, 30 Jun 2023 21:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3824417B2;
	Fri, 30 Jun 2023 21:24:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3824417B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FvJjcs6G0KQj; Fri, 30 Jun 2023 21:24:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5246416BF;
	Fri, 30 Jun 2023 21:24:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5246416BF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3E41E1BF844
 for <buildroot@lists.busybox.net>; Fri, 30 Jun 2023 21:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2316C416BF
 for <buildroot@lists.busybox.net>; Fri, 30 Jun 2023 21:24:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2316C416BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sop21ammnQuv for <buildroot@lists.busybox.net>;
 Fri, 30 Jun 2023 21:24:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E51C415FD
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E51C415FD
 for <buildroot@buildroot.org>; Fri, 30 Jun 2023 21:24:11 +0000 (UTC)
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout02.mail.de (Postfix) with ESMTP id 69AB0A2D3C
 for <buildroot@buildroot.org>; Fri, 30 Jun 2023 23:24:09 +0200 (CEST)
Received: from smtp04.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix01.mail.de (Postfix) with ESMTP id 4FB5580298;
 Fri, 30 Jun 2023 23:24:09 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp04.mail.de (Postfix) with ESMTPSA id 0F1AAC009A;
 Fri, 30 Jun 2023 23:24:09 +0200 (CEST)
To: buildroot@buildroot.org
Date: Fri, 30 Jun 2023 23:24:04 +0200
Message-Id: <20230630212404.699274-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1542
X-purgate-ID: 154282::1688160249-FD7FCC09-73676A73/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1688160249;
 bh=s+stqIIqJqMiDDdgH4htktxQVLV4VgXfABB1MuJ2Fy4=;
 h=From:To:Cc:Subject:Date:Message-Id:From:To:CC:Subject:Reply-To;
 b=gnO6ixcLfBhUKX/HEtdFnSFoWbsq5IS/txBHaQeRchaZ6iadgYHIM2FAR8rkiXvMX
 c3RkeMraPhS36SgJkvZ7gbHEZnB0uZa0lEOh6DdGHoGDeTTJHe+207t0Y64Wj3uWQg
 j3cOW1iJPR7xVzHXX3rnF1k9rmiK7hw0F7Ys68Xof+JGwQps3LWhs8EzBIHdlMU4zM
 usosILJnNJh5muYvX9PPUOSvA1XNvcbqAsaV5J70IY+CVgonyRceyw1KIL1lp+T8Gh
 XxnTbzS+89iAXgWyqr5qlEEsfbTl7/CTpp6jDTZhr1ZLKgIXqP1GApWssHndQJm4QK
 VG712je8u/gQw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=gnO6ixcL
Subject: [Buildroot] [PATCH 0/3] Add board support for Radxa Rock 5B
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
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch series adds support for the Radxa Rock 5B board, featuring
the Rockchip RK3588 SoC. I added a package for the Rockchip ATF binary
blobs, needed by u-boot. It uses a modified Linux kernel from Radxa.
After build, a fit image with compressed kernel is generated which is
then put into an SD card image alongside uboot an the root file
system.

Kilian Zinnecker (3):
  package: add rockchip-rkbin package
  configs: add defconfig for Radxa Rock 5B
  board/radxa/rock5b: Add sdcard image scripts

 board/radxa/rock5b/genimage.cfg          | 36 +++++++++++++++++++
 board/radxa/rock5b/linux.fragment        |  1 +
 board/radxa/rock5b/post-image.sh         | 24 +++++++++++++
 board/radxa/rock5b/rock5b.its            | 46 ++++++++++++++++++++++++
 board/radxa/rock5b/uboot.fragment        |  3 ++
 configs/rock5b_defconfig                 | 41 +++++++++++++++++++++
 package/Config.in                        |  1 +
 package/rockchip-rkbin/Config.in         | 19 ++++++++++
 package/rockchip-rkbin/rockchip-rkbin.mk | 19 ++++++++++
 9 files changed, 190 insertions(+)
 create mode 100644 board/radxa/rock5b/genimage.cfg
 create mode 100644 board/radxa/rock5b/linux.fragment
 create mode 100755 board/radxa/rock5b/post-image.sh
 create mode 100644 board/radxa/rock5b/rock5b.its
 create mode 100644 board/radxa/rock5b/uboot.fragment
 create mode 100644 configs/rock5b_defconfig
 create mode 100644 package/rockchip-rkbin/Config.in
 create mode 100644 package/rockchip-rkbin/rockchip-rkbin.mk

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
