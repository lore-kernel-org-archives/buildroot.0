Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D238C433EF
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 14:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C10C6127B;
	Tue, 31 May 2022 14:35:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TE0x-BJemhfV; Tue, 31 May 2022 14:35:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C12C61276;
	Tue, 31 May 2022 14:35:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B304E1BF4E2
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 14:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96C3461084
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 14:35:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1CyxNNJggw3o for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 14:35:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0730C60E29
 for <buildroot@buildroot.org>; Tue, 31 May 2022 14:35:04 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F3507FF80B;
 Tue, 31 May 2022 14:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654007703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=gDD8rEVeppT8Nn0q3pFgoSxrelDoDGXAP34+mAaAYbY=;
 b=jO1V3jgJhR2EkEENDoELucNr0Brwj/Ixx//Y2dMU6T/cxfw68w3Q/ePUbKHcZf6rCHpCSQ
 7/eM0DCj55rRRxBoTC86SUvX5GaluKnRnDC9ueoOuuxUTOwQkK/4LZ0Gt18tovVLeJNK0A
 3HllBuDPEQHxvX+pUj12gruTlHChuzTOLKu0PBNv7K2+SQP/CqWMQwv8nvLdvJ35t/watM
 GWf2M+LjMyhTQbwASbRLAD8wDldGlHJLs0Kc/O/lWqpmesiVcgfWFn79bX8JdUOg5sMdU9
 4I/zVwPdS79c114LPxNIeJvpbEucHfrn8+dCoM86JAX6M+AzcM0jCIF0ktsChg==
To: buildroot@buildroot.org
Date: Tue, 31 May 2022 16:35:02 +0200
Message-Id: <20220531143502.464179-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package: Rename and update arm-gnu-a-toolchain
 to arm-gnu-toolchain
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: kory.maincent@bootlin.com
Cc: Kory Maincent <kory.maincent@bootlin.com>, thomas.petazzoni@bootlin.com,
 sunil@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Kory Maincent <kory.maincent@bootlin.com>

arm-gnu-a-toolchain is now deprecated to be replaced by arm-gnu-toolchain.
This patch rename the package and update to the new version.
It also update TF-A package that depends on it.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 DEVELOPERS                                    |  2 +-
 .../arm-trusted-firmware.mk                   |  2 +-
 .../arm-gnu-a-toolchain.hash                  |  2 --
 .../arm-gnu-a-toolchain.mk                    | 26 -------------------
 .../arm-gnu-toolchain/arm-gnu-toolchain.hash  |  2 ++
 .../arm-gnu-toolchain/arm-gnu-toolchain.mk    | 26 +++++++++++++++++++
 6 files changed, 30 insertions(+), 30 deletions(-)
 delete mode 100644 package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash
 delete mode 100644 package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk
 create mode 100644 package/arm-gnu-toolchain/arm-gnu-toolchain.hash
 create mode 100644 package/arm-gnu-toolchain/arm-gnu-toolchain.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 71cc3da6d7..bc3e6f7eae 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2703,7 +2703,7 @@ F:	configs/rock_pi_4_defconfig
 F:	configs/rock_pi_n8_defconfig
 F:	configs/rock_pi_n10_defconfig
 F:	configs/rockpro64_defconfig
-F:	package/arm-gnu-a-toolchain/
+F:	package/arm-gnu-toolchain/
 
 N:	Sven Haardiek <sven.haardiek@iotec-gmbh.de>
 F:	package/lcdproc/
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 03fa83b7b5..38655a70a0 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -36,7 +36,7 @@ ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-dtc
 endif
 
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN),y)
-ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-arm-gnu-a-toolchain
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-arm-gnu-toolchain
 endif
 
 ARM_TRUSTED_FIRMWARE_PLATFORM = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM))
