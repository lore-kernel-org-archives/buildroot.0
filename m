Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7781C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 811B64014E;
	Sun, 12 Dec 2021 14:23:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wCRZQFRozPU6; Sun, 12 Dec 2021 14:23:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8319740531;
	Sun, 12 Dec 2021 14:23:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AC15A1BF33B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 836B960A9B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:20:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NMHNOTQPAIhH for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:20:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44B9860D6A
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:20:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6CA5082DFB; Sun, 12 Dec 2021 14:15:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 14:56:22 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 0d280a461dc07f37820871c0dcad8f3bf5ff815f
X-Git-Newrev: 7bc5438ff356a8ec0fc271eee8cb1c6bfa8b0848
X-Patchwork-Hint: ignore
Message-Id: <20211212141522.6CA5082DFB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.{4, 10, 15}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=7bc5438ff356a8ec0fc271eee8cb1c6bfa8b0848
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

5.14.x is EOL, so no more updates for that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 64cb922db7db08d180f59010e59f3adef5ae2e0b)
[Peter: drop 5.15.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 3eae93f8bf..a60ff7d1fa 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -125,7 +125,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.10.81" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.10.83" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.198-cip54" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.198-cip54-rt21" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index db2a31be60..8246c7dc09 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,11 +1,11 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  a2e1686132c4598c0adfdf52acbf1ab4bb327b2398badef346a0eff849da5adb  linux-5.10.81.tar.xz
-sha256  3149c6b52a3079218a60bd369a80d18275b574d84908ffee32a0a8f9ddf939a7  linux-5.4.161.tar.xz
+sha256  ef259a43f33ddb56001283f4f4e50af29b8a48fa066aed7371a90ebf38c29b70  linux-5.10.83.tar.xz
+sha256  6246fe1776d83039d71f74eb839f38ebdec23e1b37a7bf76f3bce13cbf0290be  linux-5.4.163.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  2729aa644e174418764eaf60f9f1ee1bd6505290a327c2f24385b4a02cfab96c  linux-4.4.292.tar.xz
-sha256  cdde5aa24633fcac929b15f2c2fe0c43053dc7439ab3d9c7223d82fdd8ea40db  linux-4.9.290.tar.xz
-sha256  f00b8001424e3f185990f6ee24a7a393b7f0996f739cd4ee6a79532b23e6b2d7  linux-4.14.255.tar.xz
-sha256  8551110cc7184b1402a21b42e498088c5b0bb824a658c5fab173c12d9904a004  linux-4.19.217.tar.xz
+sha256  6d2f83619493e656276dbf22afcdb80f42320e697570419380773bb4916130fd  linux-4.4.293.tar.xz
+sha256  b55d77774ed631f57f736bcdab021f68167455c9daede7e9e4161b4d564d8b53  linux-4.9.291.tar.xz
+sha256  9784204f95cfc7de1c933088e6f9364e99a29988ae4e6b9353677637eb171aa0  linux-4.14.256.tar.xz
+sha256  8f4ecd71fbcdd733c2849e2e5afe59d351c463c9a699bdbf428d88fa911009db  linux-4.19.219.tar.xz
 # Locally computed
 sha256  e6fc0a999a180ad272b08ff71cbc67f2d3fdc6773d4a8069aefb8781b8e07821  linux-cip-4.19.198-cip54.tar.gz
 sha256  449668d678e458ddaf30f944b7ca7f5ce6ea6664f57d43ea4eb90b176e03b9cb  linux-cip-4.19.198-cip54-rt21.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a385665632..740ed6c09d 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -346,12 +346,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.292"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.290"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.255"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.217"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.161"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.81"	if BR2_KERNEL_HEADERS_5_10
+	default "4.4.293"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.291"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.256"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.219"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.163"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.83"	if BR2_KERNEL_HEADERS_5_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
