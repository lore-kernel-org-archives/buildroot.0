Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35F3C43217
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 21:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F258405E0;
	Fri, 13 May 2022 21:48:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3kArKclR2sBW; Fri, 13 May 2022 21:48:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E025D40207;
	Fri, 13 May 2022 21:48:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 05CEC1C1189
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 21:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E87DE40303
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 21:47:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XWL8-vR2sVxU for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 21:47:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E887140300
 for <buildroot@buildroot.org>; Fri, 13 May 2022 21:47:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id AEA3B85E29; Fri, 13 May 2022 21:36:54 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 13 May 2022 23:47:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 334924192b6bf17c91e23264b32702f6285fb165
X-Git-Newrev: d1f7af938cb51139b43a6ca640dc16eb04b46d98
X-Patchwork-Hint: ignore
Message-Id: <20220513213654.AEA3B85E29@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: default to 5.17.x
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

commit: https://git.buildroot.net/buildroot/commit/?id=d1f7af938cb51139b43a6ca640dc16eb04b46d98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

5.15.x is getting quite old, so default to 5.17.x instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 linux/Config.in                      | 6 +++---
 package/linux-headers/Config.in.host | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 24655a2962..fd3605a559 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -28,8 +28,8 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (5.15)"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15 if BR2_KERNEL_HEADERS_AS_KERNEL
+	bool "Latest version (5.17)"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_17 if BR2_KERNEL_HEADERS_AS_KERNEL
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (5.10.104-cip3)"
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.15.39" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.17.7" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.104-cip3" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.104-cip3-rt3" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index afe849772a..859f772624 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_LINUX_HEADERS
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_5_15
+	default BR2_KERNEL_HEADERS_5_17
 	help
 	  Select the kernel version to get headers from.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
