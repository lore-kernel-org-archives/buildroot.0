Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F1CC27C77
	for <buildroot@archiver.kernel.org>; Fri, 14 Jun 2024 16:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A800F415D3;
	Fri, 14 Jun 2024 16:49:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5E4x9HXzOcXg; Fri, 14 Jun 2024 16:49:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A175415CE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A175415CE;
	Fri, 14 Jun 2024 16:49:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C2EE21BF35E
 for <buildroot@lists.busybox.net>; Fri, 14 Jun 2024 16:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AED5980FAA
 for <buildroot@lists.busybox.net>; Fri, 14 Jun 2024 16:49:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hSuZaaVw9FFg for <buildroot@lists.busybox.net>;
 Fri, 14 Jun 2024 16:49:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA82C80FA2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA82C80FA2
 for <buildroot@buildroot.org>; Fri, 14 Jun 2024 16:49:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6175287F70; Fri, 14 Jun 2024 16:49:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 14 Jun 2024 18:48:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 876d24578c37acfd514999f45bb964283f3ddc6a
X-Git-Newrev: a4d38ef61cb1846871d15f49bdffd70a5ca05a2c
X-Patchwork-Hint: ignore
Message-Id: <20240614164904.6175287F70@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs: stm32f429_disco_xip: use same
 headers as kernel
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

commit: https://git.buildroot.net/buildroot/commit/?id=a4d38ef61cb1846871d15f49bdffd70a5ca05a2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of downloading a different version of the kernel for the headers as
for the runtime kernel itself, use the same one.  By doing so, we now need
to add the hash file for linux-headers.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../stm32f429-disco/patches/linux-headers/linux-headers.hash            | 1 +
 configs/stm32f429_disco_xip_defconfig                                   | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/board/stmicroelectronics/stm32f429-disco/patches/linux-headers/linux-headers.hash b/board/stmicroelectronics/stm32f429-disco/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/stmicroelectronics/stm32f429-disco/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/configs/stm32f429_disco_xip_defconfig b/configs/stm32f429_disco_xip_defconfig
index e3d3cc38ff..11ec6c4bf7 100644
--- a/configs/stm32f429_disco_xip_defconfig
+++ b/configs/stm32f429_disco_xip_defconfig
@@ -1,6 +1,6 @@
 BR2_arm=y
 BR2_cortex_m4=y
-BR2_KERNEL_HEADERS_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 # BR2_UCLIBC_INSTALL_UTILS is not set
 BR2_ENABLE_LTO=y
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f429-disco/patches"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
