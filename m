Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E98C25B78
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 13:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6566660073;
	Tue,  4 Jun 2024 13:28:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kdgq8o27LAX5; Tue,  4 Jun 2024 13:28:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD83361077
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD83361077;
	Tue,  4 Jun 2024 13:28:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0EC391BF869
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 13:28:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08DC2606DA
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 13:28:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KwjJVtt-NX2c for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 13:28:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3791F606AE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3791F606AE
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 13:28:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3115E87AAF; Tue,  4 Jun 2024 13:28:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 4 Jun 2024 15:16:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6a1c376492d6bb39a8725baae934f2b248501e0c
X-Git-Newrev: f7f2c8249662ea3a2076af31aae3fa0a7f819dac
X-Patchwork-Hint: ignore
Message-Id: <20240604132830.3115E87AAF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/ls1028ardb: add hashes
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

commit: https://git.buildroot.net/buildroot/commit/?id=f7f2c8249662ea3a2076af31aae3fa0a7f819dac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

and enable BR2_DOWNLOAD_FORCE_CHECK_HASHES

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                                  | 1 -
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash           | 2 ++
 board/freescale/ls1028ardb/patches/linux-headers/linux-headers.hash  | 1 +
 board/freescale/ls1028ardb/patches/linux/linux.hash                  | 2 ++
 board/freescale/ls1028ardb/patches/uboot/uboot.hash                  | 2 ++
 configs/ls1028ardb_defconfig                                         | 5 +++--
 6 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 50fdab88f9..fad6ff5c8b 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -206,7 +206,6 @@ configs/kontron_bl_imx8mm_defconfig lib_defconfig.ForceCheckHash
 configs/kontron_pitx_imx8m_defconfig lib_defconfig.ForceCheckHash
 configs/kontron_smarc_sal28_defconfig lib_defconfig.ForceCheckHash
 configs/linksprite_pcduino_defconfig lib_defconfig.ForceCheckHash
-configs/ls1028ardb_defconfig lib_defconfig.ForceCheckHash
 configs/ls1046a-frwy_defconfig lib_defconfig.ForceCheckHash
 configs/mangopi_mq1rdw2_defconfig lib_defconfig.ForceCheckHash
 configs/mender_x86_64_efi_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/freescale/ls1028ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/ls1028ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..17c409530d
--- /dev/null
+++ b/board/freescale/ls1028ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  0dda154c335e1a50c727601e698b6a0827e3f92308873b373449fb888df5acfd  atf-LSDK-21.08.tar.gz
diff --git a/board/freescale/ls1028ardb/patches/linux-headers/linux-headers.hash b/board/freescale/ls1028ardb/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/freescale/ls1028ardb/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/freescale/ls1028ardb/patches/linux/linux.hash b/board/freescale/ls1028ardb/patches/linux/linux.hash
new file mode 100644
index 0000000000..bd5e29d026
--- /dev/null
+++ b/board/freescale/ls1028ardb/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  6db58cf91b98f7fc279f341279a5d43d4069fb56a660a34209aba6af53ea2b57  linux-LSDK-21.08.tar.gz
diff --git a/board/freescale/ls1028ardb/patches/uboot/uboot.hash b/board/freescale/ls1028ardb/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..d0cc110fdd
--- /dev/null
+++ b/board/freescale/ls1028ardb/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  6279c161ad8a218b549e6631be969b74f358cf01a20103953ccaf3bb14185ac2  u-boot-LSDK-21.08.tar.gz
diff --git a/configs/ls1028ardb_defconfig b/configs/ls1028ardb_defconfig
index d92c543b44..462e642c3d 100644
--- a/configs/ls1028ardb_defconfig
+++ b/configs/ls1028ardb_defconfig
@@ -2,8 +2,9 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
 
-# patches
-BR2_GLOBAL_PATCH_DIR="board/freescale/common/patches"
+# Build
+BR2_GLOBAL_PATCH_DIR="board/freescale/ls1028ardb/patches board/freescale/common/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 
 # Toolchain
 # Linux headers same as kernel, a 5.10 series
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
