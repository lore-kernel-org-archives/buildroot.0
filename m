Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F27FE7E367
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 10:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63F7C81C46;
	Fri,  3 Apr 2026 10:27:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2afvOdh9e6u3; Fri,  3 Apr 2026 10:27:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 905C081CA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775212034;
	bh=uMgajVoKsqWYYQupoUpPKb/8Y7TbadcS6SktAlWavr8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KcU75IKGWaOufy6FoyLmkOVkyXLoIU1px49jqxog6eXrgrP81/cFxgAOjAuIX2Rj4
	 JEzC5LfwQX1MS+1e6T8obwUyZN54A1IUkCyVBypvr/wHL38F7ce6EaO73uzfomZwVZ
	 R6339z3UZBe3In7l9KNP9qmuTlMs+xREm1SCV0CjbDex8slTLFwMqsLbKaNbPzsDVa
	 238Dl2EQc5ZUzFQ6MwShC8CQccGTY2E5XYF2Ex/biYbwcW6MMMZ2e+ziXPF1M/TSCZ
	 2ocikeUqMBumIXBenr7ic3LFXxW1TGhAExvyiAhe22LltAb9ZOtgT+vOOs/6KswOHh
	 3XnUBllbFkMAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 905C081CA0;
	Fri,  3 Apr 2026 10:27:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BFD92CC
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7DAC140055
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:26:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iw3_eg7UlBrF for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 10:26:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E3DC40265
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E3DC40265
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:26:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0904C7FFF8; Fri,  3 Apr 2026 10:26:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Apr 2026 12:21:46 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5905cd590ccab0c01315dd46603a30ba96212682
X-Git-Newrev: f6a408fd8f94e24c724a78e55cfb3acef7851dff
X-Patchwork-Hint: ignore
Message-Id: <20260403102657.0904C7FFF8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/tor: security
 bump version to 0.4.9.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f6a408fd8f94e24c724a78e55cfb3acef7851dff
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.6/ReleaseNotes

Fixes TROVE-2026-003 & TROVE-2026-004. See:
https://gitlab.torproject.org/tpo/core/team/-/wikis/NetworkTeam/TROVE

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: add link to TROVE page]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f359f665bec3300bf0f1efdaed95a1384f63b588)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
