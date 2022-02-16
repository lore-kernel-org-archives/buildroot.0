Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9419BC433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 20:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4170960BEA;
	Wed, 16 Feb 2022 20:48:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PmcYukEv3S9l; Wed, 16 Feb 2022 20:48:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB12A60B4B;
	Wed, 16 Feb 2022 20:48:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A3F7A1BF9BA
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 20:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DE31403EC
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 20:48:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mg7xVtcUzJai for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 20:48:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F14DC4034F
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 20:48:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4226E835CE; Wed, 16 Feb 2022 20:40:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 16 Feb 2022 21:34:57 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 749175affa7916e523f524c39b20aa6314e05afe
X-Git-Newrev: 09b168c7edfe0fe51604d5e7d8bfd5bf9f1c3816
X-Patchwork-Hint: ignore
Message-Id: <20220216204039.4226E835CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] linux: clarify
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

commit: https://git.buildroot.net/buildroot/commit/?id=09b168c7edfe0fe51604d5e7d8bfd5bf9f1c3816
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
index e7addf1810..3f796b252b 100644
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
