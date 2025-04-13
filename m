Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE15C3601E
	for <buildroot@archiver.kernel.org>; Sun, 13 Apr 2025 21:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0257380EC0;
	Sun, 13 Apr 2025 21:06:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yv0ObxCQOVJR; Sun, 13 Apr 2025 21:06:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37F8581FE5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37F8581FE5;
	Sun, 13 Apr 2025 21:06:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 84290DE
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 21:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6800581FE5
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 21:06:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O4-YJkoWgyrL for <buildroot@buildroot.org>;
 Sun, 13 Apr 2025 21:06:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.147;
 helo=smtpweb147.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DD00E80EC0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD00E80EC0
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD00E80EC0
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 21:06:43 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 44XIu9UM7U6JK44XIuzoae; Sun, 13 Apr 2025 23:06:41 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 13 Apr 2025 23:06:40 +0200
Message-Id: <20250413210640.384406-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMM4Y3j4obE/tyWXfUnQsMioFsjSK4UYHvItzISLoc1CPVMUPh3cIHb+PosBzEC89LPASy7cLu4qkDV7fCHAKf4Mrv5BDIS3r2UAvpaE5NIqiK3gcOzR
 JmatQZBrnY6XaeLr7MZOkiTVsjlWgej3B+SQQVxBHtOvOL/d0o8GYPdTE7GADJ9L7haG9tYf7wmIP/B+txLvKavCApVu/oq9aarX7yhmHWBtzltCEeiJGM8T
 RuPIU0c2XEdgxLIlHPZcst1cjIsOpvtIqllUNi+1BQc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1744578401; bh=NBzl6xtSPfY1v+RFEPNZRU7T1oBbYKWbqI8pMW/c3pg=;
 h=From:To:Subject:Date:MIME-Version;
 b=c2dlZ1B5BFf89L0ghCDbaKduLI6kkSq9uS0xRfyoy7Q1rmhL+mvGoFFgYbryvAhEc
 t1rqE73MBhozn8uh8WRrJ/WTL5MuVxi2cdbGj1TuIw6XwkEBW+sN/MT8jIYs0i6oSC
 aIQcqSaBqMMeVbp/1GRem65WzBT/vO8sfZdtIoJlO5qru6hbNYgN4is1bJPDg6RHir
 ouKCV8vSUDj+fHGsCmvr34O1Yw/8IHE2y0Er5wAmXfY7+N1uIeACqYU59Tm7ahPHz6
 3EcAeDwlmX0t8FxCgQ7ypYRmzv033Vn8VpyArTCCNcUCPw29kPBP4uJDcjDX/43LI2
 YBcMITS0Z9q1A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=c2dlZ1B5
Subject: [Buildroot] [PATCH] package/libnvme: bump to version 1.13
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release note, see:
https://github.com/linux-nvme/libnvme/releases/tag/v1.13

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnvme/libnvme.hash | 2 +-
 package/libnvme/libnvme.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnvme/libnvme.hash b/package/libnvme/libnvme.hash
index ace82aaec8..9496401c61 100644
--- a/package/libnvme/libnvme.hash
+++ b/package/libnvme/libnvme.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  53791f2e75773ba95449fc98a3b8b444d984624322ec6980049fd4eb289123d5  libnvme-1.12.tar.gz
+sha256  f083c21f525644a2bcca6d367d96fab813de880cba9f1746a850f3a8692a5980  libnvme-1.13.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libnvme/libnvme.mk b/package/libnvme/libnvme.mk
index 7ff7eef8e8..8184c9d0a2 100644
--- a/package/libnvme/libnvme.mk
+++ b/package/libnvme/libnvme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNVME_VERSION = 1.12
+LIBNVME_VERSION = 1.13
 LIBNVME_SITE = $(call github,linux-nvme,libnvme,v$(LIBNVME_VERSION))
 LIBNVME_LICENSE = LGPL-2.1
 LIBNVME_LICENSE_FILES = COPYING
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
