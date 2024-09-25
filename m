Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D708C369A4
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 07:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 248ED81E70;
	Wed, 25 Sep 2024 07:22:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 16RVWqucfmCP; Wed, 25 Sep 2024 07:22:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28FA88492C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28FA88492C;
	Wed, 25 Sep 2024 07:22:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 23B831BF38D
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 07:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 208A26070B
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 07:22:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a2XkxRg6Hwn6 for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 07:22:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=60.248.80.70;
 helo=atcsqr.andestech.com; envelope-from=peterlin@andestech.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0830D6068A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0830D6068A
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0830D6068A
 for <buildroot@buildroot.org>; Wed, 25 Sep 2024 07:22:22 +0000 (UTC)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
 by Atcsqr.andestech.com with ESMTPS id 48P7LtIC096885
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
 Wed, 25 Sep 2024 15:21:56 +0800 (+08)
 (envelope-from peterlin@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Sep
 2024 15:21:56 +0800
To: <buildroot@buildroot.org>
Date: Wed, 25 Sep 2024 15:21:51 +0800
Message-ID: <20240925072151.571744-5-peterlin@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240925072151.571744-1-peterlin@andestech.com>
References: <20240925072151.571744-1-peterlin@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 48P7LtIC096885
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=andestech.com
Subject: [Buildroot] [PATCH v4 4/4] board/andes/ae350: readme.txt: Add
 SPI_burn tool instructions
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
From: Yu Chien Peter Lin via buildroot <buildroot@buildroot.org>
Reply-To: Yu Chien Peter Lin <peterlin@andestech.com>
Cc: tim609@andestech.com, Yu Chien Peter Lin <peterlin@andestech.com>,
 ycliang@andestech.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yu-Chien Peter Lin <peterlin@andestech.com>

Add a section to document how to update bootloader on AE350
platforms with SPI_burn tool.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>
---
 board/andes/ae350/readme.txt | 43 ++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/board/andes/ae350/readme.txt b/board/andes/ae350/readme.txt
index 4de4cb3894..36561fc777 100644
--- a/board/andes/ae350/readme.txt
+++ b/board/andes/ae350/readme.txt
@@ -41,6 +41,49 @@ After building, you should obtain the following files:
   |-- u-boot-spl.bin
   `-- u-boot.itb
 
+How to update the bootloader and device-tree
+============================================
+
+To update the bootloader and device tree, make sure you have
+an ICEman (Andes OpenOCD [1]) and AICE [2] connection set up
+as below:
+
+  Local Host                 Local/Remote Host
+ .-----------------.          .--------------.
+ | buildroot images|          |              |
+ |                 |         ICEman host <IP:PORT>
+ | .----------.    |          |  .--------.  |
+ | | SPI_burn |<---+--socket--+->| ICEman |  |
+ | '----------'    |          |  '--.-----'  |
+ '-----------------'          '-----|--------'
+                                    |
+                                    USB
+   .--------------.                 |
+   | target       |           .-----v-----.
+   | board        <----JTAG---| AICE      |
+   |              |           '-----------'
+   '--------------'
+
+[1] https://github.com/andestech/ICEman
+[2] https://www.andestech.com/en/products-solutions/andeshape-platforms/aice-micro/
+
+The Andes SPI_burn tool will be located in output/host/bin. Use
+the following commands to update the bootloader and device tree:
+
+  $ SPI_burn --host $ICE_IP --port $ICE_BURNER_PORT --addr 0x0     -i u-boot-spl.bin
+  $ SPI_burn --host $ICE_IP --port $ICE_BURNER_PORT --addr 0x10000 -i u-boot.itb
+  $ SPI_burn --host $ICE_IP --port $ICE_BURNER_PORT --addr 0xf0000 -i ae350_ax45mp.dtb
+
+Note that the --addr option specifies the offset starting from
+the flash base address 0x80000000 and set by U-Boot configurations.
+e.g.
+u-boot-spl.bin  : CONFIG_SPL_TEXT_BASE=0x80000000
+u-boot.itb      : CONFIG_SPL_LOAD_FIT_ADDRESS=0x80010000
+ae350_ax45mp.dtb: CONFIG_SYS_FDT_BASE=0x800f0000
+
+How to write the SD card
+========================
+
 Copy the sdcard.img to a SD card with "dd":
 
   $ sudo dd if=sdcard.img of=/dev/sdX bs=4096
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
