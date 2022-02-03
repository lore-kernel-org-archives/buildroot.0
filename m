Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DB6C433EF
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 20:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B58784089A;
	Thu,  3 Feb 2022 20:46:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xdzxNjyNFvgX; Thu,  3 Feb 2022 20:46:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 194A5408D2;
	Thu,  3 Feb 2022 20:46:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7DA5C1BF38D
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 20:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88F4081D73
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 20:45:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fneq3Cb1CXao for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 20:45:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D402A82948
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 20:45:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 94DC382AE4; Thu,  3 Feb 2022 20:38:00 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 3 Feb 2022 21:44:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: de1a3737879eef4a9dd283269a896e50a1badabf
X-Git-Newrev: 8ef413b59a870b6a593eb9f1a71caef30c1848c3
X-Patchwork-Hint: ignore
Message-Id: <20220203203800.94DC382AE4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: clarify
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

commit: https://git.buildroot.net/buildroot/commit/?id=8ef413b59a870b6a593eb9f1a71caef30c1848c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This clarifies that custom DTSI files can be passed too,
and that the files are compiled after being copied to the
Linux kernel source tree.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 linux/Config.in | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 582f37ba7c..13d99bd09d 100644
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
