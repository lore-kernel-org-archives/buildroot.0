Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FA2FC9EFE
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 14:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 737066100A;
	Sat,  7 Mar 2026 14:38:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xhnQdfgaIyVt; Sat,  7 Mar 2026 14:38:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F93C60FE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772894281;
	bh=8TotkE97+rJCrB2p5oZoDrcJgczOCkXiMm7o+amNmxE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ii6zoH9/UPBVN8NpYEnHUgL6HtLoL3xd8CKp4TbyIaP+O4oDS68Nf2OOlM+UgpOzY
	 O12to7X7VZcNB9OIqZpO7c+vE1ETL+fmyBLVEUr8m6etoPba4l2PoNgOeLAGFXE8/r
	 2q+7kaBRhnFv17iFMZHdNOcgAetHWNov7mZT+h9cU8/e1WQXU5+Wi3tEwQbo79y6pT
	 VbgaK8WH8wtnKordvilH2qkt7HDCxFMzbkRvJ0aZ4h9oSTh+2J9E9d3F3XTxQGKSIl
	 9mg8f+DhjgPxpz6itdZknnvH87eUJP+WgNkCd3/7nOMyYWqTwSmYARAwu2pHe9PaGN
	 hgj6aHkmQkMRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F93C60FE4;
	Sat,  7 Mar 2026 14:38:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 00778223
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 14:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F25CA41CCF
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 14:37:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IQV72VDEl4VB for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 14:37:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5432F41CCC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5432F41CCC
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 14:37:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6707685DCC; Sat,  7 Mar 2026 14:37:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Mar 2026 15:33:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: be3837ea3fc93fc4b8519afd8cf15f78aa609298
X-Git-Newrev: 3506c8a0f8d32ce7b6fcba517d5222eba7086799
X-Patchwork-Hint: ignore
Message-Id: <20260307143759.6707685DCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linenoise: bump to version 2.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3506c8a0f8d32ce7b6fcba517d5222eba7086799
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/linenoise/linenoise.hash | 2 +-
 package/linenoise/linenoise.mk   | 6 +-----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/linenoise/linenoise.hash b/package/linenoise/linenoise.hash
index 3f82ba0ff9..3c6774c132 100644
--- a/package/linenoise/linenoise.hash
+++ b/package/linenoise/linenoise.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d5e702e7e04f0fcd09393bd4c010ce2bb19b4d137e22f2dd6064e848f4a6b5b2  linenoise-e26268de5e56bfaad773786471844578fe9f7f4b.tar.gz
+sha256  97ad7d4041e11d7fa395819fd773c1892dea89e5292342378a8345692ce89c29  linenoise-2.0.tar.gz
 sha256  efe1692aa5b869edaa0ac88f95eb0276c1125304ffc636a299db3ebbab47f62b  LICENSE
diff --git a/package/linenoise/linenoise.mk b/package/linenoise/linenoise.mk
index 29bed3ce4f..ac8d9aa799 100644
--- a/package/linenoise/linenoise.mk
+++ b/package/linenoise/linenoise.mk
@@ -4,19 +4,15 @@
 #
 ################################################################################
 
-LINENOISE_VERSION = e26268de5e56bfaad773786471844578fe9f7f4b
+LINENOISE_VERSION = 2.0
 LINENOISE_SITE = $(call github,antirez,linenoise,$(LINENOISE_VERSION))
 LINENOISE_LICENSE = BSD-2-Clause
 LINENOISE_LICENSE_FILES = LICENSE
 LINENOISE_CPE_ID_VENDOR = antirez
-LINENOISE_CPE_ID_VERSION = 1.0
 LINENOISE_INSTALL_STAGING = YES
 # Static library only, nothing to install on target
 LINENOISE_INSTALL_TARGET = NO
 
-# Fixed in https://github.com/antirez/linenoise/commit/880b94130ffa5f8236392392b447ff2234b11983
-LINENOISE_IGNORE_CVES += CVE-2025-9810
-
 define LINENOISE_BUILD_CMDS
 	cd $(@D); $(TARGET_CC) $(TARGET_CFLAGS) -c linenoise.c
 	cd $(@D); $(TARGET_AR) rcu liblinenoise.a linenoise.o
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
