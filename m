Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D1DC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 20:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E2F4412F5;
	Fri, 12 Jul 2024 20:42:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Npnpl5LtbAX9; Fri, 12 Jul 2024 20:42:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 888E1418A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 888E1418A3;
	Fri, 12 Jul 2024 20:42:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 931981BF420
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E880412F5
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:42:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fs_fK6VN9bwO for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 20:42:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 769664065D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 769664065D
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 20:42:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5ECDA86246; Fri, 12 Jul 2024 20:42:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 22:39:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 38d84178ce29ac3433cc1d1ae5b52ff17aace724
X-Git-Newrev: 8460ba0d2625abd8d4116f04fd25073845669a96
X-Patchwork-Hint: ignore
Message-Id: <20240712204214.5ECDA86246@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/spike_riscv64: bump kernel to
 6.6.35 and add hashes
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

commit: https://git.buildroot.net/buildroot/commit/?id=8460ba0d2625abd8d4116f04fd25073845669a96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit [1] introduced a new spike_riscv32_defconfig with Kernel
at v6.6.35.

This commit bumps the Kernel of spike_riscv64_defconfig to have it
aligned with its 32bit counterpart.

This commit also adds custom hashes. Therefore, it adds
BR2_DOWNLOAD_FORCE_CHECK_HASHES=y in the defconfig, adds a global
patch directory, and removes the entry in ".checkpackageignore".

Finally, to completely align with the spike_riscv32_defconfig, the
config directive BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM is moved by few
lines.

With this commit, the maintenance of the two spike_riscv{32,64}
defconfigs will be easier.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/a83ab3f4c8621dec58dc78a8dcb48e519377ac3d

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                          | 1 -
 board/spike/riscv64/patches/linux-headers/linux-headers.hash | 1 +
 board/spike/riscv64/patches/linux/linux.hash                 | 2 ++
 board/spike/riscv64/patches/opensbi/opensbi.hash             | 2 ++
 configs/spike_riscv64_defconfig                              | 6 ++++--
 5 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 81cabcb308..0944eb1c2d 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -281,7 +281,6 @@ configs/socrates_cyclone5_defconfig lib_defconfig.ForceCheckHash
 configs/solidrun_clearfog_defconfig lib_defconfig.ForceCheckHash
 configs/solidrun_clearfog_gt_8k_defconfig lib_defconfig.ForceCheckHash
 configs/solidrun_macchiatobin_defconfig lib_defconfig.ForceCheckHash
-configs/spike_riscv64_defconfig lib_defconfig.ForceCheckHash
 configs/stm32mp157c_dk2_defconfig lib_defconfig.ForceCheckHash
 configs/stm32mp157c_odyssey_defconfig lib_defconfig.ForceCheckHash
 configs/terasic_de10nano_cyclone5_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/spike/riscv64/patches/linux-headers/linux-headers.hash b/board/spike/riscv64/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/spike/riscv64/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/spike/riscv64/patches/linux/linux.hash b/board/spike/riscv64/patches/linux/linux.hash
new file mode 100644
index 0000000000..a3b67a09a4
--- /dev/null
+++ b/board/spike/riscv64/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  fce3ee728712ed063aa8c14a8756c8ff8c7a46ba3827f61d2b04a73c7cf5dd9e  linux-6.6.35.tar.xz
diff --git a/board/spike/riscv64/patches/opensbi/opensbi.hash b/board/spike/riscv64/patches/opensbi/opensbi.hash
new file mode 100644
index 0000000000..bc4058abe6
--- /dev/null
+++ b/board/spike/riscv64/patches/opensbi/opensbi.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  319b62a4186fbce9b81a0c5f0ec9f003a10c808397a72138bc9745d9b87b1eb1  opensbi-1.4.tar.gz
diff --git a/configs/spike_riscv64_defconfig b/configs/spike_riscv64_defconfig
index fa8cba4275..feb13d84db 100644
--- a/configs/spike_riscv64_defconfig
+++ b/configs/spike_riscv64_defconfig
@@ -1,10 +1,12 @@
 BR2_riscv=y
 BR2_RISCV_64=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_GLOBAL_PATCH_DIR="board/spike/riscv64/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.26"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.35"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TARGET_ROOTFS_CPIO=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_OPENSBI=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
