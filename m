Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A802FC433EF
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 18:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B3A182977;
	Sat, 30 Apr 2022 18:56:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mH9hJjwdHSE1; Sat, 30 Apr 2022 18:56:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 854A981B52;
	Sat, 30 Apr 2022 18:56:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 618521BF94D
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C73981A99
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:54:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3uVNK2guXe0R for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 18:54:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E94781B3E
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 18:54:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 292F984B62; Sat, 30 Apr 2022 18:44:18 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 30 Apr 2022 20:42:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dded1e52c06100cba6c974825342582ee6504008
X-Git-Newrev: e0e268d61d3995f1096fdac4c3cd9ebb74deb57b
X-Patchwork-Hint: ignore
Message-Id: <20220430184418.292F984B62@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/postgis: bump version to 3.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=e0e268d61d3995f1096fdac4c3cd9ebb74deb57b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release-notes: https://git.osgeo.org/gitea/postgis/postgis/src/tag/3.2.1/NEWS

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/postgis/postgis.hash | 2 +-
 package/postgis/postgis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/postgis/postgis.hash b/package/postgis/postgis.hash
index 12ca18f84f..018e6523f3 100644
--- a/package/postgis/postgis.hash
+++ b/package/postgis/postgis.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7ab9e154c6947c0cffb8fa12d70806add9aa060e62b6c86a2e206f9d4b507cfd  postgis-3.2.0.tar.gz
+sha256  fbab68dde6ca3934b24ba08c8ab0cff2594f57f93deab41a15c82ae1bb69893e  postgis-3.2.1.tar.gz
 sha256  55b69f22e1752830dd565852dc7ff242daf289dbd3a6bfede5db43f90d2e28c9  LICENSE.TXT
diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
index d9cda64730..b77071d03b 100644
--- a/package/postgis/postgis.mk
+++ b/package/postgis/postgis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGIS_VERSION = 3.2.0
+POSTGIS_VERSION = 3.2.1
 POSTGIS_SITE = https://download.osgeo.org/postgis/source
 # parallel build issues
 POSTGIS_MAKE = $(MAKE1)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
