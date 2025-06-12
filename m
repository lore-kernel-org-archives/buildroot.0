Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5BADC7114C
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 21:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B93D083B53;
	Thu, 12 Jun 2025 21:14:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i54f6h6HZs1y; Thu, 12 Jun 2025 21:14:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E033383B24
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E033383B24;
	Thu, 12 Jun 2025 21:14:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E8621BD
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 21:14:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 480B64087B
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 21:13:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D7nvLilJ_Pum for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 21:13:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79F7740888
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79F7740888
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 21:13:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 572AD8386C; Thu, 12 Jun 2025 21:13:58 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 12 Jun 2025 22:54:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eac26f1ac0cf25a51fec589bab51594ae0803b91
X-Git-Newrev: d02a1239a553f31605e63b0fb50d9ea4e5e0d987
X-Patchwork-Hint: ignore
Message-Id: <20250612211358.572AD8386C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-headers: drop 6.14.x option
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

commit: https://git.buildroot.net/buildroot/commit/?id=d02a1239a553f31605e63b0fb50d9ea4e5e0d987
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 6.14.x series is now EOL upstream, so drop the linux-headers
option and add legacy handling for it.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy                     | 7 +++++++
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 5 -----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 7cb3d945a1..3084e7336e 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.08"
 
+config BR2_KERNEL_HEADERS_6_14
+	bool "kernel headers version 6.14.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 6.14.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_PACKAGE_GPSD_OCEANSERVER
 	bool "gpsd OceanServer removed upstream"
 	select BR2_LEGACY
diff --git a/linux/linux.hash b/linux/linux.hash
index de6e89dda8..38ba9b474d 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  3458cd6a6c508e161dbc5406e72b99d5dbdf929faf704a67db9ba46d07514858  linux-6.15.2.tar.xz
-sha256  3f1ccd0a6dc9c9777cb6fcef357c77e4a2386c84c52b6d5bbcda79c16af33b1b  linux-6.14.11.tar.xz
 sha256  c0a575630f2603a20bb0641f8df8f955e46c9d7ac1fae8b54b21316e6b52a254  linux-6.12.33.tar.xz
 sha256  0d79ff359635e9f009f1e330deed5f3aefd8c452b80660bffdc504b877797719  linux-6.6.93.tar.xz
 sha256  bc3c45faf6f5f0450666c75fa9dad9bc7c0cf7c7cba0dbd94e5cfdc58229c116  linux-6.1.141.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 15ca78c890..d16aa265d8 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -48,10 +48,6 @@ config BR2_KERNEL_HEADERS_6_12
 	bool "Linux 6.12.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 
-config BR2_KERNEL_HEADERS_6_14
-	bool "Linux 6.14.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_14
-
 config BR2_KERNEL_HEADERS_6_15
 	bool "Linux 6.15.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_15
@@ -454,7 +450,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.1.141"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.93"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.33"	if BR2_KERNEL_HEADERS_6_12
-	default "6.14.11"	if BR2_KERNEL_HEADERS_6_14
 	default "6.15.2"	if BR2_KERNEL_HEADERS_6_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
