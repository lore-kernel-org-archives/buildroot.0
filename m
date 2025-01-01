Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7A9E7718B
	for <buildroot@archiver.kernel.org>; Wed,  1 Jan 2025 20:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 472554128D;
	Wed,  1 Jan 2025 20:55:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lKzYd4CEsKcU; Wed,  1 Jan 2025 20:55:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18EED41291
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18EED41291;
	Wed,  1 Jan 2025 20:55:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F671F24
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 20:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F013400A6
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 20:55:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4dHqrC5-M1Qy for <buildroot@buildroot.org>;
 Wed,  1 Jan 2025 20:55:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::216; helo=shout01.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 037654033F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 037654033F
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 037654033F
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 20:55:38 +0000 (UTC)
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout01.mail.de (Postfix) with ESMTP id 0568D240B83;
 Wed,  1 Jan 2025 21:55:37 +0100 (CET)
Received: from smtp01.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix03.mail.de (Postfix) with ESMTP id D154626003B;
 Wed,  1 Jan 2025 21:55:36 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 09F67241240;
 Wed,  1 Jan 2025 21:55:35 +0100 (CET)
To: buildroot@buildroot.org
Cc: Drew Fustini <dfustini@tenstorrent.com>,
 Drew Fustini <drew@beagleboard.org>, robertcnelson@beagleboard.org,
 jkridner@beagleboard.org, Han Gao <rabenda.cn@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>
Date: Wed,  1 Jan 2025 21:54:32 +0100
Message-ID: <20250101205435.1513140-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 3051
X-purgate-ID: 154282::1735764936-32D2889E-F414C813/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1735764936;
 bh=7Rj8COf1uMBRlJYQORbo8EHO6olOxjOfga+NUTYlWv0=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=V63DIvWxQH7Dm8utHeuX/+kku3pdEg/KBBsqlSjEdsn4pP9FxiPwIe6NtbcbKXV8v
 dqoFI2UzkGxM2mILzI41WUTbBnt/BcdPV3pLFU5c3Aq/iw20hb7qSrbrUMCJHGcE4X
 dll5RJTH6kNdTwGaPaKWHj2Jpwd41ysrLUlC0+C+0bvj80xEmMUcZKdr/ad8T7yaic
 gnZU5ygPugMQa6rBz8NUi2z438SNGeeNjw01Ud2E1HAqRabqTNQz4BeheK7BjBetwM
 MbvZBJ8yDbnPND4QL1CYVKBtV4rMRxCqogkirb31ks7BX1ILP219CaDACo2/fzvW+v
 YqNoI3JePZ/zQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=V63DIvWx
Subject: [Buildroot] [PATCH v6 0/2] Add board support for the BeagleV-Ahead
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

v5 -> v6:

  - Switched from beagleboard custom uboot to RevyOS custom uboot, which
    activates all 4 cores of the TH1520

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
