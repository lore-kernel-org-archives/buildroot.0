Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9CBEE4996
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 22:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2AA3E40609;
	Mon, 21 Aug 2023 22:33:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AA3E40609
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XtPkIGS1Eehv; Mon, 21 Aug 2023 22:33:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52A7D409F1;
	Mon, 21 Aug 2023 22:33:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52A7D409F1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 328CD1BF35B
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 22:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0ADFB40308
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 22:33:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0ADFB40308
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R2xWwAa3rlAi for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 22:33:46 +0000 (UTC)
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 79DC1402B0
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 22:33:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79DC1402B0
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout02.mail.de (Postfix) with ESMTP id 61A8BA0203;
 Tue, 22 Aug 2023 00:33:44 +0200 (CEST)
Received: from smtp01.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix01.mail.de (Postfix) with ESMTP id 46ECA8029A;
 Tue, 22 Aug 2023 00:33:44 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id BC5F4241206;
 Tue, 22 Aug 2023 00:33:43 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue, 22 Aug 2023 00:33:35 +0200
Message-Id: <20230821223337.9402-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 2429
X-purgate-ID: 154282::1692657224-EB7FD668-A50B2172/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1692657224;
 bh=PIfjaPmiSWGv8lAtJX1cQtnxS5pBYEJUqEn6ios7TZk=;
 h=From:To:Cc:Subject:Date:Message-Id:From:To:CC:Subject:Reply-To;
 b=eSWyBF2F12iiIxNh/zavSypIosO8lPfRYvJv0xNNS9qWUJJdgiLDOStjunbEx30RQ
 CWZai/xaeU/ljZQXwp0ryDSIh+HEwvJvkL1vTmnYNjicPeo9gLXMtljWGH2JqVKJOY
 zdXT93K7cnDQ/MGu9C7zU0coTs3Mr5ElE+l8EgWr28GZ/JqehMK41a23x0TNsUClw+
 IFNfttzCG6wE1RQNHIXNPYrnj3vVH6AtMExTMh/xdYEdiDKd9eWEfdMWZg4geJu5OI
 O+N0DrJqMWJ/GV8l+/JyVTAQw+2cFfCijS3JY0hhgbba5ix0UXBBEI5lia/c8bj9vQ
 f9Uvi3UJHvFKw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=eSWyBF2F
Subject: [Buildroot] [PATCH v1 0/2] Add board support for the BeagleV-Ahead
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
Cc: Robert Nelson <robertcnelson@gmail.com>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch series adds board support for the BeagleV-Ahead.

This first version of the patch series works, but has flaws, which
will be fixed in future versions of the patch series. I deliberately
already send these patches, so that they can be discussed and feedback
can be given early.

This patch series introduces a package which fetches binaries for the
SoC, i.e., one binary blob for an on-chip FPGA and one binary blob for
audio. Currently they are not used, but are intended to be used in the
future.

This board support generates an image suitable for SD card. The boot
command for uboot to boot the kernel could not easily be changed. It
seemed that a default boot command was persisent and any change to it
by normal means (e.g., uboot config parameters like
CONFIG_BOOT_COMMAND) did not have any effect. Hence a dirty hack was
introduced by patching the custom uboot code to force overwriting of
the boot command.

Kilian Zinnecker (2):
  package/xuantie-bins: new package
  configs/beaglev_ahead: new defconfig

 DEVELOPERS                                    |  7 +-
 board/beaglev-ahead/extlinux.conf             |  6 ++
 board/beaglev-ahead/genimage.cfg              | 63 +++++++++++++++++
 board/beaglev-ahead/linux.fragment            |  2 +
 .../0001-Overwrite-bootcmd-by-force.patch     | 30 ++++++++
 board/beaglev-ahead/post-image.sh             | 10 +++
 board/beaglev-ahead/readme.txt                | 69 +++++++++++++++++++
 board/beaglev-ahead/uboot.fragment            |  5 ++
 configs/beaglev_ahead_defconfig               | 44 ++++++++++++
 package/Config.in                             |  1 +
 package/xuantie-bins/Config.in                |  6 ++
 package/xuantie-bins/xuantie-bins.mk          | 27 ++++++++
 12 files changed, 268 insertions(+), 2 deletions(-)
 create mode 100644 board/beaglev-ahead/extlinux.conf
 create mode 100644 board/beaglev-ahead/genimage.cfg
 create mode 100644 board/beaglev-ahead/linux.fragment
 create mode 100644 board/beaglev-ahead/patches/uboot/0001-Overwrite-bootcmd-by-force.patch
 create mode 100755 board/beaglev-ahead/post-image.sh
 create mode 100644 board/beaglev-ahead/readme.txt
 create mode 100644 board/beaglev-ahead/uboot.fragment
 create mode 100644 configs/beaglev_ahead_defconfig
 create mode 100644 package/xuantie-bins/Config.in
 create mode 100644 package/xuantie-bins/xuantie-bins.mk

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
