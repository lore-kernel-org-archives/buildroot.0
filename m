Return-Path: <SRS0=Uqjv=MW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18AA5C4338F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 21:44:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDD9F60F46
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 21:44:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CDD9F60F46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C2564026A;
	Fri, 30 Jul 2021 21:44:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mnRftBCUhltA; Fri, 30 Jul 2021 21:44:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72A664034C;
	Fri, 30 Jul 2021 21:44:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 946DD1BF488
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 21:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F7DA4055A
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 21:43:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KhnfrfvUMn35 for <buildroot@lists.busybox.net>;
 Fri, 30 Jul 2021 21:43:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 355244052B
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 21:43:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id CD8888A355; Fri, 30 Jul 2021 21:43:32 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 30 Jul 2021 23:43:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 196b29f3273035888d8743075be453649ad82e93
X-Git-Newrev: 92f9eb53ba25ea15815493702a5c76c1338fd40e
X-Patchwork-Hint: ignore
Message-Id: <20210730214332.CD8888A355@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/i2c-tools: bump to version 4.3
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=92f9eb53ba25ea15815493702a5c76c1338fd40e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patch.

Update README hash for text changes that are not related to license.

Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: Matt Weber <matthew.weber@collins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...s-i2ctransfer-add-check-for-returned-leng.patch | 41 ----------------------
 package/i2c-tools/i2c-tools.hash                   |  4 +--
 package/i2c-tools/i2c-tools.mk                     |  2 +-
 3 files changed, 3 insertions(+), 44 deletions(-)

diff --git a/package/i2c-tools/0001-Revert-tools-i2ctransfer-add-check-for-returned-leng.patch b/package/i2c-tools/0001-Revert-tools-i2ctransfer-add-check-for-returned-leng.patch
deleted file mode 100644
index 7173efe219..0000000000
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
index 150bdb2e63..9bfdacb3f1 100644
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
index 8936f6c4f6..7565349f5e 100644
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
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
