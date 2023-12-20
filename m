Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 266B4C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 20:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7583403EA;
	Wed, 20 Dec 2023 20:41:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7583403EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vyxnXjdHrQFQ; Wed, 20 Dec 2023 20:41:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7E61436FD;
	Wed, 20 Dec 2023 20:41:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7E61436FD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 650BA1BF365
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 20:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E046839A4
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 20:41:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E046839A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h_MTTlbCFsYg for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 20:41:24 +0000 (UTC)
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2654A8399B
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 20:41:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2654A8399B
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id G3NZrwVnE598zG3NZrrcFT; Wed, 20 Dec 2023 21:41:21 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 20 Dec 2023 21:28:18 +0100
Message-Id: <20231220202818.165002-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfHnlRkEiVrekbqJOZWu8TSJuJBlPGnqZeMFB9cAdjax43n3DtRdFBpLSwsJBuhzneWOW1GahP5BompL8b6rb9HTw30AgU3Do1FXr87DFsrCQ/JNW8Goq
 8HxaoLP8BbD0Z3Q3w95xWr+QaMiKS5HDUPzuZYg2sfdEJzIUmFK6A/ewKGL82Ddjmj3TE+GcbyKc+LU1aAm+FP3acUqu/E7f4oAHVOzNq0GRbS9cB8blTDL0
 HzCkVvs7axHLZB7OBLSqoVAh3Tc9X+tWI/IdK3S3cDQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1703104881; bh=jjqfW3exIuFMVXQw+6mHPBupTNLtSHHN8AJchWXJm/A=;
 h=From:To:Subject:Date:MIME-Version;
 b=BgoK7VkBTNHddq49wR2CE+YELQhkjXTmHO+Y6LMVlsx1/MeKRSXMl+ZMTkC3oOtSt
 tHCQPyf3OzfldACtc89J7CvJfCw4xj19mLCdUy4BRfvlox27zBi0YNHjeJ7jF6CLgR
 +V5KOqMUz4HNrEBb/Ng5RjusJvs6T+vbvw6XddBUP1Ohj4RxGtm1vOhPF36KBDhohU
 /zrv58uLe/DcT7pjV/oMnkzd/DhqnuFcjfgdcfPbGEqaYvvhSezT6FWT6JDYub0gtH
 oKcHLgUDmWC7kElnXvGleHbz7XJgvuCJ5pWRm7Nym5zjXlhyGj3ZInHjpO3eJrqtOd
 aL2NFHyyFKZnw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=BgoK7VkB
Subject: [Buildroot] [PATCH] package/libnvme: bump to version 1.7.1
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
index 2a446eaf0a..69963578cd 100644
--- a/package/libnvme/libnvme.hash
+++ b/package/libnvme/libnvme.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  93febccd2e4201a6a9c696a0208a7227adfd1649ad0523754c1885503890e77c  libnvme-1.7.tar.gz
+sha256  e9c3ad59c068788faf0f0af4296f92f8ce410d12749f0f35a541d6a21e630393  libnvme-1.7.1.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libnvme/libnvme.mk b/package/libnvme/libnvme.mk
index 688624a79e..813f7279e8 100644
--- a/package/libnvme/libnvme.mk
+++ b/package/libnvme/libnvme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNVME_VERSION = 1.7
+LIBNVME_VERSION = 1.7.1
 LIBNVME_SITE = $(call github,linux-nvme,libnvme,v$(LIBNVME_VERSION))
 LIBNVME_LICENSE = LGPL-2.1
 LIBNVME_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
