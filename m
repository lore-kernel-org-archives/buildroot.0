Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F7BC5AD5A
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 15:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A90C605B5;
	Sat, 15 Aug 2026 15:09:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fKmxMaU_tpRM; Sat, 15 Aug 2026 15:09:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF32B60617
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786806583;
	bh=JJfCiqjAuiHspE2CchcE1cOXBPmyRx0W5WhNbDaH+YQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eXdyXOOfo6SPNJXI9uTDNVmQSyhWmnTfV+UsjNE52LRXebJmOQcn2Wi1fUWvZ8xg+
	 cMlyHl9kwlwqEPBvZtKKKwpXuXzYvJ8yBDULIfllkDJS7o43hpZhLTGPH2R7xh1ft7
	 5XIXSjqTabtVhE87oYz7Wd/hJkgxwzyefumXIA7MCX/9YXFbVchGxAMPe0MEejVw0F
	 FGkfcG1Ic6uJIXOk593uh5hfIKT24E26lCpm3zKAJC4gxGsTabCN0LGDfGDRESGUry
	 kyGCi85JuYkQMW12ss8A+iPk0NxyUaCaAFuN93hnyEXzLqLm6IyDmO1qOiStuCghcF
	 yrUtik8WR2TEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF32B60617;
	Sat, 15 Aug 2026 15:09:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9290C1393
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 15:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84B494008A
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 15:09:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YSP73dtWo4VD for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 15:09:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5007A40084
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5007A40084
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 15:09:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B621A8878A; Sat, 15 Aug 2026 15:08:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 15 Aug 2026 17:07:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 506830c40bccdc0b77fa6d1ada4f75724e1a4ce9
X-Git-Newrev: 0b3d526226662af8b16525aecec7da5ff0e5fa1d
X-Patchwork-Hint: ignore
Message-Id: <20260815150849.B621A8878A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdb: drop ARC-specific version
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0b3d526226662af8b16525aecec7da5ff0e5fa1d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
---
 Config.in.legacy           | 7 +++++++
 package/gdb/Config.in.host | 8 +-------
 package/gdb/gdb.hash       | 3 ---
 package/gdb/gdb.mk         | 7 -------
 4 files changed, 8 insertions(+), 17 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index fdfc50af42..4da157fbba 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.08"
 
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
index 0cc28ef7f0..93f174db99 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -46,15 +46,10 @@ config BR2_PACKAGE_HOST_GDB_SIM
 
 choice
 	prompt "GDB debugger Version"
-	default BR2_GDB_VERSION_16 if !BR2_arc
-	default BR2_GDB_VERSION_ARC if BR2_arc
+	default BR2_GDB_VERSION_16
 	help
 	  Select the version of gdb you wish to use.
 
-config BR2_GDB_VERSION_ARC
-	bool "gdb arc (15.x)"
-	depends on BR2_arc
-
 config BR2_GDB_VERSION_15
 	bool "gdb 15.x"
 
@@ -71,7 +66,6 @@ endif
 # If cross-gdb is not enabled, the latest stable version is chosen.
 config BR2_GDB_VERSION
 	string
-	default "arc-2024.12-release-gdb" if BR2_GDB_VERSION_ARC || (!BR2_PACKAGE_HOST_GDB && BR2_arc)
 	default "15.2"	   if BR2_GDB_VERSION_15
 	default "16.3"	   if BR2_GDB_VERSION_16
 	default "17.1"	   if BR2_GDB_VERSION_17
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index a0add73dca..241fe9c7c4 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -3,9 +3,6 @@ sha512  624007deceb5b15ba89c0725883d1a699fa46714ef30887f3d0165e17c5d65d634671740
 sha512  fffd6689c3405466a179670b04720dc825e4f210a761f63dd2b33027432f8cd5d1c059c431a5ec9e165eedd1901220b5329d73c522f9a444788888c731b29e9c  gdb-16.3.tar.xz
 sha512  f1a6751e439a2128fecf3eae8b57c1608a0dc7cfe79b4356a937874e5a42bb2df0aba36eb6a9452c41966908b9a59076c7cad9720f684688ab956b65080f1d7c  gdb-17.1.tar.xz
 
-# Locally calculated (fetched from Github)
-sha512  a909a687abf6e9623c7ec99a8b2cbb03ab6fdeccee9ebd33ce34fffdb2bed5e4d519113aeb29ba3ca8db52e9bdbb63b59973914c74e3eebf4a4a2a6033b9e784  gdb-arc-2024.12-release-gdb.tar.gz
-
 # Locally calculated (fetched from gcc.gnu.org)
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING3
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 2a2fdb260d..685d1fe992 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -7,13 +7,6 @@
 GDB_VERSION = $(call qstrip,$(BR2_GDB_VERSION))
 GDB_SITE = $(BR2_GNU_MIRROR)/gdb
 GDB_SOURCE = gdb-$(GDB_VERSION).tar.xz
-
-ifeq ($(BR2_GDB_VERSION_ARC),y)
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
