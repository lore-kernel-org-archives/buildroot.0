Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 164F8C6FD1F
	for <buildroot@archiver.kernel.org>; Tue,  2 Apr 2024 17:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B57E440153;
	Tue,  2 Apr 2024 17:59:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c4-kfy7FE0Bt; Tue,  2 Apr 2024 17:59:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A75BD40194
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A75BD40194;
	Tue,  2 Apr 2024 17:59:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ACD181BF2B5
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 17:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 994DE4083B
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 17:59:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id arfz_QoidwVT for <buildroot@lists.busybox.net>;
 Tue,  2 Apr 2024 17:59:50 +0000 (UTC)
X-Greylist: delayed 8773 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 02 Apr 2024 17:59:49 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 49FD840800
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49FD840800
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.249;
 helo=lelv0142.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 49FD840800
 for <buildroot@buildroot.org>; Tue,  2 Apr 2024 17:59:49 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 432FXZtI012528;
 Tue, 2 Apr 2024 10:33:35 -0500
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 432FXZBc007454
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 2 Apr 2024 10:33:35 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 2
 Apr 2024 10:33:35 -0500
Received: from fllvsmtp7.itg.ti.com (10.64.40.31) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 2 Apr 2024 10:33:34 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by fllvsmtp7.itg.ti.com (8.15.2/8.15.2) with ESMTP id 432FXY7p116704;
 Tue, 2 Apr 2024 10:33:34 -0500
To: Buildroot Mailing List <buildroot@buildroot.org>
Date: Tue, 2 Apr 2024 10:33:28 -0500
Message-ID: <20240402153328.1859642-1-bb@ti.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1941; i=bb@ti.com;
 h=from:subject; bh=PEss6EiOykPznqFIY60gi/sOqKZ38tPiXWc7wlY5+Tc=;
 b=owNCWmg5MUFZJlNZDNsoKgAAY3///nffWu+/zO/VX1f935vzc07r7925/vL/Ymmsp3343/ewA
 RswIekAGgBoAaAA000DRkAHqDI0aGgGgzUNDTQaaZDRoaaA00GjRoNMTA1NGnoyRA0NBkANMTQ0
 AA0ZNNDQDQaYgAyDQeo2ppiaM0JhNADamgyNBoMIGEaDEAZTR6QzRDQDBGBABk0wIBppiYgAAGJ
 kZNGAmgABoyDRpoMgBo0AAAEGTEVoiJWAighc3UEQ7mKyo4ICQfgWQHTDncn2ZQMgWQY4wUM5ZB
 iJvwnxl+UGQzdCT5gyabOPsJ+EyexwCz5ek0VVwV97i2jUo6f7uHFXnhwD+4eFFggBb+R9+mF3h
 1bkSfDXAa+rNhK0NFUcU4vbdWCRL7YLr6/lBFEC8fKXzcJ/MALDSjRRYYxhNzquw3wrCLIHxGOo
 H9CXPeVgNlMZjuYFGgJj9Iw6YqJ8sRGYW60SvB4LRySuVacp8HS8UkX5juVMoApsNeusxuAmOky
 8eujj+ScA3mrb7UJXJp09FQ4xLBWtS202/HDNksZjzSm0ZH9TQJhhwol0KeGHT7dwCcAKwIAjB8
 HEKmjoZnWrf52QANlwqt6WFqRWqHIIikHwhxQlFUhIk+XOxaMas3M5uEklvAB3QPpBWjKdTwyq7
 Qf8XckU4UJAM2ygqA==
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1712072015;
 bh=buXW9V+wjnSIMc2pP/qdVZszPYQCH3w9K3l2fm+OcOg=;
 h=From:To:CC:Subject:Date;
 b=uDBJFwazVuU/e/nq5P6fALWjFWqNwFcYm2owB8Jq+a0iXjTVAgjaRGpMtco82g/z0
 WQ1boETF5rFA7sA9zvymQ1sen1FGvNkh34b5BZ3CqmJNAB24Fm55/OU6N2wOfZFe0t
 XPKKi6xGFtUf0/WFRSSK3GyCef+l05u4Sx4roFz8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=uDBJFwaz
Subject: [Buildroot] [PATCH] boot/ti-k3-boot-firmware: bump to latest version
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

The 09.02.00.009 release of ti-linux-firmware has the latest updates to
TI's TIFS, DM and DMSC firmware needed for the K3 generation of
processors. Update to pull in these latest updates.

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

base-commit: d69e13b0e965961019b4aab38e187267af3cab78
-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
