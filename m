Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0081C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8462A813DD;
	Mon, 20 Feb 2023 23:08:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8462A813DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TKaTwGSKrTdT; Mon, 20 Feb 2023 23:08:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2CE3829DC;
	Mon, 20 Feb 2023 23:08:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2CE3829DC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A1C6E1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 625AD6129D
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 625AD6129D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hIA5m6Sdclqw for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3805612C9
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3805612C9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 91E058648F; Mon, 20 Feb 2023 20:52:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Dec 2022 15:32:09 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 384b75098ba936277379fbaf6e9b78ad8e6fa25f
X-Git-Newrev: d7c99eaa307d1417c8c8e222290df6512ee872ec
X-Patchwork-Hint: ignore
Message-Id: <20230220205212.91E058648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/hddtemp: link to
 libintl when needed
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

commit: https://git.buildroot.net/buildroot/commit/?id=d7c99eaa307d1417c8c8e222290df6512ee872ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:
http://autobuild.buildroot.net/results/e84/e84b7131f996302301dd0a8fd47362c9f2eab0bf/
http://autobuild.buildroot.net/results/524/52428940034d59887e0172fbd8481943d86db13b/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hddtemp/hddtemp.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/hddtemp/hddtemp.mk b/package/hddtemp/hddtemp.mk
index 7023e11e59..4f45647dff 100644
--- a/package/hddtemp/hddtemp.mk
+++ b/package/hddtemp/hddtemp.mk
@@ -15,7 +15,8 @@ HDDTEMP_GETTEXTIZE = YES
 
 HDDTEMP_DB_PATH = /usr/share/misc/hddtemp.db
 HDDTEMP_CONF_OPTS = --with-db-path=$(HDDTEMP_DB_PATH)
-HDDTEMP_CONF_ENV = LIBS="$(HDDTEMP_LIBS)"
+HDDTEMP_CONF_ENV = LIBS="$(HDDTEMP_LIBS) $(TARGET_NLS_LIBS)"
+HDDTEMP_DEPENDENCIES += $(TARGET_NLS_DEPENDENCIES)
 
 ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
 HDDTEMP_DEPENDENCIES += libexecinfo
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
