Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FA9C32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 16:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CAB341A42;
	Sun, 18 Sep 2022 16:31:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CAB341A42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p3wLnQsXNhiC; Sun, 18 Sep 2022 16:31:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32B6641A59;
	Sun, 18 Sep 2022 16:31:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32B6641A59
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0DB311BF5B5
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 16:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCDAE83EEB
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 16:31:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCDAE83EEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RYpTT96WiSeL for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 16:31:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFEFB83EBD
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFEFB83EBD
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 16:31:49 +0000 (UTC)
Received: from localhost.localdomain ([146.241.46.240])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ZxCuovn8UsT4eZxCuogGCI; Sun, 18 Sep 2022 18:31:48 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 18:31:47 +0200
Message-Id: <20220918163147.1133842-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220918153710.GC1127102@scaer>
References: <20220918153710.GC1127102@scaer>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfD0f8hox+QeWPamLGB5fUXPdV/DnPXBjp+DSh4BgxnopbUk6Hi5mV2ZqqHkfjRvaOn+stBiO62qTq4+2JFfYOLlvcOB3nZG03n6O1eQM0dSZNErbmXrE
 liQAraAjBNZ/wsSJM4FYcenTN6Fi7ZunZsGUisi4d03RDwKaHI+2HVSn1ZIhK5Y94ETcNzjyUOMCbYpwApBTCZqa3On0omA9/xkoS7A25t2eoJ2ZlIrZ1VHd
 ChLQt2ExYxbVx0v8cRPpZHnrRhfS3nrwjdFS77Tl3LAfIV7SwJiQwZYetR3TOsiz9gf05UYb642ccLYC7dQiNuOGU2uLfe+FdghEJZ6qDuUUsw3pnxOSvFWG
 eypXD7OxeytUQtHdm1QBc18HFStnSw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1663518708; bh=HicaNDHMZCRZ7G72mcIp8P4/KS6AhL4B3k4InQ9zQME=;
 h=From:To:Subject:Date:MIME-Version;
 b=Thj7lc8n6A5sdeITU8vhw/2joPNBOwm14Fe+aI7979sKKy0NpXVEdM57cQf+gCmnz
 FgwpR5sThgMhG3n89FG/OZ4u1OkCfPiBKq2ns5++DhPLOevxqd7SK5a3Ispht5PUmq
 JoJ0dqeU/CSfWymWSYtIyYsEYqL5k03wMg2yv7UDU0WGO9RUCCKSkJWR0m8hQ/52PH
 0Eb5qTp0MvUcPVOqCg49wM2D0n4ME8MNL3pAVAPZ+eVgvFm78dkKm1aNhSbO40eCb5
 v9a1wNNROKdnqUDrIReZR8QSWwIcY5VaKyNzr7jZ28auPhsDQTRWXeaWV4sX6jXa+0
 41DW98lYl7a2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Thj7lc8n
Subject: [Buildroot] [PATCH v2] package/mmc-utils: fix build failure due to
 a warning and -Werror enabled
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
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
https://patchwork.kernel.org/project/linux-mmc/patch/20220918161751.1132590-1-giulio.benetti@benettiengineering.com/

Fixes:
http://autobuild.buildroot.net/results/18c4fce5416e5d1ccd95900ccef87d4c045a361e/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* change local patch approach after feedback in linux-mmc mailing list
---
 ...ils-fix-warning-on-uninitialized-cnt.patch | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/mmc-utils/0002-mmc-utils-fix-warning-on-uninitialized-cnt.patch

diff --git a/package/mmc-utils/0002-mmc-utils-fix-warning-on-uninitialized-cnt.patch b/package/mmc-utils/0002-mmc-utils-fix-warning-on-uninitialized-cnt.patch
new file mode 100644
index 0000000000..04ba6ea399
--- /dev/null
+++ b/package/mmc-utils/0002-mmc-utils-fix-warning-on-uninitialized-cnt.patch
@@ -0,0 +1,47 @@
+From 639a80658dfe4302617a3fd22cbae4714efd40b6 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Sun, 18 Sep 2022 14:10:29 +0200
+Subject: [PATCH] mmc-utils: fix warning on uninitialized 'cnt'
+
+When building following warning shows up:
+```
+In function '__bswap_32',
+    inlined from 'do_rpmb_write_block' at mmc_cmds.c:2293:27:
+/home/autobuild/autobuild/instance-15/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/bits/byteswap.h:52:10: error: 'cnt' may be used uninitialized [-Werror=maybe-uninitialized]
+   52 |   return __builtin_bswap32 (__bsx);
+      |          ^~~~~~~~~~~~~~~~~~~~~~~~~
+mmc_cmds.c: In function 'do_rpmb_write_block':
+mmc_cmds.c:2270:22: note: 'cnt' was declared here
+2270 |         unsigned int cnt;
+      |                      ^~~
+cc1: all warnings being treated as errors
+```
+This is due to function rpmb_read_counter() that doesn't set its
+argument 'unsigned int *cnt' in all return points. So let's set
+*cnt to 0 in the return point that misses to initialize it.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+[Upstream status: https://patchwork.kernel.org/project/linux-mmc/patch/20220918161751.1132590-1-giulio.benetti@benettiengineering.com/]
+---
+ mmc_cmds.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/mmc_cmds.c b/mmc_cmds.c
+index 12b7802..4d203ef 100644
+--- a/mmc_cmds.c
++++ b/mmc_cmds.c
+@@ -2238,8 +2238,10 @@ int rpmb_read_counter(int dev_fd, unsigned int *cnt)
+ 	}
+ 
+ 	/* Check RPMB response */
+-	if (frame_out.result != 0)
++	if (frame_out.result != 0) {
++		*cnt = 0;
+ 		return be16toh(frame_out.result);
++	}
+ 
+ 	*cnt = be32toh(frame_out.write_counter);
+ 
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
