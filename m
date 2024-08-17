Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294A9C52D7D
	for <buildroot@archiver.kernel.org>; Sat, 17 Aug 2024 11:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B57058120D;
	Sat, 17 Aug 2024 11:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FXz_MXyx2lsM; Sat, 17 Aug 2024 11:52:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF6D381E11
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF6D381E11;
	Sat, 17 Aug 2024 11:52:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 60C061BF578
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 11:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5AFC94025E
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 11:52:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v3Gy6KIPVKxh for <buildroot@lists.busybox.net>;
 Sat, 17 Aug 2024 11:52:24 +0000 (UTC)
X-Greylist: delayed 1807 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 17 Aug 2024 11:52:23 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DA7F24024C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA7F24024C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=60.248.80.70;
 helo=atcsqr.andestech.com; envelope-from=peterlin@andestech.com;
 receiver=<UNKNOWN> 
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA7F24024C
 for <buildroot@buildroot.org>; Sat, 17 Aug 2024 11:52:23 +0000 (UTC)
Received: from Atcsqr.andestech.com (localhost [127.0.0.2] (may be forged))
 by Atcsqr.andestech.com with ESMTP id 47HBMPnA050100
 for <buildroot@buildroot.org>; Sat, 17 Aug 2024 19:22:25 +0800 (+08)
 (envelope-from peterlin@andestech.com)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
 by Atcsqr.andestech.com with ESMTPS id 47HBM73i050060
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
 Sat, 17 Aug 2024 19:22:07 +0800 (+08)
 (envelope-from peterlin@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 17 Aug
 2024 19:22:08 +0800
To: <buildroot@buildroot.org>
Date: Sat, 17 Aug 2024 19:22:03 +0800
Message-ID: <20240817112203.3719873-1-peterlin@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 47HBMPnA050100
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=andestech.com
Subject: [Buildroot] [PATCH] boot: optee-os: enable RISC-V (64-bit)
 architecture
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
Cc: tim609@andestech.com, alvinga@andestech.com,
 Etienne Carriere <etienne.carriere@foss.st.com>,
 Yu Chien Peter Lin <peterlin@andestech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

OP-TEE OS and TAs can run on RISC-V (64-bit) machines, so allow
optee-os to be compiled for the new architecture.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
---
 boot/optee-os/Config.in   |  2 +-
 boot/optee-os/optee-os.mk | 29 ++++++++++++++++++++++++-----
 2 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index 2f996cbafc..cc0044f00a 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -1,6 +1,6 @@
 config BR2_TARGET_OPTEE_OS
 	bool "optee_os"
-	depends on BR2_ARM_CPU_ARMV8A || BR2_ARM_CPU_ARMV7A
+	depends on BR2_ARM_CPU_ARMV8A || BR2_ARM_CPU_ARMV7A || BR2_RISCV_64
 	help
 	  OP-TEE OS provides the secure world boot image and the trust
 	  application development kit of the OP-TEE project. OP-TEE OS
diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
index 6b04a0f5e1..d135de6dc7 100644
--- a/boot/optee-os/optee-os.mk
+++ b/boot/optee-os/optee-os.mk
@@ -44,26 +44,41 @@ ifeq ($(BR2_TARGET_OPTEE_OS_NEEDS_DTC),y)
 OPTEE_OS_DEPENDENCIES += host-dtc
 endif
 
+OPTEE_OS_MAKE_OPTS = \
+	CROSS_COMPILE="$(TARGET_CROSS)" \
+	CROSS_COMPILE_core="$(TARGET_CROSS)" \
+	PYTHON3="$(HOST_DIR)/bin/python3"
+
+ifeq ($(BR2_RISCV_64),y)
+OPTEE_OS_MAKE_OPTS += CROSS_COMPILE_ta_rv64="$(TARGET_CROSS)"
+else
 # On 64bit targets, OP-TEE OS can be built in 32bit mode, or
 # can be built in 64bit mode and support 32bit and 64bit
 # trusted applications. Since buildroot currently references
 # a single cross compiler, build exclusively in 32bit
 # or 64bit mode.
-OPTEE_OS_MAKE_OPTS = \
-	CROSS_COMPILE="$(TARGET_CROSS)" \
-	CROSS_COMPILE_core="$(TARGET_CROSS)" \
+OPTEE_OS_MAKE_OPTS += \
 	CROSS_COMPILE_ta_arm64="$(TARGET_CROSS)" \
-	CROSS_COMPILE_ta_arm32="$(TARGET_CROSS)" \
-	PYTHON3="$(HOST_DIR)/bin/python3"
+	CROSS_COMPILE_ta_arm32="$(TARGET_CROSS)"
+endif
 
+ifeq ($(BR2_riscv),y)
+OPTEE_OS_MAKE_OPTS += \
+	ARCH=riscv \
+	CFG_RV64_core=y \
+	CFG_USER_TA_TARGETS=ta_rv64
+else
 ifeq ($(BR2_aarch64),y)
 OPTEE_OS_MAKE_OPTS += \
+	ARCH=aarch64 \
 	CFG_ARM64_core=y \
 	CFG_USER_TA_TARGETS=ta_arm64
 else
 OPTEE_OS_MAKE_OPTS += \
+	ARCH=arm \
 	CFG_ARM32_core=y
 endif
+endif
 
 # Get mandatory PLAFORM and optional PLATFORM_FLAVOR and additional
 # variables
@@ -77,6 +92,10 @@ OPTEE_OS_MAKE_OPTS += $(call qstrip,$(BR2_TARGET_OPTEE_OS_ADDITIONAL_VARIABLES))
 # root path otherwise the output directory path depends on the target
 # platform name.
 OPTEE_OS_BUILDDIR_OUT = out
+ifeq ($(BR2_riscv),y)
+OPTEE_OS_LOCAL_SDK = $(OPTEE_OS_BUILDDIR_OUT)/export-ta_rv64
+OPTEE_OS_SDK = $(STAGING_DIR)/lib/optee/export-ta_rv64
+endif
 ifeq ($(BR2_aarch64),y)
 OPTEE_OS_LOCAL_SDK = $(OPTEE_OS_BUILDDIR_OUT)/export-ta_arm64
 OPTEE_OS_SDK = $(STAGING_DIR)/lib/optee/export-ta_arm64
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
