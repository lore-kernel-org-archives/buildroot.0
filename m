Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5BB8FED3EA
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAD9442970;
	Fri, 24 Apr 2026 16:38:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VFchglKVoBaf; Fri, 24 Apr 2026 16:38:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C96AB42985
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777048722;
	bh=yzS8aFdFFLve0+WQLdF12zVp/ZEIYOVxiaWMx3CTGM4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=M0ndmAXmXiX19kgv7T2dZB4AN61Cpg09GWA7Tr/IZaU08eBbzUTmV6jfJ4Ce8n7uz
	 X9ps0rr0pWbZPnyqUU62kTpns0sau6awHXM9nKLsjGooMay6Y/LMyeMVvmGK5hmUcM
	 xYVW+8wNUoupQnShtL2rUYc585edxqUZ0MHKsip0vS/+8RLiwT1ZZiSb0tYGwlHVQ1
	 1gtz5gn+u+v3dJx/jTYTXZ/Px5dS5r6zcAXEWhPm9c16nvtXYddDoDplOXYI4Bz8EP
	 pnonczPtenG4IsRGtjptpRn2m+b6nN3UBkMxZ2V5Da5dqqxZSWeJlZN2WKoDQxl2Ls
	 Hk9aoeEwTUwtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C96AB42985;
	Fri, 24 Apr 2026 16:38:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9ABA2231
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC253423E9
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:38:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t2zinuh6uNp5 for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:38:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0C52423EC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0C52423EC
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:38:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A70E82B36; Fri, 24 Apr 2026 16:38:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Apr 2026 14:22:00 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: ceb27f0f04dbb6933ddac42eb7eb44ceaef438d4
X-Git-Newrev: b6474fc1c4a15f48695a989761ad95c573850fa1
X-Patchwork-Hint: ignore
Message-Id: <20260424163825.4A70E82B36@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/wolftpm: security
 bump version to 3.10.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b6474fc1c4a15f48695a989761ad95c573850fa1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://github.com/wolfSSL/wolfTPM/blob/v3.10.0/ChangeLog.md

Version 3.9.2 fixes CVE-2025-7844:
https://github.com/wolfSSL/wolfTPM/pull/427

Upstream switched from GPL-2.0+ to GPL-3.0+ with version 3.9.2:
https://github.com/wolfSSL/wolfTPM/commit/1402d0d132aef7d52569ee17d19fb6b04b57074e

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 482a8e61facd22de81cfb8faf59b66f4a15f4c85)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/wolftpm/wolftpm.hash | 4 ++--
 package/wolftpm/wolftpm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wolftpm/wolftpm.hash b/package/wolftpm/wolftpm.hash
index 33d0aa2414..1875a11666 100644
--- a/package/wolftpm/wolftpm.hash
+++ b/package/wolftpm/wolftpm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b4f6c090cad7fdbd4fd976f1bd8f271694669459b240fa14bec60a89b749dc1b  wolftpm-3.1.0.tar.gz
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
+sha256  b77ebfdf66dfa5e8881056c9512a6ab7d4ff8d0a920c36fc1eb311bd7f1882df  wolftpm-3.10.0.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/wolftpm/wolftpm.mk b/package/wolftpm/wolftpm.mk
index 4d1d459801..f1b0891277 100644
--- a/package/wolftpm/wolftpm.mk
+++ b/package/wolftpm/wolftpm.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-WOLFTPM_VERSION = 3.1.0
+WOLFTPM_VERSION = 3.10.0
 WOLFTPM_SITE = $(call github,wolfSSL,wolfTPM,v$(WOLFTPM_VERSION))
 WOLFTPM_INSTALL_STAGING = YES
-WOLFTPM_LICENSE = GPL-2.0+
+WOLFTPM_LICENSE = GPL-3.0+
 WOLFTPM_LICENSE_FILES = LICENSE
 WOLFTPM_CONFIG_SCRIPTS = wolftpm-config
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
