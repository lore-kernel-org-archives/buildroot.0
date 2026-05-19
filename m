Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585E8CD8CA4
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F9E885637;
	Tue,  9 Jun 2026 13:03:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JNvRxVmk_OMB; Tue,  9 Jun 2026 13:03:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEFE685A68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010216;
	bh=9e5djRvAVKGXArD3H5GQG2nEYQUYWN95vz3poRciw70=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fqTbHENDasw+hR5rEQ7OIFDlmLlKFXBHlDD4zjcC5DHI8qHN+Kh4ocr4CePtntSGx
	 OORM9KkBn4V1kpvbeqV+HUtnTIAk0QC3vNj7IAEhNnRn/I0rKOZgaNITwamDh+oiam
	 2O4gtbLnJYfrMZSkvL454dKYWNexGtpUvqy8lyGrxdFeNOjTOK1YYuRcuII2CsDhKm
	 Zu6nE1G89BCz5kR4E8T9pzlwGA/dx4PE97bgJRY6iNElya/g3NTMlIFMyKE43H5y47
	 so5gvas2aMzzfol4zcdfVwdh4DoaweHdF2rpk1/xhE/Ws4qNBYdfWaAHXC0XY106zf
	 hUAMchVo7eZaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEFE685A68;
	Tue,  9 Jun 2026 13:03:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11179190
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8139B457F9
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jwKujg36YpyC for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5095941EF2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5095941EF2
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C4DD87E8D; Tue,  9 Jun 2026 13:01:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 19 May 2026 21:54:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 95f86e5d8ea50ac12ce667307bec2af7e9a1b145
X-Git-Newrev: 1c393bfa6374a378550305ad70d096d4c16cf88b
X-Patchwork-Hint: ignore
Message-Id: <20260609130117.8C4DD87E8D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/pine64: enable
 BR2_DOWNLOAD_FORCE_CHECK_HASHES
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1c393bfa6374a378550305ad70d096d4c16cf88b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Enable BR2_DOWNLOAD_FORCE_CHECK_HASHES, add custom hashes in
board/pine64/pine64/patches directory and remove the exception from
.checkpackageignore.

Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                                | 1 -
 .../pine64/patches/arm-trusted-firmware/arm-trusted-firmware.hash  | 3 +++
 board/pine64/pine64/patches/linux/linux.hash                       | 7 +++++++
 board/pine64/pine64/patches/uboot/uboot.hash                       | 3 +++
 configs/pine64_defconfig                                           | 2 ++
 5 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 3f6cdff263..25c94b9562 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -130,7 +130,6 @@ configs/olpc_xo175_defconfig lib_defconfig.ForceCheckHash
 configs/olpc_xo1_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_pc2_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_zero_plus_defconfig lib_defconfig.ForceCheckHash
-configs/pine64_defconfig lib_defconfig.ForceCheckHash
 configs/pine64_pinecube_defconfig lib_defconfig.ForceCheckHash
 configs/s6lx9_microboard_defconfig lib_defconfig.ForceCheckHash
 configs/sipeed_lichee_rv_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/pine64/pine64/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/pine64/pine64/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..649ae8df44
--- /dev/null
+++ b/board/pine64/pine64/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  3ab7e90d6fc3364815ad7770d7aa7af9cfd68edde43da7123f5f38f80e034c44  arm-trusted-firmware-lts-v2.12.1-git4.tar.gz
+sha256  b2c79635797bafcde84c6edadadde290b9d5e05deb3ea16a847210fd2ca83669  docs/license.rst
diff --git a/board/pine64/pine64/patches/linux/linux.hash b/board/pine64/pine64/patches/linux/linux.hash
new file mode 100644
index 0000000000..e810c7aa76
--- /dev/null
+++ b/board/pine64/pine64/patches/linux/linux.hash
@@ -0,0 +1,7 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  067dadd445578284ea6158f312f7970d8940fed3e094dbe49cff66d188d3bda4  linux-6.18.32.tar.xz
+
+# Locally calculated
+sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
+sha256  8780e78a1a737e127f25a65f6d95269bffd36158dc261114de7859b490bfc5aa  LICENSES/preferred/GPL-2.0
+sha256  8e378ab93586eb55135d3bc119cce787f7324f48394777d00c34fa3d0be3303f  LICENSES/exceptions/Linux-syscall-note
diff --git a/board/pine64/pine64/patches/uboot/uboot.hash b/board/pine64/pine64/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..d20ea61576
--- /dev/null
+++ b/board/pine64/pine64/patches/uboot/uboot.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  ac7c04b8b7004923b00a4e5d6699c5df4d21233bac9fda690d8cfbc209fff2fd  u-boot-2026.04.tar.bz2
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
diff --git a/configs/pine64_defconfig b/configs/pine64_defconfig
index a2e19b1a4b..9a77452a51 100644
--- a/configs/pine64_defconfig
+++ b/configs/pine64_defconfig
@@ -3,6 +3,8 @@ BR2_ARM_FPU_VFPV4=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
+BR2_GLOBAL_PATCH_DIR="board/pine64/pine64/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to PINE64"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pine64/pine64/genimage.cfg"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
