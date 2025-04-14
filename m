Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16464C369B2
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 19:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDC9782115;
	Mon, 14 Apr 2025 19:44:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WgUTpdFMMys8; Mon, 14 Apr 2025 19:44:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4531881279
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4531881279;
	Mon, 14 Apr 2025 19:44:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DC9E4200
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 19:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE05440403
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 19:44:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3044ot3lOOub for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 19:44:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 020A440D57
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 020A440D57
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 19:44:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E241B846F3; Mon, 14 Apr 2025 19:44:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 14 Apr 2025 21:42:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2488d97719535a00797bef01caad7f449954c725
X-Git-Newrev: d39d9b53ec3a718b2b684739e1585352577b3f1f
X-Patchwork-Hint: ignore
Message-Id: <20250414194410.E241B846F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bmap-tools: bump to 3.9.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=d39d9b53ec3a718b2b684739e1585352577b3f1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream changelog:

https://github.com/yoctoproject/bmaptool/releases/tag/v3.9.0

Two important changes from a packaging point of view:

- Switch to using hatch to build
- Remove six from production code

So we do adjust our packaging accordingly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bmap-tools/Config.in       | 1 -
 package/bmap-tools/Config.in.host  | 1 -
 package/bmap-tools/bmap-tools.hash | 2 +-
 package/bmap-tools/bmap-tools.mk   | 4 ++--
 4 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/bmap-tools/Config.in b/package/bmap-tools/Config.in
index b5ccce786e..c71d6f6ea0 100644
--- a/package/bmap-tools/Config.in
+++ b/package/bmap-tools/Config.in
@@ -7,7 +7,6 @@ config BR2_PACKAGE_BMAP_TOOLS
 	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime, pkg_resources
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  Tool to flash image files to block devices using the block map
 	  bmaptool is a generic tool for creating the block map (bmap)
diff --git a/package/bmap-tools/Config.in.host b/package/bmap-tools/Config.in.host
index 499f9d177d..056e76f959 100644
--- a/package/bmap-tools/Config.in.host
+++ b/package/bmap-tools/Config.in.host
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_HOST_BMAP_TOOLS
 	bool "host bmap-tools"
 	select BR2_PACKAGE_HOST_PYTHON3 # runtime
-	select BR2_PACKAGE_HOST_PYTHON_SIX # runtime
 	help
 	  Tool to flash image files to block devices using the block map
 	  bmaptool is a generic tool for creating the block map (bmap)
diff --git a/package/bmap-tools/bmap-tools.hash b/package/bmap-tools/bmap-tools.hash
index 28a68e8b8e..0ead4ab1b1 100644
--- a/package/bmap-tools/bmap-tools.hash
+++ b/package/bmap-tools/bmap-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3c741ccdd5049b5cb6983bc186f7be8040a132ed7e9c2afda4d9e7390888163c  bmap-tools-3.8.0.tar.gz
+sha256  9940bb97fa0f2c11ee4625a2f620a4ae2b94c556f8d01c070aee08486a2a1812  bmap-tools-3.9.0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/bmap-tools/bmap-tools.mk b/package/bmap-tools/bmap-tools.mk
index 3c661cb9e2..b8dec2c774 100644
--- a/package/bmap-tools/bmap-tools.mk
+++ b/package/bmap-tools/bmap-tools.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-BMAP_TOOLS_VERSION = 3.8.0
+BMAP_TOOLS_VERSION = 3.9.0
 BMAP_TOOLS_SITE = $(call github,yoctoproject,bmaptool,v$(BMAP_TOOLS_VERSION))
 BMAP_TOOLS_LICENSE = GPL-2.0
 BMAP_TOOLS_LICENSE_FILES = LICENSE
-BMAP_TOOLS_SETUP_TYPE = poetry
+BMAP_TOOLS_SETUP_TYPE = hatch
 
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
