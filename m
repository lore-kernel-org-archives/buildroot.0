Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D728CCCD187
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 21:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4505260F8F;
	Sun, 12 Oct 2025 21:13:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fTJX8wpR67cX; Sun, 12 Oct 2025 21:13:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AC1B60EE0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AC1B60EE0;
	Sun, 12 Oct 2025 21:13:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8554091C
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 21:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6AF3D40421
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 21:13:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LlnNpOAeGj53 for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 21:13:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5747F4009C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5747F4009C
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 21:13:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4560B86F11; Sun, 12 Oct 2025 21:13:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 22:53:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ae29b86dc4b7c8c6ea1a9585ca261cfdb37e4d55
X-Git-Newrev: fec2d492a431f557817ba4ba8ee9244fdcc11370
X-Patchwork-Hint: ignore
Message-Id: <20251012211311.4560B86F11@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 6.{6, 12, 16,
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

commit: https://git.buildroot.net/buildroot/commit/?id=fec2d492a431f557817ba4ba8ee9244fdcc11370
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 31ee73103b..1c48c1c41a 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.17.1" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.17.2" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 54b2d36839..5b56aebb58 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  a53dbe3f41491922a61f17c5cc551e88f544d5411aeb1c8c65c402795c4f4da0  linux-6.17.1.tar.xz
-sha256  5f304f0c453d87ac765207359da4f5a733939d1595ef258f1809194fa18dba7b  linux-6.16.11.tar.xz
-sha256  2d55ad149ca7d9ef82595c669430650030cbf9afbbeb42e5cd9b4ba3cc1a7221  linux-6.12.51.tar.xz
-sha256  1bf20daf5543b8759f325e55fb0da4913715e68741627a13380e66aaf219fb1d  linux-6.6.110.tar.xz
+sha256  fdebcb065065f5c1b8dc68a6fb59cda50cdddbf9103d207c2196d55ea764f57f  linux-6.17.2.tar.xz
+sha256  7ca4debc5ca912ebb8a76944a5c118afd5d09e31ef43c494adb14273da29a26e  linux-6.16.12.tar.xz
+sha256  b4850cf670a032c70f38b713a27d62046c5f747caf028c5f50b18f98606a9eb1  linux-6.12.52.tar.xz
+sha256  04c470e130d659ef05217ac695422c28d817d19daa50643fe28b945e6ab646c7  linux-6.6.111.tar.xz
 sha256  c29387aeee085fbcbd91236224b9df805063bac43615e75cea2c6b29604a5c73  linux-6.1.155.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  348d6faada05fd4684450cd7c4e666c3c98cdb96f2309b1520c9a92a378c267e  linux-5.15.194.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 0688144480..e7ba0cac24 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -466,10 +466,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.245"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.194"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.155"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.110"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.51"	if BR2_KERNEL_HEADERS_6_12
-	default "6.16.11"	if BR2_KERNEL_HEADERS_6_16
-	default "6.17.1"	if BR2_KERNEL_HEADERS_6_17
+	default "6.6.111"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.52"	if BR2_KERNEL_HEADERS_6_12
+	default "6.16.12"	if BR2_KERNEL_HEADERS_6_16
+	default "6.17.2"	if BR2_KERNEL_HEADERS_6_17
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
