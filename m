Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E67C28B2F
	for <buildroot@archiver.kernel.org>; Tue, 18 Mar 2025 15:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE80F83487;
	Tue, 18 Mar 2025 15:06:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WIB0QhTSZjED; Tue, 18 Mar 2025 15:06:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D655E83F9E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D655E83F9E;
	Tue, 18 Mar 2025 15:06:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 135D7D8C
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C44240859
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8z1v8mJ6wVgg for <buildroot@buildroot.org>;
 Tue, 18 Mar 2025 15:02:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8ADEF4094C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8ADEF4094C
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 86B1D85FD1; Tue, 18 Mar 2025 15:02:43 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 6 Mar 2025 22:13:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b891981d504aee5ed586d8466cbc70bb7b37ade9
X-Git-Newrev: ad5445a347ccec583c133c5476c7751c5448a920
X-Patchwork-Hint: ignore
Message-Id: <20250318150243.86B1D85FD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/arm-trusted-firmware: add lts-v2.12.x
 selection
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=ad5445a347ccec583c133c5476c7751c5448a920
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is a new lts-v2.12.x branch. Add it to the selection

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/arm-trusted-firmware/Config.in                             | 6 ++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk               | 2 +-
 boot/arm-trusted-firmware/lts-v2.12.1/arm-trusted-firmware.hash | 3 +++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index c8deede9cd..becc3f69c3 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -16,6 +16,11 @@ choice
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
 	bool "v2.12"
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_12_VERSION
+	bool "latest lts-v2.12.x"
+	help
+	  Select the latest LTS v2.12.x version available
+
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_10_VERSION
 	bool "latest lts-v2.10.x"
 	help
@@ -53,6 +58,7 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_VERSION
 	string
 	default "v2.12"		if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
+	default "lts-v2.12.1"	if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_12_VERSION
 	default "lts-v2.10.5"	if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_10_VERSION
 	default "lts-v2.8.20"	if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_8_VERSION
 	default "custom"	if BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 172a930b5c..dca16d3960 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -20,7 +20,7 @@ ARM_TRUSTED_FIRMWARE_SITE = https://git.trustedfirmware.org/TF-A/trusted-firmwar
 ARM_TRUSTED_FIRMWARE_SITE_METHOD = git
 # The licensing of custom or from-git versions is unknown.
 # This is valid only for the latest (i.e. known) version.
-ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_10_VERSION)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_8_VERSION),y)
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_10_VERSION)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_8_VERSION)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_12_VERSION),y)
 ARM_TRUSTED_FIRMWARE_LICENSE = BSD-3-Clause
 ARM_TRUSTED_FIRMWARE_LICENSE_FILES = docs/license.rst
 endif
diff --git a/boot/arm-trusted-firmware/lts-v2.12.1/arm-trusted-firmware.hash b/boot/arm-trusted-firmware/lts-v2.12.1/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..649ae8df44
--- /dev/null
+++ b/boot/arm-trusted-firmware/lts-v2.12.1/arm-trusted-firmware.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  3ab7e90d6fc3364815ad7770d7aa7af9cfd68edde43da7123f5f38f80e034c44  arm-trusted-firmware-lts-v2.12.1-git4.tar.gz
+sha256  b2c79635797bafcde84c6edadadde290b9d5e05deb3ea16a847210fd2ca83669  docs/license.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
