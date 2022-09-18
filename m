Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E69C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 12:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2C0F40359;
	Sun, 18 Sep 2022 12:53:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2C0F40359
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BMA6GN8eLeXf; Sun, 18 Sep 2022 12:53:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DA4E4032A;
	Sun, 18 Sep 2022 12:53:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DA4E4032A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 72F731BF228
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 12:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 489E5402E8
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 12:53:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 489E5402E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id swCKyWpLQNF9 for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 12:53:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB69540293
Received: from smtpcmd10101.aruba.it (smtpcmd10101.aruba.it [62.149.156.101])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB69540293
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 12:53:11 +0000 (UTC)
Received: from localhost.localdomain ([146.241.46.240])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ZtnJo3GiKeVWJZtnKoV0i1; Sun, 18 Sep 2022 14:53:10 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 14:53:09 +0200
Message-Id: <20220918125309.1128650-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfIfbI7LqJEgffY5IFzFOSP2BUit1wM1BooRuDbGKAz1/uqlvuOiNd2Yyo32ds8rEVjDJtCkFLxfG75lNzmj4VVA5tKjfDPU8nzSzfY6BWmOG+jn8lS2v
 wrHNX2/0TQJhzrig+N0PW7gNCNEoOQfp1yy4T2QuSsrDVyaJ1h6OyDfwqCAJTKq2kwMfppjg0y9bP4AiDKAdEnBVbQIJlPgjJsW3k0ib9LO0ogE4uNu4qH5h
 xlifxVqFf7rmCIo/5RloXYM26ptFIp4B499y+JXeICZU5vFgRQbJeAw3mud0Kmf9rvdti8SZLWu33gKXgbfeOmZxXxe6p5nExaxSJCMdcX8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1663505590; bh=EK5hpwC2m/tDV8A2Eq73rMYLXFQ774xLXmOw5jmfsSo=;
 h=From:To:Subject:Date:MIME-Version;
 b=XPkcWd6qqZ2ZmiCnRQevObqxN8PpIkkE2gVX7GGIpLzZ57yiI5ohPKBBHgECSmOaW
 2ux2siKAJ7xFPswmYodLS+QUiYTdWJ9CeWJvjyY7ZmcP8w6FxKbNsaNSpEcjvJy8Pe
 +W/rGRg3KdUfX91Mpr8ISIx560oSsUT2AndvsoG7jdnb22bhqe/B2piM0nM1xD+YSo
 qbW4jk2/mgOvLUM8mRE54y4l4MBZehciy4oNz/KIY8HYzrit9mHLbFXdW74GtkZCfi
 IJYuynBFFXFH2a3z+Ux7g1qSaAHsRrSZuOXn1HglLj2RCuOiSJeVTCSsas307zq/rj
 5I7plmztyEuqA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=XPkcWd6q
Subject: [Buildroot] [PATCH] package/mmc-utils: fix build failure due to a
 warning and -Werror enabled
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

Add patch to fix warning that is treated like error:
```
In function '__bswap_32',
    inlined from 'do_rpmb_write_block' at mmc_cmds.c:2293:27:
/home/autobuild/autobuild/instance-15/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/bits/byteswap.h:52:10: error: 'cnt' may be used uninitialized [-Werror=maybe-uninitialized]
   52 |   return __builtin_bswap32 (__bsx);
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~
mmc_cmds.c: In function 'do_rpmb_write_block':
mmc_cmds.c:2270:22: note: 'cnt' was declared here
 2270 |         unsigned int cnt;
      |                      ^~~
cc1: all warnings being treated as errors
```
Patch is pending upstream:
https://patchwork.kernel.org/project/linux-mmc/patch/20220918124210.1127345-1-giulio.benetti@benettiengineering.com/

Fixes:
http://autobuild.buildroot.net/results/18c4fce5416e5d1ccd95900ccef87d4c045a361e/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...ds.c-fix-warning-on-uninitialized-cn.patch | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/mmc-utils/0002-mmc-utils-mmc_cmds.c-fix-warning-on-uninitialized-cn.patch

diff --git a/package/mmc-utils/0002-mmc-utils-mmc_cmds.c-fix-warning-on-uninitialized-cn.patch b/package/mmc-utils/0002-mmc-utils-mmc_cmds.c-fix-warning-on-uninitialized-cn.patch
new file mode 100644
index 0000000000..e2f74879a6
--- /dev/null
+++ b/package/mmc-utils/0002-mmc-utils-mmc_cmds.c-fix-warning-on-uninitialized-cn.patch
@@ -0,0 +1,27 @@
+From bf783bbc2da0348591dd317ccd53bbfc5a57f2f8 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Sun, 18 Sep 2022 14:10:29 +0200
+Subject: [PATCH] mmc-utils: mmc_cmds.c: fix warning on uninitialized 'cnt'
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+[Upstream status: https://patchwork.kernel.org/project/linux-mmc/patch/20220918124210.1127345-1-giulio.benetti@benettiengineering.com/]
+---
+ mmc_cmds.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mmc_cmds.c b/mmc_cmds.c
+index 12b7802..777d649 100644
+--- a/mmc_cmds.c
++++ b/mmc_cmds.c
+@@ -2436,7 +2436,7 @@ int do_rpmb_write_block(int nargs, char **argv)
+ 	int ret, dev_fd, key_fd, data_fd;
+ 	unsigned char key[32];
+ 	uint16_t addr;
+-	unsigned int cnt;
++	unsigned int cnt = 0;
+ 	struct rpmb_frame frame_in = {
+ 		.req_resp    = htobe16(MMC_RPMB_WRITE),
+ 		.block_count = htobe16(1)
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
