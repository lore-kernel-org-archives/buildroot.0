Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB94C021A4
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 16:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B92380B1D;
	Sat, 14 Sep 2024 16:02:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8B7JS68fngv5; Sat, 14 Sep 2024 16:02:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A19D880B28
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A19D880B28;
	Sat, 14 Sep 2024 16:02:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 212EE1BF844
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 16:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FA794013B
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 16:02:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1AIdYcOGYw7d for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 16:02:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB3F240148
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB3F240148
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 16:02:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B715F8348A; Sat, 14 Sep 2024 16:02:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 17:56:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 49c041aa2753d8dfe524bb3bd671b4d769c8640a
X-Git-Newrev: 7c5b6c1e9f7914d87e69678ad502363ae8e61f99
X-Patchwork-Hint: ignore
Message-Id: <20240914160231.B715F8348A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot: optee-os: enable RISC-V (64-bit)
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7c5b6c1e9f7914d87e69678ad502363ae8e61f99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

OP-TEE OS and TAs can run on RISC-V (64-bit) machines, so allow
optee-os to be compiled for the new architecture.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
[Arnout:
 - set CROSS_COMPILE_ta_rv64 even on arm builds;
 - ARCH=arm for aarch64.
]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 boot/optee-os/Config.in   |  2 +-
 boot/optee-os/optee-os.mk | 14 ++++++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

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
index 6b04a0f5e1..8d0169448f 100644
--- a/boot/optee-os/optee-os.mk
+++ b/boot/optee-os/optee-os.mk
@@ -54,16 +54,26 @@ OPTEE_OS_MAKE_OPTS = \
 	CROSS_COMPILE_core="$(TARGET_CROSS)" \
 	CROSS_COMPILE_ta_arm64="$(TARGET_CROSS)" \
 	CROSS_COMPILE_ta_arm32="$(TARGET_CROSS)" \
+	CROSS_COMPILE_ta_rv64="$(TARGET_CROSS)" \
 	PYTHON3="$(HOST_DIR)/bin/python3"
 
+ifeq ($(BR2_riscv),y)
+OPTEE_OS_MAKE_OPTS += \
+	ARCH=riscv \
+	CFG_RV64_core=y \
+	CFG_USER_TA_TARGETS=ta_rv64
+else
 ifeq ($(BR2_aarch64),y)
 OPTEE_OS_MAKE_OPTS += \
+	ARCH=arm \
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
@@ -77,6 +87,10 @@ OPTEE_OS_MAKE_OPTS += $(call qstrip,$(BR2_TARGET_OPTEE_OS_ADDITIONAL_VARIABLES))
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
