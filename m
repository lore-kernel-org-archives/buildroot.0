Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A50CD3430
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39F5D8468F;
	Mon,  4 May 2026 14:48:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gJuo8Jw-kw-C; Mon,  4 May 2026 14:48:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CD068469B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906116;
	bh=N8HCPLOq29Wj8q0WZoIiTS0twY7L6HUbNl8TqupUb3o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LFyf1qweWsOvzllezNB7SAjrB4Tu2aFs7yogLuMgU+9BpEiTDieEQ3qXhktOwYn0y
	 afStynR4cJVDDK5V+B98CtPkkIuJBl3PA3e7Tre45FQ+WdsV2PvuHF6pPKY+uSdlx5
	 oURF4Qe7euCHuKKw8YomI/iuhLvRp4jAZkKgkZPUfughcOCnO99bvO3lU7NPMYu1lQ
	 fNZCgwWPKBVnt8iUuNxWNTvJzX7zvdKWzZbhp/3JhzyGsioeBMwOWPXogRCpDKw2+I
	 3us4mhrki4770RYhe5lZpPR3NnLlMKRNdHvgYkFhXpsMD0EEhhPiHv8/b84op20cUR
	 3TsAIZ658+DnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CD068469B;
	Mon,  4 May 2026 14:48:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DB5125D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F51B40B70
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yJpjwnR0Qt70 for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:48:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 533A54079C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 533A54079C
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2821B8423F; Mon,  4 May 2026 14:48:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 13:44:35 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 6b2ec193400a5a0609fe564b4ba418b0a87761d4
X-Git-Newrev: 1c6afcd9f15b4cacf08f2b05f3f324d3434c4eb2
X-Patchwork-Hint: ignore
Message-Id: <20260504144832.2821B8423F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/p11-kit: security
 bump version to 0.26.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1c6afcd9f15b4cacf08f2b05f3f324d3434c4eb2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://github.com/p11-glue/p11-kit/blob/0.26.2/NEWS

Fixes CVE-2026-2100: https://github.com/advisories/GHSA-hq85-3f6c-jx84

Switched to sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a5366d13ba67d297440ad28a1651cf9bb037c303)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/p11-kit/p11-kit.hash | 4 ++--
 package/p11-kit/p11-kit.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/p11-kit/p11-kit.hash b/package/p11-kit/p11-kit.hash
index 43a566a82c..943ad9c22f 100644
--- a/package/p11-kit/p11-kit.hash
+++ b/package/p11-kit/p11-kit.hash
@@ -1,4 +1,4 @@
-# Locally calculated after checking pgp signature
-sha256  04d0a86450cdb1be018f26af6699857171a188ac6d5b8c90786a60854e1198e5  p11-kit-0.25.5.tar.xz
+# From https://github.com/p11-glue/p11-kit/releases/tag/0.26.2
+sha256  09fd9f44da4813a3141e73d5e7cf7008e5660d0405f13d56c15e1da9dcecf828  p11-kit-0.26.2.tar.xz
 # Locally computed
 sha256  2e1ba993904df807a10c3eda1e5c272338edc35674b679773a8b3ad460731054  COPYING
diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
index 42de3e1065..68b1894183 100644
--- a/package/p11-kit/p11-kit.mk
+++ b/package/p11-kit/p11-kit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-P11_KIT_VERSION = 0.25.5
+P11_KIT_VERSION = 0.26.2
 P11_KIT_SOURCE = p11-kit-$(P11_KIT_VERSION).tar.xz
 P11_KIT_SITE = https://github.com/p11-glue/p11-kit/releases/download/$(P11_KIT_VERSION)
 P11_KIT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
