Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D1DD59F73
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 21:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD0C0812CC;
	Wed,  6 Nov 2024 21:13:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4PydqJVuBMp8; Wed,  6 Nov 2024 21:13:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E959E812E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E959E812E8;
	Wed,  6 Nov 2024 21:13:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 433EF3B
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C0B840260
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:13:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OLZzaJGTC773 for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 21:13:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E17C540281
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E17C540281
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:13:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA40585E55; Wed,  6 Nov 2024 21:13:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Nov 2024 21:54:22 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: b0cfdd972afee887246acf44d6aef34007bc6938
X-Git-Newrev: 6822a658e68de3603f249c7ebe86a6730d3be90e
X-Patchwork-Hint: ignore
Message-Id: <20241106211315.DA40585E55@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] {linux,
 linux-headers}: bump 6.{1, 6, 10}.x series
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=6822a658e68de3603f249c7ebe86a6730d3be90e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9a203208204cd9530337145fde6dcdf1e9b41b8f)
[Peter: drop 6.10.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index f1b2cb3752..93d2200cab 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.6.51" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.6.56" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 05a5eca070..7cc406183e 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  1c0c9a14650879c4913efdbac428ba31a540c3d987155ddf34d33e11eca008b3  linux-6.6.51.tar.xz
-sha256  9ebe34b4742f8c9104678f32a6bc20e91299ebac2ae607ff2ed137d928df8f6a  linux-6.1.110.tar.xz
+sha256  f74812f78e88992c416434cb107639e13a551dbaff36bb90d6346ab16ab71a95  linux-6.6.56.tar.xz
+sha256  8bd8de3562fb006653e550a934e66ed9f80b7576258a03e2caa2e3ce1c1f9f24  linux-6.1.112.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  b1751f18ece3df08d502dd87a9ab1a317dc0f9486355bf8ee62ba6af0b35da30  linux-5.15.167.tar.xz
 sha256  f6a19a64785965b9fcac0bcb6fd2412b45ca449495bb03592d46f9a50be51ca6  linux-5.10.226.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index b95774306f..d9614ff60a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -407,8 +407,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.284"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.226"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.167"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.110"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.51"	if BR2_KERNEL_HEADERS_6_6
+	default "6.1.112"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.56"	if BR2_KERNEL_HEADERS_6_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
