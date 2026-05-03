Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718B3FF886F
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 16:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B003412A6;
	Sun,  3 May 2026 16:19:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id inR6XQ4KWsAT; Sun,  3 May 2026 16:19:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22B44411A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777825181;
	bh=jlVX6o9aSvjvBKe0tH0rohNtVUZZO5OAY5lIXcOkaG0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MR74baDGRgg0HnkA/h0btFpF7i1kpFaLnaE5dEYLeWOQSSOTQ8uRYFzTjivQb4aNn
	 9UO5mluxa9/9bJ+5mD6y2AAqYDfEmsYGPnS3Jk4GBYvYC0ys3Ophkent8DE8GawieQ
	 KAeWXbVuZwT5lCCvH8cWzMM3ZrqByyva9rl0j0yAl5IkfGQ+KrM3avS91J4lktTCoG
	 0Tpq04WTs4tYPLT9ls45CebiyMzWmtUy+Qw/E9ruReexgaVXVWusaBjLaBvQjtfX5y
	 g9LOfhyDcJcrCOVspU8Bv24xgjXK27kKdEdgC14p1joN64VkE92KtalLS5zEV1Yvh6
	 HqwdLawF8b3ww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22B44411A3;
	Sun,  3 May 2026 16:19:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2AB5725D
 for <buildroot@buildroot.org>; Sun,  3 May 2026 16:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1108B403D7
 for <buildroot@buildroot.org>; Sun,  3 May 2026 16:19:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id czaRsj6BVmEk for <buildroot@buildroot.org>;
 Sun,  3 May 2026 16:19:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 496BE402DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 496BE402DC
 for <buildroot@buildroot.org>; Sun,  3 May 2026 16:19:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1157E8404F; Sun,  3 May 2026 16:19:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 18:14:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5657229086de7977533aec298922f0ce1b7a1745
X-Git-Newrev: 8502f942d8430819858e671e4ba259ddbcfde534
X-Patchwork-Hint: ignore
Message-Id: <20260503161938.1157E8404F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lmdb: bump to version 0.9.35
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8502f942d8430819858e671e4ba259ddbcfde534
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

for changes, see:
https://git.openldap.org/openldap/openldap/-/blob/LMDB_0.9.35/libraries/liblmdb/CHANGES?ref_type=tags

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/lmdb/lmdb.hash | 2 +-
 package/lmdb/lmdb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lmdb/lmdb.hash b/package/lmdb/lmdb.hash
index 4b80953dff..e0856136b2 100644
--- a/package/lmdb/lmdb.hash
+++ b/package/lmdb/lmdb.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d19d52725800177b89d235161c0af8ae8b2932207e3c9eb87e95b61f1925206d  openldap-LMDB_0.9.33.tar.bz2
+sha256  98e28ab0a5c23fb2eb8ad12c12d7ad5fc5e4c3563f41d0b91e9420a075974d6f  openldap-LMDB_0.9.35.tar.bz2
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  libraries/liblmdb/LICENSE
diff --git a/package/lmdb/lmdb.mk b/package/lmdb/lmdb.mk
index e4f929c7f0..2792c93006 100644
--- a/package/lmdb/lmdb.mk
+++ b/package/lmdb/lmdb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LMDB_VERSION = 0.9.33
+LMDB_VERSION = 0.9.35
 LMDB_SOURCE = openldap-LMDB_$(LMDB_VERSION).tar.bz2
 LMDB_SITE = https://git.openldap.org/openldap/openldap/-/archive/LMDB_$(LMDB_VERSION)
 LMDB_LICENSE = OLDAP-2.8
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
