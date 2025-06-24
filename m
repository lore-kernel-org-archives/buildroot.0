Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43444C7EE30
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D0F241959;
	Thu, 26 Jun 2025 19:49:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VFkCSmU5CuMa; Thu, 26 Jun 2025 19:49:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2314B4195E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2314B4195E;
	Thu, 26 Jun 2025 19:49:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A4BBE1CD
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B26B607A1
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:49:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MjFn1rv_qfZh for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:49:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 868D4607D5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 868D4607D5
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:49:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 80A4D8467C; Thu, 26 Jun 2025 19:49:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 24 Jun 2025 20:37:05 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 51fc7d63b9a315d6659cb17ecdc4b7a6857af2be
X-Git-Newrev: 3a528c9f5ea9cf285797750c390b14a0d81d2020
X-Patchwork-Hint: ignore
Message-Id: <20250626194921.80A4D8467C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] {linux,
 linux-headers}: bump 6.{12, 14}.x series
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3a528c9f5ea9cf285797750c390b14a0d81d2020
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3a00ac13d814d795b3d051d10ddbab501e44a7bd)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index ddd6515446..ef81474ffc 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.14.10" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.14.11" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index b69793bf63..c6b3bb7ee1 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  de8b97cfeae74c22f832ee4ca2333c157cc978d98baa122f0ee9c01796a2fe43  linux-6.14.10.tar.xz
-sha256  a9b020721778384507010177d3929e7d4058f7f6120f05a99d56b5c5c0346a70  linux-6.12.32.tar.xz
+sha256  3f1ccd0a6dc9c9777cb6fcef357c77e4a2386c84c52b6d5bbcda79c16af33b1b  linux-6.14.11.tar.xz
+sha256  c0a575630f2603a20bb0641f8df8f955e46c9d7ac1fae8b54b21316e6b52a254  linux-6.12.33.tar.xz
 sha256  0d79ff359635e9f009f1e330deed5f3aefd8c452b80660bffdc504b877797719  linux-6.6.93.tar.xz
 sha256  bc3c45faf6f5f0450666c75fa9dad9bc7c0cf7c7cba0dbd94e5cfdc58229c116  linux-6.1.141.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index efe50f98df..e2dc5f8075 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -445,8 +445,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.185"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.141"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.93"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.32"	if BR2_KERNEL_HEADERS_6_12
-	default "6.14.10"	if BR2_KERNEL_HEADERS_6_14
+	default "6.12.33"	if BR2_KERNEL_HEADERS_6_12
+	default "6.14.11"	if BR2_KERNEL_HEADERS_6_14
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
