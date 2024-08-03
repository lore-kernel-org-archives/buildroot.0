Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE9AC49EA1
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 18:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D523640382;
	Sat,  3 Aug 2024 18:29:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sEnSa0Zx2R0N; Sat,  3 Aug 2024 18:29:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB6CA403A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB6CA403A7;
	Sat,  3 Aug 2024 18:29:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 359041BF364
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 18:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AAEE16060D
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 18:29:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rRRjAF4Si0KY for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 18:29:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6C6460645
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6C6460645
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 18:29:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 54F8783C67; Sat,  3 Aug 2024 18:29:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Aug 2024 20:29:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 179bf242d564e18db278b39fdf67e43ec6806e28
X-Git-Newrev: 4450ee378f6ac49018241d3258fc178272384db0
X-Patchwork-Hint: ignore
Message-Id: <20240803182913.54F8783C67@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-headers: drop 6.9.x option
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4450ee378f6ac49018241d3258fc178272384db0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 6.9.x series is now EOL upstream, so drop the linux-headers option
and add legacy handling for it.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                     | 7 +++++++
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 5 -----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index a746f682cc..94092d38f4 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2024.08"
 
+config BR2_KERNEL_HEADERS_6_9
+	bool "kernel headers version 6.9.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 6.9.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_x86_knightslanding
 	bool "knightslanding x86 architecture support dropped"
 	select BR2_LEGACY
diff --git a/linux/linux.hash b/linux/linux.hash
index b6ab8b3267..4e05f4a765 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  fa5f22fd67dd05812d39dca579320c493048e26c4a556048a12385e7ae6fc698  linux-6.10.3.tar.xz
-sha256  5ae7cc4e0e2f6b9ba630f643985ba0522c7d5e5b9571ba478a3cb513edd4cf22  linux-6.9.12.tar.xz
 sha256  93218296934915636fe6ba08e125948424cc270fd8948502c0ab91087a9fccd8  linux-6.6.44.tar.xz
 sha256  5eb4706f898f50881552ff5146d892132d3ffc5298033bffe27087d3a44c4573  linux-6.1.103.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index e235689700..83b8d1267e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -48,10 +48,6 @@ config BR2_KERNEL_HEADERS_6_6
 	bool "Linux 6.6.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
 
-config BR2_KERNEL_HEADERS_6_9
-	bool "Linux 6.9.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_9
-
 config BR2_KERNEL_HEADERS_6_10
 	bool "Linux 6.10.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10
@@ -433,7 +429,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.164"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.103"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.44"	if BR2_KERNEL_HEADERS_6_6
-	default "6.9.12"	if BR2_KERNEL_HEADERS_6_9
 	default "6.10.3"	if BR2_KERNEL_HEADERS_6_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
