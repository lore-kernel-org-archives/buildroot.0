Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4ABC5AC67
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 16:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3C8F60667;
	Sat,  8 Aug 2026 16:07:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7eKoofhpC9ML; Sat,  8 Aug 2026 16:07:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E06D56067D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786205232;
	bh=LhQdKgHLt29wJ8qg9c/7f/sN/zef7qn+LaNUHHEooc0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HYizO/tMNeRiCpjsrk8+1LprdG3DeXKSLZpzgJ+DcJERbsPc0fErRDZW2KLtBPTvB
	 BpLKDPR2H6ssz2siBEW4DBh2uTTmPBkLIJq/tSJPPFDN6aoEmiKZJWEk5Wse7/mGq7
	 BQ/p1uUEcM6Gd/iVZSuKNJJhsOQzyGLjl5aMwxzCYpxgFx2H/9mzRb3aEo94EglY/B
	 wmVukl562AS9ppy5olGvHpciIe3smMcjGN/NKBPHT5Mg70YsdtI2eQ+sSFjCjFgPV4
	 1DjhZDN/9T66nVArmKNdhG92q6VCXO0o+ZGIqtrMbGcleNrNqHxBmZSsM3XG5rN2+e
	 2/ZbP4B0cONBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E06D56067D;
	Sat,  8 Aug 2026 16:07:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A0409296
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 16:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 922204061A
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 16:07:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a5DFbvICDUG3 for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 16:07:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF93B4060F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF93B4060F
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 16:07:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C35C8CA4E; Sat,  8 Aug 2026 16:06:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 8 Aug 2026 18:05:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 55fb101003c1922b1f63f4e0463d56484e3b8410
X-Git-Newrev: 7343017dcd4debb020b079d74a1c94f552058961
X-Patchwork-Hint: ignore
Message-Id: <20260808160622.8C35C8CA4E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sexpect: bump to version 2.4.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7343017dcd4debb020b079d74a1c94f552058961
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changes:
https://github.com/clarkwang/sexpect/compare/v2.3.15...v2.4.0

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sexpect/sexpect.hash | 2 +-
 package/sexpect/sexpect.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sexpect/sexpect.hash b/package/sexpect/sexpect.hash
index ce1232de82..3c8f2b2265 100644
--- a/package/sexpect/sexpect.hash
+++ b/package/sexpect/sexpect.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  44f5711aa99f3ccf9c4b0edfcd9a7d25fa64b442574624ce451713d1532c1a7e  sexpect-2.3.15.tar.gz
+sha256  8f7a989ecf67f4ff6eb167d29a8e2e54db85143ebf3e8f904ea16ee5576a4b0d  sexpect-2.4.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/sexpect/sexpect.mk b/package/sexpect/sexpect.mk
index bbc84c1ca6..0ca4d39bec 100644
--- a/package/sexpect/sexpect.mk
+++ b/package/sexpect/sexpect.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SEXPECT_VERSION = 2.3.15
+SEXPECT_VERSION = 2.4.0
 SEXPECT_SITE = $(call github,clarkwang,sexpect,v$(SEXPECT_VERSION))
 SEXPECT_LICENSE = GPL-3.0
 SEXPECT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
