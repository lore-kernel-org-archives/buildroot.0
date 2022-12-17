Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62FEC4332F
	for <buildroot@archiver.kernel.org>; Sat, 17 Dec 2022 15:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44F164052B;
	Sat, 17 Dec 2022 15:09:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44F164052B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o47k61v1Kcn6; Sat, 17 Dec 2022 15:09:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8461D404EF;
	Sat, 17 Dec 2022 15:09:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8461D404EF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5FF021BF2FC
 for <buildroot@lists.busybox.net>; Sat, 17 Dec 2022 15:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B26B81397
 for <buildroot@lists.busybox.net>; Sat, 17 Dec 2022 15:09:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B26B81397
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 03pTfI0YSmqS for <buildroot@lists.busybox.net>;
 Sat, 17 Dec 2022 15:09:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0ACA78138E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0ACA78138E
 for <buildroot@buildroot.org>; Sat, 17 Dec 2022 15:09:23 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.170.170.20])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id EEF7313F86E;
 Sat, 17 Dec 2022 16:09:18 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 17 Dec 2022 16:09:09 +0100
Message-Id: <20221217150909.6494-1-ju.o@free.fr>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1671289760;
 bh=WCJqK7kslTgwePv7/h6ZwxhZR4dhOQbYletpF7a0fBA=;
 h=From:To:Cc:Subject:Date:From;
 b=kAa1GOVW6uUU8V7DoIqgc6wBetYfrAdALcHue/TohJfUbOcf4IUC5CkpFAwZnw5X5
 A+xF3y79HyFrfczOSb4ve2T8yrSBUqdT/fbZ7fx+SEr7QQASkjf4F2DgM6doSEhquZ
 XhzZ1vMOHHYFe0I46Ek968/dSt5U0oW+h+k5sGLgz7ywlcWry/bwA8hOOeaSrmQxiE
 K8rJplDhX5oTWaYAWha/Sbv++Kifx5BLTNHBRtt2c2HE1Mv5OzA9z9X+kh3Sw24Bi7
 lWZfahbMqp7xE2kFgxlO3qQkaCxjwgvFS3b3m5lTWAXyy3u9wRqShmI1BlF3NuTpXQ
 WVO/kxS9aui2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kAa1GOVW
Subject: [Buildroot] [PATCH 1/1] Revert "package/gperf: add _CPE_ID_VENDOR
 and _CPE_ID_PRODUCT"
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This reverts commit 3712e1dee7626b0c3262c054b5b9c2769fd2a61e.

gperf -- the GNU perfect hash function generator
https://www.gnu.org/software/gperf/

and

gperftools -- the Google Performance Tools
https://github.com/gperftools/gperftools

are two different and unrelated projects.

Signed-off-by: Julien Olivain <ju.o@free.fr>
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
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
