Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D34DC4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 16:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EA0740251;
	Thu,  2 May 2024 16:27:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6QvJQItWodtG; Thu,  2 May 2024 16:27:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B68D84049A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B68D84049A;
	Thu,  2 May 2024 16:27:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F2EC41BF990
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 16:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9EC741B78
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 16:27:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8pdl_7bkx9K1 for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 16:27:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.249;
 helo=lelv0142.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AAE2241B66
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAE2241B66
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AAE2241B66
 for <buildroot@buildroot.org>; Thu,  2 May 2024 16:27:14 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 442GRDBo005189;
 Thu, 2 May 2024 11:27:13 -0500
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 442GRDCF067222
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 2 May 2024 11:27:13 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 May 2024 11:27:13 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 May 2024 11:27:13 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 442GRDLq127921;
 Thu, 2 May 2024 11:27:13 -0500
Date: Thu, 2 May 2024 11:26:54 -0500
MIME-Version: 1.0
Message-ID: <20240430-optee-update-v2-4-5bdc2f940db1@ti.com>
References: <20240430-optee-update-v2-0-5bdc2f940db1@ti.com>
In-Reply-To: <20240430-optee-update-v2-0-5bdc2f940db1@ti.com>
To: Etienne Carriere <etienne.carriere@foss.st.com>, Anand Gadiyar
 <gadiyar@ti.com>, Xuanhao Shi <X15000177@gmail.com>, Romain Naour
 <romain.naour@smile.fr>, <buildroot@buildroot.org>, Bryan Brattlof
 <bb@ti.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1989; i=bb@ti.com;
 h=from:subject:message-id; bh=Tf8UEv6x+WLocRqeeDjPAla1stxveCQ0WB4iZBDqeYU=;
 b=owNCWmg5MUFZJlNZok9FBgAAaH///79L//d8WvSvz98mvdtv//d7+33vfu/v9X1PyrRZ2v6wA
 RsxpAGg9T1GgAaDQNDQAAGgBoAAGgDQGmg0NAyNAAD1GQDRppo9Qep5I9T9UyDymhyDQMJoDJoZ
 DTQAaNPU0yDIGmRmoANAMQxAwj1AGQA0Gg0wgB6gDQANMjRD9UbSG0T1AAaaAAAGRiNqaAGhoAA
 AMTEDTRkDIANDQDRpkyAGgDQyDT0gQTIOmHoaoJ3/SSB6hrg9LQ8WHkKUAlS/vbhvsgC44u2iEi
 MLzBdFZhbxk2KhOY+NutS0ttE4Ea9D9fLX0JiBnHkMv5AMGmbWH4BuetShe0whCPtA2TgBtf1tN
 PcCwQ7wG5T7DeqcJlBU36LpGYBZtc/GY+7B2ScewfVqXDNVh8i4eFfNZAH1RmUITFi7x7kuIZQZ
 RAaYtC0aLSMUqFJMbHcoc+rX5D+eJwiBGKvjNEMFUdLfCVT7rBxxTvqUiDRqb3wEOJr9JtZj6gB
 322mr1TK8BvxWdsvPD9KVcKC1pWdIWg0l+2NdeYRBcke0DsASBsyygHD8OrHWo6h8dDKhmn/ZFC
 /ptbZhp86TJYBfJDNDIxKvVRfI32AmKR+moFYzwpnHLym50YH4Wb7mk2bRQh8bKybefIL5JaPBq
 DFxF9/bLL/F3JFOFCQok9FBgA==
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1714667233;
 bh=ZFFg0m3VCPPOMApzWfYTU9i9qu7Qh5O6i4Faj926W6w=;
 h=From:Date:Subject:References:In-Reply-To:To:CC;
 b=p4l+B+R2w9sZQSK2bg3hKaenn2HxyiNjkf5e9/0SxGjJKlsmgQOFACmH92XRzDCd4
 ghZ8fYQc0GMbB5tjAqPwBhb4E7Bo4hkGlXDkydDGS+ladE+UdadTgPRhhaExeHMzlL
 9xakIvmJCJxn0t7Eri16g4ZeUOn/8TFwbRXmyosE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=p4l+B+R2
Subject: [Buildroot] [PATCH RESEND v2 04/11] boot/ti-k3-boot-firmware: bump
 to version 09.02.00.009
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

The 09.02.00.009 release of ti-linux-firmware has the latest updates to
TI's TIFS, DM and DMSC firmware needed for the K3 generation of
processors. Update to pull in these latest updates.

Reviewed-by: Heiko Thiery <heiko.thiery@gmail.com>
Tested-by: Andreas Dannenberg <dannenberg@ti.com>
Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash | 2 +-
 boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk   | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
index 95131180ef400..2398d02da258a 100644
--- a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
+++ b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  ab20ffbe7bba7e94be246b3417d33a914b3f07c16c47ef5a7f7602349a666a61  LICENSE.ti
-sha256  6032a258ce731d987576115f5de44c677a6b0cf8bddcd61a9a2852928bdfff92  ti-linux-firmware-08.06.00.006.tar.xz
+sha256  ae888a0a22f8c5b8fe841236d6e40bb2f821d9a4161dab6924fd989e1467ef0e  ti-linux-firmware-09.02.00.009.tar.xz
diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
index 1f8ade207c13a..9332732ad4a32 100644
--- a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
+++ b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# The hash 340194800a581baf976360386dfc7b5acab8d948 defined in the
-# Makefile of ti-k3-image-gen corresponds to the tag 08.06.00.006.
-TI_K3_BOOT_FIRMWARE_VERSION = 08.06.00.006
+TI_K3_BOOT_FIRMWARE_VERSION = 09.02.00.009
 TI_K3_BOOT_FIRMWARE_SITE = https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/snapshot
 TI_K3_BOOT_FIRMWARE_SOURCE = ti-linux-firmware-$(TI_K3_BOOT_FIRMWARE_VERSION).tar.xz
 TI_K3_BOOT_FIRMWARE_INSTALL_IMAGES = YES

-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
