Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7202C3DA64
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 21:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EC5F81F66;
	Thu,  1 Aug 2024 21:16:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wNOjrBCrUWmC; Thu,  1 Aug 2024 21:16:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82DDD82036
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82DDD82036;
	Thu,  1 Aug 2024 21:16:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1EE091BF3F0
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CBC7400CF
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:16:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ljW5hFx_zXDs for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 21:16:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F18F440CFB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F18F440CFB
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 21:16:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC2DA8390A; Thu,  1 Aug 2024 21:16:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Aug 2024 23:15:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 44b921f605dffd07bb6294e6368c2ace34a08266
X-Git-Newrev: 450240ca3f933b710910a6ff0620fae5bd74f07b
X-Patchwork-Hint: ignore
Message-Id: <20240801211627.DC2DA8390A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/mx6sx_udoo_neo: add hashes
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

commit: https://git.buildroot.net/buildroot/commit/?id=450240ca3f933b710910a6ff0620fae5bd74f07b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hashes for uboot and linux, and enable
BR2_DOWNLOAD_FORCE_CHECK_HASHES.

Modify .checkpackageignore to enable the hash check for the Udoo Neo
config.

Signed-off-by: Philip-Dylan Gleonec <philip-dylan@gleonec.bzh>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                     | 1 -
 board/udoo/neo/patches/linux-headers/linux-headers.hash | 1 +
 board/udoo/neo/patches/linux/linux.hash                 | 2 ++
 board/udoo/neo/patches/uboot/uboot.hash                 | 2 ++
 configs/mx6sx_udoo_neo_defconfig                        | 2 ++
 5 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 028b63b4d3..fe5d2618c6 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -202,7 +202,6 @@ configs/microchip_sama7g5ek_mmc_dev_defconfig lib_defconfig.ForceCheckHash
 configs/minnowboard_max_defconfig lib_defconfig.ForceCheckHash
 configs/mx25pdk_defconfig lib_defconfig.ForceCheckHash
 configs/mx53loco_defconfig lib_defconfig.ForceCheckHash
-configs/mx6sx_udoo_neo_defconfig lib_defconfig.ForceCheckHash
 configs/mx6udoo_defconfig lib_defconfig.ForceCheckHash
 configs/nexbox_a95x_defconfig lib_defconfig.ForceCheckHash
 configs/nitrogen6sx_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/udoo/neo/patches/linux-headers/linux-headers.hash b/board/udoo/neo/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/udoo/neo/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/udoo/neo/patches/linux/linux.hash b/board/udoo/neo/patches/linux/linux.hash
new file mode 100644
index 0000000000..b8935a250a
--- /dev/null
+++ b/board/udoo/neo/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  0ad83b1a1a780a1aad948d55aa55ee63c50c626f2d46910b9d2180028d100a5e  linux-6.6.43.tar.xz
diff --git a/board/udoo/neo/patches/uboot/uboot.hash b/board/udoo/neo/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..0bfbf306ff
--- /dev/null
+++ b/board/udoo/neo/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  81b4543227db228c03f8a1bf5ddbc813b0bb8f6555ce46064ef721a6fc680413  u-boot-2022.01.tar.bz2
diff --git a/configs/mx6sx_udoo_neo_defconfig b/configs/mx6sx_udoo_neo_defconfig
index 71a7473307..adcd7aeb4e 100644
--- a/configs/mx6sx_udoo_neo_defconfig
+++ b/configs/mx6sx_udoo_neo_defconfig
@@ -1,5 +1,7 @@
 BR2_arm=y
 BR2_cortex_a9=y
+BR2_GLOBAL_PATCH_DIR="board/udoo/neo/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
