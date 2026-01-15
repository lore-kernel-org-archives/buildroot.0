Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5523CCF2D4
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 10:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86ABE81E78;
	Mon, 19 Jan 2026 10:01:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k_b0-_eXNiDa; Mon, 19 Jan 2026 10:01:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF40681EAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768816877;
	bh=jmCj36n6I9XU/hq0cNYXcZl4P48jHhuLvdtkV8ZqCFg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZQCf/MFs4gcqhLtMmIBn1vRDU7g8cX85OvvX64yTMff4W8Vb8jYhVyxxcI2YontXS
	 xcfFaG+v1SSUCHOchcjdxHdHCMgiuCoBeNF2umRdSjrnrcqCBYGe8xd+LnNO8nYeNa
	 Ym4eiB5SeNp6ApKofH0J946rfIOt00uNzDOwgi4Ef/D5QUwPS7pqF5J9p2wAK8w1xI
	 ELOsxse6DHI0P2el0eIRCHXzDf0GoDtYaK4ANXbn+iuRoDFMrWOPZr11fv2m2NLLGO
	 hmW5gNN/4AGvFCl8ugDCVyqtecX0HgsBkGBLqqzJaKoJ4EqMj5JIBgUwhWBnTIc5f7
	 nVdy1nK9A727A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF40681EAB;
	Mon, 19 Jan 2026 10:01:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 75B592CE
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9BE6406DC
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 58CUXxVlmtuq for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 10:00:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2FDC406DA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2FDC406DA
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D234088587; Mon, 19 Jan 2026 10:00:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Jan 2026 09:28:21 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 431dfa0e0b61b93e7814e62f170d9a9c4e70a845
X-Git-Newrev: e35028d7088d2c7d5b32ff1b7b00de73c6a9e4ec
X-Patchwork-Hint: ignore
Message-Id: <20260119100040.D234088587@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] linux: bump CIP kernel to
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

commit: https://git.buildroot.net/buildroot/commit/?id=e35028d7088d2c7d5b32ff1b7b00de73c6a9e4ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

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
index b0510f24fe..1058d66ad4 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -176,7 +176,6 @@ configs/uevm5432_defconfig lib_defconfig.ForceCheckHash
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
index a865056622..db74f4c337 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -35,7 +35,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (5.10.162-cip24)"
+	bool "Latest CIP SLTS version (5.10.246-cip66)"
 	# Support was introduced in Linux 5.19
 	depends on !BR2_loongarch64
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
@@ -57,7 +57,7 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	  https://www.cip-project.org
 
 config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
-	bool "Latest CIP RT SLTS version (5.10.162-cip24-rt10)"
+	bool "Latest CIP RT SLTS version (5.10.246-cip66-rt29)"
 	# Support was introduced in Linux 5.19
 	depends on !BR2_loongarch64
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
@@ -142,8 +142,8 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "6.18.5" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
+	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
diff --git a/linux/linux.hash b/linux/linux.hash
index 4566117102..722839df4b 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -8,8 +8,8 @@ sha256  0e8546a8437558be17ef5a87142055347bf2e7e9863ee58bb3996cbf0fd28496  linux-
 sha256  fd218df8e2107a4443b6c29fef7f95aad167031e0fbdbc7a858ae8471360668a  linux-5.15.197.tar.xz
 sha256  70c8b87ba1fcd8bfa663661934dc9bda92d0b5f3c0fc3197bb56399f69d9fe0c  linux-5.10.247.tar.xz
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
