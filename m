Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F67C28B20
	for <buildroot@archiver.kernel.org>; Sun, 30 Mar 2025 13:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11AF5408A8;
	Sun, 30 Mar 2025 13:39:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sXlYruUQmlC7; Sun, 30 Mar 2025 13:38:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD38640851
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD38640851;
	Sun, 30 Mar 2025 13:38:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A8C39121
 for <buildroot@buildroot.org>; Sun, 30 Mar 2025 13:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E95780B9C
 for <buildroot@buildroot.org>; Sun, 30 Mar 2025 13:38:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XxPKKSlvVrVc for <buildroot@buildroot.org>;
 Sun, 30 Mar 2025 13:38:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8DFC681EB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DFC681EB3
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8DFC681EB3
 for <buildroot@buildroot.org>; Sun, 30 Mar 2025 13:38:56 +0000 (UTC)
Received: from home.juju.sh (unknown [82.64.214.120])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id A58D2B00579;
 Sun, 30 Mar 2025 15:38:53 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sun, 30 Mar 2025 15:38:32 +0200
Message-ID: <20250330133832.876762-1-ju.o@free.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743341934;
 bh=iUUm7uqWCTaMfVneOWxBzsIgTVkXOyO7IwOyF/0hc/Y=;
 h=From:To:Cc:Subject:Date:From;
 b=EPWdpgdgdueVVqu9m46xnRdPvB+/CxQefYGTTHb9/RQGyeRUII+UnlSbIf9y3t7O+
 jeMRan6MZBKM6M5IOGs8oEGXHCBKUu96NKYf6wpXAzeW3Wz+rnpgpy6gB7gpLhpAlT
 YSyIq+SCA6QPdNOuaD+O6dWhxDhD6sqUI/VA8ilnAIyogd/3cnZ8uKLyT8SgqR2w5C
 Po5aucZPQnv34loeN6aBpv8gYmu6z+4bkAZ5P3oF2LT4CLPdoZRwVz/whBEk1kf46q
 2UwnlZKH8gC+jMlohRh5s+U2GTIqpdd8aI0dSe1m0rSJMislDunPstPJjn44bC3tbZ
 9Tqb0Kdxk3YFQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EPWdpgdg
Subject: [Buildroot] [PATCH 1/1] package/hyperfine: bump version to 1.19.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/sharkdp/hyperfine/blob/v1.19.0/CHANGELOG.md

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/hyperfine/hyperfine.hash | 2 +-
 package/hyperfine/hyperfine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hyperfine/hyperfine.hash b/package/hyperfine/hyperfine.hash
index 88b8710125..3590d91133 100644
--- a/package/hyperfine/hyperfine.hash
+++ b/package/hyperfine/hyperfine.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  6cbe5673729ba7fd7a1b0b19a54630f93f4fcc29ea7878845f17931d31cd16fb  hyperfine-1.18.0-cargo2.tar.gz
+sha256  805a1be8dc1667591988ac6ca1ac4fc37408a46a077b4e2332e0a81cc4a3d2e1  hyperfine-1.19.0-cargo2.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
 sha256  1dfee18c2ff07ce551de4d6a1d2db158c0380746b488a7f0d08c8e0d3568b7c3  LICENSE-MIT
diff --git a/package/hyperfine/hyperfine.mk b/package/hyperfine/hyperfine.mk
index b9f09a2820..7ab25fd4f1 100644
--- a/package/hyperfine/hyperfine.mk
+++ b/package/hyperfine/hyperfine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HYPERFINE_VERSION = 1.18.0
+HYPERFINE_VERSION = 1.19.0
 HYPERFINE_SITE = $(call github,sharkdp,hyperfine,v$(HYPERFINE_VERSION))
 HYPERFINE_LICENSE = Apache-2.0 or MIT
 HYPERFINE_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
