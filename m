Return-Path: <SRS0=Uqjv=MW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE9B3C4338F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 13:12:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84AB360F5C
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 13:12:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 84AB360F5C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tkos.co.il
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37FC5606AA;
	Fri, 30 Jul 2021 13:12:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2sqyw4OY51fx; Fri, 30 Jul 2021 13:12:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7271160748;
	Fri, 30 Jul 2021 13:12:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C1D921BF390
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 13:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE32683B45
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 13:12:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vAoPXuIwkGHf for <buildroot@lists.busybox.net>;
 Fri, 30 Jul 2021 13:12:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx.tkos.co.il (guitar.tcltek.co.il [192.115.133.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EBD8083B51
 for <buildroot@busybox.net>; Fri, 30 Jul 2021 13:12:49 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id 07FF7440432;
 Fri, 30 Jul 2021 16:12:29 +0300 (IDT)
From: Baruch Siach <baruch@tkos.co.il>
To: buildroot@busybox.net
Date: Fri, 30 Jul 2021 16:12:42 +0300
Message-Id: <c9fb789ac40e708a74c1b69fcf90904ae599af0f.1627650762.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] i2c-tools: bump to version 4.3
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Drop upstream patch.

Update README hash for text changes that are not related to license.

Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: Matt Weber <matthew.weber@collins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...transfer-add-check-for-returned-leng.patch | 41 -------------------
 package/i2c-tools/i2c-tools.hash              |  4 +-
 package/i2c-tools/i2c-tools.mk                |  2 +-
 3 files changed, 3 insertions(+), 44 deletions(-)
 delete mode 100644 package/i2c-tools/0001-Revert-tools-i2ctransfer-add-check-for-returned-leng.patch

diff --git a/package/i2c-tools/0001-Revert-tools-i2ctransfer-add-check-for-returned-leng.patch b/package/i2c-tools/0001-Revert-tools-i2ctransfer-add-check-for-returned-leng.patch
deleted file mode 100644
index 7173efe2190d..000000000000
--- a/package/i2c-tools/0001-Revert-tools-i2ctransfer-add-check-for-returned-leng.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 06a1909ae1e8ae1edc70dc48dd22a32ba5eceecb Mon Sep 17 00:00:00 2001
-From: Wolfram Sang <wsa+renesas@sang-engineering.com>
-Date: Tue, 9 Feb 2021 12:05:56 +0100
-Subject: [PATCH] Revert "tools: i2ctransfer: add check for returned length
- from driver"
-
-This reverts commit 34806fc4e7090b34e32fa1110d546ab5ce01a6a0. It was
-developed against an experimental kernel. The regular kernel does not
-update the new message length to userspace, so the check is always false
-positive. We can't change the kernel behaviour because it would break
-the ABI. So revert this commit.
-
-Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
-Signed-off-by: Wolfram Sang <wsa@kernel.org>
-[Peter: drop CHANGES update]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- tools/i2ctransfer.c | 7 +------
- 1 file changed, 1 insertions(+), 6 deletions(-)
-
-diff --git a/tools/i2ctransfer.c b/tools/i2ctransfer.c
-index f2a4df8..b0e8d43 100644
---- a/tools/i2ctransfer.c
-+++ b/tools/i2ctransfer.c
-@@ -88,12 +88,7 @@ static void print_msgs(struct i2c_msg *msgs, __u32 nmsgs, unsigned flags)
- 		int recv_len = msgs[i].flags & I2C_M_RECV_LEN;
- 		int print_buf = (read && (flags & PRINT_READ_BUF)) ||
- 				(!read && (flags & PRINT_WRITE_BUF));
--		__u16 len = msgs[i].len;
--
--		if (recv_len && print_buf && len != msgs[i].buf[0] + 1) {
--			fprintf(stderr, "Correcting wrong msg length after recv_len! Please fix the I2C driver and/or report.\n");
--			len = msgs[i].buf[0] + 1;
--		}
-+		__u16 len = recv_len ? msgs[i].buf[0] + 1 : msgs[i].len;
- 
- 		if (flags & PRINT_HEADER) {
- 			fprintf(output, "msg %u: addr 0x%02x, %s, len ",
--- 
-2.20.1
-
diff --git a/package/i2c-tools/i2c-tools.hash b/package/i2c-tools/i2c-tools.hash
index 150bdb2e6341..9bfdacb3f1ef 100644
--- a/package/i2c-tools/i2c-tools.hash
+++ b/package/i2c-tools/i2c-tools.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/software/utils/i2c-tools/sha256sums.asc
-sha256  37f2dabc7082d185903ff21d1f584b5dcb4dd2eb2c879bbd8d7c50ae900dacd6  i2c-tools-4.2.tar.xz
+sha256  1f899e43603184fac32f34d72498fc737952dbc9c97a8dd9467fadfdf4600cf9  i2c-tools-4.3.tar.xz
 
 # License files
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
-sha256  370e8bc3d45744170cc4b12dc5135b107fa40a00179a19973fbd714146dec04c  README
+sha256  2293b6e9076984d02184ff620baac557143e16cfa47d88f0a791d05a1271742c  README
diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index 8936f6c4f6d7..7565349f5efb 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-I2C_TOOLS_VERSION = 4.2
+I2C_TOOLS_VERSION = 4.3
 I2C_TOOLS_SOURCE = i2c-tools-$(I2C_TOOLS_VERSION).tar.xz
 I2C_TOOLS_SITE = https://www.kernel.org/pub/software/utils/i2c-tools
 I2C_TOOLS_LICENSE = GPL-2.0+, GPL-2.0 (py-smbus), LGPL-2.1+ (libi2c)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
