Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD7BC4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 16:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABBE44049A;
	Thu,  2 May 2024 16:27:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ycsDyfMatAo; Thu,  2 May 2024 16:27:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A8F641D6A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A8F641D6A;
	Thu,  2 May 2024 16:27:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 50D0F1BF296
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 16:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31AC44026B
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 16:27:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nJ50TOnjA1O9 for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 16:27:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.142;
 helo=fllv0016.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ABA5641729
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABA5641729
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ABA5641729
 for <buildroot@buildroot.org>; Thu,  2 May 2024 16:27:14 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 442GRDNK085867;
 Thu, 2 May 2024 11:27:13 -0500
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 442GRDt9131042
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 2 May 2024 11:27:13 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 May 2024 11:27:13 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 May 2024 11:27:13 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 442GRDJd109044;
 Thu, 2 May 2024 11:27:13 -0500
Date: Thu, 2 May 2024 11:26:50 -0500
Message-ID: <20240430-optee-update-v2-0-5bdc2f940db1@ti.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMq+M2YC/32NMQ/CIBBG/0rDLIYCaYOTg10ddDQOlF4tSYUGW
 qJp+t+9MDgZx+9d3r2VRAgWIjkUKwmQbLTe4eC7gphBuwdQ2+EmnHHJpGDUTzMAXaZOz0BbZcr
 WSFA9VwSVVkeEQTszoOSWcUQ4BejtKzdu5NJcm/OJ3JEPNs4+vHM6lfn6u5JKymjV18JIxQQYc
 Zzt3vhn/pL4P5OjWWspqk5VTCn1Nbdt+wA313t7/AAAAA==
To: Etienne Carriere <etienne.carriere@foss.st.com>, Anand Gadiyar
 <gadiyar@ti.com>, Xuanhao Shi <X15000177@gmail.com>, Romain Naour
 <romain.naour@smile.fr>, <buildroot@buildroot.org>, Bryan Brattlof
 <bb@ti.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3023; i=bb@ti.com;
 h=from:subject:message-id; bh=DqqgxPNeeKgQoQvuHPdjJZuXiQG10ky3ZtD1RfG+F48=;
 b=owNCWmg5MUFZJlNZERnnOQAAZv///vd99/n5b+akeu/ZNYlf85//8m/73P4/cT7rv7p791SwA
 RsYIepo0ANNGmj1DQAAAB6gAAAAPUAaAZAMg0ADQPQgAaMQaNqZPak9TwUOgZANAGRptQNA9RoA
 ZMmJoNDT1NDIaAAPUGgxDQaDaTygABppoZGT1NPSMmhoIZHqaGjIZAAaNGBNqDQNAGgaBgBBoAG
 gDIyMgGTRkYEZMI0MIDRkDAAHYe1vgzDNj9CWES4UFgXo6eQ3KyNLePY2lR07MRjfg7gk8lA+cc
 WNFAvwnTpQLkC1EBSCA2Vd5DBByiYC0CTkYVEiIHI3G3IYNrmbKDgt6rRJb+ALGlRJYuJNDSh9O
 mZg6GkNhCgsRXv4w9LBMZylDI/iNPmOwE5bpiEqFi5Lx7+6W5h8R7izTAX6U9jiHbuo3hZ+Om41
 Bsf+Dkjw1jdoXgG1ljF1LU82mx+PvVNfYcNv2z9ettUM2xVqlYEagfo8X5CN1MyvqQUokjUG2R9
 rV3f7JgNxO00I0bFXzCxhqqWSpQ21PIG0gaVyxwbJ98kQ8IT8Ilx8UnJ2XGiR1bQU5kgCHjWucO
 EX5hl6Z5eGwTlpbP09QEa4VhUmRxMsUREAMwzKo6DDKNFxATSX9bpBiYI4nRTZjEI26OPsw/8Xc
 kU4UJARGec5
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1714667233;
 bh=qSFQSzxRU/1ZX4rdItDK8HtUvyRJN5RwGG9XZeip1gU=;
 h=From:Subject:Date:To:CC;
 b=tvd8hItp52PonJnYEB9TqMxbIsjKO0am6bTuOFaZxA30FPSF5/JFkjzBnmAyBm/6h
 mynIaS756Uyx2mvuLH/DyZkBXK57G5ZvUDVMrlly0+LRTFvznjBfMDOGzfUxtA2P3m
 Ae6z+N42to72FiIVIOPW69D0pmZwYUpn3yIp/sv0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=tvd8hItp
Subject: [Buildroot] [PATCH RESEND v2 00/11] update bsp binaries for TI SoCs
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello everyone!

My apologies to everyone I just spammed with the first v2. I dropped the 
mailing list (still setting up my b4 configs) :/

This series updates all the boot binaries (U-Boot, OP-TEE, TF-A, and 
Linux) to their latest versions to pull in all bug fixes and new 
features additions in these projects.

This also includes a patch I send out a while ago just to keep things 
organized. 

  https://lore.kernel.org/buildroot/20240402153328.1859642-1-bb@ti.com/

and finally some proof I didn't completely break something ;)

  https://paste.sr.ht/~bryanb/b666adef7da412de76efb5e4a68e68e0651f7928

Thanks for reviewing
~Bryan

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
Changes in v2:
- most emails never made it to the mailing list
- updated commit messages to be more explicit about versions picked
- Link to v1: https://lore.kernel.org/r/20240430-optee-update-v1-0-6f73c4903ec3@ti.com

---
Bryan Brattlof (11):
      boot/optee-os: bump to release v4.2.0
      boot/uboot: bump to version v2024.04
      boot/ti-k3-r5-loader: bump to version v2024.04
      boot/ti-k3-boot-firmware: bump to version 09.02.00.009
      configs/ti_am62x_sk_defconfig: update TFA to v2.10
      configs/ti_am64x_sk_defconfig: update TFA to v2.10
      configs/ti_am62x_sk_defconfig: update U-Boot to v2024.04
      configs/ti_am64x_sk_defconfig: update U-Boot to v2024.04
      configs/ti_am62x_sk_defconfig: bump kernel to v6.8.8
      configs/ti_am64x_sk_defconfig: update kernel to v6.8.8
      DEVELOPERS: add myself to TI's packages and reference boards

 DEVELOPERS                                                       | 7 +++++++
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash       | 2 +-
 board/ti/am62x-sk/patches/linux/linux.hash                       | 2 +-
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash       | 2 +-
 board/ti/am64x-sk/patches/linux/linux.hash                       | 2 +-
 boot/optee-os/Config.in                                          | 4 ++--
 boot/optee-os/optee-os.hash                                      | 4 ++--
 boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash                | 2 +-
 boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk                  | 4 +---
 boot/ti-k3-r5-loader/Config.in                                   | 4 ++--
 boot/ti-k3-r5-loader/ti-k3-r5-loader.hash                        | 2 +-
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk                          | 1 +
 boot/uboot/Config.in                                             | 6 +++---
 boot/uboot/uboot.hash                                            | 2 +-
 configs/ti_am62x_sk_defconfig                                    | 9 ++++-----
 configs/ti_am64x_sk_defconfig                                    | 9 ++++-----
 16 files changed, 33 insertions(+), 29 deletions(-)
---
base-commit: 929bffbf4bf8fcb91bda446777f907f32c782656
change-id: 20240430-optee-update-b9c1bc4e9f29

Best regards,
-- 
Bryan Brattlof <bb@ti.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
