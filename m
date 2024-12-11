Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74609E7717D
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 13:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 286C680A99;
	Wed, 11 Dec 2024 13:33:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8A4W3GF4UuYl; Wed, 11 Dec 2024 13:33:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2762E80BC7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2762E80BC7;
	Wed, 11 Dec 2024 13:33:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 02B56ED2
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 13:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D84D580BC7
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 13:33:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3AXue6stQoWG for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 13:33:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15DCF80A99
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 15DCF80A99
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 13:33:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 011C786CAE; Wed, 11 Dec 2024 13:33:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 11 Dec 2024 14:27:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f22d4076370a9ac513e17662cc7ce56d5c3ca992
X-Git-Newrev: 5144d2d7aeafcbff1e0c5bf5ad3fc4bb44ca0089
X-Patchwork-Hint: ignore
Message-Id: <20241211133301.011C786CAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/aarch64_efi: bump Linux to 6.11.11
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8862190542729408673=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8862190542729408673==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5144d2d7aeafcbff1e0c5bf5ad3fc4bb44ca0089
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump Linux kernel version to 6.11.11 and update the hash accordingly.

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Dick Olsson <hi@senzilla.io>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 board/aarch64-efi/patches/linux/linux.hash | 2 +-
 configs/aarch64_efi_defconfig              | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/aarch64-efi/patches/linux/linux.hash b/board/aarch64-efi/patches/linux/linux.hash
index 20941a269b..50983eb42b 100644
--- a/board/aarch64-efi/patches/linux/linux.hash
+++ b/board/aarch64-efi/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  524858852f5869a9ef17de8b1e6e7faf05bcb2c462bc96b3c24dbf82ede373cf  linux-6.10.12.tar.xz
+sha256  62148e7e17f54c4a5ab5e75ad4882682c54bee818948be61a5963234fc0849fc  linux-6.11.11.tar.xz
diff --git a/configs/aarch64_efi_defconfig b/configs/aarch64_efi_defconfig
index 9f284ff74b..3aa649cf9c 100644
--- a/configs/aarch64_efi_defconfig
+++ b/configs/aarch64_efi_defconfig
@@ -1,5 +1,5 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_10=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11=y
 BR2_GLOBAL_PATCH_DIR="board/aarch64-efi/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/aarch64-efi/post-image.sh support/scripts/ge
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/aarch64-efi/genimage-efi.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.10.12"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.11.11"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3=y

--===============8862190542729408673==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8862190542729408673==--
