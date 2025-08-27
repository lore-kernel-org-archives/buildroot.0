Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB589CAC588
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 14:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB184807D5;
	Mon,  8 Sep 2025 14:18:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PGL_NMGWEVFn; Mon,  8 Sep 2025 14:18:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECA1B807C0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECA1B807C0;
	Mon,  8 Sep 2025 14:18:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EB5E234
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5536480540
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3KAI6dl9Wg5Z for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 14:16:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB2E680511
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB2E680511
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AAFE9818B3; Mon,  8 Sep 2025 14:16:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Aug 2025 22:41:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fdc002ee38e58ef4abfbd1615217a5977f9a0077
X-Git-Newrev: 9f9ec04c73f0b59eff324c1f23ac036dada3a185
X-Patchwork-Hint: ignore
Message-Id: <20250908141625.AAFE9818B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/stm32mp1*_dk*: switch to external
 Bootlin stable toolchain
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

commit: https://git.buildroot.net/buildroot/commit/?id=9f9ec04c73f0b59eff324c1f23ac036dada3a185
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As Arnout stated[1], defconfigs should use a Bootlin toolchain (stable, glibc).

[1] https://lore.kernel.org/buildroot/e9576c4f-243b-4a89-a74d-3fee591100a8@mind.be/

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/stm32mp135f_dk_defconfig  | 4 +++-
 configs/stm32mp157a_dk1_defconfig | 4 +++-
 configs/stm32mp157c_dk2_defconfig | 4 +++-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/configs/stm32mp135f_dk_defconfig b/configs/stm32mp135f_dk_defconfig
index eb20466709..53fa594a47 100644
--- a/configs/stm32mp135f_dk_defconfig
+++ b/configs/stm32mp135f_dk_defconfig
@@ -1,6 +1,8 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/common/stm32mp1xx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
index a42e90bbeb..50baadfdc9 100644
--- a/configs/stm32mp157a_dk1_defconfig
+++ b/configs/stm32mp157a_dk1_defconfig
@@ -1,6 +1,8 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/common/stm32mp1xx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157a-dk1/overlay/"
diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
index a149936303..3b6625d48d 100644
--- a/configs/stm32mp157c_dk2_defconfig
+++ b/configs/stm32mp157c_dk2_defconfig
@@ -1,6 +1,8 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/common/stm32mp1xx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157c-dk2/overlay/"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
