Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09E6C433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 10:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58AA0404A0;
	Fri, 28 Jan 2022 10:26:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uMzWaVrRqg-T; Fri, 28 Jan 2022 10:26:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26593403E7;
	Fri, 28 Jan 2022 10:26:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 03E0F1BF380
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 10:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5B3261040
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 10:26:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9sN0DQJZgbO7 for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 10:26:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60B8760F31
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 10:26:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8A98B82858; Fri, 28 Jan 2022 10:19:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 11:25:27 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 08b34bc3920106a78c6b0cdfb17ceb5b86621aec
X-Git-Newrev: fa7f960200be32f6443f4684e721dd1142375345
X-Patchwork-Hint: ignore
Message-Id: <20220128101908.8A98B82858@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] {linux,
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

commit: https://git.buildroot.net/buildroot/commit/?id=fa7f960200be32f6443f4684e721dd1142375345
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit db14f7d71505aad2ae1e4aefc5c0ece97f5eacec)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 14 +++++++-------
 package/linux-headers/Config.in.host | 14 +++++++-------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index db0c58129f..264cbde98e 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -125,7 +125,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.15.6" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.15.13" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.198-cip54" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.198-cip54-rt21" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 9062b72a0e..116d4af1d6 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  b3e9ba06a299a3e2ead4a15753bc46a3e0c90d3b92ffeed1034ccc9f13a717f0  linux-5.15.6.tar.xz
+sha256  0a131b6a2f9f5ee37ecb332b5459ab35a87f0bf2d4ec923988d0663646cf156a  linux-5.15.13.tar.xz
 sha256  f41a259cb2002dd2e3286524b2bb4e803f4f982992d092706ecea613584023b3  linux-5.14.21.tar.xz
-sha256  ef259a43f33ddb56001283f4f4e50af29b8a48fa066aed7371a90ebf38c29b70  linux-5.10.83.tar.xz
-sha256  6246fe1776d83039d71f74eb839f38ebdec23e1b37a7bf76f3bce13cbf0290be  linux-5.4.163.tar.xz
+sha256  945e4264c014a3d9dfc0a4639309dd1ec2fb545416556421f931b95da78c2725  linux-5.10.90.tar.xz
+sha256  b09f74e0cf5fc7cf5de6aa932fe654c962cb10118bdbbdddb397022c6e6d382c  linux-5.4.170.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  6d2f83619493e656276dbf22afcdb80f42320e697570419380773bb4916130fd  linux-4.4.293.tar.xz
-sha256  b55d77774ed631f57f736bcdab021f68167455c9daede7e9e4161b4d564d8b53  linux-4.9.291.tar.xz
-sha256  9784204f95cfc7de1c933088e6f9364e99a29988ae4e6b9353677637eb171aa0  linux-4.14.256.tar.xz
-sha256  8f4ecd71fbcdd733c2849e2e5afe59d351c463c9a699bdbf428d88fa911009db  linux-4.19.219.tar.xz
+sha256  86c9ed59b120fad14d207470446086ac46099cd7bb9e58682e368e721164a6e0  linux-4.4.298.tar.xz
+sha256  fd4bdbc8be3472d6324fa0f5f57a17f5c3f509d5f5b4fa4f1a9797d982d0bca8  linux-4.9.296.tar.xz
+sha256  bffaaa4c93ab4ed1de61f804c26c92b82dd80f92793e20194b62497d7b8b4723  linux-4.14.261.tar.xz
+sha256  01ccfc3413c3bb305653ceb0aa528aba0caa61b326e43709bf1f8b624f211031  linux-4.19.224.tar.xz
 # Locally computed
 sha256  e6fc0a999a180ad272b08ff71cbc67f2d3fdc6773d4a8069aefb8781b8e07821  linux-cip-4.19.198-cip54.tar.gz
 sha256  449668d678e458ddaf30f944b7ca7f5ce6ea6664f57d43ea4eb90b176e03b9cb  linux-cip-4.19.198-cip54-rt21.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 9bc3c873c5..89307fdb99 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -374,14 +374,14 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.293"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.291"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.256"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.219"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.163"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.83"	if BR2_KERNEL_HEADERS_5_10
+	default "4.4.298"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.296"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.261"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.224"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.170"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.90"	if BR2_KERNEL_HEADERS_5_10
 	default "5.14.21"	if BR2_KERNEL_HEADERS_5_14
-	default "5.15.6"	if BR2_KERNEL_HEADERS_5_15
+	default "5.15.13"	if BR2_KERNEL_HEADERS_5_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
