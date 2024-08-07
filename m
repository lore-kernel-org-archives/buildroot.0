Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F1AC52D7B
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 22:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12CAB40746;
	Wed,  7 Aug 2024 22:07:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zyuYKTFrc-Yk; Wed,  7 Aug 2024 22:07:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A931E40735
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A931E40735;
	Wed,  7 Aug 2024 22:07:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 248391BF321
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 22:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E0B58146B
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 22:07:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SeznX169JEM2 for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 22:07:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 255ED8146D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 255ED8146D
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 22:07:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C43F84707; Wed,  7 Aug 2024 22:07:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Aug 2024 23:56:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c48c3cf48223f2abda7da58bf206eac87c89b08b
X-Git-Newrev: 88e8f08fb676ab6c8d441f66d5ecbdac9bfff628
X-Patchwork-Hint: ignore
Message-Id: <20240807220742.1C43F84707@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/arm-trusted-firmware: also provide
 license info for LTS versions
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=88e8f08fb676ab6c8d441f66d5ecbdac9bfff628
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds license information, and license file hashes for LTS
versions, by using per-version directories.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.hash             | 5 -----
 boot/arm-trusted-firmware/arm-trusted-firmware.mk               | 2 +-
 boot/arm-trusted-firmware/lts-v2.10.5/arm-trusted-firmware.hash | 3 +++
 boot/arm-trusted-firmware/lts-v2.8.20/arm-trusted-firmware.hash | 3 +++
 boot/arm-trusted-firmware/v2.11/arm-trusted-firmware.hash       | 3 +++
 5 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.hash b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
deleted file mode 100644
index 4e446eaff5..0000000000
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# Locally calculated
-sha256  c0f23ccc71c49989e9ad238acf334473c17b7c88f79a20c829c3d443e3794a22  arm-trusted-firmware-v2.11-git4.tar.gz
-sha256  62af6f1f2e9406d761ace03025f6bf22a0670578b1d0b76092dc1db455746dad  arm-trusted-firmware-lts-v2.10.5-git4.tar.gz
-sha256  a90617cc2c1791c98d36b9e3d9a7f3f77029897e00c4279ff4ef559b769e9d7b  arm-trusted-firmware-lts-v2.8.20-git4.tar.gz
-sha256  03d5088ff4fbfe989f3c807117356191c263cf27d62ee6916bde8532611728ed  docs/license.rst
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 1b2cc3a236..a3a44feea9 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -20,7 +20,7 @@ ARM_TRUSTED_FIRMWARE_SITE = https://git.trustedfirmware.org/TF-A/trusted-firmwar
 ARM_TRUSTED_FIRMWARE_SITE_METHOD = git
 # The licensing of custom or from-git versions is unknown.
 # This is valid only for the latest (i.e. known) version.
-ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION),y)
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_10_VERSION)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_8_VERSION),y)
 ARM_TRUSTED_FIRMWARE_LICENSE = BSD-3-Clause
 ARM_TRUSTED_FIRMWARE_LICENSE_FILES = docs/license.rst
 endif
diff --git a/boot/arm-trusted-firmware/lts-v2.10.5/arm-trusted-firmware.hash b/boot/arm-trusted-firmware/lts-v2.10.5/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..6657337118
--- /dev/null
+++ b/boot/arm-trusted-firmware/lts-v2.10.5/arm-trusted-firmware.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  62af6f1f2e9406d761ace03025f6bf22a0670578b1d0b76092dc1db455746dad  arm-trusted-firmware-lts-v2.10.5-git4.tar.gz
+sha256  130d0c6e5159fa454b1e969fd281fa1d388819aefb203f65dd282544b5ab7ba9  docs/license.rst
diff --git a/boot/arm-trusted-firmware/lts-v2.8.20/arm-trusted-firmware.hash b/boot/arm-trusted-firmware/lts-v2.8.20/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..6368bf7f98
--- /dev/null
+++ b/boot/arm-trusted-firmware/lts-v2.8.20/arm-trusted-firmware.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  a90617cc2c1791c98d36b9e3d9a7f3f77029897e00c4279ff4ef559b769e9d7b  arm-trusted-firmware-lts-v2.8.20-git4.tar.gz
+sha256  130d0c6e5159fa454b1e969fd281fa1d388819aefb203f65dd282544b5ab7ba9  docs/license.rst
diff --git a/boot/arm-trusted-firmware/v2.11/arm-trusted-firmware.hash b/boot/arm-trusted-firmware/v2.11/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..984978dc11
--- /dev/null
+++ b/boot/arm-trusted-firmware/v2.11/arm-trusted-firmware.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  c0f23ccc71c49989e9ad238acf334473c17b7c88f79a20c829c3d443e3794a22  arm-trusted-firmware-v2.11-git4.tar.gz
+sha256  03d5088ff4fbfe989f3c807117356191c263cf27d62ee6916bde8532611728ed  docs/license.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
