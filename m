Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B441C5DF94
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6D6F812DE;
	Fri, 21 Aug 2026 15:07:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zAse0ZhguD79; Fri, 21 Aug 2026 15:07:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787324868;
	bh=YEZ1MLKkQqM/ixTVffhpnKrn0QmQRdUDfeiJYcY6+dQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cmB7qBwCVr6fY9J9GIj/Z0wmleBxO1Lplsxax/hrID9NR+v76nExVUTNmo+3sxvHw
	 Ta4JJSQdkimVndxp8b/2k1gUUZV7tF7a/CQxgyq/iosURQITilvqwBDJWRmAFG/uDa
	 35/xQ23hTBwsc2NsbcX4m127A65t5s+YvbB9ivLOcyLrOCHb7Kc3sCH0FuB52/U8C7
	 9pX/GBTU0MpmdeGxu9ez1pSHff5K39PxTjKadn52V3zefYEZ8rga2LN5t6sBBHj0s6
	 ns4jWrjIG1W846jnky+Gin77mja+jkVPOyFbyYyh79f4bqXOwDNn/GVK8pqQM8pyXZ
	 eFzLKkK3kFWxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 323A1812BA;
	Fri, 21 Aug 2026 15:07:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C655EA3
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81D266063E
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gvnwIVkwrhw4 for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:07:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8F5260666
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2CED58E150; Fri, 21 Aug 2026 15:06:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Aug 2026 17:04:28 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 28b028fceaa983fb8ea22e33dd85dff9cfb4968e
X-Git-Newrev: 7abb4198336547688a770d57a9b5e765e2ce0f35
X-Patchwork-Hint: ignore
Message-Id: <20260821150615.2CED58E150@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/gdb: drop
 ARC-specific version
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7abb4198336547688a770d57a9b5e765e2ce0f35
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

A warning was sent to Synopsys ARC people in December 2025 that the
ARC support in Buildroot was poorly maintained and in particular the
ARC-pspecific toolchain components. Despite a reply that some effort
would be made [1], no contributions were actually done. Also, Alexey
Brodkin is no longer at Synopsys. Time to remove Synopsys ARC specific
toolchain and toolchain components.

This commit removes the ARC-specific gdb version.

[1] https://lore.kernel.org/buildroot/SJ2PR12MB818487232470DA4456967C73A1A3A@SJ2PR12MB8184.namprd12.prod.outlook.com/

Cc: ARC Maintainers <arc-buildroot@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 0b3d526226662af8b16525aecec7da5ff0e5fa1d)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 Config.in.legacy           | 7 +++++++
 package/gdb/Config.in.host | 2 --
 package/gdb/gdb.hash       | 3 ---
 package/gdb/gdb.mk         | 6 ------
 4 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 5219e2a33e..c06d8faf81 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.02.17"
 
+config BR2_GDB_VERSION_ARC
+	bool "ARC-specific gdb version removed"
+	select BR2_LEGACY
+	help
+	  Support for the ARC-specific gdb version was removed, as it
+	  was no longer maintained in Buildroot.
+
 config BR2_BINUTILS_VERSION_ARC
 	bool "ARC-specific binutils version removed"
 	select BR2_LEGACY
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 54247ad642..d1aa2afcd7 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -42,7 +42,6 @@ config BR2_PACKAGE_HOST_GDB_SIM
 choice
 	prompt "GDB debugger Version"
 	default BR2_GDB_VERSION_15
-	depends on !BR2_arc
 	help
 	  Select the version of gdb you wish to use.
 
@@ -68,7 +67,6 @@ endif
 # If cross-gdb is not enabled, the latest stable version is chosen.
 config BR2_GDB_VERSION
 	string
-	default "arc-2023.09-release" if BR2_arc
 	default "14.2"     if BR2_GDB_VERSION_14 || (!BR2_PACKAGE_HOST_GDB && !BR2_TOOLCHAIN_GCC_AT_LEAST_9)
 	default "15.2"	   if BR2_GDB_VERSION_15 || (!BR2_PACKAGE_HOST_GDB && BR2_TOOLCHAIN_GCC_AT_LEAST_9)
 	default "16.3"	   if BR2_GDB_VERSION_16
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 8bef9cd374..b4338e4c31 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -3,9 +3,6 @@ sha512  7e07941f1fe661288cc571b4964012ceabc1760624fce20320db2f470c01439b2386f859
 sha512  624007deceb5b15ba89c0725883d1a699fa46714ef30887f3d0165e17c5d65d634671740a135aa69e437d916218abb08cfa2a38ed309ff19d48f51da56b2a8ba  gdb-15.2.tar.xz
 sha512  fffd6689c3405466a179670b04720dc825e4f210a761f63dd2b33027432f8cd5d1c059c431a5ec9e165eedd1901220b5329d73c522f9a444788888c731b29e9c  gdb-16.3.tar.xz
 
-# Locally calculated (fetched from Github)
-sha512  3518b47d5c11d1fb478ee152bde1719363f9391db73f3b9f5491217c17742bef8ebca6a51a40302dfaa9476c5a32a8b8f70a4bf64289422dea5f750ae53ab88d  gdb-arc-2023.09-release.tar.gz
-
 # Locally calculated (fetched from gcc.gnu.org)
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING3
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 4a00a29ef7..425619165e 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -8,12 +8,6 @@ GDB_VERSION = $(call qstrip,$(BR2_GDB_VERSION))
 GDB_SITE = $(BR2_GNU_MIRROR)/gdb
 GDB_SOURCE = gdb-$(GDB_VERSION).tar.xz
 
-ifeq ($(GDB_VERSION),arc-2023.09-release)
-GDB_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(GDB_VERSION))
-GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
-GDB_FROM_GIT = y
-endif
-
 GDB_LICENSE = GPL-2.0+, LGPL-2.0+, GPL-3.0+, LGPL-3.0+
 GDB_LICENSE_FILES = COPYING COPYING.LIB COPYING3 COPYING3.LIB
 GDB_CPE_ID_VENDOR = gnu
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
