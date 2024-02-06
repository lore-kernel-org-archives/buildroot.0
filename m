Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D174DC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 16:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D660612AD;
	Tue,  6 Feb 2024 16:32:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D660612AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6mIv9vd7XLLG; Tue,  6 Feb 2024 16:32:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E27D611C5;
	Tue,  6 Feb 2024 16:32:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E27D611C5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F388A1BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D325441FCD
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:31:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D325441FCD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XsHiQqoUWFQg for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 16:31:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D26C941FA5
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 16:31:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D26C941FA5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B64DD87136; Tue,  6 Feb 2024 16:31:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 17:31:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c6ab9328e13c6c9a1538b4a33824525a990b623d
X-Git-Newrev: 2a310666e06c9c5edd6879d32295c63b7851c817
X-Patchwork-Hint: ignore
Message-Id: <20240206163157.B64DD87136@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/arm-trusted-firmware: add config
 option to use latest lts-v2.8.13
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5945376657106158537=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5945376657106158537==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=2a310666e06c9c5edd6879d32295c63b7851c817
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch 0001-feat-build-add-support-for-new-binutils-versions.patch as
found in v2.8 patch dir has already been applied in lts-v2.8.13
Patch 0002-build-tools-avoid-unnecessary-link.patch from v2.8 has
been included as 0001-build-tools-avoid-unnecessary-link.patch for
lts-v2.8.13

Signed-off-by: Marleen Vos <marleen.vos@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/arm-trusted-firmware/Config.in                |  6 ++
 .../arm-trusted-firmware/arm-trusted-firmware.hash |  1 +
 .../0001-build-tools-avoid-unnecessary-link.patch  | 77 ++++++++++++++++++++++
 3 files changed, 84 insertions(+)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index c65f4aaba2..2fe3dd1146 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -16,6 +16,11 @@ choice
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
 	bool "v2.10"
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_8_VERSION
+	bool "latest lts-v2.8.x"
+	help
+	  Select the latest LTS v2.8.x version available
+
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION
 	bool "Custom version"
 	help
@@ -43,6 +48,7 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_VERSION
 	string
 	default "v2.10"		if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
+	default "lts-v2.8.13"	if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_8_VERSION
 	default "custom"	if BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL
 	default BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION \
 				if BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.hash b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
index c63e9d30b0..73ab431b9f 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,3 +1,4 @@
 # Locally calculated
 sha256  2e18b881ada9198173238cca80086c787b1fa3f698944bde1743142823fc511c  arm-trusted-firmware-v2.10.tar.gz
+sha256  e55ae7105c996b60f748b2eb6adeaf5ac8946425e1d4294ecc1c56aebf435274  arm-trusted-firmware-lts-v2.8.13.tar.gz
 sha256  130d0c6e5159fa454b1e969fd281fa1d388819aefb203f65dd282544b5ab7ba9  docs/license.rst
diff --git a/boot/arm-trusted-firmware/lts-v2.8.13/0001-build-tools-avoid-unnecessary-link.patch b/boot/arm-trusted-firmware/lts-v2.8.13/0001-build-tools-avoid-unnecessary-link.patch
new file mode 100644
index 0000000000..9e0ea74248
--- /dev/null
+++ b/boot/arm-trusted-firmware/lts-v2.8.13/0001-build-tools-avoid-unnecessary-link.patch
@@ -0,0 +1,77 @@
+From aa57ce632c629fe72ff417e261e0f5bfd8db6bab Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
+Date: Tue, 4 Jul 2023 16:14:02 +0200
+Subject: [PATCH] build(tools): avoid unnecessary link
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+In their respective makefiles, cert_create, encrypt_fw and fiptool
+depend on the --openssl phony target as a prerequisite. This forces
+those tools to be re-linked each time.
+
+Move the dependencies on the --openssl target from the tools to their
+makefiles all targets, to avoid unnecessary linking while preserving the
+OpenSSL version printing done in the --openssl targets when in debug.
+
+Fixes: cf2dd17ddda2 ("refactor(security): add OpenSSL 1.x compatibility")
+Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
+Change-Id: I98a3ab30f36dffc253cecaaf3a57d2712522135d
+Upstream: https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/commit/?id=aa57ce632c629fe72ff417e261e0f5bfd8db6bab
+---
+ tools/cert_create/Makefile | 4 ++--
+ tools/encrypt_fw/Makefile  | 4 ++--
+ tools/fiptool/Makefile     | 4 ++--
+ 3 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/tools/cert_create/Makefile b/tools/cert_create/Makefile
+index 042e844626..b911d19d2b 100644
+--- a/tools/cert_create/Makefile
++++ b/tools/cert_create/Makefile
+@@ -85,9 +85,9 @@ HOSTCC ?= gcc
+ 
+ .PHONY: all clean realclean --openssl
+ 
+-all: ${BINARY}
++all: --openssl ${BINARY}
+ 
+-${BINARY}: --openssl ${OBJECTS} Makefile
++${BINARY}: ${OBJECTS} Makefile
+ 	@echo "  HOSTLD  $@"
+ 	@echo 'const char build_msg[] = "Built : "__TIME__", "__DATE__; \
+                 const char platform_msg[] = "${PLAT_MSG}";' | \
+diff --git a/tools/encrypt_fw/Makefile b/tools/encrypt_fw/Makefile
+index 2939b142be..924e5febab 100644
+--- a/tools/encrypt_fw/Makefile
++++ b/tools/encrypt_fw/Makefile
+@@ -65,9 +65,9 @@ HOSTCC ?= gcc
+ 
+ .PHONY: all clean realclean --openssl
+ 
+-all: ${BINARY}
++all: --openssl ${BINARY}
+ 
+-${BINARY}: --openssl ${OBJECTS} Makefile
++${BINARY}: ${OBJECTS} Makefile
+ 	@echo "  HOSTLD  $@"
+ 	@echo 'const char build_msg[] = "Built : "__TIME__", "__DATE__;' | \
+                 ${HOSTCC} -c ${HOSTCCFLAGS} -xc - -o src/build_msg.o
+diff --git a/tools/fiptool/Makefile b/tools/fiptool/Makefile
+index 2ebee33931..4bdebd9235 100644
+--- a/tools/fiptool/Makefile
++++ b/tools/fiptool/Makefile
+@@ -68,9 +68,9 @@ DEPS := $(patsubst %.o,%.d,$(OBJECTS))
+ 
+ .PHONY: all clean distclean --openssl
+ 
+-all: ${PROJECT}
++all: --openssl ${PROJECT}
+ 
+-${PROJECT}: --openssl ${OBJECTS} Makefile
++${PROJECT}: ${OBJECTS} Makefile
+ 	@echo "  HOSTLD  $@"
+ 	${Q}${HOSTCC} ${OBJECTS} -o $@ ${LDLIBS}
+ 	@${ECHO_BLANK_LINE}
+-- 
+2.25.1
+

--===============5945376657106158537==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5945376657106158537==--
