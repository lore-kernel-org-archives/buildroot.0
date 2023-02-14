Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEAAC05027
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 17:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E4BD40B9E;
	Tue, 14 Feb 2023 17:19:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E4BD40B9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PvB8bkJ-BcB6; Tue, 14 Feb 2023 17:19:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D480740BB0;
	Tue, 14 Feb 2023 17:19:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D480740BB0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 850B71BF4DB
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 17:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0F1660E92
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 17:16:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0F1660E92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jKFEcMspzfMs for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 17:16:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF33C60F1C
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 17:16:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF33C60F1C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C89EE85E9E; Tue, 14 Feb 2023 17:16:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Feb 2023 18:13:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 89fa774a191d41ed5d125d87d812ff3478902251
X-Git-Newrev: 3cd0132561ecfb471d76409f40aa565612f10208
X-Patchwork-Hint: ignore
Message-Id: <20230214171654.C89EE85E9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/postgresql: fix legal info
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

commit: https://git.buildroot.net/buildroot/commit/?id=3cd0132561ecfb471d76409f40aa565612f10208
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 57e297a215193c92f6a178139db53616f2ee23b5 forgot to update hash of
COPYRIGHT file (year updated with
https://github.com/postgres/postgres/commit/1fbcb1360bc19b89369209203ea7cc19b8cde224)

Fixes:
 - http://autobuild.buildroot.org/results/93f40dc71619745ddc6741598c9a488c81ea440f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index e6a9bd6658..3e89d3ec35 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
 # From https://ftp.postgresql.org/pub/source/v15.2/postgresql-15.2.tar.bz2.sha256
 sha256  99a2171fc3d6b5b5f56b757a7a3cb85d509a38e4273805def23941ed2b8468c7  postgresql-15.2.tar.bz2
 # License file, Locally calculated
-sha256  f6d6616acdb598742e2a7c64fa0551c1c72c309d279fd2d90370e5fdd41c8945  COPYRIGHT
+sha256  1a7d13c3ab31961b91ba256f77d6e82e0b54bf992253060fe93bdb5466df416a  COPYRIGHT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
