Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D392C433FE
	for <buildroot@archiver.kernel.org>; Tue, 18 Oct 2022 13:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E306D610C6;
	Tue, 18 Oct 2022 13:39:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E306D610C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q--lIMS5oonV; Tue, 18 Oct 2022 13:39:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 225AB610C5;
	Tue, 18 Oct 2022 13:39:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 225AB610C5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 30B761BF5E9
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 13:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A654419B8
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 13:39:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A654419B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wrzCP6y1trur for <buildroot@lists.busybox.net>;
 Tue, 18 Oct 2022 13:39:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6579E40336
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6579E40336
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 13:39:41 +0000 (UTC)
Received: from localhost.localdomain ([146.241.87.206])
 by Aruba Outgoing Smtp  with ESMTPSA
 id kmokonzUeaWj1kmoko9hMV; Tue, 18 Oct 2022 15:39:39 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 18 Oct 2022 15:39:36 +0200
Message-Id: <20221018133936.356595-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfCHIbCNXTd9wkGqM7Wyt31XGoh7asSS1x2pP0m0HjkXwfzAjLazAgZlxdjHWv4YYu4T5D/0Yg5rpBpY4xZ4UgqNyecP9oaR5sfyHKkwZMxqqnaJc/1jc
 sUhfkXIf7SWTbcolNbNDCpv+l1it0AO9rW/pUot7NTFtvXy9rN2r8yVEZKLx96PTArvHhQPllzmVAnzHs8O6nrqoc1Q92xuSykAog8I94x7cVon3LvEt0XbP
 5Z6cYMt75fzST4q6j4KslrOSfphujssH+HRj/ceDphCadAz/HT/yfFTrupTEgTf+OO9Q7WB+xRgXyjct8tgyWI//HAqnkphrQeqEB3mKn29HSKXu1xtTd7Gk
 doBlTHO5GXXiyaeI4I0wDBt8bAv2cg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1666100379; bh=dLsM3ePiqNdIo9nlzeuBCJrRevcTpUOXhx+gB8AIhDY=;
 h=From:To:Subject:Date:MIME-Version;
 b=P9R3spG4FT8c3LOQAeN7K69UmNNyrNoX7XB4QGZ1C8du2lDU5TgyP4tTvaqKl6km4
 JNXW5IoIN5Dvar9QEcvh/CbCJstEnVnOTkAmdWaraCwCafn6SDCUUG85aokbL6EjCN
 oLwDzeOsQWZEhL2P5bMiQUbS0aImszs29yD7jV+McfaXeD2gfx6qkytWBDKbJNHRQt
 3tMXs1BSi5XYp172nUmOsB6lOwiSGblyqRjrt68kR+dqrFr0oRqT0jKWxFTEYU6Zi4
 +8oNOHgZbHImhwSXXy9eQLUzr9ZtfXjLnuzKSCnhyIuGGkRw0Omu2xYE1sVoWxmukH
 4VsKI41zqe1Mw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=P9R3spG4
Subject: [Buildroot] [PATCH v3] package/rtl8188eu: bump version to fix build
 failure with linux >= 6.0.0
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
 Peter Seiderer <ps.report@gmx.net>, Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Note that we use latest commit from branch v5.2.2.4 instead of
branch master.

Fixes:
http://autobuild.buildroot.org/results/550/550640296a92826f6f04d2344adde75c3025ea35/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
V1->V2:
* use specific upstream commit SHA1 since the latest is buggy
V2->V3:
* use latest commit since it's been fixed and improve commit log as pointed by
Peter Seiderer
---
 package/rtl8188eu/rtl8188eu.hash | 2 +-
 package/rtl8188eu/rtl8188eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8188eu/rtl8188eu.hash b/package/rtl8188eu/rtl8188eu.hash
index 9c7f2de4b6..0ad7786328 100644
--- a/package/rtl8188eu/rtl8188eu.hash
+++ b/package/rtl8188eu/rtl8188eu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6bc46a13b20a2ed121844e51fd690216b2ab3b1faa1af8d9501090026ca9bd22  rtl8188eu-903b6fcb821465fe9c63e83416080df70c1c3c90.tar.gz
+sha256  50529c110e0a45fbe3169d0e237c4d0959300840f5e162c24256452976fb2670  rtl8188eu-c4908ca4caf861d858c4d9e8452a2ad5c88cf2ba.tar.gz
 sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index ebce4617ac..199362d7ae 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8188EU_VERSION = 903b6fcb821465fe9c63e83416080df70c1c3c90
+RTL8188EU_VERSION = c4908ca4caf861d858c4d9e8452a2ad5c88cf2ba
 RTL8188EU_SITE = $(call github,lwfinger,rtl8188eu,$(RTL8188EU_VERSION))
 RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
 RTL8188EU_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
