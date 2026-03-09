Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253C1FCA17B
	for <buildroot@archiver.kernel.org>; Mon,  9 Mar 2026 19:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4B4040C26;
	Mon,  9 Mar 2026 19:42:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eMnbls6FeCdA; Mon,  9 Mar 2026 19:42:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CFB740BF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773085335;
	bh=L5g9/4t82re23LZGd6A3CGqo2KrlvlzovabFo6txvXU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mjePs0czGqTs+uua9a7vrEjAFQ8r5Qk/yTNlr9cYaUCO2oGPVHLByPcF7twlgww0A
	 L1iQM1z1+1ytgHZMPhhUQfftMe3wrruc0TJrdVjWJ3ggiIDhN9yVkt19OrcL8RLRsN
	 TEw1+H8pNtRRb/Z8oRvKQmoyKDGxQKcGLRXCwM7qmxHkRI3YJO5Tk0/QJv8w3B4W8T
	 qdcddJLFuzHmEDE4M/GK100s+EX/GKXYpZ1x21uyX627Fdz11qoR/ZNJaEBWkNZE+w
	 wW0vgTQkcEdU1xStyVVGQrF747RKONjx2Z1TCOCB/j5I9KJENREG5CbQ8CuPsDsXUx
	 y0/o9ZuFfLCWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CFB740BF6;
	Mon,  9 Mar 2026 19:42:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F857B8
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 19:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E94E440627
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 19:42:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UvFWE_NAVnTx for <buildroot@buildroot.org>;
 Mon,  9 Mar 2026 19:42:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37CCF401E7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37CCF401E7
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 19:42:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4843886256; Mon,  9 Mar 2026 19:42:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 9 Mar 2026 20:36:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7dfd2feb445c2cf83a2b52057fab96e72e42a071
X-Git-Newrev: 7821851f00f905db215998a423b4886b68e88f55
X-Patchwork-Hint: ignore
Message-Id: <20260309194212.4843886256@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tbtools: bump to version 0.8.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7821851f00f905db215998a423b4886b68e88f55
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update to the latest release of tbtools. For change log, see:
https://github.com/intel/tbtools/compare/v0.6.0...v0.8.0

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/tbtools/tbtools.hash | 2 +-
 package/tbtools/tbtools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tbtools/tbtools.hash b/package/tbtools/tbtools.hash
index f62d3c36d6..a66ae15e63 100644
--- a/package/tbtools/tbtools.hash
+++ b/package/tbtools/tbtools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3fd91206483884f44ef757343f68c9acf91817ebbcdf4c0f6821a3734eb54984  tbtools-0.6.0-cargo4.tar.gz
+sha256  114c0dfb3f30cc491c9fcb583adf0f8b356268d8207bfc8c73a5bffe990e0c6a  tbtools-0.8.0-cargo4.tar.gz
 sha256  9b16a3add311d607af8d9b348a842a37840d0f47dfcc6cf2a7756ee02c24ed69  LICENSE
diff --git a/package/tbtools/tbtools.mk b/package/tbtools/tbtools.mk
index 3031b86144..ed5ead332d 100644
--- a/package/tbtools/tbtools.mk
+++ b/package/tbtools/tbtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TBTOOLS_VERSION = 0.6.0
+TBTOOLS_VERSION = 0.8.0
 TBTOOLS_SITE = $(call github,intel,tbtools,v$(TBTOOLS_VERSION))
 TBTOOLS_LICENSE = MIT
 TBTOOLS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
