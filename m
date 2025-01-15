Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB0FC282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B2E785000;
	Fri, 28 Feb 2025 16:59:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tuuooZ0cL7YC; Fri, 28 Feb 2025 16:59:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8264784FFB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8264784FFB;
	Fri, 28 Feb 2025 16:59:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 02D6C68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A34442EEA
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KomQ37CFBh-e for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD8D142E0B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD8D142E0B
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD11B8118C; Fri, 28 Feb 2025 16:30:11 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 15 Jan 2025 21:30:31 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8fe1935fcc830eb007109e0bdbcafddc05c85280
X-Git-Newrev: 3cc2fef0d2bb77b677e3c55643085bffc583db49
X-Patchwork-Hint: ignore
Message-Id: <20250228163011.BD11B8118C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] arch: disable nios2
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
