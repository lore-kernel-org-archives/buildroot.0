Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63249C00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 20:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA9A160E22;
	Tue,  2 Aug 2022 20:05:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA9A160E22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MsMBFrC4LjBy; Tue,  2 Aug 2022 20:05:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA5D460BD8;
	Tue,  2 Aug 2022 20:05:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA5D460BD8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1EDFC1BF3B8
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 20:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06C91400AF
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 20:05:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06C91400AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iWg2L7OYaudO for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 20:05:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5FE6402FE
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E5FE6402FE
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 20:05:26 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 272K5NcB016435;
 Tue, 2 Aug 2022 15:05:23 -0500
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 272K5Nae103841
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 2 Aug 2022 15:05:23 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 2
 Aug 2022 15:05:23 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 2 Aug 2022 15:05:23 -0500
Received: from uda0500531.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 272K5M3Q106903;
 Tue, 2 Aug 2022 15:05:22 -0500
To: <buildroot@buildroot.org>
Date: Tue, 2 Aug 2022 15:05:19 -0500
Message-ID: <20220802200522.4619-1-x-shi@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1659470723;
 bh=drMbY8ga5QNi5rLtzxH59fyZnE4jPbOuX1ZVPLC9wBI=;
 h=From:To:CC:Subject:Date;
 b=OZ7UwP0Lv7D3cfwlKccrSgV+pu+Z3vZEmqfBRPIiZFKRNUXH989/HxEFPCsCHuuRa
 P/F+3UwcfAeHRodN1neczdL3pF1FqZXXUG5CYp/yBEoG1tK4lZHaWtksJ5kycIAkuk
 W3ZmWhHpouEkkb8iMZjv/Prjstg0FZTucAZ4k528=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=OZ7UwP0L
Subject: [Buildroot] [PATCH v3 0/3] add support for TI's AM6X boards
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The series applied the changes requested by Thomas Petazzoni and 
Giulio Benetti to the previous patch for adding support to TI's 
AM6X boards ([1]). Specifically, it added support for the
AM64x_sk board only for now, but more k3 boards will be added
in the future.

[1] https://lists.buildroot.org/pipermail/buildroot/2022-July/647882.html

Changes in v3:
- Fix boot/ti-k3-r5-loader package's build options and dependencies.
- Fix boot/ti-k3-image-gen package's config
- Add more details in board/ti/am64x_sk's readme
- Trim configs/am64x_sk's toolchain options and 
  fix uboot and genimage dependencies.
- Remove board/ti/am62x_sk and configs/am62x_sk for now due to some
  firmware dependency problems. Will be added back in the future.

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

Xuanhao Shi (3):
  boot/ti-k3-r5-loader: add new package
  boot/ti-k3-image-gen: add new package
  board/ti/am64x_sk: add new board

 DEVELOPERS                                | 12 ++++++
 board/ti/am64x_sk/genimage.cfg            | 27 +++++++++++++
 board/ti/am64x_sk/readme.txt              | 49 +++++++++++++++++++++++
 boot/Config.in                            |  2 +
 boot/ti-k3-image-gen/Config.in            | 24 +++++++++++
 boot/ti-k3-image-gen/ti-k3-image-gen.hash |  2 +
 boot/ti-k3-image-gen/ti-k3-image-gen.mk   | 33 +++++++++++++++
 boot/ti-k3-r5-loader/Config.in            | 13 ++++++
 boot/ti-k3-r5-loader/ti-k3-r5-loader.hash |  2 +
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk   | 45 +++++++++++++++++++++
 configs/am64x_sk_defconfig                | 48 ++++++++++++++++++++++
 11 files changed, 257 insertions(+)
 create mode 100644 board/ti/am64x_sk/genimage.cfg
 create mode 100644 board/ti/am64x_sk/readme.txt
 create mode 100644 boot/ti-k3-image-gen/Config.in
 create mode 100644 boot/ti-k3-image-gen/ti-k3-image-gen.hash
 create mode 100644 boot/ti-k3-image-gen/ti-k3-image-gen.mk
 create mode 100644 boot/ti-k3-r5-loader/Config.in
 create mode 100644 boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
 create mode 100644 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
 create mode 100644 configs/am64x_sk_defconfig

-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
