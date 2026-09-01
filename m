Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1659C61DD6
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 22:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 850DC806F0;
	Tue,  1 Sep 2026 22:00:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JwwRICTVFscm; Tue,  1 Sep 2026 22:00:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788300037;
	bh=1Ow/1YBXnpY8wsNOsUnTF/pV4A0TVTX6LWVmIZ9Wjeo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HXobu4U3nA8UIIYRQg3Klef9MMxOsdxwtT3lZtYD5bvzic4cF0B9BPU9OzOtTVVpj
	 cDBglUZbdaNfgyKFMAY0tHwMOI02LljQlxBAj1cIjMDAT3Wdi4l2M67oqnWBYbn3Rs
	 hQhuGeqNNmvDxnCwAmhiyRk8GIguVFMc7s3fQOM3eojo2CI9HPYuhR8f6qssy5p9Em
	 OCYDZCE7sTziA5JsY2AOR+XpIgN1Jhst7EnPpqRzp264Iqw6yeYbXS+3+0xTtxF13V
	 NpCZV4Ff+NUXZkPsiXgMcuGCY8hI5QFU0roLAA5olePEzEh7EOHuodXcYZgp9aYOwZ
	 e2nMzqtlsuXDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A752C80882;
	Tue,  1 Sep 2026 22:00:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 64821498
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 22:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61DF88071F
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 22:00:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 10H_2L3PIhRv for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 22:00:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A301C806F0
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 22:00:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 714669358B; Tue,  1 Sep 2026 21:59:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 1 Sep 2026 23:58:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 789485b3e7a70e18c799ea330b3c184ce9ea245e
X-Git-Newrev: 79fd6241e4347f67d659cc02669448397b458d52
X-Patchwork-Hint: ignore
Message-Id: <20260901215936.714669358B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/qemu: add xtensa kernel patch
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/79fd6241e4347f67d659cc02669448397b458d52
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

-fno-stack-protector must be passed to avoid linking errors related to
undefined references to '__stack_chk_guard' and '__stack_chk_fail' if
toolchain enforces -fstack-protector.

Fixes:
https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/15876432953

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-xtensa-disable-SSP-when-needed.patch      | 36 ++++++++++++++++++++++
 configs/qemu_xtensa_lx60_defconfig                 |  2 +-
 configs/qemu_xtensa_lx60_nommu_defconfig           |  2 +-
 3 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/board/qemu/xtensa-lx60/patches/linux/0001-xtensa-disable-SSP-when-needed.patch b/board/qemu/xtensa-lx60/patches/linux/0001-xtensa-disable-SSP-when-needed.patch
new file mode 100644
index 0000000000..cc19348140
--- /dev/null
+++ b/board/qemu/xtensa-lx60/patches/linux/0001-xtensa-disable-SSP-when-needed.patch
@@ -0,0 +1,36 @@
+From 5358d4e20801ffbb1c0834eab36c003049d4055f Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Sun, 16 Aug 2026 22:27:28 +0200
+Subject: [PATCH] xtensa: disable SSP when needed
+
+-fno-stack-protector must be passed to avoid linking errors related to
+undefined references to '__stack_chk_guard' and '__stack_chk_fail' if
+toolchain enforces -fstack-protector.
+
+Fixes:
+https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/15876432953
+
+Upstream: Submitted to Max Filippov via email for initial review.
+
+Cc: Max Filippov <jcmvbkbc@gmail.com>
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ arch/xtensa/boot/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/xtensa/boot/Makefile b/arch/xtensa/boot/Makefile
+index d8b0fadf429a9..dfb758cdb2756 100644
+--- a/arch/xtensa/boot/Makefile
++++ b/arch/xtensa/boot/Makefile
+@@ -9,7 +9,7 @@
+ 
+ 
+ # KBUILD_CFLAGS used when building rest of boot (takes effect recursively)
+-KBUILD_CFLAGS	+= -fno-builtin
++KBUILD_CFLAGS	+= -fno-builtin -fno-stack-protector
+ 
+ subdir-y	:= lib
+ targets		+= vmlinux.bin vmlinux.bin.gz
+-- 
+2.55.0
+
diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
index d2d6c92faf..a84395a344 100644
--- a/configs/qemu_xtensa_lx60_defconfig
+++ b/configs/qemu_xtensa_lx60_defconfig
@@ -2,7 +2,7 @@ BR2_xtensa=y
 BR2_XTENSA_CUSTOM=y
 BR2_XTENSA_OVERLAY_FILE="https://github.com/jcmvbkbc/xtensa-toolchain-build/raw/95291b7c39e6f790d0b2f062c945a630290f2c81/overlays/xtensa_dc233c.tar.gz"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
-BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
+BR2_GLOBAL_PATCH_DIR="board/qemu/patches board/qemu/xtensa-lx60/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_SYSTEM_DHCP="eth0"
diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_xtensa_lx60_nommu_defconfig
index 89b73ee1e6..a937112a9e 100644
--- a/configs/qemu_xtensa_lx60_nommu_defconfig
+++ b/configs/qemu_xtensa_lx60_nommu_defconfig
@@ -3,7 +3,7 @@ BR2_XTENSA_CUSTOM=y
 BR2_XTENSA_OVERLAY_FILE="https://github.com/jcmvbkbc/xtensa-toolchain-build/raw/95291b7c39e6f790d0b2f062c945a630290f2c81/overlays/xtensa_dc233c.tar.gz"
 # BR2_XTENSA_USE_MMU is not set
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
-BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
+BR2_GLOBAL_PATCH_DIR="board/qemu/patches board/qemu/xtensa-lx60/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_SYSTEM_DHCP="eth0"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
