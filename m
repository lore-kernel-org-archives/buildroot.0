Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA342C3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 22:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E240403CF;
	Wed, 10 Jul 2024 22:01:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QP0rtge3Bnu7; Wed, 10 Jul 2024 22:01:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49636415CF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49636415CF;
	Wed, 10 Jul 2024 22:01:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 371911BF292
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 22:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2368640126
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 22:01:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d40rMXTyToSl for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 22:01:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35B32400FE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35B32400FE
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 22:01:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2189E848E6; Wed, 10 Jul 2024 22:01:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jul 2024 00:01:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0ffff6106cd2686cb08cfe2a60d7900929270af5
X-Git-Newrev: 623bd47c26caa72e772d9ccb073eb806fae950ea
X-Patchwork-Hint: ignore
Message-Id: <20240710220154.2189E848E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/spike_riscv64: remove no longer
 needed kernel fragment
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

commit: https://git.buildroot.net/buildroot/commit/?id=623bd47c26caa72e772d9ccb073eb806fae950ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit [1] updated riscv-isa-sim (Spike), which now includes
a NS16550 uart emulation. The Kernel config fragment was introduced to
work with older HTIF interface from Spike.

For more information about the HTIF/NS16550 in Spike, see the commit
log [2].

This commit removes this Kernel config fragment, since it is no longer
needed.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/853b7661bf5ddca5d4b81964ef1a19a133beac85
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/38c581b05cd8e7967783410b36c14b9b561acd12

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/spike/riscv64/linux.fragment | 3 ---
 configs/spike_riscv64_defconfig    | 1 -
 2 files changed, 4 deletions(-)

diff --git a/board/spike/riscv64/linux.fragment b/board/spike/riscv64/linux.fragment
deleted file mode 100644
index b443b0ab36..0000000000
--- a/board/spike/riscv64/linux.fragment
+++ /dev/null
@@ -1,3 +0,0 @@
-CONFIG_RISCV_SBI_V01=y
-CONFIG_HVC_RISCV_SBI=y
-CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
diff --git a/configs/spike_riscv64_defconfig b/configs/spike_riscv64_defconfig
index b4b3d6e3d5..fa8cba4275 100644
--- a/configs/spike_riscv64_defconfig
+++ b/configs/spike_riscv64_defconfig
@@ -4,7 +4,6 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.26"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/spike/riscv64/linux.fragment"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TARGET_ROOTFS_CPIO=y
 # BR2_TARGET_ROOTFS_TAR is not set
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
