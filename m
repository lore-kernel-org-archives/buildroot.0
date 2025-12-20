Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86347E668BC
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 18:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 318DB40906;
	Sat, 20 Dec 2025 18:57:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wLsyawM8EGni; Sat, 20 Dec 2025 18:57:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B07A40908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766257034;
	bh=2aAM8m21bnXk50wUjnz+SF+x1qtNf1actqSBfkCVcjM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fShJXIkQEjVoIh30iuOxw+0/rKhmMuDOKsyQuigfYBjJEyIXit69imrzIFXPJ1nIh
	 +2ZpBALNu2jifWICv+utGS+qH86qj6j4eEu2P9GadE7WmraIQe8qeqme5w8tQv3QVL
	 2jlJlFSxXoo+J5v9Jyximci/6jmNBYmpbBSMH27U63+W3MW5kSFmQsNeG4WJuUk+5+
	 3DkttdAal2LJFO2w36r0/zm7v42gCV0HKMNwbYDIpJtfcE4krYtE0xlclQ3nztngE5
	 C+OqsSCZl6gHhjYM/bh5I1S8ulW2gaQqSgwnEuWth9ElACfsHOS9PhTDcI6nP2SM/B
	 xNIIk/+TCkieA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B07A40908;
	Sat, 20 Dec 2025 18:57:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0236223D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 18:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E85EA81E7E
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 18:57:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y2mFi6FXs7PZ for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 18:57:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A3C981E64
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A3C981E64
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 18:57:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE2EB87136; Sat, 20 Dec 2025 18:57:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 19:28:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e4bd44dbdda406a2e189e6342b5157456ffb4ab9
X-Git-Newrev: a8b9c6f9f512cc3ef18956b53a99b93ba74a9e8f
X-Patchwork-Hint: ignore
Message-Id: <20251220185711.EE2EB87136@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/acmesystems_acqua_a5_*: switch to
 Bootlin glibc stable toolchain
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

commit: https://git.buildroot.net/buildroot/commit/?id=a8b9c6f9f512cc3ef18956b53a99b93ba74a9e8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the Acmesystem's Acqua defconfigs to the Bootlin glibc stable
external toolchain, as per[1].

[1]: https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/acmesystems_acqua_a5_256mb_defconfig | 3 ++-
 configs/acmesystems_acqua_a5_512mb_defconfig | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
index 9e6d35a859..f693ad9baf 100644
--- a/configs/acmesystems_acqua_a5_256mb_defconfig
+++ b/configs/acmesystems_acqua_a5_256mb_defconfig
@@ -2,7 +2,8 @@ BR2_arm=y
 BR2_cortex_a5=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/acmesystems/acqua-a5/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
index 8e6d9774da..3e243cd45e 100644
--- a/configs/acmesystems_acqua_a5_512mb_defconfig
+++ b/configs/acmesystems_acqua_a5_512mb_defconfig
@@ -2,7 +2,8 @@ BR2_arm=y
 BR2_cortex_a5=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/acmesystems/acqua-a5/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
