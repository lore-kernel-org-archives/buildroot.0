Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E43C48BC4
	for <buildroot@archiver.kernel.org>; Wed, 14 Feb 2024 23:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C5328230D;
	Wed, 14 Feb 2024 23:30:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id umUOuzIjgawE; Wed, 14 Feb 2024 23:30:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC47A82304
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC47A82304;
	Wed, 14 Feb 2024 23:30:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5B5FD1BF3C0
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 23:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47A5582304
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 23:30:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fAIVHWH6GJ2I for <buildroot@lists.busybox.net>;
 Wed, 14 Feb 2024 23:30:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::216; helo=shout01.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 790D1822F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 790D1822F8
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 790D1822F8
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 23:30:38 +0000 (UTC)
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout01.mail.de (Postfix) with ESMTP id B73EC240E59;
 Thu, 15 Feb 2024 00:30:36 +0100 (CET)
Received: from smtp01.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix01.mail.de (Postfix) with ESMTP id 99E60801CB;
 Thu, 15 Feb 2024 00:30:36 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 55BBE240A5B;
 Thu, 15 Feb 2024 00:30:34 +0100 (CET)
To: buildroot@buildroot.org
Date: Thu, 15 Feb 2024 00:30:25 +0100
Message-Id: <20240214233028.1226645-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 2884
X-purgate-ID: 154282::1707953436-BD52E878-FB702EDD/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1707953436;
 bh=5H6hNqE6TZqouioxh16gKqFq9iag3wu+sOFcteYdlmg=;
 h=From:To:Cc:Subject:Date:Message-Id:From:To:CC:Subject:Reply-To;
 b=C9kKt7y9cjPredO6Ns6r2PQ4aX2fn3DJjuKbY9HrJ8NyWexskZrZBDg4Tx+64e53c
 H8Kd9/Kc89cb1sgmgggy1dWhgGe/6eK8jK8G5b2U8WpW4DfCNGKfEWTltzU/z8HJAZ
 NsldHQytE45aYGAprEufYbrNnZ1cev6WbWtwVsLA6VRamBqcPvZHSOHSqAa7ziOQNJ
 3vU3zWVVXAUBJDOjUWmkfLV31kDtmNzD/inoofgWiS/7AAisnthLnU4pz22EGMF301
 oiDMCXM2TJZG4aQhT1xR3rSG+2zLRy12gP71qqUgFDJ2VsvJWCmq3lHTuwwh/SDqjl
 9iOjhxvFvWMww==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=C9kKt7y9
Subject: [Buildroot] [PATCH v4 0/3] Add board support for the BeagleV-Ahead
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
 Robert Nelson <robertcnelson@gmail.com>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch series adds board support for the BeagleV-Ahead.

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

Kilian Zinnecker (3):
  Fix alphabetical order of DEVELOPERS file entry
  package/xuantie-bins: new package
  configs/beaglev_ahead: new defconfig

 DEVELOPERS                                    |  5 +-
 board/beaglev-ahead/genimage.cfg              | 62 +++++++++++++++
 board/beaglev-ahead/linux.fragment            |  2 +
 ...01-Disable-CLOCK_ALLOW_WRITE_DEBUGFS.patch | 30 +++++++
 .../0001-Overwrite-bootcmd-by-force.patch     | 30 +++++++
 board/beaglev-ahead/post-image.sh             |  6 ++
 board/beaglev-ahead/readme.txt                | 78 +++++++++++++++++++
 board/beaglev-ahead/uEnv.txt                  |  4 +
 board/beaglev-ahead/uboot.fragment            |  2 +
 configs/beaglev_ahead_defconfig               | 46 +++++++++++
 package/Config.in                             |  1 +
 package/xuantie-bins/Config.in                |  8 ++
 package/xuantie-bins/xuantie-bins.hash        |  2 +
 package/xuantie-bins/xuantie-bins.mk          | 19 +++++
 14 files changed, 294 insertions(+), 1 deletion(-)
 create mode 100644 board/beaglev-ahead/genimage.cfg
 create mode 100644 board/beaglev-ahead/linux.fragment
 create mode 100644 board/beaglev-ahead/patches/linux/0001-Disable-CLOCK_ALLOW_WRITE_DEBUGFS.patch
 create mode 100644 board/beaglev-ahead/patches/uboot/0001-Overwrite-bootcmd-by-force.patch
 create mode 100755 board/beaglev-ahead/post-image.sh
 create mode 100644 board/beaglev-ahead/readme.txt
 create mode 100644 board/beaglev-ahead/uEnv.txt
 create mode 100644 board/beaglev-ahead/uboot.fragment
 create mode 100644 configs/beaglev_ahead_defconfig
 create mode 100644 package/xuantie-bins/Config.in
 create mode 100644 package/xuantie-bins/xuantie-bins.hash
 create mode 100644 package/xuantie-bins/xuantie-bins.mk

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
