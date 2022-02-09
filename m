Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C2EC433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20EB281421;
	Wed,  9 Feb 2022 21:38:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TaT6J_xeQg4U; Wed,  9 Feb 2022 21:38:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A9BE81773;
	Wed,  9 Feb 2022 21:38:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5E3D51BF2F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7A1E60E40
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vD4IeXb1HC0Q for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A1F560E38
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 7F98D81335; Wed,  9 Feb 2022 21:25:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:07:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ab41d540ef7b88496bf3fe9cb39a1c747f29f3e
X-Git-Newrev: 246077a8890c96283419f93d7df4ca85f190b2c0
X-Patchwork-Hint: ignore
Message-Id: <20220209212559.7F98D81335@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/crudini: drop python2 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=246077a8890c96283419f93d7df4ca85f190b2c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/crudini/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/crudini/Config.in b/package/crudini/Config.in
index 240848dffc..ff4c98d579 100644
--- a/package/crudini/Config.in
+++ b/package/crudini/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_CRUDINI
 	bool "crudini"
-	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_INIPARSE # runtime
 	help
 	  A utility for handling ini files from the command line and
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
