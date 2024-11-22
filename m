Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02490E6916C
	for <buildroot@archiver.kernel.org>; Fri, 22 Nov 2024 16:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8ACCA60665;
	Fri, 22 Nov 2024 16:07:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qZV4W6YXlpkN; Fri, 22 Nov 2024 16:07:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D08C606FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D08C606FA;
	Fri, 22 Nov 2024 16:07:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 84273E11
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 16:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71E6742B3B
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 16:07:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7zoTvR7LWkjS for <buildroot@buildroot.org>;
 Fri, 22 Nov 2024 16:07:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81E7642B8D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81E7642B8D
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 16:07:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 70238865AE; Fri, 22 Nov 2024 16:07:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 22 Nov 2024 16:53:08 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: f956d40c81a7fee80c42134a88c5b45d2dc6dac6
X-Git-Newrev: 687de602f5787e0cd42baa36d73f47f49cffac7d
X-Patchwork-Hint: ignore
Message-Id: <20241122160746.70238865AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] {linux,
 linux-headers}: bump 5.15.x / 6.{1, 6, 11}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=687de602f5787e0cd42baa36d73f47f49cffac7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c9d16e41e9e27b1da1315d2b89073dac96c76c14)
[Peter: drop 6.11.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 0c15064167..ee1371e61e 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,9 +1,9 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  55e5bcbc68d66776fc46896291f0a24844beb57817345a854d65e3d055fa423e  linux-6.10.14.tar.xz
-sha256  e7df81e588d70fab5ec3ec3bb04ac53d51f0860fc3b1ec45e0a4167a026899db  linux-6.6.58.tar.xz
-sha256  2286e4a02ea2fbe65023dbf779f20aa994ba2b8d37ed559049378089451aa256  linux-6.1.114.tar.xz
+sha256  23616808d8c08f12815ff898f4edb4c11397a2b2843d029ee62452d21833a76d  linux-6.6.59.tar.xz
+sha256  0fd8ba827e1f1888376d88fd1d1c80d707c587c75b0f18c26530824be437ba6f  linux-6.1.115.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  e618c6d845fd1bc89477508e8d084bbe791fc88bf7623adee2deb6ecb2275370  linux-5.15.169.tar.xz
+sha256  fd596545a3d6d93196db3fa29e4926e60900b9c05b3b9ccdee9e35d8e376e7a9  linux-5.15.170.tar.xz
 sha256  76cc8d7f1528f87902e38697229661d0617a7d6ab86166be9f3ef9a613b17b72  linux-5.10.228.tar.xz
 sha256  77221ab9aebeac746915c755ec3b7d320f85cd219c63d9c501820fbca1e3b32b  linux-5.4.284.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index e44ba290ea..f96a8a7b49 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -426,9 +426,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.19.322"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.284"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.228"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.169"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.114"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.58"	if BR2_KERNEL_HEADERS_6_6
+	default "5.15.170"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.115"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.59"	if BR2_KERNEL_HEADERS_6_6
 	default "6.10.14"	if BR2_KERNEL_HEADERS_6_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
