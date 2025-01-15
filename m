Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89CF9C02185
	for <buildroot@archiver.kernel.org>; Wed, 15 Jan 2025 20:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7113641E5B;
	Wed, 15 Jan 2025 20:35:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w1cimhe8Ybz7; Wed, 15 Jan 2025 20:35:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B01E41E72
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B01E41E72;
	Wed, 15 Jan 2025 20:35:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D236B89
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 20:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F0FE6F712
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 20:35:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oVwjjV7SCLjy for <buildroot@buildroot.org>;
 Wed, 15 Jan 2025 20:35:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 800686F716
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 800686F716
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 20:35:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7D75C83B09; Wed, 15 Jan 2025 20:35:30 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 15 Jan 2025 21:30:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8fe1935fcc830eb007109e0bdbcafddc05c85280
X-Git-Newrev: 3cc2fef0d2bb77b677e3c55643085bffc583db49
X-Patchwork-Hint: ignore
Message-Id: <20250115203530.7D75C83B09@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch: disable nios2
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

commit: https://git.buildroot.net/buildroot/commit/?id=3cc2fef0d2bb77b677e3c55643085bffc583db49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The nios2 architecture was deprecated in gcc-14 and has been removed
in the upcoming gcc-15 [1][2].

Our last and only nios2 defconfig "qemu_nios2_10m50_defconfig" was
removed in 2024.11 due to nios2 removal from Qemu 9.1.0 [3].

This patch only definitively hides the symbol. When all references
to it are removed (to come in followup patches), we'll eventually
remove the symbol altogether.

[1] https://sourceware.org/pipermail/binutils/2024-April/133675.html
[2] https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=e876acab6cdd84bb2b32c98fc69fb0ba29c81153
[3] f96b4c176f6e9d6c4374a0d322de672bf44c35bf

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .defconfig     | 1 -
 arch/Config.in | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/.defconfig b/.defconfig
index 7ab0c3fbf0..d25c62e104 100644
--- a/.defconfig
+++ b/.defconfig
@@ -12,7 +12,6 @@ BR2_i386=y
 # BR2_m68k is not set
 # BR2_mips is not set
 # BR2_mipsel is not set
-# BR2_nios2 is not set
 # BR2_powerpc is not set
 # BR2_sh is not set
 # BR2_sparc is not set
diff --git a/arch/Config.in b/arch/Config.in
index 7da2dc69e4..6254cb6467 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -145,6 +145,7 @@ config BR2_mips64el
 
 config BR2_nios2
 	bool "Nios II"
+	depends on BR2_BROKEN
 	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
 	select BR2_USE_MMU
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
