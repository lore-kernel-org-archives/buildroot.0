Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86994CDB482
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 12:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18CD260AAA;
	Sun, 15 Oct 2023 12:39:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18CD260AAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YjfopvpA6FmE; Sun, 15 Oct 2023 12:39:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55A4760E4E;
	Sun, 15 Oct 2023 12:39:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55A4760E4E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E54721BF489
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 12:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9A9740A93
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 12:39:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9A9740A93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rrHWBGfOBZJY for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 12:39:46 +0000 (UTC)
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E42F5405F9
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 12:39:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E42F5405F9
Received: from localhost.localdomain ([146.241.127.78])
 by Aruba Outgoing Smtp  with ESMTPSA
 id s0PGqKVhte7bZs0PHqlgnR; Sun, 15 Oct 2023 14:39:43 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 14:39:41 +0200
Message-Id: <20231015123941.1099291-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfHc1dfJ1IMTgm4VYCxNBO6ErYtZN6R22rH62v/tL9xJFV36AbSHcnaK3lWProZzVXWBgqxZd57Y+2cR1ajShLGhzQ0MoTjaZX27l6Ky5/rKd4lHGzqrr
 BnZjHJbSLz+CDf7b1yXntreSM9iyCTfWXhbxwb0yIaAj/JLOH+mrprJYJHmokzdjweN/bf89VR68DrcBiSVpaqZK1WW+BuPE9fztnBaTNwukrnKYAk4fC5Ya
 l61W67ihWK0ebkw+ZapKTjXvBWYtvdQgKX7NmWB43jzV1/LggUJEY2NSdzZEOFEf
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1697373583; bh=ei0ntobobSBzG32d6WKw2H43fB/cks4gYn9b2oJ/vwo=;
 h=From:To:Subject:Date:MIME-Version;
 b=c9uPTpU4lD+8CvyIQMIJBty3MZC4jMJg8x2rZDb8xiBuVrug+m4RFQ7HOzD0kiBqE
 CLY8vgN03D4yRokMR9+1sCdeVOtVvx81568iqXvBSC57CQTFuE3WFwcmFVeTydLJ+h
 Uzw4aaHDxZaDrGNncFMz7PltpBgEsuLfYydyH1MAU9Pp05ImoJK7Drv+4Q+HEAuxhZ
 TJynYlXpSoz73WvWzuLolLQk1Uc82mOnyYl8eVWIJZlMdL66Izbrk+ouaFtr1wCuxi
 A7b9SndL6il0RpkqoLQDoIxomT/edwHNUK3bdBybQoIFfLl1eKZpl7+52s5ilJ/SIp
 XUAcbhueT/1Lw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=c9uPTpU4
Subject: [Buildroot] [PATCH] package/libnvme: bump to version 1.6
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
 package/libnvme/libnvme.hash | 2 +-
 package/libnvme/libnvme.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnvme/libnvme.hash b/package/libnvme/libnvme.hash
index b869ae295a..b9e0281189 100644
--- a/package/libnvme/libnvme.hash
+++ b/package/libnvme/libnvme.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  f73ba1edde059b2d5e7c1048ad4f895e6047bff241c94b34a7aff5894779d086  libnvme-1.5.tar.gz
+sha256  0dd8ba8b655abe78c09833edb66632aa6bee82aebf117dd252ded968deaaeec7  libnvme-1.6.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libnvme/libnvme.mk b/package/libnvme/libnvme.mk
index 71885e198c..32d28c4ad2 100644
--- a/package/libnvme/libnvme.mk
+++ b/package/libnvme/libnvme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNVME_VERSION = 1.5
+LIBNVME_VERSION = 1.6
 LIBNVME_SITE = $(call github,linux-nvme,libnvme,v$(LIBNVME_VERSION))
 LIBNVME_LICENSE = LGPL-2.1
 LIBNVME_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
