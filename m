Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13072C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 16:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B99BA83F7E;
	Thu, 28 Jul 2022 16:41:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B99BA83F7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4sSZtpkftKlI; Thu, 28 Jul 2022 16:41:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E42183F74;
	Thu, 28 Jul 2022 16:41:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E42183F74
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CED9E1BF20B
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 16:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5342607C9
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 16:40:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5342607C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xw1-4labiZlC for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 16:40:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56ECE60A73
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 56ECE60A73
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 16:40:12 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26SGe7hu021426;
 Thu, 28 Jul 2022 11:40:07 -0500
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26SGe7jr039469
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 28 Jul 2022 11:40:07 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 28
 Jul 2022 11:40:06 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 28 Jul 2022 11:40:06 -0500
Received: from uda0500531.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26SGe66M038992;
 Thu, 28 Jul 2022 11:40:06 -0500
To: <buildroot@buildroot.org>
Date: Thu, 28 Jul 2022 11:40:02 -0500
Message-ID: <20220728164006.16652-1-x-shi@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1659026407;
 bh=zM89D5SQc5y2Lor1Db6tS8GBiF4us3CZ17eXS+XPuao=;
 h=From:To:CC:Subject:Date;
 b=SmsylNXZxzjog7kY15Yi24j8zOYxfIzUaooYEYxA+ZysDuPpWU08PapWiho5VSCAV
 SXYFvn6uSIUAdcdEOZNx6jtNEm5M+m7O1U27z5FlYC0LtF1Lnyw4uv58OyJGZj/9NM
 g3NZivhJsdAnc5w1C3ratcSH5sIqm/yD6QwQ1Fnc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=SmsylNXZ
Subject: [Buildroot] [PATCH v2 0/4] add support for TI's AM6X boards
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
From: Xuanhao Shi via buildroot <buildroot@buildroot.org>
Reply-To: Xuanhao Shi <x-shi@ti.com>
Cc: Anand Gadiyar <gadiyar@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The series applied the changes requested by Thomas Petazzoni and 
Arnout Vandecappelle to the previous patch for adding support to TI's 
AM6X boards ([1]). Specifically, it currently added support for the
AM64x_sk board and the AM62x_sk board.

[1] http://lists.busybox.net/pipermail/buildroot/2022-July/647460.html

Changes in v2:
- Revert arm-gnu-toolchain back to version 10.x due to a bug.
  When the pre-packaged GCC was built, it could be targeting
  a newer x86_64 architecture than the processor being used.
- Add boot/ti-k3-r5-loader package that builds a separate U-Boot
  for the R5 cores on TI's K3 devices.
- Add boot/ti-k3-image-gen package that builds the full boot binary
  tiboot3.bin from the spl built from ti-k3-r5-loader.
- Add board/ti directory to include sdcard config and board information
  for AM64x_sk and AM62x_sk boards.
- Add the Buildroot defconfigs for AM64x_sk and AM62x_sk.
- Add to DEVELOPERS list.

Xuanhao Shi (4):
  package/arm-gnu-toolchain: revert to version 10
  boot/ti-k3-r5-loader: add new package
  boot/ti-k3-image-gen: add new package
  board/ti: add new boards

 DEVELOPERS                                    | 16 +++++++
 board/ti/am62x_sk/genimage.cfg                | 27 +++++++++++
 board/ti/am62x_sk/readme.txt                  | 46 +++++++++++++++++++
 board/ti/am64x_sk/genimage.cfg                | 27 +++++++++++
 board/ti/am64x_sk/readme.txt                  | 46 +++++++++++++++++++
 boot/Config.in                                |  2 +
 boot/ti-k3-image-gen/Config.in                | 24 ++++++++++
 boot/ti-k3-image-gen/ti-k3-image-gen.hash     |  2 +
 boot/ti-k3-image-gen/ti-k3-image-gen.mk       | 33 +++++++++++++
 boot/ti-k3-r5-loader/Config.in                | 13 ++++++
 boot/ti-k3-r5-loader/ti-k3-r5-loader.hash     |  2 +
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk       | 42 +++++++++++++++++
 configs/am62x_sk_defconfig                    | 45 ++++++++++++++++++
 configs/am64x_sk_defconfig                    | 45 ++++++++++++++++++
 .../arm-gnu-toolchain/arm-gnu-toolchain.hash  |  2 +-
 .../arm-gnu-toolchain/arm-gnu-toolchain.mk    |  6 +--
 16 files changed, 374 insertions(+), 4 deletions(-)
 create mode 100644 board/ti/am62x_sk/genimage.cfg
 create mode 100644 board/ti/am62x_sk/readme.txt
 create mode 100644 board/ti/am64x_sk/genimage.cfg
 create mode 100644 board/ti/am64x_sk/readme.txt
 create mode 100644 boot/ti-k3-image-gen/Config.in
 create mode 100644 boot/ti-k3-image-gen/ti-k3-image-gen.hash
 create mode 100644 boot/ti-k3-image-gen/ti-k3-image-gen.mk
 create mode 100644 boot/ti-k3-r5-loader/Config.in
 create mode 100644 boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
 create mode 100644 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
 create mode 100644 configs/am62x_sk_defconfig
 create mode 100644 configs/am64x_sk_defconfig

-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
