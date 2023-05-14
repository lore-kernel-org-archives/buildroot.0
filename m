Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B487C77B7F
	for <buildroot@archiver.kernel.org>; Sun, 14 May 2023 10:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCED961499;
	Sun, 14 May 2023 10:20:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCED961499
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QYoNmDgDntCM; Sun, 14 May 2023 10:20:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9488760E77;
	Sun, 14 May 2023 10:20:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9488760E77
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EA22C1BF37C
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 10:20:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CFEE141CEC
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 10:20:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFEE141CEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B7bgAc0uc694 for <buildroot@lists.busybox.net>;
 Sun, 14 May 2023 10:20:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49E74409AC
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 49E74409AC
 for <buildroot@buildroot.org>; Sun, 14 May 2023 10:20:41 +0000 (UTC)
Received: from localhost.localdomain ([146.241.104.90])
 by Aruba Outgoing Smtp  with ESMTPSA
 id y8qEpBmjgse5dy8qEpm6wU; Sun, 14 May 2023 12:20:39 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 14 May 2023 12:20:37 +0200
Message-Id: <20230514102037.261428-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfBxdJG9riZED/L0ctryid3L3X8E5gtz6GC8gkcnR9szUyhFYXM4JrPTRS1th15A9oN4cayt6EYiLWxy2HByh7M+E22CZtT46BGCM56MfnTrvgRqVcI2X
 TbZsGUWJ/SMGDcy7PGWzU94pncslRdDjKSuuWOHgl0LTsT4Q/WipEq43nhAx2Bh8gBxQBt+knLxjShqQV1s0aZY0gOBuBtJX4Z7HwgvyvTsZV9mUzkztfyL2
 R1igYLCEfTLOUiVatPRBtQZqfsJP579bbY2yieAzji+iHauZB2AZe0BEonbYVw1mS1ZRAQ2/BVWyntbokDXUlQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1684059639; bh=BEOF2WB36o71mOscjaiguNMHc9K6A26uMPVfHBY6CF4=;
 h=From:To:Subject:Date:MIME-Version;
 b=OCXEmhyVk+spnqWO11A0+L941FsGnA9+aJ4eyKrCpvG9/WHcyt+W5Yr0F8L7fOtk3
 IChi4BIhUneprBgvK2XWN8j+zfg8OxYCtJSGvAZ+5z3rRbW4kWaiJk483Sr4cVkBvv
 +BCZbObv9QxvwAIFibpXWAErB7wzdnDXe/J8BX94T7i4Nb3Ea6IDQLPcnxTLHJ6ZPa
 JoJhgofj95Z0kGkbJ8fgtMzZYTFXpGgBFa8zgCmfxP47zfgP274/iJJrEshzNbFSND
 ZTMEqrUz5m1DQUxIEv60JSQe+wGPrKDN/xCFDmST1QMOtK/420lQIVBJZ3OU+KL21j
 /fmycsLHXkfyg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=OCXEmhyV
Subject: [Buildroot] [PATCH] package/nfs-utils: fix host build failure
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

Package nfs-utils requires libevent and sqlite so let's add these two
packages as dependencies for host package too.

Fixes:
http://autobuild.buildroot.org/results/5e1ac97e4023f902dffa066c895aa6f6005d541c/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/nfs-utils/nfs-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 2f2e200bb5..3c85be0558 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -22,7 +22,7 @@ NFS_UTILS_CONF_OPTS = \
 	--with-statedir=/run/nfs \
 	--with-rpcgen=$(HOST_DIR)/bin/rpcgen
 
-HOST_NFS_UTILS_DEPENDENCIES = host-pkgconf host-libtirpc
+HOST_NFS_UTILS_DEPENDENCIES = host-pkgconf host-libtirpc host-libevent host-sqlite
 
 HOST_NFS_UTILS_CONF_OPTS = \
 	--enable-tirpc \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
