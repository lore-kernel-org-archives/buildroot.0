Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA1AEC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 06:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24C0981771;
	Thu,  9 May 2024 06:32:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sF8DEyvR0UVW; Thu,  9 May 2024 06:32:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9059383CCA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9059383CCA;
	Thu,  9 May 2024 06:32:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B88D1BF84C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 06:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8820881C0A
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 06:32:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dsyFgk4c4bnU for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 06:32:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.154.123;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=8524e0df5=nayabbasha.sayed@microchip.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7A1768130A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A1768130A
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A1768130A
 for <buildroot@buildroot.org>; Thu,  9 May 2024 06:32:37 +0000 (UTC)
X-CSE-ConnectionGUID: PbUr6rRBRNCFX05CXiAZ0w==
X-CSE-MsgGUID: SbF1EGH0RPmCBZUIbL2zwQ==
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; d="scan'208";a="191600368"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 May 2024 23:32:34 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 23:32:08 -0700
Received: from [10.40.56.22] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 8 May 2024 23:32:07 -0700
Date: Thu, 9 May 2024 11:58:58 +0530
MIME-Version: 1.0
Message-ID: <20240509-optee-bumps-v1-3-fa2a6e1096a6@microchip.com>
References: <20240509-optee-bumps-v1-0-fa2a6e1096a6@microchip.com>
In-Reply-To: <20240509-optee-bumps-v1-0-fa2a6e1096a6@microchip.com>
To: <buildroot@buildroot.org>
X-Mailer: b4 0.12.4
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1715236357; x=1746772357;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=fullqZ3EaHXK1WfvNMhb1TTtYOI8sbS74ntvqiWUsZo=;
 b=whMn+/Whms+ZOIkBjiVAU1l2c3fGAUNTGuov5pNYY0/yWr81Mi6EgMw1
 cHpwdVYCO6WLpvueJSq4JAm8XZ7gvVUFJLMhQZV0uytCnSBo6vxUfCu1A
 PkR8N1zGPgG8c4YLGxTJfYTziN4slCPwbwmnyjZ/hkTR5/hMV4hDsqcYK
 lDI8XnWRQx5TsZuqr//MOoRKqHrepmj+LFSy0BmVHcPaIrJxCBlEgrA+Y
 WW75dyCIDDDKHCbJokkf9N/d/4Lz5BEtCPbZ3KndImXk/V3YsiCJ55bAj
 NY3CIWPUP25IgH6nJa7O08JuAZEivwYwq8X4INh/3foNrlyuIriossyJV
 A==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=whMn+/Wh
Subject: [Buildroot] [PATCH 3/3] package/optee-client: bump to version 4.2.0
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
From: Nayab Sayed via buildroot <buildroot@buildroot.org>
Reply-To: Nayab Sayed <nayabbasha.sayed@microchip.com>
Cc: Nayab Sayed <nayabbasha.sayed@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bumps OP-TEE client package version to OP-TEE release 4.2.0.
Removes the local patch related to build failure as the changes are
integrated into mailine repository before 4.2.0.

Signed-off-by: Nayab Sayed <nayabbasha.sayed@microchip.com>
---
 ...tee-supplicant-fix-build-with-kernel-4.16.patch | 56 ----------------------
 package/optee-client/optee-client.hash             |  4 +-
 package/optee-client/optee-client.mk               |  2 +-
 3 files changed, 3 insertions(+), 59 deletions(-)

