Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62689C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2ECD5856AC;
	Fri, 28 Feb 2025 17:03:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A3CnxA4SJU5W; Fri, 28 Feb 2025 17:03:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2F02856A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2F02856A0;
	Fri, 28 Feb 2025 17:03:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 08F1F68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CFEF42521
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CmktFbdQ5y7m for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB84D42E78
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB84D42E78
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B809B818ED; Fri, 28 Feb 2025 16:30:17 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 24 Jan 2025 19:31:32 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6bd147c35ae2e454c0905861256d61a724bd68a4
X-Git-Newrev: fb36a4635ef69e333a5a5e5642ee378d4854e8dd
X-Patchwork-Hint: ignore
Message-Id: <20250228163017.B809B818ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gnu-efi: change
 upstream, bump to 4.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=fb36a4635ef69e333a5a5e5642ee378d4854e8dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://sourceforge.net/projects/gnu-efi/ is dead and stuck at version
3.0.18. At https://sourceforge.net/p/gnu-efi/feature-requests/11/ the
upstream maintainer has indicated that the project is now maintained
at https://github.com/ncroxon/gnu-efi/, so let's use this as upstream.

We can drop patches 0002 and 0003 since they are upstream. Patch 0001
is just slightly refreshed.

Changes 3.0.18 -> 3.0.19:
  https://github.com/ncroxon/gnu-efi/releases/tag/3.0.19

Changes 3.0.19 -> 4.0.0:
  https://github.com/ncroxon/gnu-efi/releases/tag/4.0.0

The licensing files have changed:

- A LICENSE file has been added, with the text of the GPLv2

- The README.efilib file has been moved, unchanged to
  licenses/LICENSE.efilib

- A new file containing the EDK2 license has been added at
  licenses/LICENSE.edk2. This requires an update in the list of
  licenses

Tested with the following defconfigs:

 ARM defconfig testing gnu-efi + fwupd-efi

 BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_VFP=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE=y
 BR2_INIT_NONE=y
 BR2_SYSTEM_BIN_SH_NONE=y
 # BR2_PACKAGE_BUSYBOX is not set
 BR2_PACKAGE_FWUPD_EFI=y
 # BR2_TARGET_ROOTFS_TAR is not set

 RISC-V defconfig testing gnu-efi + fwupd-efi

 BR2_riscv=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_STABLE=y
 BR2_INIT_NONE=y
 BR2_SYSTEM_BIN_SH_NONE=y
 # BR2_PACKAGE_BUSYBOX is not set
 BR2_PACKAGE_FWUPD_EFI=y
 # BR2_TARGET_ROOTFS_TAR is not set

 x86-64 defconfig testing gnu-efi + fwupd-efi + systemd-boot

 BR2_x86_64=y
 BR2_x86_corei7=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE=y
 BR2_INIT_SYSTEMD=y
 BR2_SYSTEM_BIN_SH_NONE=y
 BR2_SYSTEM_DEFAULT_PATH="/bin:/sbin:/usr/bin:/usr/sbin"
 # BR2_PACKAGE_BUSYBOX is not set
 BR2_PACKAGE_SYSTEMD_BOOT=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_SYSLINUX=y
 BR2_TARGET_SYSLINUX_EFI=y

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...ts-don-t-override-ARCH-when-cross-compili.patch |    8 +-
 .../gnu-efi/0002-Make-CHAR16-use-uint16_t.patch    |  164 --
 package/gnu-efi/0003-Use-char16_t-literals.patch   | 2103 --------------------
 package/gnu-efi/Config.in                          |    2 +-
 package/gnu-efi/gnu-efi.hash                       |    9 +-
 package/gnu-efi/gnu-efi.mk                         |    9 +-
 6 files changed, 13 insertions(+), 2282 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
