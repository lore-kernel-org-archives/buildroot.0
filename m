Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6151C25B75
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 13:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9ADD4241D;
	Thu,  6 Jun 2024 13:23:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XtXTvYIi75ZM; Thu,  6 Jun 2024 13:23:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66DF542422
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66DF542422;
	Thu,  6 Jun 2024 13:23:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E23161BF32B
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 13:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CBB7141A74
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 13:23:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0DlLHUuQbP9s for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 13:23:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEDD941A75
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AEDD941A75
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 13:23:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9518787CA2; Thu,  6 Jun 2024 13:23:19 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 6 Jun 2024 15:20:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9c1fabc1ac5bd0469d21aea91335ee35c5287f90
X-Git-Newrev: 9eb7eb456a6a530749d1c0121794c415b4888b96
X-Patchwork-Hint: ignore
Message-Id: <20240606132319.9518787CA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/stm32f429_disco_xip: add hashes
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

commit: https://git.buildroot.net/buildroot/commit/?id=9eb7eb456a6a530749d1c0121794c415b4888b96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch adds the .hash file for Linux, which then allow to enable
BR2_DOWNLOAD_FORCE_CHECK_HASHES. With this, we can now drop the
defconfig from .checkpackageignore.

Note that the defconfig uses linux-headers that are not the same as
the kernel (although the same series), and instead use the 6.1.x
version from the linux-headers package choice. So we don't need to
add a .hash file for linux-headers.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[yann.morin.1998@free.fr: don't add linux-headers symlink; explain why]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                               | 1 -
 board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash | 2 ++
 configs/stm32f429_disco_xip_defconfig                             | 2 ++
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 35c8c0a59c..8a21b3f155 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -330,7 +330,6 @@ configs/solidrun_clearfog_defconfig lib_defconfig.ForceCheckHash
 configs/solidrun_clearfog_gt_8k_defconfig lib_defconfig.ForceCheckHash
 configs/solidrun_macchiatobin_defconfig lib_defconfig.ForceCheckHash
 configs/spike_riscv64_defconfig lib_defconfig.ForceCheckHash
-configs/stm32f429_disco_xip_defconfig lib_defconfig.ForceCheckHash
 configs/stm32f469_disco_sd_defconfig lib_defconfig.ForceCheckHash
 configs/stm32f469_disco_xip_defconfig lib_defconfig.ForceCheckHash
 configs/stm32mp157a_dk1_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
new file mode 100644
index 0000000000..c1bd9f9100
--- /dev/null
+++ b/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  c2b74b96dd3d0cc9f300914ef7c4eef76d5fac9de6047961f49e69447ce9f905  linux-6.1.27.tar.xz
diff --git a/configs/stm32f429_disco_xip_defconfig b/configs/stm32f429_disco_xip_defconfig
index 99ae8cc753..e3d3cc38ff 100644
--- a/configs/stm32f429_disco_xip_defconfig
+++ b/configs/stm32f429_disco_xip_defconfig
@@ -3,6 +3,8 @@ BR2_cortex_m4=y
 BR2_KERNEL_HEADERS_6_1=y
 # BR2_UCLIBC_INSTALL_UTILS is not set
 BR2_ENABLE_LTO=y
+BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f429-disco/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
