Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6115C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EA1F6FB38;
	Tue, 21 Feb 2023 01:57:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EA1F6FB38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gwMUtrEaonos; Tue, 21 Feb 2023 01:57:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81D22701FC;
	Tue, 21 Feb 2023 01:57:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81D22701FC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D0D4E1BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96C7770033
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96C7770033
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GDU7W3yiTaka for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A984B7002A
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A984B7002A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A741E828C8; Mon, 20 Feb 2023 20:52:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Feb 2023 18:12:05 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 36a8be4770d93c0a4346008c56f6ab6862b9b509
X-Git-Newrev: 6634710cdb12ec5b972c2c4068636dfd591cae4d
X-Patchwork-Hint: ignore
Message-Id: <20230220205259.A741E828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/linux-headers: drop
 4.9.x option
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

commit: https://git.buildroot.net/buildroot/commit/?id=6634710cdb12ec5b972c2c4068636dfd591cae4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The 4.9.x series is now EOL upstream, so drop the linux-headers option and
add legacy handling for it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                     | 7 +++++++
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 6 ------
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 72deb03c35..e2dc854c78 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2023.02"
 
+config BR2_KERNEL_HEADERS_4_9
+	bool "kernel headers version 4.9.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 4.9.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_PACKAGE_DOCKER_PROXY
 	bool "docker-proxy removed"
 	select BR2_LEGACY
diff --git a/linux/linux.hash b/linux/linux.hash
index f797d5a61a..ae8b5e5f62 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -6,7 +6,6 @@ sha256  e7ed24f2690bf0e11158ccfa8ddc5c0e8a4816d83c4055d205218853da9c5dad  linux-
 sha256  d807f97812e566410cd13b3170009e0d7552748d4f22d608ffd4dbd7f85bf9c6  linux-5.10.167.tar.xz
 sha256  8dd0ea7f1db4c1e89d485255798e3c3dfb9be63c0f2af369912a1a37b75f36a8  linux-5.4.231.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  5385aaec55c766e3f462511453f5c63d7898b2d0e9ea74f22a23ebbedab0b3c6  linux-4.9.337.tar.xz
 sha256  a35bcde16b13aa423a1822675775a1b0abf17f5392454febabd8c3757187959a  linux-4.14.305.tar.xz
 sha256  489fb9368bd7ab808264dea1a4acdf607f057bf1ba19f647a17aa18d08f313f9  linux-4.19.272.tar.xz
 # Locally computed
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 8a76f93d62..6970090855 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -24,11 +24,6 @@ config BR2_KERNEL_HEADERS_AS_KERNEL
 	depends on BR2_LINUX_KERNEL
 	select BR2_KERNEL_HEADERS_LATEST if BR2_LINUX_KERNEL_LATEST_VERSION
 
-config BR2_KERNEL_HEADERS_4_9
-	bool "Linux 4.9.x kernel headers"
-	depends on !BR2_riscv
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
-
 config BR2_KERNEL_HEADERS_4_14
 	bool "Linux 4.14.x kernel headers"
 	depends on !BR2_riscv
@@ -393,7 +388,6 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.9.337"	if BR2_KERNEL_HEADERS_4_9
 	default "4.14.305"	if BR2_KERNEL_HEADERS_4_14
 	default "4.19.272"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.231"	if BR2_KERNEL_HEADERS_5_4
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
