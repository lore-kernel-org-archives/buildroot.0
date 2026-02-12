Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F02DEF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF0AB41E5F;
	Fri, 13 Feb 2026 19:35:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3XnfHu85ECmi; Fri, 13 Feb 2026 19:35:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1667541E70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011345;
	bh=PZ+F5WqH2VFZY/XdJLzf4O8CQhdZIl2mfZnvPGtyk+s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IS57JmoStT/2NUb8P5tEcRKGND55YJmQc0exOoa5k+mRFl1Uj6kCMjTNXs4Vd33qw
	 /QniUSWqc2kSyHpK0PDLC4GzFHkzGCsA6DtlGsaXTmW/D9x7znEwQI5O/2iXZgOqt4
	 ufetIqxkE5K2FroDd9ytqa8njhtimKmZGdDfuiFuAqU4XCVRGljERkzO88ntXnwFLj
	 yOyxcAhkmgLOCwXRkaGiMdQpYACzk7QcvsklShrmVdNk6kE+2ciZ3u8azFVjCUhCez
	 r5UEMjtiRUBG6imMwcfT/opIqGUwHSYX6zSbKmGpEbheMF5zpsBuCdxTnViGtDOTuY
	 xmwQ+E+cxoxvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1667541E70;
	Fri, 13 Feb 2026 19:35:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F579283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 387ED84545
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NB5hLK0sfiyk for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7ECC844FD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7ECC844FD
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD45485F11; Fri, 13 Feb 2026 19:35:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:26:15 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 291c3360a6fe9803683d3e469fc4f044ad9e3aa0
X-Git-Newrev: 46f8c7115ad2229b8f43835d951c1a8f0059e7b8
X-Patchwork-Hint: ignore
Message-Id: <20260213193526.DD45485F11@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] linux: Add support for
 custom license files
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/46f8c7115ad2229b8f43835d951c1a8f0059e7b8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The Linux package was not providing any license file when a custom
Linux version was selected.

Fix this by adding a Kconfig option to specify the license file,
with a default value set to the commonly used license paths.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
[Arnout: use a single Kconfig option with conditional prompt]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 50958bcdac6775be5d0c36bb867bbac7a7eb2e49)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 linux/Config.in | 8 ++++++++
 linux/linux.mk  | 8 ++------
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 7e2207e995..5ba117c212 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -146,6 +146,14 @@ config BR2_LINUX_KERNEL_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION \
 		if BR2_LINUX_KERNEL_CUSTOM_GIT || BR2_LINUX_KERNEL_CUSTOM_HG || BR2_LINUX_KERNEL_CUSTOM_SVN
 
+config BR2_LINUX_KERNEL_LICENSE_FILES
+	string "Kernel license files" if BR2_LINUX_KERNEL_CUSTOM_GIT || BR2_LINUX_KERNEL_CUSTOM_HG || \
+		BR2_LINUX_KERNEL_CUSTOM_SVN || BR2_LINUX_KERNEL_CUSTOM_TARBALL
+	default "COPYING LICENSES/preferred/GPL-2.0 LICENSES/exceptions/Linux-syscall-note"
+	help
+	  A space-separated list of license files related to the Linux
+	  kernel package.
+
 #
 # Patch selection
 #
diff --git a/linux/linux.mk b/linux/linux.mk
index 16762ac2e6..65affbfa7f 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -6,12 +6,8 @@
 
 LINUX_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
 LINUX_LICENSE = GPL-2.0
-ifeq ($(BR2_LINUX_KERNEL_LATEST_VERSION),y)
-LINUX_LICENSE_FILES = \
-	COPYING \
-	LICENSES/preferred/GPL-2.0 \
-	LICENSES/exceptions/Linux-syscall-note
-endif
+LINUX_LICENSE_FILES = $(call qstrip,$(BR2_LINUX_KERNEL_LICENSE_FILES))
+
 LINUX_CPE_ID_VENDOR = linux
 LINUX_CPE_ID_PRODUCT = linux_kernel
 LINUX_CPE_ID_PREFIX = cpe:2.3:o
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
