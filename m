Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DE4C25B10
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 20:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11E2982771;
	Mon,  6 May 2024 20:13:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id me6H-2Xh6hy7; Mon,  6 May 2024 20:13:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBAC6828DD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBAC6828DD;
	Mon,  6 May 2024 20:13:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A5D401BF951
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93378608D9
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:13:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vSl_AV4in9ZU for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 20:13:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA91B608D7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA91B608D7
 for <buildroot@buildroot.org>; Mon,  6 May 2024 20:13:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A5E16868DC; Mon,  6 May 2024 20:13:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 May 2024 22:12:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1e3cc620b4320aa045b3e23c6111171489437b29
X-Git-Newrev: 20817818333acb9bbfb22b4b194a1b36fadf7648
X-Patchwork-Hint: ignore
Message-Id: <20240506201307.A5E16868DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/olimex_imx233_olinuxino: add
 hashes for Linux & U-Boot
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

commit: https://git.buildroot.net/buildroot/commit/?id=20817818333acb9bbfb22b4b194a1b36fadf7648
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

and enable BR2_DOWNLOAD_FORCE_CHECK_HASHES

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                                   | 1 -
 .../olimex/imx233_olinuxino/patches/linux-headers/linux-headers.hash  | 1 +
 board/olimex/imx233_olinuxino/patches/linux/linux.hash                | 2 ++
 board/olimex/imx233_olinuxino/patches/uboot/uboot.hash                | 2 ++
 configs/olimex_imx233_olinuxino_defconfig                             | 4 ++++
 5 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 44d4250e14..33d2b011ae 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -262,7 +262,6 @@ configs/olimex_a20_olinuxino_lime_defconfig lib_defconfig.ForceCheckHash
 configs/olimex_a20_olinuxino_micro_defconfig lib_defconfig.ForceCheckHash
 configs/olimex_a33_olinuxino_defconfig lib_defconfig.ForceCheckHash
 configs/olimex_a64_olinuxino_defconfig lib_defconfig.ForceCheckHash
-configs/olimex_imx233_olinuxino_defconfig lib_defconfig.ForceCheckHash
 configs/olimex_stmp157_olinuxino_lime_defconfig lib_defconfig.ForceCheckHash
 configs/olpc_xo175_defconfig lib_defconfig.ForceCheckHash
 configs/olpc_xo1_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/olimex/imx233_olinuxino/patches/linux-headers/linux-headers.hash b/board/olimex/imx233_olinuxino/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/olimex/imx233_olinuxino/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/olimex/imx233_olinuxino/patches/linux/linux.hash b/board/olimex/imx233_olinuxino/patches/linux/linux.hash
new file mode 100644
index 0000000000..1dba724d0c
--- /dev/null
+++ b/board/olimex/imx233_olinuxino/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  88b69611093613ce4494527685f833af0c31b986dcbeda7086f69f18f9e0b190  linux-6.1.83.tar.xz
diff --git a/board/olimex/imx233_olinuxino/patches/uboot/uboot.hash b/board/olimex/imx233_olinuxino/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..c1aeddf06c
--- /dev/null
+++ b/board/olimex/imx233_olinuxino/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
diff --git a/configs/olimex_imx233_olinuxino_defconfig b/configs/olimex_imx233_olinuxino_defconfig
index 7049cfeac1..d45c55ada3 100644
--- a/configs/olimex_imx233_olinuxino_defconfig
+++ b/configs/olimex_imx233_olinuxino_defconfig
@@ -5,6 +5,10 @@ BR2_arm926t=y
 # Linux headers same as kernel, a 6.1 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
+# Build
+BR2_GLOBAL_PATCH_DIR="board/olimex/imx233_olinuxino/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_SYSTEM_DHCP="eth0"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
