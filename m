Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA05EF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68E6341E48;
	Fri, 13 Feb 2026 19:36:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fFLZRYMuFDT8; Fri, 13 Feb 2026 19:36:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EF7A41EB8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011417;
	bh=9w8p3Aza2TXAkdmtMTRTVNSx2xXAI64+gjlznAln6Cs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ara00aL2pQ6uwFIg1bw4+ixYJVGskW0dtEdLOsNJp0ngzYPJnT6c9JQVxWYT9Sosm
	 Lmw22swPjr4w9Pdzu3GJrs2CYZKpAk6QpwKVc0eqk7FyKL+HfCUcxuDvOhTeJ9hnyq
	 5oxkLPZUyh0yum+AVW+NixyJxDx1z8rmNUojo+/T+DGZO/ugu2CjA0dq2vWOA/fwuY
	 s8rZ/XkUJ7v1A8col9BYMzv2Fwyz3FU5Z7nEZBi606B0Qyh7+J8kH9KR0DKVYY3Hzy
	 pnizJ+XhUfG7CYaASzqJn+bNdNBVey0tBFwgclGj8yONVrc2f0973LAAgVFdJdsmjr
	 73T9TJV0wdEog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EF7A41EB8;
	Fri, 13 Feb 2026 19:36:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 10942283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC85A8455F
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V-jRBm3lDDHj for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA4C08456C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA4C08456C
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F97B83545; Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:32:03 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6ce14a3faebf5c3f927f98d480d5b7a81afd7445
X-Git-Newrev: 07b60c2d54ebacfdf27a9340bd50d739241575b4
X-Patchwork-Hint: ignore
Message-Id: <20260213193529.9F97B83545@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/uclibc: rename
 UCLIBC_INSTALL_UTILS_STAGING to UCLIBC_INSTALL_HOST_UTILS
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/07b60c2d54ebacfdf27a9340bd50d739241575b4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The UCLIBC_INSTALL_UTILS_STAGING is really badly named, as it doesn't
install anything to STAGING_DIR. Instead, it installs the host variant
of ldd and ldconfig into $(HOST_DIR)/bin. Therefore, rename it to
UCLIBC_INSTALL_HOST_UTILS.

This is important as a follow-up commit will re-introduce a
UCLIBC_INSTALL_UTILS_STAGING variable which really installs things
into STAGING_DIR.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 026c635508cf9518b20cfd76350a01b2d0f57a5c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/uclibc/uclibc.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index e1cf12fa68..dea5445b16 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -463,7 +463,7 @@ endef
 
 # STATIC has no ld* tools, only getconf
 ifeq ($(BR2_STATIC_LIBS),)
-define UCLIBC_INSTALL_UTILS_STAGING
+define UCLIBC_INSTALL_HOST_UTILS
 	$(INSTALL) -D -m 0755 $(@D)/utils/ldd.host $(HOST_DIR)/bin/ldd
 	ln -sf ldd $(HOST_DIR)/bin/$(GNU_TARGET_NAME)-ldd
 	$(INSTALL) -D -m 0755 $(@D)/utils/ldconfig.host $(HOST_DIR)/bin/ldconfig
@@ -478,7 +478,7 @@ define UCLIBC_INSTALL_STAGING_CMDS
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=/ \
 		install_runtime install_dev
-	$(UCLIBC_INSTALL_UTILS_STAGING)
+	$(UCLIBC_INSTALL_HOST_UTILS)
 endef
 
 # Checks to give errors that the user can understand
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
