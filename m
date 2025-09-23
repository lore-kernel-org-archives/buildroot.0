Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBFDCAC5AC
	for <buildroot@archiver.kernel.org>; Tue, 23 Sep 2025 19:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50FDF6000A;
	Tue, 23 Sep 2025 19:39:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sLsLbGb7X3BN; Tue, 23 Sep 2025 19:39:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 556F460D71
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 556F460D71;
	Tue, 23 Sep 2025 19:39:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 91661129
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 19:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 780AB822E5
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 19:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4cTeFxLEoiA7 for <buildroot@buildroot.org>;
 Tue, 23 Sep 2025 19:38:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81013822C9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81013822C9
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 19:38:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F3688635E; Tue, 23 Sep 2025 19:38:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Sep 2025 21:20:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ca24cd9c9b11bd634b2570f059f1187ec426b9e2
X-Git-Newrev: 39ea74ffc7d6387af0a3040542008960c7cdbf2f
X-Patchwork-Hint: ignore
Message-Id: <20250923193857.6F3688635E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/aspeed_ast2600evb: bump kernel to
 6.16.7, check hashes, use bootlin toolchain
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
Content-Type: multipart/mixed; boundary="===============5295275313657706348=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5295275313657706348==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=39ea74ffc7d6387af0a3040542008960c7cdbf2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds BR2_DOWNLOAD_FORCE_CHECK_HASHES=y and
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y in the
defconfig, bumps kernel to 6.16.7, and adds custom hash files and
removes the exception entry in .checkpackageignore.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
[Julien:
 - mention kernel bump in commit title
 - move BR2_DOWNLOAD_FORCE_CHECK_HASHES=y down in defconfig
 - remove linux-headers hash file
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                               | 1 -
 board/aspeed/ast2600-evb/patches/linux/linux.hash | 2 ++
 board/aspeed/ast2600-evb/patches/uboot/uboot.hash | 2 ++
 configs/aspeed_ast2600evb_defconfig               | 8 ++++++--
 4 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index d100a165ef..50471f3f85 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -87,7 +87,6 @@ configs/am574x_idk_defconfig lib_defconfig.ForceCheckHash
 configs/andes_ae350_45_defconfig lib_defconfig.ForceCheckHash
 configs/arcturus_ucls1012a_defconfig lib_defconfig.ForceCheckHash
 configs/arcturus_ucp1020_defconfig lib_defconfig.ForceCheckHash
-configs/aspeed_ast2600evb_defconfig lib_defconfig.ForceCheckHash
 configs/asus_tinker-s_rk3288_defconfig lib_defconfig.ForceCheckHash
 configs/asus_tinker_rk3288_defconfig lib_defconfig.ForceCheckHash
 configs/at91sam9260eknf_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/aspeed/ast2600-evb/patches/linux/linux.hash b/board/aspeed/ast2600-evb/patches/linux/linux.hash
new file mode 100644
index 0000000000..e1da9b309e
--- /dev/null
+++ b/board/aspeed/ast2600-evb/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  5be3daa1f9427b1bdb34c4894d9c1adfac38cff674376fe0611a3065729a1a81  linux-6.16.7.tar.xz
diff --git a/board/aspeed/ast2600-evb/patches/uboot/uboot.hash b/board/aspeed/ast2600-evb/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..de387741d2
--- /dev/null
+++ b/board/aspeed/ast2600-evb/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  16da36d1832f058cf1a6673b6a2eedeef1260576c15e76c4998e30d0fb13d339  uboot-66672e5af36fe294df56f8e7942069e3909f3790-git4.tar.gz
diff --git a/configs/aspeed_ast2600evb_defconfig b/configs/aspeed_ast2600evb_defconfig
index 0572f78599..056c6aedc1 100644
--- a/configs/aspeed_ast2600evb_defconfig
+++ b/configs/aspeed_ast2600evb_defconfig
@@ -1,13 +1,17 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_16=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
+BR2_GLOBAL_PATCH_DIR="board/aspeed/ast2600-evb/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="ast2600-evb"
 BR2_TARGET_GENERIC_ISSUE="Aspeed AST2600 EVB"
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/aspeed/common/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.16.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.16.7"
 BR2_LINUX_KERNEL_DEFCONFIG="aspeed_g5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="aspeed/aspeed-ast2600-evb"

--===============5295275313657706348==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5295275313657706348==--
