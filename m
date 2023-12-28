Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF60C3DA6E
	for <buildroot@archiver.kernel.org>; Thu, 28 Dec 2023 20:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93E2E40852;
	Thu, 28 Dec 2023 20:44:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93E2E40852
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AEwxfxRuzDY2; Thu, 28 Dec 2023 20:44:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF36D40571;
	Thu, 28 Dec 2023 20:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF36D40571
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 670661BF342
 for <buildroot@lists.busybox.net>; Thu, 28 Dec 2023 20:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D34081772
 for <buildroot@lists.busybox.net>; Thu, 28 Dec 2023 20:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D34081772
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KgxhCSalo9SG for <buildroot@lists.busybox.net>;
 Thu, 28 Dec 2023 20:44:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92F96812D6
 for <buildroot@buildroot.org>; Thu, 28 Dec 2023 20:44:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92F96812D6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7EF7C83550; Thu, 28 Dec 2023 20:44:13 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 28 Dec 2023 21:41:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e29fcde4ba70ce2259824b3b7dd807b2195baefa
X-Git-Newrev: b678091a1c68327d086b6534a27224763db23006
X-Patchwork-Hint: ignore
Message-Id: <20231228204413.7EF7C83550@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-qmake.mk: drop host-perl
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=b678091a1c68327d086b6534a27224763db23006
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit 5770a645a3a49a3f0f02972131a4ff5283b4c11e ("package/qt5:
bump packages to latest kde submodule versions"), the
QT_HEADERS_SYNC_HOOK hook no longer calls the syncqt.pl script, so
host-perl is no longer needed as a dependency of running this
hook (and as a dependency of building Qt).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-qmake.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/pkg-qmake.mk b/package/pkg-qmake.mk
index fdaddf08df..ccf78692e8 100644
--- a/package/pkg-qmake.mk
+++ b/package/pkg-qmake.mk
@@ -50,7 +50,6 @@ $(2)_DEPENDENCIES 		+= qt5base
 endif
 
 ifeq ($$($(2)_SYNC_QT_HEADERS),YES)
-$(2)_DEPENDENCIES 		+= host-perl
 $(2)_PRE_CONFIGURE_HOOKS        += QT_HEADERS_SYNC_HOOK
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
