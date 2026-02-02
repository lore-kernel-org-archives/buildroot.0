Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0366FE7DF16
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 17:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3D346077A;
	Mon,  2 Feb 2026 17:44:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cuh5QZjPDkVt; Mon,  2 Feb 2026 17:44:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD42260D69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770054253;
	bh=Up4syF40GY9LTnDZngZgJ0Cexo02Llw9zxmHPc6A3g4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CQbDTS1SzwzrRdpx+CCwuQX4NvWIwt0qrf/H4kQb02BczRkboKC7opoZBCjG6vd6R
	 Xn0b5szRIqZiGAPmNIP1NjGKiX0u0uYIntlNR/Xi4r3nfI3Ij+gXM2NOliokxThCkn
	 J6mXqxA0wa9QFGL1E68aPKqjwycu+yu/p7NBUuvbGymLoT51TwDIm6IhHrvuMCdBNJ
	 imib4f3NLnFJRGIRfX8EaufBT5yLFixDnt4lJESU2r+ccTPepaIUiDQpi+8+uyvL+X
	 n5d4OxYWCzFkdXPQUuoQU+fbIY1ip+pM8ZbBMRqHnilo6vjfAA8tuZejlHc9eE1qTO
	 Kd4O7reSMV17A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD42260D69;
	Mon,  2 Feb 2026 17:44:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F55D34E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB331821C0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:44:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TXFezO1Vfyvj for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 17:44:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3B5B82250
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3B5B82250
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:44:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D9DEB8645C; Mon,  2 Feb 2026 17:44:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 18:43:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d9999aeec913bbf8dedf96d8dabf07591838a0aa
X-Git-Newrev: d94762640e7234ef60dbc5a8ed7380fa3549b24e
X-Patchwork-Hint: ignore
Message-Id: <20260202174403.D9DEB8645C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-headers: Add support for
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d94762640e7234ef60dbc5a8ed7380fa3549b24e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The linux-headers package was not providing any license file for any
version other than the latest one.

Fix this by adding a Kconfig option to specify the license file,
with a default value set to the commonly used license paths.

For the headers-as-kernel case, use LINUX_LICENSE_FILES and disable the
Kconfig option entirely.

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/linux-headers/Config.in.host   | 10 ++++++++++
 package/linux-headers/linux-headers.mk |  7 +------
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index c80ff97208..8f59dc89e2 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -466,3 +466,13 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
 		if BR2_KERNEL_HEADERS_CUSTOM_GIT
+
+config BR2_PACKAGE_HOST_LINUX_HEADERS_LICENSE_FILES
+	string "Kernel headers license files" if BR2_KERNEL_HEADERS_VERSION || \
+		BR2_KERNEL_HEADERS_CUSTOM_TARBALL || \
+		BR2_KERNEL_HEADERS_CUSTOM_GIT
+	default BR2_LINUX_KERNEL_LICENSE_FILES if BR2_KERNEL_HEADERS_AS_KERNEL
+	default "COPYING LICENSES/preferred/GPL-2.0 LICENSES/exceptions/Linux-syscall-note"
+	help
+	  A space-separated list of license files related to the Linux
+	  kernel headers.
diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index b4b5a5b47d..15724090ce 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -111,12 +111,7 @@ endif
 LINUX_HEADERS_DL_SUBDIR = linux
 
 LINUX_HEADERS_LICENSE = GPL-2.0
-ifeq ($(BR2_KERNEL_HEADERS_LATEST),y)
-LINUX_HEADERS_LICENSE_FILES = \
-	COPYING \
-	LICENSES/preferred/GPL-2.0 \
-	LICENSES/exceptions/Linux-syscall-note
-endif
+LINUX_HEADERS_LICENSE_FILES = $(call qstrip,$(BR2_PACKAGE_HOST_LINUX_HEADERS_LICENSE_FILES))
 LINUX_HEADERS_CPE_ID_VENDOR = linux
 LINUX_HEADERS_CPE_ID_PRODUCT = linux_kernel
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
