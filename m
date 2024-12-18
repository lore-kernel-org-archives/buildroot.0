Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B87C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5428F4F756;
	Fri, 28 Feb 2025 16:41:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SPcXqU_YZzI1; Fri, 28 Feb 2025 16:41:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 917CD4F763
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 917CD4F763;
	Fri, 28 Feb 2025 16:41:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 116F968
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 997F4419B6
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zWdHaNrgKjaA for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F40EB424E5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F40EB424E5
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EF0D5820F8; Fri, 28 Feb 2025 16:29:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Dec 2024 20:28:42 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ca3cf2bea272bb0e0833c7fd2ec8f0fa28387692
X-Git-Newrev: c583befc8e92d0ae70d4fcb967bf8257ea94d577
X-Patchwork-Hint: ignore
Message-Id: <20250228162942.EF0D5820F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] boot/opensbi: bump to version
 1.5
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c583befc8e92d0ae70d4fcb967bf8257ea94d577
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For release notes since version 1.3, see:
https://github.com/riscv-software-src/opensbi/releases/tag/v1.5
https://github.com/riscv-software-src/opensbi/releases/tag/v1.4

This commit also updates the package home page url and the
download _SITE to reflect the change of github account from "riscv"
to "riscv-software-src".

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 boot/opensbi/Config.in    | 6 +++---
 boot/opensbi/opensbi.hash | 2 +-
 boot/opensbi/opensbi.mk   | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/opensbi/Config.in b/boot/opensbi/Config.in
index de2f0aae20..7604be29d9 100644
--- a/boot/opensbi/Config.in
+++ b/boot/opensbi/Config.in
@@ -10,7 +10,7 @@ config BR2_TARGET_OPENSBI
 	  System-on-Chip vendors to fit a particular hadware
 	  configuration.
 
-	  https://github.com/riscv/opensbi.git
+	  https://github.com/riscv-software-src/opensbi
 
 if BR2_TARGET_OPENSBI
 choice
@@ -19,7 +19,7 @@ choice
 	  Select the specific OpenSBI version you want to use
 
 config BR2_TARGET_OPENSBI_LATEST_VERSION
-	bool "1.3"
+	bool "1.5"
 
 config BR2_TARGET_OPENSBI_CUSTOM_VERSION
 	bool "Custom version"
@@ -57,7 +57,7 @@ endif
 
 config BR2_TARGET_OPENSBI_VERSION
 	string
-	default "1.3" if BR2_TARGET_OPENSBI_LATEST_VERSION
+	default "1.5" if BR2_TARGET_OPENSBI_LATEST_VERSION
 	default BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_OPENSBI_CUSTOM_VERSION
 	default "custom" if BR2_TARGET_OPENSBI_CUSTOM_TARBALL
diff --git a/boot/opensbi/opensbi.hash b/boot/opensbi/opensbi.hash
index 980fb141dc..c69bcf7150 100644
--- a/boot/opensbi/opensbi.hash
+++ b/boot/opensbi/opensbi.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  2c0501eb3475f463b15f5b8531996f64604ea49e0e3ed040ecbd1fc27ecd8c5c  opensbi-1.3.tar.gz
+sha256  9880485672a3a2c48a81d373df6707517b568402f2d3f9eecbfa9d83f8e6f22f  opensbi-1.5.tar.gz
 sha256  82d13fb1bf6bb162629deeea9eb9c117e74548d3b707e478967691fe79a68e21  COPYING.BSD
diff --git a/boot/opensbi/opensbi.mk b/boot/opensbi/opensbi.mk
index dd113a0bf8..0142769a12 100644
--- a/boot/opensbi/opensbi.mk
+++ b/boot/opensbi/opensbi.mk
@@ -16,7 +16,7 @@ OPENSBI_SITE = $(call qstrip,$(BR2_TARGET_OPENSBI_CUSTOM_REPO_URL))
 OPENSBI_SITE_METHOD = git
 else
 # Handle official OpenSBI versions
-OPENSBI_SITE = $(call github,riscv,opensbi,v$(OPENSBI_VERSION))
+OPENSBI_SITE = $(call github,riscv-software-src,opensbi,v$(OPENSBI_VERSION))
 endif
 
 OPENSBI_LICENSE = BSD-2-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
