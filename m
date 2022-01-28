Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715DEC433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 10:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 162C384D29;
	Fri, 28 Jan 2022 10:28:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xX425T00qr2p; Fri, 28 Jan 2022 10:28:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D0D884D23;
	Fri, 28 Jan 2022 10:28:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A55F11BF380
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 10:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90E0741687
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 10:28:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H9V4f3HefInQ for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 10:28:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8E3F40246
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 10:28:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EE47582858; Fri, 28 Jan 2022 10:21:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 11:27:43 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 35baab9abf3ffa44d2318eb5d2063cfd5547b88d
X-Git-Newrev: bf066e053c6f0e84294dae7f5cf908064f6e7623
X-Patchwork-Hint: ignore
Message-Id: <20220128102110.EE47582858@busybox.osuosl.org>
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

commit: https://git.buildroot.net/buildroot/commit/?id=bf066e053c6f0e84294dae7f5cf908064f6e7623
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit db14f7d71505aad2ae1e4aefc5c0ece97f5eacec)
[Peter: drop 5.15.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index a60ff7d1fa..e7addf1810 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -125,7 +125,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.10.83" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.10.90" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.198-cip54" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.198-cip54-rt21" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 8246c7dc09..e22ac924bc 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,11 +1,11 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
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
index 740ed6c09d..fb9867525c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -346,12 +346,12 @@ endchoice
 
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
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
