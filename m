Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F088C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 12:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B46C82EBA;
	Sun, 12 Dec 2021 12:25:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YWMbMsWPol_z; Sun, 12 Dec 2021 12:25:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BE2182D57;
	Sun, 12 Dec 2021 12:25:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0BE2E1BF373
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC9914216D
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:22:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qy44o9hT4GeM for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 12:22:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF5CB429A1
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 12:22:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3540582B66; Sun, 12 Dec 2021 12:17:15 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 13:21:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0adbd0c84b8ea3b7337740d38eb2b9f501216247
X-Git-Newrev: b5778d7b76c098010a4abc339938f2694e8cf57f
X-Patchwork-Hint: ignore
Message-Id: <20211212121715.3540582B66@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: bump CIP RT kernel to version
 5.10.83-cip1-rt1
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

commit: https://git.buildroot.net/buildroot/commit/?id=b5778d7b76c098010a4abc339938f2694e8cf57f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps Linux CIP RT kernel to version 5.10.83-cip1-rt1.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 linux/Config.in  | 6 +++---
 linux/linux.hash | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index e21d1681f7..6c30100921 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -50,12 +50,12 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	  https://www.cip-project.org
 
 config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
-	bool "Latest CIP RT SLTS version (4.19.198-cip54-rt21)"
+	bool "Latest CIP RT SLTS version (5.10.83-cip1-rt1)"
 	help
 	  Same as the CIP version, but this is the PREEMPT_RT realtime
 	  variant.
 
-	  The CIP community plans to maintain 4.19 for security and
+	  The CIP community plans to maintain 5.10 for security and
 	  bug fixes for more than 10 years.
 
 	  https://www.cip-project.org
@@ -127,7 +127,7 @@ config BR2_LINUX_KERNEL_VERSION
 	string
 	default "5.15.6" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.83-cip1" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	default "4.19.198-cip54-rt21" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
+	default "5.10.83-cip1-rt1" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
diff --git a/linux/linux.hash b/linux/linux.hash
index 6d3b31c5a4..2f144427f4 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -10,7 +10,7 @@ sha256  9784204f95cfc7de1c933088e6f9364e99a29988ae4e6b9353677637eb171aa0  linux-
 sha256  8f4ecd71fbcdd733c2849e2e5afe59d351c463c9a699bdbf428d88fa911009db  linux-4.19.219.tar.xz
 # Locally computed
 sha256  5738dcf020ff75fb6e43d6d1a8b572d2f1fe58c08b31f822eb42fb91d6bdc98f  linux-cip-5.10.83-cip1.tar.gz
-sha256  449668d678e458ddaf30f944b7ca7f5ce6ea6664f57d43ea4eb90b176e03b9cb  linux-cip-4.19.198-cip54-rt21.tar.gz
+sha256  2395443c5f960e5c6343f70480209d2530da27aa6f0299412e0f4b7128fccb7c  linux-cip-5.10.83-cip1-rt1.tar.gz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
