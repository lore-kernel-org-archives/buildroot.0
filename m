Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C47C02194
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 14:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2A8D4258C;
	Sat, 14 Sep 2024 14:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HVZO0cmLeSuM; Sat, 14 Sep 2024 14:01:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59C4742590
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59C4742590;
	Sat, 14 Sep 2024 14:01:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B70041BF3F9
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 14:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D25FF60771
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 14:00:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wWPGkvZtpv5l for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 14:00:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DF936076F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DF936076F
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 14:00:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 19298828E3; Sat, 14 Sep 2024 14:00:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 15:54:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 271ea8be96abf1b30b999075500aaf91f992c25c
X-Git-Newrev: 66dbf094d3a8613fc594c9d6ae1be7c0d19757ce
X-Patchwork-Hint: ignore
Message-Id: <20240914140014.19298828E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/musepack: fix occurring typo in
 patch description
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

commit: https://git.buildroot.net/buildroot/commit/?id=66dbf094d3a8613fc594c9d6ae1be7c0d19757ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/musepack/0004-missing-sys-select.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/musepack/0004-missing-sys-select.patch b/package/musepack/0004-missing-sys-select.patch
index 1e3a4b1140..64efbc4733 100644
--- a/package/musepack/0004-missing-sys-select.patch
+++ b/package/musepack/0004-missing-sys-select.patch
@@ -1,7 +1,7 @@
 Add missing <sys/select.h> include
 
 This header is needed when types like fd_set are used. This fixes a
-build issue occuring on the musl C library.
+build issue occurring on the musl C library.
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 [Thomas: better commit log.]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
