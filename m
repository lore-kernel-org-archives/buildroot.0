Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA412C25B48
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 16:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 687F142E0E;
	Thu, 26 Oct 2023 16:42:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 687F142E0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O4Y0IgvKnksQ; Thu, 26 Oct 2023 16:42:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 865D942E02;
	Thu, 26 Oct 2023 16:42:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 865D942E02
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 846E31BF239
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 16:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5EB7142DFF
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 16:41:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EB7142DFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jaDj7VxqMyAv for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 16:41:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 863CA42DED
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 16:41:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 863CA42DED
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 75BFF85F49; Thu, 26 Oct 2023 16:41:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 18:37:26 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: ae2b8dd57a405716a000820ca4234167277ed35f
X-Git-Newrev: 13affee92ce29321a6e027e41abe459b2a4e2691
X-Patchwork-Hint: ignore
Message-Id: <20231026164147.75BFF85F49@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] {linux,
 linux-headers}: bump 6.1.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=13affee92ce29321a6e027e41abe459b2a4e2691
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2e1890db65fe0e08d626770e226e399309d33fe5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 2 +-
 package/linux-headers/Config.in.host | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index b5b486cc3e..a89888ccbb 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.1.57" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.1.58" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index f52ca6bad1..d3eeaf6151 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  f9ebfe3ddc5152d87b37e33be30e31875d137433be10a57ce29d2eae7b6e91b1  linux-6.1.57.tar.xz
+sha256  ce987ed3d2f640b3a2a62a0a8573d538a36dfd3cc31e2d7a239ce5a16c1c21ad  linux-6.1.58.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  14835e629e237f136cfed484fdb533c95242429809bdcdb2a2d66dfcb7447170  linux-5.15.135.tar.xz
 sha256  2b141fce994364fbbf137b01e7910d3518b8cdbdf18f1811b48470ab4ce2fa05  linux-5.10.198.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 61ff9a6739..9fab93fb4f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -389,7 +389,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.258"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.198"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.135"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.57"	if BR2_KERNEL_HEADERS_6_1
+	default "6.1.58"	if BR2_KERNEL_HEADERS_6_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
