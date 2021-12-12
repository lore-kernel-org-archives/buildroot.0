Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF2CFC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 12:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A013660E7B;
	Sun, 12 Dec 2021 12:25:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Buvz3ca1oy0t; Sun, 12 Dec 2021 12:25:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D701E60E7A;
	Sun, 12 Dec 2021 12:25:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A98351BF373
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75F3340532
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:22:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L_FiTs7QcEJ1 for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 12:22:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DAC2440537
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 12:22:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2B44E82B71; Sun, 12 Dec 2021 12:17:15 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 13:21:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f0dd82794e539709421baa26d4ed843ed9075242
X-Git-Newrev: 0adbd0c84b8ea3b7337740d38eb2b9f501216247
X-Patchwork-Hint: ignore
Message-Id: <20211212121715.2B44E82B71@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: bump CIP kernel to version
 5.10.83-cip1
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

commit: https://git.buildroot.net/buildroot/commit/?id=0adbd0c84b8ea3b7337740d38eb2b9f501216247
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps Linux CIP to version 5.10.83-cip1.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 linux/Config.in  | 6 +++---
 linux/linux.hash | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index db0c58129f..e21d1681f7 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -31,7 +31,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (5.15)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (4.19.198-cip54)"
+	bool "Latest CIP SLTS version (5.10.83-cip1)"
 	help
 	  CIP launched in the spring of 2016 to address the needs of
 	  organizations in industries such as power generation and
@@ -44,7 +44,7 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	  implementation of software building blocks that meet
 	  these requirements.
 
-	  The CIP community plans to maintain 4.19 for security and
+	  The CIP community plans to maintain 5.10 for security and
 	  bug fixes for more than 10 years.
 
 	  https://www.cip-project.org
@@ -126,7 +126,7 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "5.15.6" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "4.19.198-cip54" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "5.10.83-cip1" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.198-cip54-rt21" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 9062b72a0e..6d3b31c5a4 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -9,7 +9,7 @@ sha256  b55d77774ed631f57f736bcdab021f68167455c9daede7e9e4161b4d564d8b53  linux-
 sha256  9784204f95cfc7de1c933088e6f9364e99a29988ae4e6b9353677637eb171aa0  linux-4.14.256.tar.xz
 sha256  8f4ecd71fbcdd733c2849e2e5afe59d351c463c9a699bdbf428d88fa911009db  linux-4.19.219.tar.xz
 # Locally computed
-sha256  e6fc0a999a180ad272b08ff71cbc67f2d3fdc6773d4a8069aefb8781b8e07821  linux-cip-4.19.198-cip54.tar.gz
+sha256  5738dcf020ff75fb6e43d6d1a8b572d2f1fe58c08b31f822eb42fb91d6bdc98f  linux-cip-5.10.83-cip1.tar.gz
 sha256  449668d678e458ddaf30f944b7ca7f5ce6ea6664f57d43ea4eb90b176e03b9cb  linux-cip-4.19.198-cip54-rt21.tar.gz
 
 # Licenses hashes
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
