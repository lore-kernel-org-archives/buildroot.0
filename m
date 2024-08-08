Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2124C3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 20:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F65580E78;
	Thu,  8 Aug 2024 20:35:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l2Q7F2QH5Vnf; Thu,  8 Aug 2024 20:35:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04C8481210
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04C8481210;
	Thu,  8 Aug 2024 20:35:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 834031BF98E
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 20:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CBD660663
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 20:35:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q0ecO4ZjVynJ for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 20:35:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.142;
 helo=fllv0016.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 87539605E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87539605E1
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 87539605E1
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 20:35:19 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 478KZIvN082369;
 Thu, 8 Aug 2024 15:35:18 -0500
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 478KZIDZ127545
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 8 Aug 2024 15:35:18 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Aug 2024 15:35:18 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Aug 2024 15:35:18 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 478KZImq046243;
 Thu, 8 Aug 2024 15:35:18 -0500
Date: Thu, 8 Aug 2024 15:35:11 -0500
Message-ID: <20240808-bsp-bump-v1-0-9e1c6f3c2592@ti.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAP8rtWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDcyMz3aTiAt2k0twCXcNU8yTLpDSzZENjYyWg8oKi1LTMCrBR0bG1tQD
 ZQny2WgAAAA==
To: <buildroot@buildroot.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2120; i=bb@ti.com;
 h=from:subject:message-id; bh=XHhPXmx2R/8bkVh2X6E5W16dVllos4+fxDx5yCLfhQk=;
 b=owNCWmg5MUFZJlNZWkBg6gAAaP////958rku3m/xdRtPX/tn1n3nVYzvn1dncv3d3f7f//ewA
 RmwHaRo0Y1AAaGQyAaGgaA0A0MgAA0ADIAGjQBkGTJo0Bk9QPTSaHo1D1GTyiANAZDQ0Mg0aDRi
 YhkNBpo0yNAaGCZGJkeoZANNMhpkGmRkYmjQYQZBiDIAZJ6nqNPU0GmTRpoZGhkAyZA0GmTQNAA
 DQGmTEAA0YAQNBpoaaMTT1A0Bo00GgEEAwGIFsOkCGjKPLHlrCoBoJkO560XiJUto6CSIACIXQp
 W/0lhbeJ1vaKuqWfOQo3pPo+/7hv2JDObhJAn6AXL9VxOYoEBr52Tc2XH8oGTipQ4SqXwbwQi2l
 SngFY/G6q+e45KuI/B0YoAG5jGI5hoaba2V5g/H7f6wa+RjgccbCLqCkEkqQUIFfI7duG0IvE5/
 GKLSGoyWT0PvEJmzLMJcP5LVjheyJaUJaBXDJg1Ca6CNnDTFIaLMh9VwQKkBSOTojDPkuJE0eH+
 lv4aSVr3VPwZqAJVgcQB0al5pqfE6hRhlEFzwCihhlTeAJ9VmOYbqw1kM2dXroQkwEeVDmnioal
 Tgi1wHyrcgRYJcf9miWeEQQANCO453+ezFFr5ERvmX/KtUcSQSrIBbHiYBCEf3AGfnuqCu+c/l5
 IxNgIXY/4u5IpwoSC0gMHUA
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1723149318;
 bh=mk/slCF3gmGl7dgHm75EQcbgmzUNSYgMOFCXfqBMl8U=;
 h=From:Subject:Date:To:CC;
 b=d3u+8I1Ba0E0JXik1DyZcXw9+iaYo8gzptLxFeng8C9qLdRUiQxKbbYijbkyMBYqx
 aMweZ3SSImpe7qfKJbyZW2QoxcjsstgHbs5CtRQZBv9cYXUoa75FWDQS9QJwaGxFXt
 nOgNMTFvESKburgWkO6JPLOjoGY+Jcl0o01B0jpc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=d3u+8I1B
Subject: [Buildroot] [PATCH 0/4] board/ti: baseport bump for TI boards and
 beagleplay
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
Cc: Xuanhao Shi <X15000177@gmail.com>, Bryan Brattlof <bb@ti.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello everyone!

This small series bumps TF-A, U-Boot, and Linux for TI's reference 
boards and the beagleplay. 

Happy reviewing
~Bryan

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
Bryan Brattlof (4):
      configs/beagleplay_defconfig: bump tfa, uboot and linux versions
      configs/ti_am62x_sk_defconfig: bump tfa, uboot and linux version
      configs/ti_am62ax_sk_defconfig: bump tfa, linux and uboot versions
      configs/ti_am64x_sk_defconfig: bump tfa, uboot and linux versions

 .../arm-trusted-firmware/arm-trusted-firmware.hash |  2 +-
 .../beagleplay/patches/linux/linux.hash            |  2 +-
 .../patches/ti-k3-r5-loader/ti-k3-r5-loader.hash   |  3 +-
 .../beagleplay/patches/uboot/uboot.hash            |  2 +-
 .../arm-trusted-firmware/arm-trusted-firmware.hash |  4 +-
 ...e-sci-clk-Adding-support-for-non-contiguo.patch | 76 ----------------------
 board/ti/am62ax-sk/patches/linux/linux.hash        |  2 +-
 .../patches/ti-k3-r5-loader/ti-k3-r5-loader.hash   |  3 +-
 board/ti/am62ax-sk/patches/uboot/uboot.hash        |  4 +-
 .../arm-trusted-firmware/arm-trusted-firmware.hash |  2 +-
 ...e-sci-clk-Adding-support-for-non-contiguo.patch | 75 ---------------------
 board/ti/am62x-sk/patches/linux/linux.hash         |  2 +-
 .../patches/ti-k3-r5-loader/ti-k3-r5-loader.hash   |  3 +-
 .../arm-trusted-firmware/arm-trusted-firmware.hash |  2 +-
 ...e-sci-clk-Adding-support-for-non-contiguo.patch | 75 ---------------------
 board/ti/am64x-sk/patches/linux/linux.hash         |  2 +-
 .../patches/ti-k3-r5-loader/ti-k3-r5-loader.hash   |  3 +-
 board/ti/am64x-sk/patches/uboot/uboot.hash         |  2 +-
 configs/beagleplay_defconfig                       | 10 +--
 configs/ti_am62ax_sk_defconfig                     |  9 ++-
 configs/ti_am62x_sk_defconfig                      |  6 +-
 configs/ti_am64x_sk_defconfig                      | 12 ++--
 22 files changed, 35 insertions(+), 266 deletions(-)
---
base-commit: 53116d091562fb260460382fa295738323decf3d
change-id: 20240726-bsp-bump-1e7b9bf6c133

Best regards,
-- 
Bryan Brattlof <bb@ti.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
