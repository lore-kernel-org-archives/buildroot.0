Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F34C9CA0EEB
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 14:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A916E60B59;
	Sun, 24 Aug 2025 14:37:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TmJvZuEPd4SM; Sun, 24 Aug 2025 14:37:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC04260BB0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC04260BB0;
	Sun, 24 Aug 2025 14:37:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EB7B3CA
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 14:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1B5741BED
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 14:37:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S_Pxk6EvWSix for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 14:37:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2115541B18
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2115541B18
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 14:37:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 185CA87A54; Sun, 24 Aug 2025 14:37:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Aug 2025 16:36:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8d6f9393ec2ad039554b32b8c7da192559c7887a
X-Git-Newrev: 0ce896b28b3c165f46fdaba01e1b25f3a3c223cd
X-Patchwork-Hint: ignore
Message-Id: <20250824143703.185CA87A54@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-headers: drop 6.15.x option
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

commit: https://git.buildroot.net/buildroot/commit/?id=0ce896b28b3c165f46fdaba01e1b25f3a3c223cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 6.15.x series is now EOL upstream, so drop the linux-headers
option and add legacy handling for it.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy                     | 7 +++++++
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 5 -----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index efb59dc535..0bedc24dce 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.08"
 
+config BR2_KERNEL_HEADERS_6_15
+	bool "kernel headers version 6.15.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 6.15.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_PACKAGE_LIBCURL_BEARSSL
 	bool "libcurl removed BearSSL support"
 	select BR2_LEGACY
diff --git a/linux/linux.hash b/linux/linux.hash
index f5e2d663d1..80181fd78e 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  1a4be2fe6b5246aa4ac8987a8a4af34c42a8dd7d08b46ab48516bcc1befbcd83  linux-6.16.tar.xz
-sha256  e94f3af85492302f7a819441458f80bca0ad9912e5a4c83c699ff3c63c52957d  linux-6.15.9.tar.xz
 sha256  6b19a3ae99423de2416964d67251d745910277af258b4c4c63e88fd87dbf0e27  linux-6.12.41.tar.xz
 sha256  8c4ff2869736538b9b0d88ea8dbf0332b79c6ecc40a32066768a754df1fae1c0  linux-6.6.101.tar.xz
 sha256  218f25663a41e3d811e84fa1c4acec50684898b2f6d0c8c0deb531d937e466f7  linux-6.1.147.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 66a9670de5..68f5504868 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -54,10 +54,6 @@ config BR2_KERNEL_HEADERS_6_12
 	bool "Linux 6.12.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 
-config BR2_KERNEL_HEADERS_6_15
-	bool "Linux 6.15.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_15
-
 config BR2_KERNEL_HEADERS_6_16
 	bool "Linux 6.16.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_16
@@ -464,7 +460,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.1.147"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.101"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.41"	if BR2_KERNEL_HEADERS_6_12
-	default "6.15.9"	if BR2_KERNEL_HEADERS_6_15
 	default "6.16"		if BR2_KERNEL_HEADERS_6_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
