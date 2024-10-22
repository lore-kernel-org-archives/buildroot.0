Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0981CDD0F4
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 21:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FE2C80F86;
	Tue, 22 Oct 2024 21:08:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0TLV0OU7xr05; Tue, 22 Oct 2024 21:08:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7016980F89
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7016980F89;
	Tue, 22 Oct 2024 21:08:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B659C59F5
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A636D80F89
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:08:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fi70IM6j9rff for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 21:08:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAC3F80F86
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BAC3F80F86
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:08:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A78CC86271; Tue, 22 Oct 2024 21:08:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Oct 2024 23:07:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 539a203d6e044c411ad1cd5f54781d060f224a42
X-Git-Newrev: 3e92a39db573c6bc99a9b2c4fa0049d12eb55512
X-Patchwork-Hint: ignore
Message-Id: <20241022210811.A78CC86271@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-headers: drop 6.10.x option
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3e92a39db573c6bc99a9b2c4fa0049d12eb55512
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 6.10.x series is now EOL upstream, so drop the linux-headers option
and add legacy handling for it.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                     | 7 +++++++
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 5 -----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 6a1518f439..4a47a2dda1 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2024.11"
 
+config BR2_KERNEL_HEADERS_6_10
+	bool "kernel headers version 6.10.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 6.10.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_PACKAGE_IPMITOOL_PEN_REG_URI
 	string "IANA PEN registry moved to iana-assignment package"
 	help
diff --git a/linux/linux.hash b/linux/linux.hash
index 32e1be4091..5233de2b0b 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  057263d0afc17d5253794afd3d239ba4da4aa734b22fa36c1665f41b95449b73  linux-6.11.3.tar.xz
-sha256  55e5bcbc68d66776fc46896291f0a24844beb57817345a854d65e3d055fa423e  linux-6.10.14.tar.xz
 sha256  f74812f78e88992c416434cb107639e13a551dbaff36bb90d6346ab16ab71a95  linux-6.6.56.tar.xz
 sha256  8bd8de3562fb006653e550a934e66ed9f80b7576258a03e2caa2e3ce1c1f9f24  linux-6.1.112.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a3610d7ecd..7c1611699c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -48,10 +48,6 @@ config BR2_KERNEL_HEADERS_6_6
 	bool "Linux 6.6.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
 
-config BR2_KERNEL_HEADERS_6_10
-	bool "Linux 6.10.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10
-
 config BR2_KERNEL_HEADERS_6_11
 	bool "Linux 6.11.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_11
@@ -438,7 +434,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.167"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.112"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.56"	if BR2_KERNEL_HEADERS_6_6
-	default "6.10.14"	if BR2_KERNEL_HEADERS_6_10
 	default "6.11.3"	if BR2_KERNEL_HEADERS_6_11
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
