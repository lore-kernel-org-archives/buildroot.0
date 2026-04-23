Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E68FDEE46
	for <buildroot@archiver.kernel.org>; Thu, 23 Apr 2026 19:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B35CF83DA5;
	Thu, 23 Apr 2026 19:32:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OW6orrtOJJrr; Thu, 23 Apr 2026 19:32:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB39A83DA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776972766;
	bh=r0rtiFLk/YtgwP7udLVhkKgWG4X+DlaJtxj5zrON+T4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hMi1JFv3lDIaYBYCnJV9gSI+TlcqzTVLBIfwRjdIh2rYqlHsilvN3UGEJz3LxE6HU
	 1HQCW6tknb/8LJk5B4/GkyrR8k4qXIg6ybWgPylxV6nujcHn5MnOCHk39jb0fwYD+t
	 MdzK9fhHSZQIPOpg7xcym7ZNpZ5/OaR3KDBsTuMQbdQnbPTQgyafO1rtaTyLcMTdGk
	 Tg4ree6BUSsaL3gZV+lI0GG61H0eEAe4ccaJO5ZE4SElyV2HzSfQpLUXS7zIpBxg2M
	 pqRlYyu6fG9zyyLic4G+FzajGcxCWgAgAkD7Sj6/zfitomJsi115F0koKHC+hICKXA
	 aZPz8jZ8H0lTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB39A83DA1;
	Thu, 23 Apr 2026 19:32:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D96C24D
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 19:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86A4E408DA
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 19:32:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jkXaoha44ufH for <buildroot@buildroot.org>;
 Thu, 23 Apr 2026 19:32:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9C76408D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9C76408D1
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 19:32:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 60FAA82829; Thu, 23 Apr 2026 19:32:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Apr 2026 21:24:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1f2845d8d6d07fae0237359922b4573b470f9d4b
X-Git-Newrev: 967b193f9f4ab129aeec3141b9e67f9296d86938
X-Patchwork-Hint: ignore
Message-Id: <20260423193243.60FAA82829@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-headers: drop 6.19.x option
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/967b193f9f4ab129aeec3141b9e67f9296d86938
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The 6.19.x series is now EOL upstream, so drop the linux-headers
option and add legacy handling for it.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy                     | 7 +++++++
 linux/from-6.17/linux.hash           | 1 -
 package/linux-headers/6.19.14        | 1 -
 package/linux-headers/Config.in.host | 5 -----
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index af093ff3e1..ead9ceaa08 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.05"
 
+config BR2_KERNEL_HEADERS_6_19
+	bool "kernel headers version 6.19.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 6.19.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_PACKAGE_PCRE
 	bool "pcre removed"
 	select BR2_LEGACY
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 928ae172cd..a2e1be9d31 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -2,7 +2,6 @@
 sha256  b2c935a36d24980e11e59bed3ca558ea6d67619ec0065faa335cdc0b64d887bf  linux-7.0.1.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  cde8bf6739be4a0777fedbbba5330b8188c55680c45a922a4dfa289cbec6f185  linux-6.19.14.tar.xz
 sha256  c207c557ce58103b4dda30e26da5203f3d8467c6dadc53d709f6d83ae1d1255f  linux-6.18.24.tar.xz
 
 # Licenses hashes
diff --git a/package/linux-headers/6.19.14 b/package/linux-headers/6.19.14
deleted file mode 120000
index a4e1d3ec9c..0000000000
--- a/package/linux-headers/6.19.14
+++ /dev/null
@@ -1 +0,0 @@
-../../linux/from-6.17
\ No newline at end of file
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7e38fc161e..0c1a90f920 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -52,10 +52,6 @@ config BR2_KERNEL_HEADERS_6_18
 	bool "Linux 6.18.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18
 
-config BR2_KERNEL_HEADERS_6_19
-	bool "Linux 6.19.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_19
-
 config BR2_KERNEL_HEADERS_7_0
 	bool "Linux 7.0.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_0
@@ -478,7 +474,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.6.135"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.83"	if BR2_KERNEL_HEADERS_6_12
 	default "6.18.24"	if BR2_KERNEL_HEADERS_6_18
-	default "6.19.14"	if BR2_KERNEL_HEADERS_6_19
 	default "7.0.1"		if BR2_KERNEL_HEADERS_7_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
