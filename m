Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C91C19F2D
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 03:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C2EB60B3A;
	Sun, 14 Aug 2022 03:12:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C2EB60B3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rHKmujChv5DA; Sun, 14 Aug 2022 03:12:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F47E60AFF;
	Sun, 14 Aug 2022 03:12:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F47E60AFF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6226B1BF969
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 03:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43E90400F6
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 03:12:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43E90400F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tFyg3iRHroq1 for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 03:12:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2429A400C7
Received: from smtpcmd0651.aruba.it (smtpcmd0651.aruba.it [62.149.156.51])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2429A400C7
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 03:12:11 +0000 (UTC)
Received: from localhost.localdomain ([86.32.63.136])
 by Aruba Outgoing Smtp  with ESMTPSA
 id N42rotjrG1ySPN42roJMjR; Sun, 14 Aug 2022 05:12:10 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 05:12:08 +0200
Message-Id: <20220814031208.508000-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfCve/LS++hIdGgC1ULMHv5xCN0Bv5M+RoD7BplTIUBEkYzrBA4HkBFY+WsxgS8MtkK37IchnKCewlkA8NPty58d9mSAf0fHxzjEdqqxrTWjdVzAgJlvV
 lI033C8nf/9yoME6RU4bzkIpBBXqTYtCWzn7VFeHLUfBYnbzPK/kUWk5LzrsPjjgidlwCn1r8L8owq/oLnf2aPjyMvFoN+3y9w1Wizm/1iXWdTWNLWEYYSxK
 xKSpHUx6dZ8e0VV4EBgNcewKE8BAXzCGeIG3gTfB1t3GTTJPKolfYFNIg9lzAwvs5/nRzJknYYwc/4hOev92QQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1660446730; bh=aul/VR9INcCiIl0YYBNmIdBo7nQeEn7p+rF+eHckfgU=;
 h=From:To:Subject:Date:MIME-Version;
 b=VayRCcR9jwpvQEv9WzFbkSLkeL4X+V6J7ZJA/6LSMtPA5raEzUxYgWqE737HqtEqU
 mH+Z6C2VHRtaZEVN8jSwt0XAN+6yCYYvYsGYZaaUSYLm5pZ3DziBi9riAaG/3Wg9Ma
 9692TD0lWdk8hLL5nNjlhLR9K18vP/T/oPfocLvMha8rM9vriVwQSW4EuNyzXIeFSM
 uodyaI2IWAmaBDLV6anmmYnL+C1RWg19/2TE4qLmygHvEebYZYysI76LAEo0PlfWyX
 2IQWWcIDNz5/im9pwonMZQD7GYBB/Z98dZm2+YHP2tZYS0+XU4hUrtvT+DzMw7Up9Y
 qtp7fmLVAzWzg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=VayRCcR9
Subject: [Buildroot] [PATCH] package/zstd: fix build failure on Microblaze
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Building for Microblaze leads to error:
```
util.c: In function 'UTIL_utime':
util.c:173:27: error: 'stat_t' {aka 'const struct stat'} has no member named 'st_mtim'; did you mean 'st_mtime'?
  173 |     timebuf[1] = statbuf->st_mtim;
      |                           ^~~~~~~
      |                           st_mtime
```
Let's define _POSIX_C_SOURCE=199309L to make st_mtim struct member
visible again. Let's do this by using the already present MOREFLAGS
variable since CFLAGS gets overridden through zstd configuration.

Fixes:
http://autobuild.buildroot.net/results/aba/abaf20f73303bf7dfde7983f32b36d43db897ced/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/zstd/zstd.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index e8f6315222..6c8fcebd89 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -36,7 +36,12 @@ ZSTD_OPTS += HAVE_LZ4=0
 endif
 
 # zstd will append -O3 after $(CFLAGS), use MOREFLAGS to override again
-ZSTD_OPTS += MOREFLAGS="$(TARGET_OPTIMIZATION)"
+ZSTD_MOREFLAGS = $(TARGET_OPTIMIZATION)
+
+# with glibc 'struct stat's member 'st_mtim' requires _POSIX_C_SOURCE=199309L
+ZSTD_MOREFLAGS += -D_POSIX_C_SOURCE=199309L
+
+ZSTD_OPTS += MOREFLAGS="$(ZSTD_MOREFLAGS)"
 
 ZSTD_BUILD_LIBS_BASENAMES = libzstd.pc
 ifeq ($(BR2_STATIC_LIBS),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
