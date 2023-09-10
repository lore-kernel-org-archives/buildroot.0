Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253CEC71153
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 21:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1C4040453;
	Sun, 10 Sep 2023 21:44:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1C4040453
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WzFvY1CwxmL3; Sun, 10 Sep 2023 21:44:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0048140541;
	Sun, 10 Sep 2023 21:44:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0048140541
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 945451BF8C7
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 21:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D5F840051
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 21:43:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D5F840051
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IGq_VKawI_yJ for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 21:43:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F69840080
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 21:43:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F69840080
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D2C386BC7; Sun, 10 Sep 2023 21:43:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Sep 2023 23:17:14 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 635da4557f94f5776581539c556affc1195cb297
X-Git-Newrev: f2a10a4f0d6831136ddfd812545533eebf2225e3
X-Patchwork-Hint: ignore
Message-Id: <20230910214330.4D2C386BC7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/stellarium:
 disable ShowMySky atmosphere model
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

commit: https://git.buildroot.net/buildroot/commit/?id=f2a10a4f0d6831136ddfd812545533eebf2225e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Buildroot commit 319c56dfe3309dbf24be01fed3afff6259a2c5dd bumped
stellarium which included these commits
https://github.com/Stellarium/stellarium/commit/b3f02beaec2a285251db1e1707abe2e423803834
https://github.com/Stellarium/stellarium/commit/5d5edd0e5f5630872628a1525685b77854b6e4b4

It downloads external packages during the build:

$ find output/build/stellarium-23.2/ -iname *.tar.*
output/build/stellarium-23.2/_deps/eigen3-subbuild/eigen3-populate-prefix/src/eigen-3.4.0.tar.bz2
output/build/stellarium-23.2/_deps/showmysky-qt5-subbuild/showmysky-qt5-populate-prefix/src/v0.3.1.tar.gz

which breaks offline builds.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2616272339073834c262bc46fdf995fdaa91acf7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/stellarium/stellarium.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index 7b48131912..fe7aaf6ac9 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -18,6 +18,7 @@ STELLARIUM_DEPENDENCIES = \
 STELLARIUM_CONF_OPTS = \
 	-DENABLE_MEDIA=ON \
 	-DENABLE_NLS=OFF \
+	-DENABLE_SHOWMYSKY=OFF \
 	-DENABLE_QTWEBENGINE=OFF \
 	-DENABLE_QT6=OFF \
 	-DENABLE_XLSX=OFF \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
