Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B92C433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 09:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 673F2419AF;
	Sat, 28 May 2022 09:17:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tjuECybibVku; Sat, 28 May 2022 09:17:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FCD5419AE;
	Sat, 28 May 2022 09:17:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E99401BF95F
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 09:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E521A84CBF
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 09:17:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y12YvC9ynO6K for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 09:17:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F19E684CAB
 for <buildroot@buildroot.org>; Sat, 28 May 2022 09:17:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B0D6984245; Sat, 28 May 2022 09:05:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 10:47:15 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: f5176416f0df7d3dea4c8a59c6c93bbf41db7661
X-Git-Newrev: 2b8c49ef508263ff713759a386b19bccb92eac4a
X-Patchwork-Hint: ignore
Message-Id: <20220528090537.B0D6984245@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] {linux,
 linux-headers}: bump 4.{9, 14, 19}.x / 5.{4, 10, 15, 16}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=2b8c49ef508263ff713759a386b19bccb92eac4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit efdbd301b7f83c1cc629e7bcc80d1835911ee32a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 14 +++++++-------
 package/linux-headers/Config.in.host | 14 +++++++-------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 82f5675f6c..c37b4cd422 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.15.33" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.15.37" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.104-cip3" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.104-cip3-rt3" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index cf7ccc5cc5..077bc4d4d7 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  da6d2cfa8b5b82d8a17b032a627fc1c7885097523c32cc8a4294745697d59b7e  linux-5.16.19.tar.xz
-sha256  c30a17e6090f9ebf2d8ff58cd6c92c7324b1f4a8b3aa6a7f68850310af05a9c4  linux-5.15.33.tar.xz
-sha256  dbef6a06325433481551cb8cfca9254d908d0ae950bc809f3da8ade00c485693  linux-5.10.110.tar.xz
-sha256  9fbc8bfdc28c9fce2307bdf7cf1172c9819df673397a411c40a5c3d0a570fdbc  linux-5.4.188.tar.xz
+sha256  d8060dc88f862baaae66b42a2dbc12298ed667c698eb5c55617a7786ee47bf25  linux-5.16.20.tar.xz
+sha256  18bf091a2157faa8d92a1aba2ecb66b5124bb0e033fc7797343984e069a2c026  linux-5.15.37.tar.xz
+sha256  82516a02bb52456f6e8057217dde6e02b78003b1e058117557c2ae9661696dfc  linux-5.10.113.tar.xz
+sha256  288ca85fcdad18e950ccbe3d640594ee36d5aac226321ed935076fadb0cc0a3a  linux-5.4.191.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  35017bb40b604e0b577fc2b87e727632b46608a2ba3a4f5858b9177f58f376b3  linux-4.4.302.tar.xz
-sha256  e86a55a89e1e28756b890b2b78f8b582d05cecb3509ff5c353e9534866468614  linux-4.9.309.tar.xz
-sha256  100a9960fb2d8e079c9feeef640715a7fb749ed728a57e427f9e2443212e58f9  linux-4.14.275.tar.xz
-sha256  bafff35102cc486ec2bf94c6d908be8e24017b2e4a1873f52f24c855eb220cd8  linux-4.19.237.tar.xz
+sha256  fa2fb1fb5ba2e6ed99603063474804bd5fddeb8a5ad769d47786f82109e5c627  linux-4.9.312.tar.xz
+sha256  e3dcacc2459c91586ae94121f54eb54a7cae9c424766fe20498169f682fd1b15  linux-4.14.277.tar.xz
+sha256  4c6269d3c14e593151b035a55227110e632642d848032ef6992135c18488fe13  linux-4.19.241.tar.xz
 # Locally computed
 sha256  63e6df81c4a747c60eed535ffc2f6f1ddb0c17ec349e860316d9a700c69ab38e  linux-cip-5.10.104-cip3.tar.gz
 sha256  9a45929d91ebaddbf6a0ef29750775e33d3c3f56f42f0a9e95e77e5b4eba3c6e  linux-cip-5.10.104-cip3-rt3.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 43a116974b..229c5a0ca8 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -382,13 +382,13 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.4.302"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.309"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.275"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.237"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.188"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.110"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.33"	if BR2_KERNEL_HEADERS_5_15
-	default "5.16.19"	if BR2_KERNEL_HEADERS_5_16
+	default "4.9.312"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.277"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.241"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.191"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.113"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.37"	if BR2_KERNEL_HEADERS_5_15
+	default "5.16.20"	if BR2_KERNEL_HEADERS_5_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
