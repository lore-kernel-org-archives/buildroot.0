Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 675A1C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 16:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6831409F8;
	Sun, 19 Jun 2022 16:59:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6831409F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qUAyT68Donss; Sun, 19 Jun 2022 16:59:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C5D3408D2;
	Sun, 19 Jun 2022 16:59:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C5D3408D2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 271CE1BF20B
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F4F960A90
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:59:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F4F960A90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t-JmbDv7n6cS for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 16:59:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14DAE60A7B
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 16:59:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14DAE60A7B
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B7E6F8744D; Sun, 19 Jun 2022 16:47:09 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 18:52:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 147e7b3c31dcd34ab71d7a8c0ed828cb4601a841
X-Git-Newrev: 467836357943f3a08a2ee3686e2878c51f9c4453
X-Patchwork-Hint: ignore
Message-Id: <20220619164709.B7E6F8744D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/arm-gnu-toolchain: Bump to
 11.2-2022.02 and rename from arm-gnu-a-toolchain
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=467836357943f3a08a2ee3686e2878c51f9c4453
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

arm-gnu-a-toolchain is now deprecated to be replaced by arm-gnu-toolchain.
The old link [1] now points to a shared page between Cortex-A and
Cortex-R/M [2].

Rename the package, taking into account legacy info, while bumping it.
Also update TF-A package that depends on it.

[1] https://developer.arm.com/downloads/-/gnu-a
[2] https://developer.arm.com/Tools%20and%20Software/GNU%20Toolchain

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                         |  2 +-
 boot/arm-trusted-firmware/arm-trusted-firmware.mk  |  2 +-
 .../arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash   |  2 --
 package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk | 26 ----------------------
 package/arm-gnu-toolchain/arm-gnu-toolchain.hash   |  2 ++
 package/arm-gnu-toolchain/arm-gnu-toolchain.mk     | 26 ++++++++++++++++++++++
 6 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 44b56ec88a..6430a38296 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2707,7 +2707,7 @@ F:	configs/rock_pi_4_defconfig
 F:	configs/rock_pi_n8_defconfig
 F:	configs/rock_pi_n10_defconfig
 F:	configs/rockpro64_defconfig
-F:	package/arm-gnu-a-toolchain/
+F:	package/arm-gnu-toolchain/
 
 N:	Sven Haardiek <sven.haardiek@iotec-gmbh.de>
 F:	package/lcdproc/
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 35a95a7ec2..998de4b814 100644
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
index 0000000000..3bfd516751
--- /dev/null
+++ b/package/arm-gnu-toolchain/arm-gnu-toolchain.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# arm-gnu-toolchain
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
