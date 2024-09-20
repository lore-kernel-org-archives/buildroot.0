Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13A3CF58EA
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 10:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F26D642B75;
	Fri, 20 Sep 2024 10:35:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tDmJD9l3WFTd; Fri, 20 Sep 2024 10:35:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF30542B84
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF30542B84;
	Fri, 20 Sep 2024 10:34:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BD5241BF983
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7F9740C08
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:34:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L1TRQYIh7ZpN for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 10:34:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA0584015F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA0584015F
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 10:34:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B257782386; Fri, 20 Sep 2024 10:34:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Sep 2024 12:33:58 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: f86b0d6d2a976d4242b928e969558f0b6c0fafbc
X-Git-Newrev: a37afd5c2e3cf1a1211d307a68e97f72ac006b1e
X-Patchwork-Hint: ignore
Message-Id: <20240920103451.B257782386@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/lldpd: fix typo
 in help text
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a37afd5c2e3cf1a1211d307a68e97f72ac006b1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 28cdb718eae4a91e4c42ab4202d789dc9d20a25e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lldpd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lldpd/Config.in b/package/lldpd/Config.in
index 3e0446986f..04dd6040b6 100644
--- a/package/lldpd/Config.in
+++ b/package/lldpd/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_LLDPD
 	select BR2_PACKAGE_LIBEVENT
 	help
 	  lldpd is a 802.1ab implementation (LLDP) to help you locate
-	  neighbors of all your equipments.
+	  neighbors of all your equipment.
 
 	  LLDP allows you to know exactly on which port is a server
 	  (and reciprocally).
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
