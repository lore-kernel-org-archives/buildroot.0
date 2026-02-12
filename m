Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA78EF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80B8341F8F;
	Fri, 13 Feb 2026 19:38:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o4ixpkSZnxRL; Fri, 13 Feb 2026 19:37:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B0CC41FC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011479;
	bh=oANaZDdN9Bq3yHTWExuBFUHcKTmdUvLOraNpe9ZXpkY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UAFRmQ1xlBii6bAlvQFSjBnJWfERGGDlvnaS5/Iiiwrzt2whHGlrSw7qIdPtm8Di1
	 vuUOuRyO+hr4MfAMbaTMQ/9k0vkFTSmuK4wVsSxsQ0gjZQ+kQgdIJhQiFfVpLiuwry
	 VQBdJNmXxTlkxIRQ6r2FmVfjX5dMGqoJ66GSo/6kWtBcf/oHsFGX4YNe7XL0jS4C1u
	 231jevU6vmw7ciT44jWhBdqLIAU62VK9K0pjWZ6CoI3A2Znkf9F0AiJrqPY2LJ9UVy
	 Bq2sAWh4ggLOUzMQR85Rn3DjKNMlcj20Mz2cSrEPBLhKuGcrJk8UYQXHrWUNjXv5oY
	 MImtwmjTce7Sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B0CC41FC8;
	Fri, 13 Feb 2026 19:37:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CA188283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77F1C413B3
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1UwW0n8HKjkN for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CB79412D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CB79412D1
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1182380462; Fri, 13 Feb 2026 19:37:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:30:55 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: ace5081baef93fe82ebf3bd32ad3349534e8e79d
X-Git-Newrev: dfa22b574f346ed481728e1a5b9c5b2bf9c7e07c
X-Patchwork-Hint: ignore
Message-Id: <20260213193702.1182380462@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/linux-headers:
 Add support for custom license files
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dfa22b574f346ed481728e1a5b9c5b2bf9c7e07c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

The linux-headers package was not providing any license file for any
version other than the latest one.

Fix this by adding a Kconfig option to specify the license file,
with a default value set to the commonly used license paths.

For the headers-as-kernel case, use LINUX_LICENSE_FILES and disable the
Kconfig option entirely.

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit d94762640e7234ef60dbc5a8ed7380fa3549b24e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/linux-headers/Config.in.host   | 10 ++++++++++
 package/linux-headers/linux-headers.mk |  7 +------
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 9fa1f2ffb7..9988e23b1c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -471,3 +471,13 @@ config BR2_DEFAULT_KERNEL_HEADERS
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
