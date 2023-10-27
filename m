Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83075C25B6E
	for <buildroot@archiver.kernel.org>; Fri, 27 Oct 2023 08:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A44383C3B;
	Fri, 27 Oct 2023 08:03:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A44383C3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jGEvGIZoVun8; Fri, 27 Oct 2023 08:03:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46A1384D20;
	Fri, 27 Oct 2023 08:03:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46A1384D20
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 96A4C1BF995
 for <buildroot@lists.busybox.net>; Fri, 27 Oct 2023 08:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E7FC432FB
 for <buildroot@lists.busybox.net>; Fri, 27 Oct 2023 08:03:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E7FC432FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oFuIn3gue_TG for <buildroot@lists.busybox.net>;
 Fri, 27 Oct 2023 08:03:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5EBDA40108
 for <buildroot@buildroot.org>; Fri, 27 Oct 2023 08:03:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EBDA40108
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 448D885FD4; Fri, 27 Oct 2023 08:03:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 Oct 2023 08:49:16 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 2e494349a46c97e1f85d69a81834047d84ee5569
X-Git-Newrev: 65bc718874acf773c037b0fd41527f6a0f09d40c
X-Patchwork-Hint: ignore
Message-Id: <20231027080321.448D885FD4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] {linux,
 linux-headers}: bump 5.15.x / 6.{1, 5}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=65bc718874acf773c037b0fd41527f6a0f09d40c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d8bcff69fc2887b2b0ceda0720b3a3569cf8abb0)
[Peter: drop 6.5.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index a89888ccbb..f1862c0f30 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.1.58" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.1.59" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index d3eeaf6151..1f065f57a4 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  ce987ed3d2f640b3a2a62a0a8573d538a36dfd3cc31e2d7a239ce5a16c1c21ad  linux-6.1.58.tar.xz
+sha256  627f7724c675036639290fb5c39e3fdeb3d566b80b192c45f4a808ab54c8c0a0  linux-6.1.59.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  14835e629e237f136cfed484fdb533c95242429809bdcdb2a2d66dfcb7447170  linux-5.15.135.tar.xz
+sha256  c624b9fe7ee4708d34cfd0b7ebc58037afac7463338cc498641ea31c55eeacb8  linux-5.15.136.tar.xz
 sha256  2b141fce994364fbbf137b01e7910d3518b8cdbdf18f1811b48470ab4ce2fa05  linux-5.10.198.tar.xz
 sha256  39701815a7a1b5ea4253db18e9327a45926a944499628d032da63c1bb6ea623e  linux-5.4.258.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 9fab93fb4f..65327d6b9f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -388,8 +388,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.19.296"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.258"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.198"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.135"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.58"	if BR2_KERNEL_HEADERS_6_1
+	default "5.15.136"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.59"	if BR2_KERNEL_HEADERS_6_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
