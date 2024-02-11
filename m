Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F848C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 12:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB55B82263;
	Sun, 11 Feb 2024 12:09:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0NfkgSiLRJlD; Sun, 11 Feb 2024 12:09:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2A248226C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2A248226C;
	Sun, 11 Feb 2024 12:09:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0FA581BF33A
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 12:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECD678226C
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 12:09:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hbywhY3YzfX9 for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 12:09:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::217; helo=shout02.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D281F82263
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D281F82263
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D281F82263
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 12:09:09 +0000 (UTC)
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout02.mail.de (Postfix) with ESMTP id 696F02409F5;
 Sun, 11 Feb 2024 13:09:07 +0100 (CET)
Received: from smtp01.mail.de (smtp01.bt.mail.de [10.0.121.211])
 by postfix03.mail.de (Postfix) with ESMTP id 4C91F8020A;
 Sun, 11 Feb 2024 13:09:07 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 235F2244670;
 Sun, 11 Feb 2024 13:09:05 +0100 (CET)
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 13:08:54 +0100
Message-Id: <20240211120857.6622-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 2983
X-purgate-ID: 154282::1707653347-455BD670-D8A422F6/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1707653347;
 bh=JkQ0HFBk+j6X2R3V5IzI0rbDupqI3nNh89Y2Bb1FqLQ=;
 h=From:To:Cc:Subject:Date:Message-Id:From:To:CC:Subject:Reply-To;
 b=R4LtBwEoOGfnUHpG7SNr3N8hzJUwEQe9m6M68LpSUa0R9m4EmRoshG9eHVFnwWBK6
 mgA+6YJXpgB8byGSeN2AuaAG/jRrWvmO7RvPia4ld4kKGWRlRjVTD2KrtOaVxZJVoo
 d5MY8xlF2J55gh7Dpvy2g55kDzhmS/nTBV4px0tkUw1PQFgBqx948stQazXliqXiDz
 m1r/Dvut7wuSr62pQiH3+M3DpJ+KiWHooTy5njFjK99nQNH1HxEeoB+/NkKTofKTHJ
 McpTDt7ujG8IJat+i80LKvbjgQW7gzDtksymoUdEn1UkDGDwgZ7szZPlm4lksWFfz8
 j3LBkdhN9lLXQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=R4LtBwEo
Subject: [Buildroot] [PATCH v3 0/2] Add board support for the BeagleV-Ahead
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

This patch series introduces a package which fetches binaries for the
SoC, i.e., one binary blob for an on-chip FPGA and one binary blob for
audio. Currently they are not used, but are intended to be used in the
future.

This board support generates an image suitable for SD card. The boot
command for uboot to boot the kernel could not easily be changed. It
seemed that a default boot command was persisent and any change to it
by normal means (e.g., uboot config parameters like
CONFIG_BOOT_COMMAND) did not have any effect. Hence a patch for the
custom u-boot is introduced for now, to insert the proper boot
command.

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
 board/beaglev-ahead/genimage.cfg              | 62 +++++++++++++++
 board/beaglev-ahead/linux.fragment            |  2 +
 .../0001-Overwrite-bootcmd-by-force.patch     | 30 +++++++
 board/beaglev-ahead/post-image.sh             |  6 ++
 board/beaglev-ahead/readme.txt                | 78 +++++++++++++++++++
 board/beaglev-ahead/uEnv.txt                  |  4 +
 board/beaglev-ahead/uboot.fragment            |  2 +
 configs/beaglev_ahead_defconfig               | 46 +++++++++++
 package/Config.in                             |  1 +
 package/xuantie-bins/Config.in                |  8 ++
 package/xuantie-bins/xuantie-bins.hash        |  1 +
 package/xuantie-bins/xuantie-bins.mk          | 23 ++++++
 13 files changed, 266 insertions(+)
 create mode 100644 board/beaglev-ahead/genimage.cfg
 create mode 100644 board/beaglev-ahead/linux.fragment
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
