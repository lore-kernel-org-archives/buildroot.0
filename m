Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35081C19F2E
	for <buildroot@archiver.kernel.org>; Thu, 27 Feb 2025 15:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2D7280D50;
	Thu, 27 Feb 2025 15:34:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wwCpnBBo84HR; Thu, 27 Feb 2025 15:34:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C28568214A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C28568214A;
	Thu, 27 Feb 2025 15:34:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A5E76711
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 15:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88E0F4142F
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 15:34:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FMhhBPnQXTf0 for <buildroot@buildroot.org>;
 Thu, 27 Feb 2025 15:34:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 46E8541437
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46E8541437
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 46E8541437
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 15:34:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 08F594440D;
 Thu, 27 Feb 2025 15:34:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Feb 2025 15:33:57 +0000
Message-Id: <20250227153358.526791-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekjeekfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegudegvdeklefhheefueeiieegteegteeuudegteduvdevffeikefgjeekgfdukeenucfkphepvdgrtddumeegfhelmeeftdejtdemvdelugdvmeemvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemgehfleemfedtjedtmedvleguvdemmedvpdhhvghlohepsghuihhlugegrdgsohhothhlihhnrdgtohhmpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdprhgtphhtthhopehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1740670441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=vbqTUzRbMBi4BEdu7hdyHXgRcow1+gnRzNvni07hBvg=;
 b=jDQB5uwXimKzXCQbbT9xnv0DjbnKOXqWo6BpgteR5hpUreY9gePv8oAj64xZYye4FN0W8Y
 yZJK/33QVRMLwyqPsi2CLbaWn+WZ6pEZLHgY+vhMhVobzHWvLQw3FuKwiEJ+R8h0RG/J0B
 qu7//hbpehUeAwzeffY3jZNkqTaCtAT7EFfqOgivWAdvi+OMrdvMKlJTuAtiAGzczKPwlw
 94weoCHcYgLtJ32hn9k+9nDKp+FxF799o3m4owaAZEBJ2V7o8+hpzRrSzMiAbcNyV+PENk
 G93F6IfTpTUfGPndDhCrwdPoRYiEJVneTtDJXEAl46QOCrs0hjdKCmpPsMzgIQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jDQB5uwX
Subject: [Buildroot] [PATCH] board/octavo: Add FORCE_CHECK_HASHES config and
 custom hashes
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Kory Maincent <kory.maincent@bootlin.com>, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable FORCE_CHECK_HASHES to ensure that all hashes are valid even
from custom packages.
Add custom version package hashes of Linux, U-boot and TF-A.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash      | 2 ++
 board/octavo/osd32mp1-brk/patches/linux/linux.hash              | 2 ++
 board/octavo/osd32mp1-brk/patches/uboot/uboot.hash              | 2 ++
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash      | 2 ++
 board/octavo/osd32mp1-red/patches/linux/linux.hash              | 2 ++
 board/octavo/osd32mp1-red/patches/uboot/uboot.hash              | 2 ++
 configs/octavo_osd32mp1_brk_defconfig                           | 1 +
 configs/octavo_osd32mp1_red_defconfig                           | 1 +
 8 files changed, 14 insertions(+)
 create mode 100644 board/octavo/osd32mp1-brk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 100644 board/octavo/osd32mp1-brk/patches/linux/linux.hash
 create mode 100644 board/octavo/osd32mp1-brk/patches/uboot/uboot.hash
 create mode 100644 board/octavo/osd32mp1-red/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 100644 board/octavo/osd32mp1-red/patches/linux/linux.hash
 create mode 100644 board/octavo/osd32mp1-red/patches/uboot/uboot.hash

diff --git a/board/octavo/osd32mp1-brk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/octavo/osd32mp1-brk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..2ba1cc0972
--- /dev/null
+++ b/board/octavo/osd32mp1-brk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  83d744c155097f27682a06fdba5f7e976fde6edf61474d40a5a44e71862a3822  arm-trusted-firmware-v2.4-stm32mp-r1-git4.tar.gz
diff --git a/board/octavo/osd32mp1-brk/patches/linux/linux.hash b/board/octavo/osd32mp1-brk/patches/linux/linux.hash
new file mode 100644
index 0000000000..ec9218e388
--- /dev/null
+++ b/board/octavo/osd32mp1-brk/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  c2e22c6d13e5970839231ca29cfbe3bb66ef4d4d1cd3c2b5afb61f591f89d71a  linux-v5.10-stm32mp-r2.1-git4.tar.gz
diff --git a/board/octavo/osd32mp1-brk/patches/uboot/uboot.hash b/board/octavo/osd32mp1-brk/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..6b51c2685b
--- /dev/null
+++ b/board/octavo/osd32mp1-brk/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  49a2470ecd29c29cc712861372335c9e2020e5c56392c6417faf66dc7a782261  uboot-v2020.10-stm32mp-r2.1-git4.tar.gz
diff --git a/board/octavo/osd32mp1-red/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/octavo/osd32mp1-red/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..2ba1cc0972
--- /dev/null
+++ b/board/octavo/osd32mp1-red/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  83d744c155097f27682a06fdba5f7e976fde6edf61474d40a5a44e71862a3822  arm-trusted-firmware-v2.4-stm32mp-r1-git4.tar.gz
diff --git a/board/octavo/osd32mp1-red/patches/linux/linux.hash b/board/octavo/osd32mp1-red/patches/linux/linux.hash
new file mode 100644
index 0000000000..ec9218e388
--- /dev/null
+++ b/board/octavo/osd32mp1-red/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  c2e22c6d13e5970839231ca29cfbe3bb66ef4d4d1cd3c2b5afb61f591f89d71a  linux-v5.10-stm32mp-r2.1-git4.tar.gz
diff --git a/board/octavo/osd32mp1-red/patches/uboot/uboot.hash b/board/octavo/osd32mp1-red/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..6b51c2685b
--- /dev/null
+++ b/board/octavo/osd32mp1-red/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  49a2470ecd29c29cc712861372335c9e2020e5c56392c6417faf66dc7a782261  uboot-v2020.10-stm32mp-r2.1-git4.tar.gz
diff --git a/configs/octavo_osd32mp1_brk_defconfig b/configs/octavo_osd32mp1_brk_defconfig
index e8857f3649..2a6d794722 100644
--- a/configs/octavo_osd32mp1_brk_defconfig
+++ b/configs/octavo_osd32mp1_brk_defconfig
@@ -4,6 +4,7 @@ BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/octavo/osd32mp1-brk/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_OVERLAY="board/octavo/osd32mp1-brk/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/octavo/osd32mp1-brk/genimage.cfg"
diff --git a/configs/octavo_osd32mp1_red_defconfig b/configs/octavo_osd32mp1_red_defconfig
index d179e0a27e..3646e2d04f 100644
--- a/configs/octavo_osd32mp1_red_defconfig
+++ b/configs/octavo_osd32mp1_red_defconfig
@@ -4,6 +4,7 @@ BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/octavo/osd32mp1-red/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_OVERLAY="board/octavo/osd32mp1-red/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/octavo/osd32mp1-red/genimage.cfg"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
