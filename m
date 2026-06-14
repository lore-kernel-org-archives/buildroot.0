Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 967B4CD98D6
	for <buildroot@archiver.kernel.org>; Sun, 14 Jun 2026 10:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B35A4123C;
	Sun, 14 Jun 2026 10:13:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sUhmHp2wavMR; Sun, 14 Jun 2026 10:13:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21EEF4124E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781432013;
	bh=4NJ/s4kWYm2fqE+KNsmQaPFQob0JF2xUGLmgLuO9jLs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YNMrqWCOf6Q+dORz74zzWNzTy7xyuIRkNmvIHTbbIF20eEF3UevImGyL76NXPXGqc
	 GBRDt/FHVdAfPI9F3ejQ0UPbZChtguJuWILWvpKBvPPGQwrHnXQ0PDrKtSjgf+hDlQ
	 2E4DBo/emlI0xZp3j04M/buGpZgYq+JWkWAO5z24cE+w+0LzBqFfm720Wz6iUNYV54
	 7AN7YD7/AlIPhrBChuer6YgDhMuqsgKa2fT6xlgQtxf1x0YQCDUbpJGWUPNEemHPcS
	 zM08Tm36p4FihsC4Wv99FYzPZNP4bk7CKkI7P41g/kDJYAjt/Eb5Z4KHFj0F24KC0D
	 QepM0hIPVHhOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21EEF4124E;
	Sun, 14 Jun 2026 10:13:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D92732EF
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 10:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD63741176
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 10:13:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EIPSrwVGC_-f for <buildroot@buildroot.org>;
 Sun, 14 Jun 2026 10:13:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08B7C41177
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08B7C41177
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 10:13:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CFD5388258; Sun, 14 Jun 2026 10:13:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 14 Jun 2026 12:08:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dbe0896826e7394da71d653c6987d1a119d85336
X-Git-Newrev: 1b6450e41f856d0c1279d7c1bf02baae42417524
X-Patchwork-Hint: ignore
Message-Id: <20260614101305.CFD5388258@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/qemu_aarch64_{ebbr,
 sbsa}_defconfig: switch to Bootlin stable toolchain
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1b6450e41f856d0c1279d7c1bf02baae42417524
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the qemu aarch64 ebbr/sbsa configurations to use the Bootlin
glibc stable prebuilt external toolchain, as recommended in the
Buildroot meeting report from ELCE 2024:
https://elinux.org/Buildroot:DeveloperDaysELCE2024

This will reduce the number of Gilab-CI minutes by ~20 minutes.

https://gitlab.com/buildroot.org/buildroot/-/jobs/14728913979 (qemu_aarch64_ebbr_defconfig)
https://gitlab.com/buildroot.org/buildroot/-/jobs/14728913980 (qemu_aarch64_sbsa_defconfig)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/qemu_aarch64_ebbr_defconfig | 4 +++-
 configs/qemu_aarch64_sbsa_defconfig | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/configs/qemu_aarch64_ebbr_defconfig b/configs/qemu_aarch64_ebbr_defconfig
index 15c68d2035..8d20813044 100644
--- a/configs/qemu_aarch64_ebbr_defconfig
+++ b/configs/qemu_aarch64_ebbr_defconfig
@@ -1,5 +1,7 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/aarch64-ebbr/post-image.sh support/scripts/genimage.sh"
diff --git a/configs/qemu_aarch64_sbsa_defconfig b/configs/qemu_aarch64_sbsa_defconfig
index 57bc899e03..56c160c85a 100644
--- a/configs/qemu_aarch64_sbsa_defconfig
+++ b/configs/qemu_aarch64_sbsa_defconfig
@@ -1,6 +1,8 @@
 BR2_aarch64=y
 BR2_neoverse_n2=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
