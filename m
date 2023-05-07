Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 345E0C77B7C
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 14:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8EB060A9C;
	Sun,  7 May 2023 14:27:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8EB060A9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2enpH0z6EYxP; Sun,  7 May 2023 14:27:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C9A260B68;
	Sun,  7 May 2023 14:27:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C9A260B68
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 477CE1BF2F8
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 14:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CE368218F
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 14:27:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CE368218F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tf3HFG1ZGLAs for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 14:27:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D79182176
 for <buildroot@buildroot.org>; Sun,  7 May 2023 14:27:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D79182176
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3995785FBE; Sun,  7 May 2023 14:27:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 16:27:03 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 8e117464920f2aa2ab7bfc288934c6af4e3504bb
X-Git-Newrev: 8dd8f39494c95aed70b23bb3af08e36dab022657
X-Patchwork-Hint: ignore
Message-Id: <20230507142736.3995785FBE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/postgresql: fix
 licensing hash
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

commit: https://git.buildroot.net/buildroot/commit/?id=8dd8f39494c95aed70b23bb3af08e36dab022657
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Commit 7d8b699c292d (package/postgresql: security bump to version 14.7)
forgot to update the hash for the liense file COPYRIGHT, which had an
update in copyright years.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 83b27a5fc0..acce26e8ae 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
 # From https://ftp.postgresql.org/pub/source/v14.7/postgresql-14.7.tar.bz2.sha256
 sha256  cef60f0098fa8101c1546f4254e45b722af5431337945b37af207007630db331  postgresql-14.7.tar.bz2
 # License file, Locally calculated
-sha256  f6d6616acdb598742e2a7c64fa0551c1c72c309d279fd2d90370e5fdd41c8945  COPYRIGHT
+sha256  1a7d13c3ab31961b91ba256f77d6e82e0b54bf992253060fe93bdb5466df416a  COPYRIGHT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
