Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FDFE77188
	for <buildroot@archiver.kernel.org>; Mon, 30 Dec 2024 22:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5006840217;
	Mon, 30 Dec 2024 22:47:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PscMw-EvxepO; Mon, 30 Dec 2024 22:47:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0170640794
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0170640794;
	Mon, 30 Dec 2024 22:47:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1754EE0F
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 22:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 017FA4079B
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 22:47:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id REuTQJPIArNk for <buildroot@buildroot.org>;
 Mon, 30 Dec 2024 22:47:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::216; helo=shout01.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C798B40217
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C798B40217
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C798B40217
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 22:47:32 +0000 (UTC)
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout01.mail.de (Postfix) with ESMTP id E3144240DBA;
 Mon, 30 Dec 2024 23:47:30 +0100 (CET)
Received: from smtp01.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix01.mail.de (Postfix) with ESMTP id BCB0F240573;
 Mon, 30 Dec 2024 23:47:30 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id EB13A240562;
 Mon, 30 Dec 2024 23:47:29 +0100 (CET)
To: buildroot@buildroot.org
Cc: Drew Fustini <dfustini@tenstorrent.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>
Date: Mon, 30 Dec 2024 23:46:27 +0100
Message-ID: <20241230224631.1080014-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 2921
X-purgate-ID: 154282::1735598850-10F732C4-E1788D7B/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1735598850;
 bh=xGWwsLOocChepIwY/NR47CzpDPsHkKzxMKQJvW5JmlY=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=TFKMsaSs8lqP1kePls4QtQgd5wmDlOl3IK1+MotAnsKALGRpqL+S4yPOXyv0sCTxF
 MjGV53acSTW2WHBmK7sa0p1PAWUmCw2KgvIWVdxAsSn/rTuDCcFrYB0n4ZqPAgwayp
 4iko+DOVLWdMgfAg06mGUOhNfbBeCAKsYDPLq5tWS/7cPtPhtnaiduxMYjRhGFh/EU
 Vo/14PFYcKM1EPpWOkO90rd2KTBuFunc8u8wuI95+Az442SgBJl06sruZw5C0kouf4
 2Hs7D2FM73H7hqhP619Rf8HAzCtvNx+laAhQ9Fm/3Dt4EkKwfjdvCSwz9rrWIvxiJZ
 cKCJ4FtS3EGpw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=TFKMsaSs
Subject: [Buildroot] [PATCH v5 0/2] Add board support for the BeagleV-Ahead
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: "kilian.zinnecker--- via buildroot" <buildroot@buildroot.org>
Reply-To: kilian.zinnecker@mail.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Kilian Zinnecker <kilian.zinnecker@mail.de>

This patch series adds board support for the BeagleV-Ahead.

v4 -> v5:

  - Switched from custom to mainline kernel 6.12.7
  - Switched from custom to mainline OpenSBI 1.6
  - Adjusted custom uboot to load OpenSBI and binary blobs from sd card

v3 -> v4:

  - Improved descriptions in commit messages
  - Patch to alphabetize own DEVELOPERS entry
  - Fix in package/xuantie-bins/Config.in: Spaces -> tabs
  - Github helper and removal of superfluous variables in xuantie-bins.mk
  - Added patch to disable CLOCK_ALLOW_WRITE_DEBUGFS in custom kernel

v2 -> v3:

  - Added brief description what the xuantie bin binaries are for
  - Unrolled loop in XUANTIE_BINS_INSTALL_IMAGES_CMDS of
    package/xuantie-bins/xuantie-bins.mk
  - Added a second product page link to board's readme.txt
  - Added URL to the product page to git commit message
  - Dropped "_CUSTOM" from all "BR2_RISCV_ISA_*" in the board's
    defconfig
  - Add description to the board's readme.txt and defconfig  why GCC
    v13 is chosen
  - Added BR2_PACKAGE_HOST_DOSFSTOOLS to board's defconfig

v1 -> v2:

  - Added hash file for xuantie-bins package
  - Now uses uEnv.txt for actual boot commands
  - Removed extlinux.conf
  - Removed superflous comments inside config files

Kilian Zinnecker (2):
  package/xuantie-bins: new package
  configs/beaglev_ahead: new defconfig

 DEVELOPERS                                    |  3 +
 board/beaglev-ahead/genimage.cfg              | 42 +++++++++++
 board/beaglev-ahead/linux.fragment            |  2 +
 ...e-custom-BeagleV-Ahead-uboot-bootcmd.patch | 54 ++++++++++++++
 board/beaglev-ahead/post-image.sh             |  5 ++
 board/beaglev-ahead/readme.txt                | 73 +++++++++++++++++++
 board/beaglev-ahead/uEnv.txt                  |  3 +
 board/beaglev-ahead/uboot.fragment            |  2 +
 configs/beaglev_ahead_defconfig               | 40 ++++++++++
 package/Config.in                             |  1 +
 package/xuantie-bins/Config.in                |  8 ++
 package/xuantie-bins/xuantie-bins.hash        |  2 +
 package/xuantie-bins/xuantie-bins.mk          | 19 +++++
 13 files changed, 254 insertions(+)
 create mode 100644 board/beaglev-ahead/genimage.cfg
 create mode 100644 board/beaglev-ahead/linux.fragment
 create mode 100644 board/beaglev-ahead/patches/uboot/0001-Overwrite-custom-BeagleV-Ahead-uboot-bootcmd.patch
 create mode 100755 board/beaglev-ahead/post-image.sh
 create mode 100644 board/beaglev-ahead/readme.txt
 create mode 100644 board/beaglev-ahead/uEnv.txt
 create mode 100644 board/beaglev-ahead/uboot.fragment
 create mode 100644 configs/beaglev_ahead_defconfig
 create mode 100644 package/xuantie-bins/Config.in
 create mode 100644 package/xuantie-bins/xuantie-bins.hash
 create mode 100644 package/xuantie-bins/xuantie-bins.mk

-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