diff --git a/package/optee-client/0001-tee-supplicant-fix-build-with-kernel-4.16.patch b/package/optee-client/0001-tee-supplicant-fix-build-with-kernel-4.16.patch
deleted file mode 100644
index fa51bd5d5e..0000000000
--- a/package/optee-client/0001-tee-supplicant-fix-build-with-kernel-4.16.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From acc5aec37f5f246ebf185d2129e7630eb80bb388 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 5 Jan 2024 09:47:43 +0100
-Subject: [PATCH] tee-supplicant: fix build with kernel < 4.16
-
-Commit 3ac968ee7c927271e83ea3a4247839649202ab5e moved linux/tee.h from
-libteec/include to libteec/src resulting in the following build failure
-with any kernel < 4.16 (i.e before
-https://github.com/torvalds/linux/commit/033ddf12bcf5326b93bd604f50a7474a434a35f9):
-
-/home/buildroot/autobuild/instance-3/output-1/build/optee-client-4.0.0/tee-supplicant/src/tee_supplicant.c: In function 'register_local_shm':
-/home/buildroot/autobuild/instance-3/output-1/build/optee-client-4.0.0/tee-supplicant/src/tee_supplicant.c:356:44: error: storage size of 'data' isn't known
-  356 |         struct tee_ioctl_shm_register_data data;
-      |                                            ^~~~
-
-To fix this build failure, update CMakeLists.txt and Makefile of
-tee-supplicant to add libteec/src to the include directories.
-
-Fixes: 3ac968ee7c92 ("Makefile, cmake: move teec related headers")
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/OP-TEE/optee_client/pull/369
----
- tee-supplicant/CMakeLists.txt | 5 ++++-
- tee-supplicant/Makefile       | 2 +-
- 2 files changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/tee-supplicant/CMakeLists.txt b/tee-supplicant/CMakeLists.txt
-index 31c6dac5..b44e9e95 100644
---- a/tee-supplicant/CMakeLists.txt
-+++ b/tee-supplicant/CMakeLists.txt
-@@ -93,7 +93,10 @@ endif()
- ################################################################################
- # Public and private header and library dependencies
- ################################################################################
--target_include_directories(${PROJECT_NAME} PRIVATE src)
-+target_include_directories(${PROJECT_NAME}
-+	PRIVATE src
-+	PRIVATE ../libteec/src
-+)
- 
- target_link_libraries(${PROJECT_NAME}
- 	PRIVATE teec
-diff --git a/tee-supplicant/Makefile b/tee-supplicant/Makefile
-index 06c4b2e5..c3b32252 100644
---- a/tee-supplicant/Makefile
-+++ b/tee-supplicant/Makefile
-@@ -40,7 +40,7 @@ TEES_OBJ_DIR	:= $(OUT_DIR)
- TEES_OBJS 	:= $(patsubst %.c,$(TEES_OBJ_DIR)/%.o, $(TEES_SRCS))
- TEES_INCLUDES 	:= ${CURDIR}/../libteec/include \
- 		   ${CURDIR}/src \
--		   ${CURDIR}/../libteec/include \
-+		   ${CURDIR}/../libteec/src \
- 
- TEES_CFLAGS	:= $(addprefix -I, $(TEES_INCLUDES)) $(CFLAGS) \
- 		   -DDEBUGLEVEL_$(CFG_TEE_SUPP_LOG_LEVEL) \
diff --git a/package/optee-client/optee-client.hash b/package/optee-client/optee-client.hash
index bb97820ab1..b0c6dfcb5e 100644
--- a/package/optee-client/optee-client.hash
+++ b/package/optee-client/optee-client.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_client/archive/4.0.0/optee-client-4.0.0.tar.gz
-sha256  bcdac9c3a9f2e93c64d114667cc6d1feddf9f978992cdc2d59745885f9bd8fbe  optee-client-4.0.0.tar.gz
+# From https://github.com/OP-TEE/optee_client/archive/4.2.0/optee-client-4.2.0.tar.gz
+sha256  ba0dad79cec2dabb7b6a6d3e391804f0184863ee9810e90bf97a392d3c1ad5eb  optee-client-4.2.0.tar.gz
 # Locally computed
 sha256  fda8385993f112d7ca61b88b54ba5b4cbeec7e43a0f9b317d5186703c1985e8f  LICENSE
diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
index 99c922a171..6600a9c4fc 100644
--- a/package/optee-client/optee-client.mk
+++ b/package/optee-client/optee-client.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_CLIENT_VERSION = 4.0.0
+OPTEE_CLIENT_VERSION = 4.2.0
 OPTEE_CLIENT_SITE = $(call github,OP-TEE,optee_client,$(OPTEE_CLIENT_VERSION))
 OPTEE_CLIENT_LICENSE = BSD-2-Clause
 OPTEE_CLIENT_LICENSE_FILES = LICENSE

-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
