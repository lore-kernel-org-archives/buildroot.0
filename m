Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60461C27C53
	for <buildroot@archiver.kernel.org>; Sun, 16 Jun 2024 10:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28335405E3;
	Sun, 16 Jun 2024 10:32:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nlpSFyYWpiV2; Sun, 16 Jun 2024 10:32:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E94EC4062A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E94EC4062A;
	Sun, 16 Jun 2024 10:32:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 383A51BF31B
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 10:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24312403B7
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 10:32:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3pHZ-N_weX9X for <buildroot@lists.busybox.net>;
 Sun, 16 Jun 2024 10:32:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2F8C4015E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2F8C4015E
 for <buildroot@buildroot.org>; Sun, 16 Jun 2024 10:32:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DDC6386B19; Sun, 16 Jun 2024 10:32:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jun 2024 12:30:44 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 6a1f9b3c0c87814f9aa624c4271f1e33ec45f0af
X-Git-Newrev: 9b2c10bc06d37aca151e8443ccbc236184eec5b0
X-Patchwork-Hint: ignore
Message-Id: <20240616103248.DDC6386B19@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] configs:
 stm32f429_disco_xip: use same headers as kernel
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

commit: https://git.buildroot.net/buildroot/commit/?id=9b2c10bc06d37aca151e8443ccbc236184eec5b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Instead of downloading a different version of the kernel for the headers as
for the runtime kernel itself, use the same one.  By doing so, we now need
to add the hash file for linux-headers.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a4d38ef61cb1846871d15f49bdffd70a5ca05a2c)
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
