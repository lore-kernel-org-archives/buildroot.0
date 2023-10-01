Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F48E748F3
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 18:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE0FF409CF;
	Sun,  1 Oct 2023 18:05:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE0FF409CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hocnmkS0CnAb; Sun,  1 Oct 2023 18:05:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8D474157D;
	Sun,  1 Oct 2023 18:05:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8D474157D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 598A61BF592
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 18:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D43260BC3
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 18:05:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D43260BC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y4hSh8cmiHRb for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 18:05:18 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E5B7260B83
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 18:05:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5B7260B83
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([89.144.223.100]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MXp5a-1r7vqp0rAy-00Y9bF; Sun, 01 Oct 2023 20:05:15 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 20:04:37 +0200
Message-ID: <20231001180437.1274555-2-dalang@gmx.at>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:Q3SVK4RHJ5BTWn6RvvBMHzWheYA5xrJnmZtP7KEW+FoT8qkGIj0
 veupBFyv+KdvCrTE9zGHJNc/wwOtM1bmKdJqZskGFYXsepTmgvC3QO+typolyqNzPhrWIFS
 NxVaHfMd8Lf0ifCUPB7L+T3juRGyp3YgzhzLzaDZ9O675ftEkVOMh6ZqPDPdPqMX26Zf+2u
 LOrZ4faRJqLfJLHaL+LtQ==
UI-OutboundReport: notjunk:1;M01:P0:k0RHVmvW6CQ=;oDiTevZ757GQ4z5tLpC2Aw4ecjk
 blhUqB3hzpF6nBEazMUcBRoYB4iTR75XuIZCqmZy1YFu1qlVNqrM+wX69rfIVmfdMkn5MAixY
 ywvcnCwuvN9kWDZE91P6ieYsz5MOrfdPzbkJLDqy4mpF91dyJ7ADYB0fW/1ZbJjxLvDrCA9ob
 34IrDYKG3aBaxVwQ4pGUROTXDj3eN3jO+ttC3m8B5BgDO7SgmEumS3dqhrnRNiLOQb8DBm7Cy
 tMObZLJjwZFYALGgfMyLd1okVvBAi9TEi7WiWPLPvM+p+EurqzhGCvEkLwWURTVvFGDdJlB7T
 hAwQpCw4VBRPJ5vT5JjAvwC774ZiqjKU1mZo+HXSxK0ZNSA5b6qEKxcf6bhTZwoe5YpfMjIz/
 S+z274c4XvBAkr4P3yogqHFvPUaGZ6BzEmnexq/qS9pazpvaTcGNQ7ZFtv4vfMJofqaEaAiRf
 s/sw6bE2L4B+FkFfPB5iCOc9HtWDRk8KoU6AR97NGKNAiY1BaXE1u9QWMxVIbW6OPj/6C4Sht
 W23DOFlIX5ahXBZ2MX6MvmTfVY+YugckfA4GLQgksWi4Ex/ohlYe8lRae1Zf8gX+iMQqyhyeD
 xsPQL5vdZtehQdssZT0CzHarLekeh6Ts2ovzpbhrXJ1crTGoKg1ESJW5yn8F7Q4b79UUmDa5A
 TJZXGqWeylWUebjq1DrtUyaKVW3Kxk7YcbmoXAYmOpnGjvmfGSC9U73OLZICDmM9UkW8EJWcR
 qY7mZ0SKTxZ6WpwkM/l0hB/eSLYNFMCQoCz3pjub9pnP/nel3oh17jUZZ3nqfPRxN+jh9iFoK
 OMBEz1OIbD9Lrx3Omo0aMpK3KOyRDYgQuaIaehe80srAvM21hfO3UJmrB1XAcq8ENdz0qZwRG
 waHo9+TrK1jbtJIZWD9gBR1rtu0tab8Mgxi4e4xI7uf0In3vRF5vkbV9RvnJThk90seewtDwq
 FOa7DORUSqoZrLBfQlwnaflyyfU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1696183515; x=1696788315; i=dalang@gmx.at;
 bh=ISjqh46mG0toHc2T3nquHOzm5PuGXaXc0lma6DprTpA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=jr3fADnaqnbyKEoBj5/SXRTlswmkWI0QZcTnFZl5rjP1Xqflz8Y8ocYO/6qSr7WIfvIQHRiP+10
 9uldf6iY6u/wpKiC4d+58u78BQOjbainr9mlqfsXTP8YXGIlwREYKsPXQvvpfdR2hC5fskaYbO3HR
 RrD76S0kPb1ATTB9QTyp94naBi2LtB6KMqW4SkyBBsRXi7kjkgXEQ3GrV+5VotNGZ4SnBWHoPZaCY
 jtF2MNt1ZpPKO9XWF5UWIFHQc/rluGq8gb5KGgFc6TYc8mAQJ4GMUbMHnnXppKav04q/o6GUsacIs
 MuUCiNGYm5i+6ZzoLtwFCQmcIyOcvbwqm9aA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=jr3fADna
Subject: [Buildroot] [PATCH] package/efl: bump to version 1.26.3
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a bug-fix release.

See: https://www.enlightenment.org/news/2022-09-16-efl-1.26.3

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/efl/efl.hash | 4 ++--
 package/efl/efl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/efl/efl.hash b/package/efl/efl.hash
index 8d50400eb7..72ff3199d0 100644
--- a/package/efl/efl.hash
+++ b/package/efl/efl.hash
@@ -1,5 +1,5 @@
-# From https://www.enlightenment.org/news/2022-01-03-efl-1.26.1
-sha256  86a9677e3d48dd0c13a399ebb417bd417bd8d150d6b06cc491bc92275c88a642  efl-1.26.1.tar.xz
+# From https://www.enlightenment.org/news/2022-09-16-efl-1.26.3
+sha256  d9f83aa0fd9334f44deeb4e4952dc0e5144683afac786feebce6030951617d15  efl-1.26.3.tar.xz
 
 sha256  d666b6b2df9f5b791f85c299c65516cb55528b02a807603de246f65f4918ae22  COMPLIANCE
 sha256  5bceb52d65debe420bc520f2992807740dc928b7fdc3c2e9a74b5889177ddf4c  COPYING
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index d4a16475e5..29b3b1955a 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EFL_VERSION = 1.26.1
+EFL_VERSION = 1.26.3
 EFL_SOURCE = efl-$(EFL_VERSION).tar.xz
 EFL_SITE = https://download.enlightenment.org/rel/libs/efl
 EFL_LICENSE = BSD-2-Clause, LGPL-2.1+, GPL-2.0+, FTL, MIT
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
