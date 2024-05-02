Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1185FC4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 16:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2CC341E59;
	Thu,  2 May 2024 16:27:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e_OxoxUJhhqV; Thu,  2 May 2024 16:27:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A915B41E54
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A915B41E54;
	Thu,  2 May 2024 16:27:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CED3C1BF296
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 16:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F03A541B66
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 16:27:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ISabzjeNXKju for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 16:27:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.249;
 helo=lelv0142.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AADCB408DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AADCB408DC
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AADCB408DC
 for <buildroot@buildroot.org>; Thu,  2 May 2024 16:27:14 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 442GRDjW005185;
 Thu, 2 May 2024 11:27:13 -0500
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 442GRDW9014696
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 2 May 2024 11:27:13 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 May 2024 11:27:13 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 May 2024 11:27:13 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 442GRDCm127917;
 Thu, 2 May 2024 11:27:13 -0500
Date: Thu, 2 May 2024 11:26:53 -0500
MIME-Version: 1.0
Message-ID: <20240430-optee-update-v2-3-5bdc2f940db1@ti.com>
References: <20240430-optee-update-v2-0-5bdc2f940db1@ti.com>
In-Reply-To: <20240430-optee-update-v2-0-5bdc2f940db1@ti.com>
To: Etienne Carriere <etienne.carriere@foss.st.com>, Anand Gadiyar
 <gadiyar@ti.com>, Xuanhao Shi <X15000177@gmail.com>, Romain Naour
 <romain.naour@smile.fr>, <buildroot@buildroot.org>, Bryan Brattlof
 <bb@ti.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2443; i=bb@ti.com;
 h=from:subject:message-id; bh=lt7r6jaWTVMExrI/tpzcvvpdfShQjYFLjoCXNjNN018=;
 b=owNCWmg5MUFZJlNZegeJKgAAYH/////7+/0zj8S/W93/l9va0u8/Xez3u/dp4/prvn96/H4wA
 RmwHamjQYgA00aBoAGgABiA0DRoGgNBoyNNABoNDajRo0GQA000xDTTJkyM1NiiDJiGgDRk00Bk
 xAZNDCAAaYmmQAGAmQ0wCBoNDJppoBphNDQAABo0aGGUGTR6jJo0ZDEMQyBoGjRpkDIaGjQAGQ0
 AZNAaNGQNDI0ZGmmTINDQ00MCA0AQJ3RJ4LkQsWCJnGssFTQaY2OBNxogB52gVaGEe8WkkancIi
 r/sFZ5wQhwsLuCA9yv+sOiHPUr9onAxjQcG4hxKi98GlIo8Y5OLnZUC6XPpsUkG5x5Sr2F1qPSh
 TUtx5kauSd6g+Iob4z2/pBW0jkwhJRBWuh7rSvT/zDVsalA3Jwhu6LldSCls2yE9nDLsFRAH1SV
 tsF91wseAmyrtuuMh5JD1V4y0P+BcC88E1ozXIGWflnmrTJl61kRdgo1TRieNjjTp3fkiPuH4UB
 jvMlOzSSd2v9FBQIbEVey+u1Ynh+WBwemc0myGfY+IwmCEpKnWSglFff4Pj0LdmiBOMJce1thoB
 JEwA1BzUT4cdCOQdFxrYVMKdCSvLgeA6nKcnU6ASCLINUjkscfE98nQTMm0TmGa5SEIKBKiiPEY
 TwRiILSsdr/F3JFOFCQegeJKg==
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1714667233;
 bh=zsjfVXx3RvBcROr7huW3pq4XQnaasb9OXmK7KseoV8U=;
 h=From:Date:Subject:References:In-Reply-To:To;
 b=lZXO2bHC8l2kOfu/7VGEFRdPJI13PCNDzhknMkkrhCY+P+Ph+I6QKxUave3z+6Jeh
 FffJbZwmg3aSHoSHTMza1n+kOkUG822UJC/3s3X2UycLXHa9/OKr2hmP0mwgJnbTll
 8uLwsw9ipwLv3o1cAFcAUjB4zpB7RyBIiBY9rH48=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=lZXO2bHC
Subject: [Buildroot] [PATCH RESEND v2 03/11] boot/ti-k3-r5-loader: bump to
 version v2024.04
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The ti-k3-r5-loader is just U-Boot with a different defconfig compiled
for the 32b MCU cores needed for TI's K3 generation of SoCs. Update to
match the U-Boot version

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 boot/ti-k3-r5-loader/Config.in            | 4 ++--
 boot/ti-k3-r5-loader/ti-k3-r5-loader.hash | 2 +-
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk   | 1 +
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
index df885cc2af601..2f2434e9db2a8 100644
--- a/boot/ti-k3-r5-loader/Config.in
+++ b/boot/ti-k3-r5-loader/Config.in
@@ -18,7 +18,7 @@ choice
 	  here as it is used to build the main U-Boot package.
 
 config BR2_TARGET_TI_K3_R5_LOADER_LATEST_VERSION
-	bool "2024.01"
+	bool "2024.04"
 
 config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION
 	bool "Custom version"
@@ -62,7 +62,7 @@ endif
 
 config BR2_TARGET_TI_K3_R5_LOADER_VERSION
 	string
-	default "2024.01"	if BR2_TARGET_TI_K3_R5_LOADER_LATEST_VERSION
+	default "2024.04"	if BR2_TARGET_TI_K3_R5_LOADER_LATEST_VERSION
 	default BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash b/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
index fbe5d215409d2..a8021fb696b1a 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
+sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index 98a6d473f17f3..2ce053461038f 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 TI_K3_R5_LOADER_VERSION = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_VERSION))
+TI_K3_R5_LOADER_DL_DIR = $(UBOOT_DL_DIR)
 
 ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL),y)
 # Handle custom U-Boot tarballs as specified by the configuration

-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
