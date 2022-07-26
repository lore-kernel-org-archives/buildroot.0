Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE3EC04A68
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 16:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 286CC84C55;
	Tue, 26 Jul 2022 16:51:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 286CC84C55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kz0pIkT24CQx; Tue, 26 Jul 2022 16:51:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E912848D2;
	Tue, 26 Jul 2022 16:51:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E912848D2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AF6481BF3D9
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 16:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83F04422F5
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 16:50:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83F04422F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yWkmSyJk5HC5 for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 16:50:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23E1F41655
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 23E1F41655
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 16:50:48 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26QGoglf022462;
 Tue, 26 Jul 2022 11:50:42 -0500
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26QGogLb012199
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 26 Jul 2022 11:50:42 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Jul 2022 11:50:42 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 26 Jul 2022 11:50:41 -0500
Received: from uda0500531.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26QGofBm095306;
 Tue, 26 Jul 2022 11:50:41 -0500
To: <buildroot@buildroot.org>
Date: Tue, 26 Jul 2022 11:50:37 -0500
Message-ID: <20220726165041.17584-1-x-shi@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1658854242;
 bh=0/U5MSpmG2qKsUGKldO3zi9TugGbvk6mjGUCpPSfacg=;
 h=From:To:CC:Subject:Date;
 b=u2aD9U1t5+H8+ikgY492s/8xYyh9IpryvYtX8Jc7yoip8DBD9nDZZqfaww2RwjQS4
 xcas3Ia+NcWBa1u43CLHXZ6l6qZ7iBbJryiEPYlQf5aOUMHtbrny/TjXvCfj+uT0bZ
 KKCk5mYy/r/2ZtmhnxXJ7AMYfOVyO7hsiayZTBcY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=u2aD9U1t
Subject: [Buildroot] [PATCH 0/4] add support for TI's AM6X SoCs
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
 Suniel Mahesh <sunil@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

*** BLURB HERE ***
The purpose of this series of patches is to include enable Buildroot to build for Texas Instruments AM6X boards.

These boards contain a separate 32-bit ARM R5 core that require a 32-bit ARM cross compiler. 
The R5 then configures some hardware before loading 64-bit code into DRAM. And this code will be run by a 64-bit ARM A53 core separately.

As a result, these boards would require two separate U-Boot builds with different cross compiler toolchains.

The more detailed boot process on these boards can be found at
https://software-dl.ti.com/processor-sdk-linux/esd/AM64X/latest/exports/docs/linux/Foundational_Components/U-Boot/UG-General-Info.html

I came across an old post about this:
http://lists.busybox.net/pipermail/buildroot/2019-October/262283.html
And the corresponding patch:
http://lists.busybox.net/pipermail/buildroot/2019-February/242251.html

So I used a similar idea and added on top of those patches to make the additions more generic to AM6X boards.

Buildroot as of now is able to build everything we need for the A53 core, but to build the R5 core, we would require a separate 32-bit arm-gnu-none-eabi cross compiler.
There is already a host package in Buildroot for the newest bare metal toolchain; however, there have been some bugs reported on 11.2:
https://bugs.launchpad.net/gcc-arm-embedded/+bug/1969997
when the pre-packaged GCC was built, it could be targeting a newer x86_64 architecture than the processor being used.
This is why I modified the arm-gnu-toolchain host package to include an additional custom option to specify a different version.
Also, we would like to have TI's k3-image-gen to build the separate boot binary, tiboot3.bin, for the R5 core: 
https://git.ti.com/cgit/k3-image-gen/k3-image-gen/about/
Which requires u-boot-spl.bin from an additional U-Boot build with the R5's defconfig.

For the k3-image-gen package, it will depend on the arm-gnu-toolchain package and uboot.
After U-Boot finishes building all that's needed for the A53 core, it will use the arm-gnu-toolchain package to build U-Boot again to obtain the R5's u-boot-spl.bin.
Lastly, it will use u-boot-spl.bin to build the boot binary tiboot3.bin for all AM6X boards' R5 cores.
All of the outputs will be in $(BINARIES_DIR)/

The additions in board/ and configs/ use this series of packages to build the image needed for TI AM64x_sk board.

Xuanhao Shi (4):
  package/arm-gnu-toolchain: add version selection
  package/k3-image-gen: new package
  board/am6x: add new board support
  configs/am64x_sk_defconfig: add new defconfig

 .../linux/ti_sdk_arm64_release_defconfig      | 1983 +++++++++++++++++
 board/am6x/genimage.cfg                       |   27 +
 board/am6x/readme.txt                         |   41 +
 configs/am64x_sk_defconfig                    |   44 +
 package/Config.in                             |    1 +
 package/Config.in.host                        |    1 +
 package/arm-gnu-toolchain/Config.in.host      |   38 +
 .../arm-gnu-toolchain/arm-gnu-toolchain.mk    |    7 +
 package/k3-image-gen/Config.in                |   37 +
 package/k3-image-gen/k3-image-gen.hash        |    2 +
 package/k3-image-gen/k3-image-gen.mk          |   43 +
 11 files changed, 2224 insertions(+)
 create mode 100644 board/am6x/am64x/linux/ti_sdk_arm64_release_defconfig
 create mode 100644 board/am6x/genimage.cfg
 create mode 100644 board/am6x/readme.txt
 create mode 100644 configs/am64x_sk_defconfig
 create mode 100644 package/arm-gnu-toolchain/Config.in.host
 create mode 100644 package/k3-image-gen/Config.in
 create mode 100644 package/k3-image-gen/k3-image-gen.hash
 create mode 100644 package/k3-image-gen/k3-image-gen.mk

-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
