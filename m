Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA68CA0FED
	for <buildroot@archiver.kernel.org>; Wed, 27 Aug 2025 20:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 133F060A7F;
	Wed, 27 Aug 2025 20:58:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pcT7ok1cE_dk; Wed, 27 Aug 2025 20:58:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5518960BDB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5518960BDB;
	Wed, 27 Aug 2025 20:58:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EE27117D
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 20:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEE648258A
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 20:58:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id arh8f2XVY6Fn for <buildroot@buildroot.org>;
 Wed, 27 Aug 2025 20:58:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 193F181173
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 193F181173
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 20:58:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 07A3E87BDA; Wed, 27 Aug 2025 20:58:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Aug 2025 22:41:01 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: fdc002ee38e58ef4abfbd1615217a5977f9a0077
X-Git-Newrev: 9f9ec04c73f0b59eff324c1f23ac036dada3a185
X-Patchwork-Hint: ignore
Message-Id: <20250827205824.07A3E87BDA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/stm32mp1*_dk*: switch
 to external Bootlin stable toolchain
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
