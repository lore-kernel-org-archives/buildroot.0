Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30998CD3442
	for <buildroot@archiver.kernel.org>; Thu,  7 May 2026 20:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3409610E1;
	Thu,  7 May 2026 20:20:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qt0BMQ4Qbhm4; Thu,  7 May 2026 20:20:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 084B660DC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778185216;
	bh=NyC+9ju7nMzGmwSdJiJo+SA0AVuLmc+swPu9WRBg+TI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rbD3G+V/uRLVrIEQ87mgBe59/erLCudfGfLaERhhsIzMULlFS9KkW+4EKvE0GOyx7
	 ytampTUZP9CRqZclfkvVRateoAxSooAnczpYubTNFUTCcSr/LuQylMsnHMC5SSuPhT
	 UUwTmv5nJZmO/UsN4hVZROnaJsgafTFnFMXKAGaxA617NBo/y6Mr3nrtCfBcGDvKh3
	 NOlYf191T/EaxTg0HMHxZtoh03yZrMZecRq7PImmQ2X5tcvt2YPRu2xNyzIDV0REcg
	 blZp0QE41pZ7ccWPzNoFU8DtPstGkyW+IW7OBnj5Yi40F1U6brxRqFn3XnNnZX1K5N
	 2B5jHgy2l1ovA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 084B660DC3;
	Thu,  7 May 2026 20:20:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DF37A317
 for <buildroot@buildroot.org>; Thu,  7 May 2026 20:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0AA640862
 for <buildroot@buildroot.org>; Thu,  7 May 2026 20:20:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CkTvsA5jVZJR for <buildroot@buildroot.org>;
 Thu,  7 May 2026 20:20:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32911400B1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32911400B1
 for <buildroot@buildroot.org>; Thu,  7 May 2026 20:20:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F5BF8516C; Thu,  7 May 2026 20:20:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 May 2026 22:10:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3db2f0b33c26c4fef9b93cc268a730288db0ac24
X-Git-Newrev: 15fbc52884847dde589aa7a472cdddfe89d1ca06
X-Patchwork-Hint: ignore
Message-Id: <20260507202012.4F5BF8516C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tor: security bump version to
 0.4.9.8
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/15fbc52884847dde589aa7a472cdddfe89d1ca06
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Version 0.4.9.7 fixes the following security bugs:
https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.7/ReleaseNotes

Fixes TROVE-2026-011, TROVE-2026-010, TROVE-2026-009, TROVE-2026-008,
TROVE-2026-007, TROVE-2026-006:
https://gitlab.torproject.org/tpo/core/team/-/wikis/NetworkTeam/TROVE

Version 0.4.9.8 fixes a bug introduced by the bump to 0.4.9.7:
https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.8/ReleaseNotes

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index a70b9e9baf..f748afecfc 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.9.6.tar.gz.sha256sum
-sha256  a89aba97052e9963a654b40df2d46be07e8a6b6e24e5437917fd81acd90a7017  tor-0.4.9.6.tar.gz
+# From https://dist.torproject.org/tor-0.4.9.8.tar.gz.sha256sum
+sha256  ac1f394e2dd2ab0877d27d928fd0d9e86662fe3ca6afdffb9fd9b6f0f96d05de  tor-0.4.9.8.tar.gz
 # Locally computed
 sha256  5dc29ea302cc75db6db4a7c88d7b5d4638b4e0f5f1d2e6d21ce71f707470b766  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index f11afcc449..a24708ddad 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.9.6
+TOR_VERSION = 0.4.9.8
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
