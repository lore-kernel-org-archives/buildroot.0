Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F97C4332F
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 18:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF9C98202D;
	Wed, 21 Dec 2022 18:03:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF9C98202D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VA5O4hr1RXGq; Wed, 21 Dec 2022 18:03:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E766782019;
	Wed, 21 Dec 2022 18:03:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E766782019
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1BC331BF844
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 18:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D34260BD0
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 18:03:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D34260BD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kE8ImIFP8T95 for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 18:03:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 272CE61093
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 18:03:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 272CE61093
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 11B3A86C76; Wed, 21 Dec 2022 18:03:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 21 Dec 2022 19:00:06 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: aaea3f2c3136c0eb4d91a7e0db6d41ec72235367
X-Git-Newrev: d8665eaa194bb3f0b561a4a2f75c827a0c68e40f
X-Patchwork-Hint: ignore
Message-Id: <20221221180303.11B3A86C76@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] Revert "package/gperf:
 add _CPE_ID_VENDOR and _CPE_ID_PRODUCT"
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

commit: https://git.buildroot.net/buildroot/commit/?id=d8665eaa194bb3f0b561a4a2f75c827a0c68e40f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

This reverts commit 3712e1dee7626b0c3262c054b5b9c2769fd2a61e.

gperf -- the GNU perfect hash function generator
https://www.gnu.org/software/gperf/

and

gperftools -- the Google Performance Tools
https://github.com/gperftools/gperftools

are two different and unrelated projects.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7aeb6c654e16863dc9d7f0d5b92414b52669299f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gperf/gperf.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/gperf/gperf.mk b/package/gperf/gperf.mk
index c2f042c464..4b928a0ebd 100644
--- a/package/gperf/gperf.mk
+++ b/package/gperf/gperf.mk
@@ -8,8 +8,6 @@ GPERF_VERSION = 3.1
 GPERF_SITE = $(BR2_GNU_MIRROR)/gperf
 GPERF_LICENSE = GPL-3.0+
 GPERF_LICENSE_FILES = COPYING
-GPERF_CPE_ID_VENDOR = gperftools_project
-GPERF_CPE_ID_PRODUCT = gperftools
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
