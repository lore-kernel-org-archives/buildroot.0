Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C994C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 23:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FBD1821A9;
	Mon,  4 Dec 2023 23:12:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FBD1821A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XrcxYTzsc_yF; Mon,  4 Dec 2023 23:12:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 679C98175C;
	Mon,  4 Dec 2023 23:12:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 679C98175C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BD86C1BF2A9
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 23:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CA2360FEC
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 23:12:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CA2360FEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kkfQjU_FvRBt for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 23:12:21 +0000 (UTC)
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CCE1360B01
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 23:12:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCE1360B01
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout01.mail.de (Postfix) with ESMTP id C22C7240CC6;
 Tue,  5 Dec 2023 00:12:18 +0100 (CET)
Received: from smtp01.mail.de (smtp01.bt.mail.de [10.0.121.211])
 by postfix03.mail.de (Postfix) with ESMTP id A4247801E7;
 Tue,  5 Dec 2023 00:12:18 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 1EFF0240076;
 Tue,  5 Dec 2023 00:12:17 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue,  5 Dec 2023 00:12:10 +0100
Message-Id: <20231204231212.36450-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 2528
X-purgate-ID: 154282::1701731538-47DBA670-3BE84755/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1701731538;
 bh=q+Wrepz66LfX7dAfLVTuKQvzPY2Jo/CS8vE9F6nfzEY=;
 h=From:To:Cc:Subject:Date:Message-Id:From:To:CC:Subject:Reply-To;
 b=Z9QcUfPyhIs0107ZTo/nJ9G+OEYTxN2p5xygLVUOEOwsB71NCwSeW8KIZVm9Kc3MA
 qdEo/dva6gOe7D8oh/8IWMrRNWNdIozH37+3Nhvqh0SmNePYoi5mHNreA2G2Hf81JC
 EIaCuT1SBTR7hEghRI7M39eRB4J9l02C6Z0cBkFH9vXeiZAcv3aHw5h/zJs7jGLWEE
 M88bnaE5zLoXzzRLyTKHIjYJh2VAawEr1rNchjuIELwpt+mY0LfiC/Cxf6RcPCS/nD
 ZgBOBYZ0WGmaZKSbl8mKs/40piR+5NPA7N/AMSjBvLgTJhKj6/qKLn16BljycNNzuQ
 T2mxyuhFdFOaQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=Z9QcUfPy
Subject: [Buildroot] [PATCH v2 0/2] Add board support for the BeagleV-Ahead
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
From: "kilian.zinnecker--- via buildroot" <buildroot@buildroot.org>
Reply-To: kilian.zinnecker@mail.de
Cc: Robert Nelson <robertcnelson@gmail.com>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Kilian Zinnecker <kilian.zinnecker@mail.de>

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

v1 -> v2:

  - Added hash file for xuantie-bins package
  - Now uses uEnv.txt for actual boot commands
  - Removed extlinux.conf
  - Removed superflous comments inside config files

Kilian Zinnecker (2):
  package/xuantie-bins: new package
  configs/beaglev_ahead: new defconfig

 DEVELOPERS                                    |  7 +-
 board/beaglev-ahead/genimage.cfg              | 62 ++++++++++++++++
 board/beaglev-ahead/linux.fragment            |  2 +
 .../0001-Overwrite-bootcmd-by-force.patch     | 30 ++++++++
 board/beaglev-ahead/post-image.sh             |  6 ++
 board/beaglev-ahead/readme.txt                | 70 +++++++++++++++++++
 board/beaglev-ahead/uEnv.txt                  |  4 ++
 board/beaglev-ahead/uboot.fragment            |  2 +
 configs/beaglev_ahead_defconfig               | 44 ++++++++++++
 package/Config.in                             |  1 +
 package/xuantie-bins/Config.in                |  6 ++
 package/xuantie-bins/xuantie-bins.hash        |  1 +
 package/xuantie-bins/xuantie-bins.mk          | 27 +++++++
 13 files changed, 260 insertions(+), 2 deletions(-)
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
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
