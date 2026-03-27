Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7A510F2862
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 18:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B51783E2B;
	Fri, 27 Mar 2026 18:21:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dEAddv9u1yOl; Fri, 27 Mar 2026 18:21:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BAFE83E1D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774635696;
	bh=11wvSQ4DJ9WYEEsQjz0zt0OCT9U2Z8fjlEdpb8oPvLc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qCRaGiQDfYvMlZrftl/9cT+PNUKoa8FK9q1bxodapaKG3dHDkkIS0gxcu7xWV2OYk
	 q57eUG9qM0Ty/kxS34y+JEZFZlngPu8m3vFIYf7Y5ZiD8dSHk9RTsxoDGkx12uoeOy
	 jJdL4/DsG/t6kKR0Ws5pAcRKFH6Rc2Lj0tcQSVO0PcqmvaFEfaxw/ZOM1KSeQNd/N1
	 aUIkFNw8JAjj/wQVurp9XNo3xWWSMX0WvyRHfrE/WayqybWM0pNb7FJwkBRB84Hj5S
	 AL9Kjj2U5jx6jHJ5Up/HwSIHjvXwL2I8Lp9JOGT7PVw+YLd9KbooC2pVziRlJIbjgp
	 V/fTZq8EI9FZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BAFE83E1D;
	Fri, 27 Mar 2026 18:21:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 31ABE2AA
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 18:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17B5983E1D
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 18:21:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rnPuOF2cumsx for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 18:21:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAB1183B7C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DAB1183B7C
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 18:21:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D7BC7FBE7; Fri, 27 Mar 2026 18:21:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 27 Mar 2026 19:19:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0ce674c2449fd506b4836a80ec0d78c2862d353d
X-Git-Newrev: f359f665bec3300bf0f1efdaed95a1384f63b588
X-Patchwork-Hint: ignore
Message-Id: <20260327182133.2D7BC7FBE7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tor: security bump version to
 0.4.9.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f359f665bec3300bf0f1efdaed95a1384f63b588
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.6/ReleaseNotes

Fixes TROVE-2026-003 & TROVE-2026-004. See:
https://gitlab.torproject.org/tpo/core/team/-/wikis/NetworkTeam/TROVE

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: add link to TROVE page]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index a4b0af12b5..a70b9e9baf 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.9.5.tar.gz.sha256sum
-sha256  c949c2f86b348e64891976f6b1e49c177655b23df97193049bf1b8cd3099e179  tor-0.4.9.5.tar.gz
+# From https://dist.torproject.org/tor-0.4.9.6.tar.gz.sha256sum
+sha256  a89aba97052e9963a654b40df2d46be07e8a6b6e24e5437917fd81acd90a7017  tor-0.4.9.6.tar.gz
 # Locally computed
 sha256  5dc29ea302cc75db6db4a7c88d7b5d4638b4e0f5f1d2e6d21ce71f707470b766  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 36be7967bf..f11afcc449 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.9.5
+TOR_VERSION = 0.4.9.6
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
