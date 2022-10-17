Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83519C4332F
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 20:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10DD5404DD;
	Mon, 17 Oct 2022 20:18:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10DD5404DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M6KskZv6c6-t; Mon, 17 Oct 2022 20:18:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4594C40181;
	Mon, 17 Oct 2022 20:18:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4594C40181
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AB1411BF97F
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 20:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93696400E4
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 20:18:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93696400E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GAKbrHvbfYsh for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 20:18:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0BE5404DD
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0BE5404DD
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 20:18:07 +0000 (UTC)
Received: from localhost.localdomain ([146.241.87.206])
 by Aruba Outgoing Smtp  with ESMTPSA
 id kWYnoDy5SJpY4kWYnoLWZk; Mon, 17 Oct 2022 22:18:05 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 17 Oct 2022 22:18:03 +0200
Message-Id: <20221017201804.995212-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfH659AFp+dS2Di3yu2PC/6aSOXdKk5A3pQvIEpr+LKwRurx2+TyG8GCkbaSe2mRoQhMuxV+U1XyjrEomkuyo67FtB+xTggtCzQpQxLtQy78nwHBJLg/5
 0ODEsVn6Wi4yX4y7at1eRjmKEjkOLyB+XAPukshlvIwS4Kke0jguGTA7+BjBSVRa5yKCREawL2Ouudz5ulJ5q97dVcdfBhSOo1zXTwZnECB1EuZoc/6Nqs7n
 ncwD06g44vPHyjV+ddoN1wbTYUWqZWWoTDhtt/2mJPHya0J+hfKvP/JRCTUxJ7LRPlh09tbweeeC5f7WAhNT+HMGLn5ndmy2a4xs4ojXm0s=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1666037885; bh=3UAXMobP34WOlvpKx1/9sk/bvG3DySBnKEJBXRNu1nA=;
 h=From:To:Subject:Date:MIME-Version;
 b=bO8crLr5aCT1YznXlJIEuiR8/KJtJyVJa/FvDslQtsIxx+Qks7UEe2k2wxkSGiRPO
 MAx5hOozUaqbrneQ3PYQ9qzfeek5/0z+LqNdJA3YPeMTz1EsdzqUMKPDUTJbqi5yY+
 afiwpyQouzHnSSQB27n9eeWohYs4RPEg1i3KdvWJhJIyQBWqxkUMQzA8wO342DbEa5
 3kciaxE1MEBInbmX7illgDg7aNwgYJZ/j4l6mymom5Kx3ghuEpYGj5pky7tTzj8+4t
 lz/C6Ok/B2FN8zhZjabZB9IMbkKAuOshtgmtx+r9Xu2F15vSDUn3ODjlEEnBECnRP2
 7rlsG4fG3Vbrw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=bO8crLr5
Subject: [Buildroot] [PATCH 1/2] package/rtl8188eu: bump version to fix
 build failure with linux >= 6.0.0
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.org/results/550/550640296a92826f6f04d2344adde75c3025ea35/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8188eu/rtl8188eu.hash | 2 +-
 package/rtl8188eu/rtl8188eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8188eu/rtl8188eu.hash b/package/rtl8188eu/rtl8188eu.hash
index 9c7f2de4b6..1cad263ee3 100644
--- a/package/rtl8188eu/rtl8188eu.hash
+++ b/package/rtl8188eu/rtl8188eu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6bc46a13b20a2ed121844e51fd690216b2ab3b1faa1af8d9501090026ca9bd22  rtl8188eu-903b6fcb821465fe9c63e83416080df70c1c3c90.tar.gz
+sha256  2f333604b39745a003b4a3c87bda3adcc0efd68100dff4aa3b54ae7992fc0143  rtl8188eu-77c1b083c5eb8336a2381aee20add496d1c96b51.tar.gz
 sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index ebce4617ac..460bcba460 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8188EU_VERSION = 903b6fcb821465fe9c63e83416080df70c1c3c90
+RTL8188EU_VERSION = 77c1b083c5eb8336a2381aee20add496d1c96b51
 RTL8188EU_SITE = $(call github,lwfinger,rtl8188eu,$(RTL8188EU_VERSION))
 RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
 RTL8188EU_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
