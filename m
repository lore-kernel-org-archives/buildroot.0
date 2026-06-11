Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC9ACD98D9
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25F3B41177;
	Fri, 12 Jun 2026 11:22:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UseUGZfKDkVv; Fri, 12 Jun 2026 11:22:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1640141169
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263355;
	bh=yHzv+wx28qtoBRpx0A3na0GA9JIVOFQk+V+VIppFnHE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RLJhJQlc07YQdGQPWzU8WgruGFPdchcknWr8lyzhaOIAf9sgk8n9+vzMBIVMuSAr0
	 KNyUe8r8h2s1jvNsFSUTvw8jgcLR1BjR5IAT6ajoORdVkqYapSAIB5sqmWMWSyijGA
	 qy8OH7vqErslwWb66p12GJGjuMNgALUAcRl0nA0yaOcDwgNVSj8i33E6XdxXrju0sW
	 3NARdQfRsz3oouJ2ogZBhbxOsRSRFWD+ZoLho6yFayuORhVkHu4CXKufeIjZt8bJNJ
	 6qneSc/MKS2uhAh+vyokKVw5JLXvSnd8IIdpdYmYJ8gLja754HPg3OzjgdWET3VskQ
	 BKGT73MQOf48w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1640141169;
	Fri, 12 Jun 2026 11:22:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A48C1F4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AA22832C9
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HNmq8d84kLD3 for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:22:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA9818329E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA9818329E
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 875B3880D5; Fri, 12 Jun 2026 11:22:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 10:31:07 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: cd25914b7836997aca7e376c633741987efcf4b2
X-Git-Newrev: 63ba4e4a714ef1191376aa6487444a93191fa954
X-Patchwork-Hint: ignore
Message-Id: <20260612112206.875B3880D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 package/x11r7/xserver_xorg-server: security bump version to 21.1.23
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/63ba4e4a714ef1191376aa6487444a93191fa954
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Advisory (no CVEs yet):
https://lists.x.org/archives/xorg-announce/2026-June/003702.html

Release notes:
https://lists.x.org/archives/xorg-announce/2026-June/003703.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 20489205ea57a00f013c49f148c93c588b0713e1)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash | 6 +++---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index b7adf1559d..5f10908c8a 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2026-April/003678.html
-sha256  1a242c8917c49ba29ccc1f6021613d8a2b9805dd0d271a66ae9d09f4b0bb06b3  xorg-server-21.1.22.tar.xz
-sha512  6cb37ff971e10eb4a7dfcb3e8071afd769c7632d50e4ad8bc948b810dc4847e152b8a05ec135f55e0695b35908abd07e7728ef85dd3135456fd532e919f440f4  xorg-server-21.1.22.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2026-June/003703.html
+sha256  e39832e5617dadaf072fdf9f0e19e5d2e1c2a13607ac280bac1aba9f8fe14634  xorg-server-21.1.23.tar.xz
+sha512  7eae854af1b5db1f5d1e59cb9d26b86d98fa176d4f80f70935c707f17982d0446a0a8ad8d29c922edbd208435f995b027604fbb72e62a7bf3ba79f2f570aa0bb  xorg-server-21.1.23.tar.xz
 # Locally calculated
 sha256  c9f90a6669109aad6c9a7c3b46cc2c574221a73b792afa419336816b49da5c11  COPYING
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index d1e7267c27..cecbb821ae 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 21.1.22
+XSERVER_XORG_SERVER_VERSION = 21.1.23
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.xz
 XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
