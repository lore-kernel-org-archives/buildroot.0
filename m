Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC10CCD199
	for <buildroot@archiver.kernel.org>; Thu, 16 Oct 2025 19:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28DC380DA1;
	Thu, 16 Oct 2025 19:50:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QD_fjEegFkiI; Thu, 16 Oct 2025 19:50:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 208A280DA2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 208A280DA2;
	Thu, 16 Oct 2025 19:50:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D8DAA968
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 19:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D60C080DA1
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 19:50:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bta3_7hWWsAV for <buildroot@buildroot.org>;
 Thu, 16 Oct 2025 19:50:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15B1380DA0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 15B1380DA0
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 19:50:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E5E8872FC; Thu, 16 Oct 2025 19:50:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 16 Oct 2025 21:42:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 24ff258905df70d82689213829fb233f1eea797e
X-Git-Newrev: 2661d9b34f73e94abe5fb55b4842bf5944ee131f
X-Patchwork-Hint: ignore
Message-Id: <20251016195039.0E5E8872FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 6.{1, 6, 12,
 17}.x series
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2661d9b34f73e94abe5fb55b4842bf5944ee131f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 1c48c1c41a..90a0ccd0c5 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.17.2" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.17.3" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index de40c6b7b6..3bdc4cd9b2 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  fdebcb065065f5c1b8dc68a6fb59cda50cdddbf9103d207c2196d55ea764f57f  linux-6.17.2.tar.xz
-sha256  b4850cf670a032c70f38b713a27d62046c5f747caf028c5f50b18f98606a9eb1  linux-6.12.52.tar.xz
-sha256  04c470e130d659ef05217ac695422c28d817d19daa50643fe28b945e6ab646c7  linux-6.6.111.tar.xz
-sha256  c29387aeee085fbcbd91236224b9df805063bac43615e75cea2c6b29604a5c73  linux-6.1.155.tar.xz
+sha256  3ecc8619d8a5b5f675224d2f52c71d1fc09bc3f9c019d8bd82d0581e03689499  linux-6.17.3.tar.xz
+sha256  663507accae673afcf4e210b4ae8d4352e61d926202e5da3f04bf71ca1d2c0b5  linux-6.12.53.tar.xz
+sha256  6c7d92bf316a56e91de41cb60da1f63d94a4f8aafaef6a13055df0c291138a22  linux-6.6.112.tar.xz
+sha256  d4bb148b204e5aed38690489736961cdaf925fe7b35cf1f56c47ad7a09a0228e  linux-6.1.156.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  348d6faada05fd4684450cd7c4e666c3c98cdb96f2309b1520c9a92a378c267e  linux-5.15.194.tar.xz
 sha256  131e75eb14da6fd683b3882bcd856085cfca47cc1aa89cd2deb1b48d22d29d9f  linux-5.10.245.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 75de52e94a..3fbad38e6e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -461,10 +461,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.300"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.245"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.194"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.155"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.111"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.52"	if BR2_KERNEL_HEADERS_6_12
-	default "6.17.2"	if BR2_KERNEL_HEADERS_6_17
+	default "6.1.156"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.112"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.53"	if BR2_KERNEL_HEADERS_6_12
+	default "6.17.3"	if BR2_KERNEL_HEADERS_6_17
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
