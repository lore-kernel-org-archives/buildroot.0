Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24046CCF2D1
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 09:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA49D40D3E;
	Mon, 19 Jan 2026 09:59:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oao6mESxpRnK; Mon, 19 Jan 2026 09:59:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1BA640D19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768816755;
	bh=SI/gehKS0sB93UWfSKBZbWjua2QUkh0lYJrSw+eDYcY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BDq+lMCGEkZZnhxdgbDKhBzmWzxpXqW/OUrd66L8Fuva3y6iaVmAG83kEQj/MpdTy
	 WQFT7ze4FeZFVQaX3gQGSld3/P3DbNWUacd2YZT2+yrErqpj1ZpyrSuzQ30Ei7yp7d
	 IxIqqza9Bd9b3n8t+MleYTNG7G5oNdfZDXXlSFZ5L5yxzSj03aIo2kuAAToaJTSnUT
	 +bl5v/rHFrCSuCHpCN7Z6dVdOLqQLvdLOGreIuA40CGypT487OERsFudpeZoIytgFg
	 bTjdnG4sm/p9+BDC4jFe1uv1wF4CpPkptPx73iQqKjgB3DtXv26cU2pYIY5oiXqpWZ
	 oyV0ElNH60vfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1BA640D19;
	Mon, 19 Jan 2026 09:59:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F1E02CE
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA25240CE5
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S_Dw9KS8blyF for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 09:58:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68F8240CEB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68F8240CEB
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 65E9688679; Mon, 19 Jan 2026 09:58:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Jan 2026 09:27:16 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9606a6d0336f43a2aef0654ea93eecf572f716cc
X-Git-Newrev: 460748400820b0602eb8e568b76e96358189ac42
X-Patchwork-Hint: ignore
Message-Id: <20260119095850.65E9688679@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] linux: bump CIP kernel to
 version 5.10.246-cip66
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=460748400820b0602eb8e568b76e96358189ac42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Added Upstream: tag to patch.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit fd2555ecfdc682201cc2081d0f9249f70a1f4022)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                                               | 1 -
 .../0001-arch-microblaze-mm-init.c-fix-build.patch                | 4 ++--
 linux/Config.in                                                   | 8 ++++----
 linux/linux.hash                                                  | 4 ++--
 4 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 7de7fb12ac..285aeb3a06 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -188,7 +188,6 @@ configs/uevm5432_defconfig lib_defconfig.ForceCheckHash
 configs/visionfive_defconfig lib_defconfig.ForceCheckHash
 configs/wandboard_defconfig lib_defconfig.ForceCheckHash
 configs/warp7_defconfig lib_defconfig.ForceCheckHash
-linux/5.10.162-cip24-rt10/0001-arch-microblaze-mm-init.c-fix-build.patch lib_patch.Upstream
 package/18xx-ti-utils/0001-plt.h-fix-build-with-gcc-10.patch lib_patch.Upstream
 package/4th/0001-avoid-regen-during-install.patch lib_patch.Upstream
 package/acl/0001-Build-with-old-GCC-versions.patch lib_patch.Upstream
diff --git a/linux/5.10.162-cip24-rt10/0001-arch-microblaze-mm-init.c-fix-build.patch b/linux/5.10.246-cip66-rt29/0001-arch-microblaze-mm-init.c-fix-build.patch
similarity index 93%
rename from linux/5.10.162-cip24-rt10/0001-arch-microblaze-mm-init.c-fix-build.patch
rename to linux/5.10.246-cip66-rt29/0001-arch-microblaze-mm-init.c-fix-build.patch
index 4760d9e4fb..d1124f4cda 100644
--- a/linux/5.10.162-cip24-rt10/0001-arch-microblaze-mm-init.c-fix-build.patch
+++ b/linux/5.10.246-cip66-rt29/0001-arch-microblaze-mm-init.c-fix-build.patch
@@ -13,9 +13,9 @@ arch/microblaze/mm/init.c:71:2: error: #endif without #if
 Fixes:
  - http://autobuild.buildroot.org/results/27291870cf7539d26e45c45f34322d24a6dbca33
 
+Upstream: sent to Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: sent to
-Sebastian Andrzej Siewior <bigeasy@linutronix.de>]
 ---
  arch/microblaze/mm/init.c | 1 +
  1 file changed, 1 insertion(+)
diff --git a/linux/Config.in b/linux/Config.in
index a589d8cb38..fb21c3f513 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -35,7 +35,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (5.10.162-cip24)"
+	bool "Latest CIP SLTS version (5.10.246-cip66)"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
 	help
 	  CIP launched in the spring of 2016 to address the needs of
@@ -55,7 +55,7 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	  https://www.cip-project.org
 
 config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
-	bool "Latest CIP RT SLTS version (5.10.162-cip24-rt10)"
+	bool "Latest CIP RT SLTS version (5.10.246-cip66-rt29)"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
 	help
 	  Same as the CIP version, but this is the PREEMPT_RT realtime
@@ -138,8 +138,8 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "6.12.65" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
+	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
diff --git a/linux/linux.hash b/linux/linux.hash
index 5585746d5a..658b6d9647 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -10,8 +10,8 @@ sha256  fd218df8e2107a4443b6c29fef7f95aad167031e0fbdbc7a858ae8471360668a  linux-
 sha256  70c8b87ba1fcd8bfa663661934dc9bda92d0b5f3c0fc3197bb56399f69d9fe0c  linux-5.10.247.tar.xz
 sha256  ae6a3207f12aa4d6cfb0fa793ec9da4a6fcdfdcb57d869d63d6b77e3a8c1423d  linux-5.4.302.tar.xz
 # Locally computed
-sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
-sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
+sha256  93408e0c5d70ff0ab63dcf9edec6fda2b8524281d611a88e56590436bda43914  linux-cip-5.10.246-cip66.tar.gz
+sha256  b3454708b98016f02604433e41060be2c1feb595c2bddeb25292596f047f0915  linux-cip-5.10.246-cip66-rt29.tar.gz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
