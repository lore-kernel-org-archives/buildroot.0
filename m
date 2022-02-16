Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9F1C433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 20:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D79B5409E7;
	Wed, 16 Feb 2022 20:48:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S7h8DNXjJgfI; Wed, 16 Feb 2022 20:48:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD87340164;
	Wed, 16 Feb 2022 20:48:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5F0F31BF425
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 20:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5AD9D61C31
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 20:48:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SUxaU7qaXCAW for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 20:48:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7EB460B6A
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 20:48:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 09893835E8; Wed, 16 Feb 2022 20:40:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 16 Feb 2022 21:33:42 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 32181572eba91a6a58fdfff0cf92df940be99b97
X-Git-Newrev: 73c8fbe2a84934778c869edac72a9d2f410ce737
X-Patchwork-Hint: ignore
Message-Id: <20220216204044.09893835E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] linux: clarify
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH description
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

commit: https://git.buildroot.net/buildroot/commit/?id=73c8fbe2a84934778c869edac72a9d2f410ce737
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

This clarifies that custom DTSI files can be passed too,
and that the files are compiled after being copied to the
Linux kernel source tree.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 8ef413b59a870b6a593eb9f1a71caef30c1848c3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 264cbde98e..0d7464d1da 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -411,9 +411,10 @@ config BR2_LINUX_KERNEL_INTREE_DTS_NAME
 config BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
 	string "Out-of-tree Device Tree Source file paths"
 	help
-	  Path to the out-of-tree device tree source files.
-	  You can provide a list of dts paths to copy and
-	  build, separated by spaces.
+	  Paths to out-of-tree Device Tree Source (.dts) and Device Tree
+	  Source Include (.dtsi) files, separated by spaces. These files
+	  will be copied to the kernel sources and the .dts files will
+	  be compiled from there.
 
 config BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME
 	bool "Keep the directory name of the Device Tree"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
