Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 033E4E82CA3
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 14:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B69D4198D;
	Wed, 27 Sep 2023 14:51:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B69D4198D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3tL4wlgu3eSH; Wed, 27 Sep 2023 14:51:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D75194197B;
	Wed, 27 Sep 2023 14:51:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D75194197B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 74A061BF83E
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 14:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4DFC260E03
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 14:51:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DFC260E03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aPA0GnRR9p_0 for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 14:51:11 +0000 (UTC)
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 49C9760D8E
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 14:51:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49C9760D8E
Received: from localhost.localdomain ([146.241.127.78])
 by Aruba Outgoing Smtp  with ESMTPSA
 id lVsZqlNlQnT8IlVsZqNokA; Wed, 27 Sep 2023 16:51:07 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 16:51:06 +0200
Message-Id: <20230927145106.509627-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfHaVM8+aW6Rc4hV7Jh6xHwgeJrukLvVMzXzcP2ruD7TsWRE5ZhAj9C2UqUnFKVn1TDd4KTJJ8luQFcQ8YXKUAvct2vDKdTJOsECWDPsFvTgaL77aXMUT
 nSLsPDnpGyhmIduAq1wUSe5M8RNl7Cl3xdqydQHHdyMDRTZ/c7uxjj7DBLY/00xsYhhBYLK97vfo7Vum6XS7JzPE0F+4JO3bBkuSUlpvQJtQAhZvJbhK2/JV
 hUkIfeZxYG0UpugpQhUbJKe+1l5RimZBnDnStUsocQVp9c+X6n9y/Q70tB+FOrPqLKrBy9tA7zkJhO6j8DkVgTxMY7dbzrRnjmtPS26S8Ko=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1695826267; bh=H4G50lbk5NAME3YJbgjuhHOYRmm7yFYld28gQA55uBQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=nng8aoS6QmorEB9Hn+TQ8AzhiyMaAd+rya4Y7WUlP0aN6W9JmCvGybedDBSbdVz6w
 tNWARjeWa9Rqk/hJWU/B4gQ5goPcxNCegbR8j28AD/ldEs5BOu4r8Un+JleUatDim3
 /dvRcCvGRMQVuwQqbjPv9U4TZS8l6sii/YhykdZccKyCeiX9oP29b1rxvQwDmVCnK/
 5ccugfydzDrs55kBo3lEwUblPK9tSjb4QzXV4NlHNkPLhIT4pJStKQBpbJvnWDTxdd
 2nUwxMxuXCBDTAv/0ZFL8TscWOuFqkIY+/1iH9BZdvLF52Zzk7rG5tIPSWGVcRSrPh
 NKqULrCctHfcg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=nng8aoS6
Subject: [Buildroot] [PATCH] package/mmc-utils: bump to version 2023-09-26
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/a53922c5db3e605a5e81e53c034f45017ebb7db7

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/mmc-utils/mmc-utils.hash | 2 +-
 package/mmc-utils/mmc-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mmc-utils/mmc-utils.hash b/package/mmc-utils/mmc-utils.hash
index 1bdb545cbc..cd9d13324f 100644
--- a/package/mmc-utils/mmc-utils.hash
+++ b/package/mmc-utils/mmc-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9ac9718343ffa36ab9ef192728e60cce6504febe29d43fb8003c2e2ef5a7c7d7  mmc-utils-613495ecaca97a19fa7f8f3ea23306472b36453c-br1.tar.gz
+sha256  84be5003ae83b4fdb0279a693f320fd472aebd14908a1ac16bda4f675e92ad40  mmc-utils-80271e9a6fd0db9cb3a85d024664da886e94315c-br1.tar.gz
 sha256  4207d81122a02555f78c5a11b61c83a331ee03dc933e1ef9dd932ef9b434d12d  README
diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/mmc-utils.mk
index 7f88c40024..ef4d97c1ca 100644
--- a/package/mmc-utils/mmc-utils.mk
+++ b/package/mmc-utils/mmc-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MMC_UTILS_VERSION = 613495ecaca97a19fa7f8f3ea23306472b36453c
+MMC_UTILS_VERSION = 80271e9a6fd0db9cb3a85d024664da886e94315c
 MMC_UTILS_SITE = https://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git
 MMC_UTILS_SITE_METHOD = git
 MMC_UTILS_LICENSE = GPL-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
