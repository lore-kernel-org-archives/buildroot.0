Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81A1C4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 08:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 343784029B;
	Sun,  5 May 2024 08:38:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RXlscmqBelI5; Sun,  5 May 2024 08:38:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2ED84013A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2ED84013A;
	Sun,  5 May 2024 08:38:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B64801BF82F
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 08:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A38F540457
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 08:38:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j3bLBvae-0Cv for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 08:38:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3A08400D8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3A08400D8
 for <buildroot@buildroot.org>; Sun,  5 May 2024 08:38:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 99FE086391; Sun,  5 May 2024 08:38:34 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 5 May 2024 10:34:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 929bffbf4bf8fcb91bda446777f907f32c782656
X-Git-Newrev: 5efa5e9023ba4e9858c5809c6dee00ba9b75d19f
X-Patchwork-Hint: ignore
Message-Id: <20240505083834.99FE086391@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/armadeus_apf27: add hashes for
 Linux/U-Boot
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

commit: https://git.buildroot.net/buildroot/commit/?id=5efa5e9023ba4e9858c5809c6dee00ba9b75d19f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And enable BR2_DOWNLOAD_FORCE_CHECK_HASHES. As asked By Romain.

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
[yann.morin.1998@free.fr: fix check-package]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                     | 1 -
 board/armadeus/patches/linux-headers/linux-headers.hash | 1 +
 board/armadeus/patches/linux/linux.hash                 | 2 ++
 board/armadeus/patches/uboot/uboot.hash                 | 2 ++
 configs/armadeus_apf27_defconfig                        | 4 ++++
 5 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index db23450f03..6a8ffe424f 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -129,7 +129,6 @@ configs/andes_ae350_45_defconfig lib_defconfig.ForceCheckHash
 configs/arcturus_ucls1012a_defconfig lib_defconfig.ForceCheckHash
 configs/arcturus_ucp1020_defconfig lib_defconfig.ForceCheckHash
 configs/arm_foundationv8_defconfig lib_defconfig.ForceCheckHash
-configs/armadeus_apf27_defconfig lib_defconfig.ForceCheckHash
 configs/armadeus_apf28_defconfig lib_defconfig.ForceCheckHash
 configs/armadeus_apf51_defconfig lib_defconfig.ForceCheckHash
 configs/aspeed_ast2500evb_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/armadeus/patches/linux-headers/linux-headers.hash b/board/armadeus/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/armadeus/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/armadeus/patches/linux/linux.hash b/board/armadeus/patches/linux/linux.hash
new file mode 100644
index 0000000000..804920c10d
--- /dev/null
+++ b/board/armadeus/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  879ca159c34ea9d3a6775f292cc59c2d3931d57dca00f0bebe2675ea0c82c6a9  linux-5.10.215.tar.xz
diff --git a/board/armadeus/patches/uboot/uboot.hash b/board/armadeus/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..777e0adab2
--- /dev/null
+++ b/board/armadeus/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  839bf23cfe8ce613a77e583a60375179d0ad324e92c82fbdd07bebf0fd142268  u-boot-2018.09.tar.bz2
diff --git a/configs/armadeus_apf27_defconfig b/configs/armadeus_apf27_defconfig
index a87d319729..782587e410 100644
--- a/configs/armadeus_apf27_defconfig
+++ b/configs/armadeus_apf27_defconfig
@@ -5,6 +5,10 @@ BR2_arm926t=y
 # Linux headers same as kernel, a 5.10 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
+# Build
+BR2_GLOBAL_PATCH_DIR="board/armadeus/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 # System
 BR2_TARGET_GENERIC_HOSTNAME="apf27"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Armadeus development platform !"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
