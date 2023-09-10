Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8ECEEB57E
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 21:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9BC940993;
	Sun, 10 Sep 2023 21:46:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9BC940993
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BAaPlDomzqr4; Sun, 10 Sep 2023 21:46:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CA4D40AFC;
	Sun, 10 Sep 2023 21:46:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CA4D40AFC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 11ADE1BF8C7
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 21:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 751E540A17
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 21:44:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 751E540A17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EYZSM76JvB9J for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 21:44:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9A874052B
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 21:44:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9A874052B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9743D86BF7; Sun, 10 Sep 2023 21:44:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Sep 2023 23:17:21 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 7abf2347be71808f894c34dce9168e5e076ddb2e
X-Git-Newrev: 1d266076669a66c477bb69798b4f304cbeeb65ed
X-Patchwork-Hint: ignore
Message-Id: <20230910214436.9743D86BF7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/stellarium:
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

commit: https://git.buildroot.net/buildroot/commit/?id=1d266076669a66c477bb69798b4f304cbeeb65ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

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