diff --git a/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash b/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash
deleted file mode 100644
index 73c2708fea..0000000000
--- a/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256 45225813f74e0c3f76af2715d30d1fbebb873c1abe7098f9c694e5567cc2279c  gcc-arm-10.3-2021.07-x86_64-arm-none-eabi.tar.xz
diff --git a/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk b/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk
deleted file mode 100644
index 97ab89c9eb..0000000000
--- a/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk
+++ /dev/null
@@ -1,26 +0,0 @@
-################################################################################
-#
-# arm-gnu-a-toolchain
-#
-################################################################################
-
-ARM_GNU_A_TOOLCHAIN_VERSION = 10.3-2021.07
-ARM_GNU_A_TOOLCHAIN_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/$(ARM_GNU_A_TOOLCHAIN_VERSION)/binrel
-ARM_GNU_A_TOOLCHAIN_SOURCE = gcc-arm-$(ARM_GNU_A_TOOLCHAIN_VERSION)-x86_64-arm-none-eabi.tar.xz
-ARM_GNU_A_TOOLCHAIN_LICENSE = GPL-3.0+
-
-HOST_ARM_GNU_A_TOOLCHAIN_INSTALL_DIR = $(HOST_DIR)/opt/gcc-arm-none-eabi
-
-define HOST_ARM_GNU_A_TOOLCHAIN_INSTALL_CMDS
-	rm -rf $(HOST_ARM_GNU_A_TOOLCHAIN_INSTALL_DIR)
-	mkdir -p $(HOST_ARM_GNU_A_TOOLCHAIN_INSTALL_DIR)
-	cp -rf $(@D)/* $(HOST_ARM_GNU_A_TOOLCHAIN_INSTALL_DIR)/
-
-	mkdir -p $(HOST_DIR)/bin
-	cd $(HOST_DIR)/bin && \
-	for i in ../opt/gcc-arm-none-eabi/bin/*; do \
-		ln -sf $$i; \
-	done
-endef
-
-$(eval $(host-generic-package))
diff --git a/package/arm-gnu-toolchain/arm-gnu-toolchain.hash b/package/arm-gnu-toolchain/arm-gnu-toolchain.hash
new file mode 100644
index 0000000000..48b1b55c73
--- /dev/null
+++ b/package/arm-gnu-toolchain/arm-gnu-toolchain.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 8c5acd5ae567c0100245b0556941c237369f210bceb196edfe5a2e7532c60326  gcc-arm-11.2-2022.02-x86_64-arm-none-eabi.tar.xz
diff --git a/package/arm-gnu-toolchain/arm-gnu-toolchain.mk b/package/arm-gnu-toolchain/arm-gnu-toolchain.mk
new file mode 100644
index 0000000000..9beef42ac4
--- /dev/null
+++ b/package/arm-gnu-toolchain/arm-gnu-toolchain.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# arm-gnu-a-toolchain
+#
+################################################################################
+
+ARM_GNU_TOOLCHAIN_VERSION = 11.2-2022.02
+ARM_GNU_TOOLCHAIN_SITE = https://developer.arm.com/-/media/Files/downloads/gnu/$(ARM_GNU_TOOLCHAIN_VERSION)/binrel/
+ARM_GNU_TOOLCHAIN_SOURCE = gcc-arm-$(ARM_GNU_TOOLCHAIN_VERSION)-x86_64-arm-none-eabi.tar.xz
+ARM_GNU_TOOLCHAIN_LICENSE = GPL-3.0+
+
+HOST_ARM_GNU_TOOLCHAIN_INSTALL_DIR = $(HOST_DIR)/opt/gcc-arm-none-eabi
+
+define HOST_ARM_GNU_TOOLCHAIN_INSTALL_CMDS
+	rm -rf $(HOST_ARM_GNU_TOOLCHAIN_INSTALL_DIR)
+	mkdir -p $(HOST_ARM_GNU_TOOLCHAIN_INSTALL_DIR)
+	cp -rf $(@D)/* $(HOST_ARM_GNU_TOOLCHAIN_INSTALL_DIR)/
+
+	mkdir -p $(HOST_DIR)/bin
+	cd $(HOST_DIR)/bin && \
+	for i in ../opt/gcc-arm-none-eabi/bin/*; do \
+		ln -sf $$i; \
+	done
+endef
+
+$(eval $(host-generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
