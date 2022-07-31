Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A77C00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 10:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8D6182BA7;
	Sun, 31 Jul 2022 10:43:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8D6182BA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZDmLfX65H5O1; Sun, 31 Jul 2022 10:43:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBEDF82B08;
	Sun, 31 Jul 2022 10:43:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBEDF82B08
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8D40C1BF30A
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 10:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7554182B08
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 10:43:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7554182B08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fHIr78QSMNNF for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 10:43:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4552C81B6D
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4552C81B6D
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 10:43:04 +0000 (UTC)
Received: from localhost.localdomain ([146.241.73.23])
 by Aruba Outgoing Smtp  with ESMTPSA
 id I6PWo6huxrvmbI6PWoSnkW; Sun, 31 Jul 2022 12:43:02 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 31 Jul 2022 12:43:01 +0200
Message-Id: <20220731104301.5987-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfOTet9F4QN1Zg97Dx7/D8o88B80apHGq99fkjvZwwIFtqto25YFKR3vBZSjBVF4yEUpiX9/CGssWDQJT0vz1z5Btdq2mxBTqg4JDw+zcvaTTDfxabDUr
 A5IqfIRmcQe56Q0PYpgAsixFH068a+x5VGx2JICQOTpGByBxI/cZV+mfsS/LH0JohlrQOstuCkJQJXtqHz7XwE7iJPz4A8Ca7VdvV0Rlu2SiClEKiOzf1Usj
 IVViBoYoLRb3zr9Q+GcR+mUm7rjKxf/zUoYtttpJZ+KvZ12kq51k+ju6VJZIYePv
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659264182; bh=DrAHCvwkT9GcO6UU91FPvKLR7xHhVHkZdUNia9yFlPU=;
 h=From:To:Subject:Date:MIME-Version;
 b=WlUFgoITAC/hQTyB4A2bn61Ugxy8T7ymqOSHvj8UqBlTz74SDpK1F7dkKjCshcYpj
 3gMmgMe8dx0dHySifM+sA2sXAw1SBp2tgHW9Fn+nGbd1NE/QfxWE0M3Y5X4sPMtMbW
 IQ03OjJW7iibmPlA8/zd//huzfX69wQ7wJxcYf4GwQpUB9tfo3xRQajdEvL/ccAIpe
 //gr2dp/hGvuepyXnRBldVwCxbADZfX7LbxeoshZ4wEDAoocACybmd9mgAuwSqlKEa
 X/36ssAA9OI3xMXnxWP8XUWQxzrpsMN/gtdyYoLfLbB0hz1RYIyL21I2nXy19u0V/p
 s7CB5MxYHenig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=WlUFgoIT
Subject: [Buildroot] [PATCH] DEVELOPERS: remoove useless whitespaces before
 tabs
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

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 88e0d02c69..8bfe9b4d5c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2744,8 +2744,8 @@ F:	board/pine64/rockpro64
 F:	board/radxa/rockpi-4
 F:	board/radxa/rockpi-n8
 F:	board/radxa/rockpi-n10
-F: 	configs/friendlyarm_nanopc_t4_defconfig
-F: 	configs/friendlyarm_nanopi_m4_defconfig
+F:	configs/friendlyarm_nanopc_t4_defconfig
+F:	configs/friendlyarm_nanopi_m4_defconfig
 F:	configs/orangepi_rk3399_defconfig
 F:	configs/roc_pc_rk3399_defconfig
 F:	configs/rock_pi_4_defconfig
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
