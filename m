Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D930D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DF5E40B39;
	Tue, 13 Jan 2026 19:40:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ibWCrL2OUqF0; Tue, 13 Jan 2026 19:40:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5912340B45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333241;
	bh=AK47zxabK5O5mL+yWhL96wE72ApJ1YjdxUCP1na7rXw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MChGjxG8anxfRTUbP3z03dp+bNyNRci/w6XIOcxLYNF0du7qXjVZ9rDAWAtAXdBXK
	 LV/o5kJA6eTTNkrZA88CYprKw3f5Un2MgS4vE2ln3tsYn/UC9yxygdW78jLXniSN94
	 zdvUJE1U6UR2oKJzIeAQhi8gfm/kxM41nLq2FpylrhVTHKJai+puA5CDevgxORhb2m
	 /fluls7qXungivpXMAYxaGEIOtFsuL3sZ2aAd6fte1M1mDfdSXmeSwk2m8mvEAyZHz
	 Q3e7T7VULfz2VWlHrJH6yHvHiWej8XbNNijrllTYIidr1uVfjBV7y760h1wYhV0O9o
	 d+fyUA1Dkkaaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5912340B45;
	Tue, 13 Jan 2026 19:40:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 04F50231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3D8882CAC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wRAuHKi-rzu4 for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 353ED82A56
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 353ED82A56
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 333518125F; Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:03:28 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 9e371bf1e007be76c5fc4a516f3cb5bc8165d272
X-Git-Newrev: 39976c2bb858259d2071ebeff666558839f86555
X-Patchwork-Hint: ignore
Message-Id: <20260113194032.333518125F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/postgresql:
 remove stale IGNORE_CVES
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

commit: https://git.buildroot.net/buildroot/commit/?id=39976c2bb858259d2071ebeff666558839f86555
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Since Buildroot commit [1] the CVEs are no longer matched to CPEs with
versions using '-'.

The CVE-2017-8806 is then no longer matched to the postgresql package.

For more information, see the explanation in commit [1].

[1] 35f376d88e support/scripts/cve.py: fix CPE matching

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b1ca8ca4ba4814dfa11e840cc94341d966a6e911)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/postgresql/postgresql.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 86761bf939..13abce8330 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -28,10 +28,6 @@ POSTGRESQL_DEPENDENCIES = \
 	host-bison \
 	host-flex
 
-# CVE-2017-8806 is related to postgresql-common package
-# It is false positive for postgresql
-POSTGRESQL_IGNORE_CVES += CVE-2017-8806
-
 ifeq ($(BR2_PACKAGE_POSTGRESQL_FULL),y)
 POSTGRESQL_NINJA_OPTS += world
 POSTGRESQL_INSTALL_TARGET_OPTS += DESTDIR=$(TARGET_DIR) install-world
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
