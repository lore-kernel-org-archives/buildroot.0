Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C69CCDD54F
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 17:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21046411AC;
	Wed, 18 Sep 2024 17:09:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eexUT8i23398; Wed, 18 Sep 2024 17:09:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF561411CD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF561411CD;
	Wed, 18 Sep 2024 17:09:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 76E381BF5A7
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 17:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66443846EC
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 17:09:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fFZKhcGvgIF3 for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 17:09:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 930AB846E1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 930AB846E1
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 17:09:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7E69083B77; Wed, 18 Sep 2024 17:09:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 18 Sep 2024 19:07:12 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 94b7bb247cea41a4249c254fbfe29cef08108831
X-Git-Newrev: 6eea6b524dc84907d5ea31495109110949987c34
X-Patchwork-Hint: ignore
Message-Id: <20240918170947.7E69083B77@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/postgresql: fix
 typo in init script info printout
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

commit: https://git.buildroot.net/buildroot/commit/?id=6eea6b524dc84907d5ea31495109110949987c34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 74f327e2869841b499d66cac6a7bd8a83b1269f5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/S50postgresql | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/postgresql/S50postgresql b/package/postgresql/S50postgresql
index 1ece4fca9e..f8077600de 100644
--- a/package/postgresql/S50postgresql
+++ b/package/postgresql/S50postgresql
@@ -6,7 +6,7 @@
 umask 077
 
 if [ ! -f /var/lib/pgsql/PG_VERSION ]; then
-	echo "Initializing postgresql data base..."
+	echo "Initializing postgresql database..."
 	su - postgres -c '/usr/bin/pg_ctl initdb -D /var/lib/pgsql'
 	echo "done"
 fi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
