Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B918C02180
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 08:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 018718473F;
	Sat, 14 Sep 2024 08:23:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nik8KPGXmDyQ; Sat, 14 Sep 2024 08:23:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 605888479B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 605888479B;
	Sat, 14 Sep 2024 08:23:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A03E81BF2AB
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 08:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D81294033F
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 08:22:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gDD43dY1DUJS for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 08:22:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFD0A4042B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFD0A4042B
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 08:22:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D2ECB86F5B; Sat, 14 Sep 2024 08:22:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 10:19:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2b6c3cc6d0f6e7d29d43e385584b2c2d64e3f923
X-Git-Newrev: 1a61cfda1e44c8c55456d71a644e70f37d567e6c
X-Patchwork-Hint: ignore
Message-Id: <20240914082254.D2ECB86F5B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libglib2: fix deferring typo
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1a61cfda1e44c8c55456d71a644e70f37d567e6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libglib2/libglib2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index bffc565f11..c33df70b25 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -124,7 +124,7 @@ endef
 
 # Compile schemas at target finalization since other packages install
 # them as well, and better do it in a central place.
-# It's used at run time so it doesn't matter defering it.
+# It's used at run time so it doesn't matter deferring it.
 define LIBGLIB2_COMPILE_SCHEMAS
 	$(HOST_DIR)/bin/glib-compile-schemas \
 		$(STAGING_DIR)/usr/share/glib-2.0/schemas \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
