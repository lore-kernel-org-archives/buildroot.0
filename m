Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0667BC433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 08:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5ED1612D2;
	Tue, 19 Apr 2022 08:55:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y0PRo73H-_T4; Tue, 19 Apr 2022 08:55:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2155612CE;
	Tue, 19 Apr 2022 08:55:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 341AE1BF29C
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 08:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D82D612CC
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 08:54:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aw_wOkxkeEND for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 08:54:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E1C21612CA
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 08:54:51 +0000 (UTC)
Received: from houde.tangerine ([193.138.218.222]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.168]) with ESMTPSA (Nemesis) id
 1MCXhr-1npEE61U71-009kPC; Tue, 19 Apr 2022 10:54:49 +0200
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Date: Tue, 19 Apr 2022 10:54:11 +0200
Message-Id: <20220419085411.125022-3-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220419085411.125022-1-thomas.claveirole@green-communications.fr>
References: <20220419085411.125022-1-thomas.claveirole@green-communications.fr>
MIME-Version: 1.0
X-Provags-ID: V03:K1:thkA9nB7tA6/L7CUe+WdUsk7RwOvmshVMYS6ktFcBs+12W+l6ai
 qlJoTU+HLulYVniC02TX2GKhz6xqZ+8ykAaESWS4WsNkW6V73FbN5FYCZySXIDh4DYsH7Yn
 ADqdrTraxbJ7P+Am+o+4xqiLOj2Q54Jfo4xZV+OBABqujMD810M6Ho8xDvqPamGzY/1NjmH
 AOze7GzncDtl26bdmAlAw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PZtN53rdb5w=:X0THvjWdqlCE2xOPm4W02Q
 7Lomc615Y6ujnN+qgoSaSAbFNqznxTDgTRCYby3bpElHHG5n9cDX0yFBUnHNiugul/fLRr+ym
 rdRXFDecTYUx/l4uQKjSFyXzNt2+uocdNnvDD9QityciwMNR+pa2dJMt/vUhp1NzdQHHt4C63
 Lm6Oy4hHeGzOQdZ4lRJ7/ST8BVukb2OqD4dNls/wThdcLBCFdpfQiORZmKvQmKDb6eVNOWAjV
 2kAN1bXmYKWutgb4fB6o73KgN6uLzm42Seq4PWmviMYWTM+CnD0sSngAGUsq9WREyDWr/kvtu
 ekL1RUEkXrsjc7bb4Mh7FayRlmY8/gzgM58SLoWi8QffwkHMxssKZu0FvKESGdZQsA7qOjMjk
 Iy8Ddzo4vhgbE9gth2IfwCc/ydxqQOq9K1mEnj6TRJ748GzdS8dUcvNBvPsXnYBWlt9uLVpmb
 B934SbYH4Q40gam+frbqbJ+/De8VCdyv4YngPXMK3aWn7riUyvWPszYai/v57iGOBU1aszljs
 83xYVjJsFMWGLWD8KbGzaR3HSxauT0KTg461q6brFu3KFtFZLYtxm7Fwmwyz4ilEbow2ln4FB
 4c5MvMUuavwKP07cBhohmLotPmJCm3K/j6rOZgyawckcDQ+g7jzCqbddLgIHv5iLjSWLJpbOt
 DRrVXcp6daTsHiwcG1EMmwF0wfXUGUcOCZE1iIgwwTskAE/a9DyZMHLErVT/5s6BK/1c+WOZ/
 FSUiTLFlBqHXHbG7Pk1zzkAQLcWnX+V+10178A==
Subject: [Buildroot] [PATCH] package/vuejs-router: bump to version 4.0.14
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
Cc: Thomas Claveirole <thomas.claveirole@green-communications.fr>,
 Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
---
 package/vuejs-router/vuejs-router.hash | 2 +-
 package/vuejs-router/vuejs-router.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vuejs-router/vuejs-router.hash b/package/vuejs-router/vuejs-router.hash
index 13ce97d32c..fe270a6062 100644
--- a/package/vuejs-router/vuejs-router.hash
+++ b/package/vuejs-router/vuejs-router.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  baf5e9dfb0a1e344f0f460a5cd521e17fd3842386ce36b8e6d53c1053d49cf1e  vue-router-4.0.12.tgz
+sha256  6adff85db2045a092ba4bf37e95cdc3c661cfe4f3e7f7cbc36082a57c05c6365  vue-router-4.0.14.tgz
 sha256  9c0015250f592a09d7787efc07152afcf661fff6bda2554359f6d00987828c02  LICENSE
diff --git a/package/vuejs-router/vuejs-router.mk b/package/vuejs-router/vuejs-router.mk
index 9c7dcc76bf..397a78e1a7 100644
--- a/package/vuejs-router/vuejs-router.mk
+++ b/package/vuejs-router/vuejs-router.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VUEJS_ROUTER_VERSION = 4.0.12
+VUEJS_ROUTER_VERSION = 4.0.14
 VUEJS_ROUTER_SOURCE = vue-router-$(VUEJS_ROUTER_VERSION).tgz
 VUEJS_ROUTER_SITE = https://registry.npmjs.org/vue-router/-
 VUEJS_ROUTER_LICENSE = MIT
-- 
2.35.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
