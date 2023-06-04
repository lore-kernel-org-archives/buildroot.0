Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7E9C7EE29
	for <buildroot@archiver.kernel.org>; Sun,  4 Jun 2023 19:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FADA8301F;
	Sun,  4 Jun 2023 19:16:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FADA8301F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VuMM0d3dFRL0; Sun,  4 Jun 2023 19:16:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB49782F98;
	Sun,  4 Jun 2023 19:16:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB49782F98
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA9D91BF47D
 for <buildroot@lists.busybox.net>; Sun,  4 Jun 2023 19:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C23A641752
 for <buildroot@lists.busybox.net>; Sun,  4 Jun 2023 19:16:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C23A641752
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id latHTd9daAZY for <buildroot@lists.busybox.net>;
 Sun,  4 Jun 2023 19:16:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15BEE4174C
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 15BEE4174C
 for <buildroot@buildroot.org>; Sun,  4 Jun 2023 19:16:18 +0000 (UTC)
Received: from localhost.localdomain ([146.241.123.36])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 5tD5qFTmHIQzo5tD5qKy9O; Sun, 04 Jun 2023 21:16:15 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  4 Jun 2023 21:16:14 +0200
Message-Id: <20230604191614.78018-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfIrKxODSI505fTr1SnblTgpyk1GNsfTePXyNNMpyE8wO6zjBlYD0KyB7QSu0WHngWUuYyGJ4NGh1MKL/9kxfVvhdi0wHUTqZMzqQJ8UPkt2+rUs5jI8q
 aLNPYMDIJ/4Rxewle27RkHUQzzTJCE8DnnjqQ8BcVrx3FyKA3O2Rpl1xjeA4CMiH3lX0LUZk7jAYLi+OoTB7T9lM7nk5aDC6hrBIxaMgVECkhnLYR1+y4P9u
 TuZmHSnuNWkV+YvtRojJXWrO/VCAlILAvN6JTD0B3y+/qJ71DOS+ewlk/7LdqYyImehVSTqMTc1ZWT1pUH4Bfw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1685906175; bh=eiLq9u93Tea20lOoJwuZAdrGLc2XMne8LgQiZL1eHIs=;
 h=From:To:Subject:Date:MIME-Version;
 b=R42f3valAbwyaGiWEUQt/waGwdFCbeA/Tohr/2nLE+KdN1rH5rwUVgGVnBtiW+Axb
 dk5zRo3gi91jp033B9/kfl0cjnMj6p78qRyKo0/ITQCaxrRGWN9FpkU8dPRhfRmjQc
 ZWNPipcy+ye4cLW/1o1ItXLne3x1CNk/pzkle99HfdEzwRWu6zg2J7Uy8vdsscAT2R
 yGoVPndidjTZUBENzFuJTj5HS4AUAfbYqy2lNCvdrrBAihx3/36orGGipRQ5ArrfxD
 ZK6vR9uEUDt3cDQNaVbpgg05TT7cP97W1lvfbY5avxR/dNatTTzo2gL19PMB+mvyYY
 il0+luKs12jRQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=R42f3val
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.90
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 63a35285d7..7252c0f254 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_89_1_RTM/src/SHA256SUMS
-sha256  3adaedb9e70c3c5f40603bf60a01e336190a6dbe01929d395f16b01fe84a0156  nss-3.89.1.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_90_RTM/src/SHA256SUMS
+sha256  9acd6534c41d8ead19fca6fcb3fffed2f9f09c437c3d79fee6a4ee668aaa93b6  nss-3.90.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index d3f227e909..1f8d1c0d31 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.89.1
+LIBNSS_VERSION = 3.90
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
