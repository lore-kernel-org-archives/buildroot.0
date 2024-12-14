Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0BB1E77183
	for <buildroot@archiver.kernel.org>; Sat, 14 Dec 2024 19:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51D6C81FF2;
	Sat, 14 Dec 2024 19:45:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NF_gvNOq52Cr; Sat, 14 Dec 2024 19:45:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4863381FFA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4863381FFA;
	Sat, 14 Dec 2024 19:45:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CE3FED1
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 19:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5E7081FFA
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 19:45:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HIG-VUzhnYYU for <buildroot@buildroot.org>;
 Sat, 14 Dec 2024 19:45:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDA7E81FF2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDA7E81FF2
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 19:45:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D467887001; Sat, 14 Dec 2024 19:45:37 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 14 Dec 2024 20:33:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: afa2af1c674712163b0a57213ac065ae7e12ff86
X-Git-Newrev: 98c691b434d3b5575c3d999d8ae2d49557cb2139
X-Patchwork-Hint: ignore
Message-Id: <20241214194537.D467887001@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-headers: drop 4.19.x option
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

commit: https://git.buildroot.net/buildroot/commit/?id=98c691b434d3b5575c3d999d8ae2d49557cb2139
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 4.19.x series is now EOL upstream, so drop the linux-headers option
and add legacy handling for it.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy                     | 7 +++++++
 linux/linux.hash                     | 2 --
 package/linux-headers/Config.in.host | 5 -----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 93d590b50b..066be19a75 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.02"
 
+config BR2_KERNEL_HEADERS_4_19
+	bool "kernel headers version 4.19.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 4.19.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_KERNEL_HEADERS_6_11
 	bool "kernel headers version 6.11.x are no longer supported"
 	select BR2_LEGACY
diff --git a/linux/linux.hash b/linux/linux.hash
index d37188b4b2..18051600cb 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -6,8 +6,6 @@ sha256  aecdaf39d0a844a81ce4c67d9daff8979e938bb690df4f679fbbb494fe423278  linux-
 sha256  8a4b2a47ccc9b208b2b6ed9a216ea1a5eb12852c723bec1a04de9e671a1d7da8  linux-5.15.173.tar.xz
 sha256  cd1850ef3b771886df4e0b4c4eb07033864abab2bb553a20fd9e3cdc23584b47  linux-5.10.230.tar.xz
 sha256  180754f3df0e8d7f206625255b3f5a6e1f441feec83336df42613ca8f6b1887c  linux-5.4.286.tar.xz
-# From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  607bed7de5cda31a443df4c8a78dbe5e8a9ad31afde2a4d28fe99ab4730e8de1  linux-4.19.325.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 826320c96e..1bcfb9c861 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -24,10 +24,6 @@ config BR2_KERNEL_HEADERS_AS_KERNEL
 	depends on BR2_LINUX_KERNEL
 	select BR2_KERNEL_HEADERS_LATEST if BR2_LINUX_KERNEL_LATEST_VERSION
 
-config BR2_KERNEL_HEADERS_4_19
-	bool "Linux 4.19.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
-
 config BR2_KERNEL_HEADERS_5_4
 	bool "Linux 5.4.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
@@ -432,7 +428,6 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.19.325"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.286"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.230"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.173"	if BR2_KERNEL_HEADERS_5_15
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
