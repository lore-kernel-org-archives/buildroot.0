Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 463B0CDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 20:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D49D7813C9;
	Sun, 15 Oct 2023 20:20:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D49D7813C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tu4sRrzWlIQ3; Sun, 15 Oct 2023 20:20:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB926813CB;
	Sun, 15 Oct 2023 20:20:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB926813CB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C5E881BF5A5
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D92A402D0
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:20:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D92A402D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UkHeWwPUYQ7S for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 20:20:39 +0000 (UTC)
Received: from smtpdh19-2.aruba.it (smtpdh19-2.aruba.it [62.149.155.149])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CDEE440B22
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 20:20:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDEE440B22
Received: from localhost.localdomain ([146.241.127.78])
 by Aruba Outgoing Smtp  with ESMTPSA
 id s7bHq03Rzilo5s7bHqjhX1; Sun, 15 Oct 2023 22:20:35 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 22:20:34 +0200
Message-Id: <20231015202034.1921882-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfOAAmPVL+Wl8bYwOLCXdaXDAtAmiJMCQvSkeJ0ljOpUCk15Cyx2SUoOiuFMJNAKxQcVWJGyCCKC319XpvEJYtc9QH0cDPh03m6FUX6Ery7YBCC/Hsxrs
 M9gN2v4EeLoWB+xWKq7HAYUYtsoA4u02WouU7TxN6rUlqoeMrC86TG6x2/K26DZyAdFTm8qL6PtB9kpOHb0AWxGXPSQLSMAmfVCftgSZhiy8/qPfdKOVcbC3
 02wVvPC1k7Dw/Jx69SlE8V2l8Dp1UrN/29NfbQgVbsCwZVOx7Ruv3S3HcPpDeDa4sRRTJHpBZ/At1Ii5g4Rc55rLff6xA7nRimjnXacNc1lz+OQXHhWAXBTF
 PBno4zhmw3G7ECV2H+TaqsOsg+4WN77OA+XJ3nFCqCeY319/kHg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1697401235; bh=I80polV+lWi9pEi6xFGptt30yRdT8lWrxp/DAL+tQ5Q=;
 h=From:To:Subject:Date:MIME-Version;
 b=Cv4ctnBYDDvm4kjo1Xan44HZlhvGsDDrUvW2lw8e3t4xtZCfxkew3Q6HTCvNhPmYQ
 YGV2FaAbeAJiDWyQJFIC0t1FwTCiLkDpSbhwnBxjsJk9wm9UeTvpDCnmtA11DoUSdd
 SavJnLh81VnMIHA2dVVJosi9Lshg/XuRdS7rRAMBlIfNMzH29up5uBwE4X07+/UFXV
 ECL46OLwjT/ZkdBsDp3W6IxlFYhQzD7GoBnIH37XIhx9k0nLamqV+YdEQBWnsLMaV4
 EDYahKpktVVDasYEsceN156qgOgukrq61RJppzO51XP3URk1kVykS5PYBxDw9ADk/W
 OeBVmxArvu4DA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Cv4ctnBY
Subject: [Buildroot] [PATCH] package/python-uvloop: bump version to 0.18.0
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
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/python-uvloop/python-uvloop.hash | 4 ++--
 package/python-uvloop/python-uvloop.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-uvloop/python-uvloop.hash b/package/python-uvloop/python-uvloop.hash
index 69834d5243..598a3ef285 100644
--- a/package/python-uvloop/python-uvloop.hash
+++ b/package/python-uvloop/python-uvloop.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/uvloop/json
-md5  bc5e841a1c3f6e8935eeaf9d82b5ee29  uvloop-0.17.0.tar.gz
-sha256  0ddf6baf9cf11a1a22c71487f39f15b2cf78eb5bde7e5b45fbb99e8a9d91b9e1  uvloop-0.17.0.tar.gz
+md5  a7679334af9a39dc89f9298088d8d235  uvloop-0.18.0.tar.gz
+sha256  d5d1135beffe9cd95d0350f19e2716bc38be47d5df296d7cc46e3b7557c0d1ff  uvloop-0.18.0.tar.gz
 # Locally computed sha256 checksums
 sha256  377025287798f9dcd819e1f826fa5fc5e2f382528691ab0528c5cf8c8c282c27  LICENSE-APACHE
 sha256  6dd4c399f26de043d77a2ad7e31db4cb5bf08ea8368b0a42d6e158635cc8ab62  LICENSE-MIT
diff --git a/package/python-uvloop/python-uvloop.mk b/package/python-uvloop/python-uvloop.mk
index 147062cf7b..9c8462d972 100644
--- a/package/python-uvloop/python-uvloop.mk
+++ b/package/python-uvloop/python-uvloop.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UVLOOP_VERSION = 0.17.0
+PYTHON_UVLOOP_VERSION = 0.18.0
 PYTHON_UVLOOP_SOURCE = uvloop-$(PYTHON_UVLOOP_VERSION).tar.gz
-PYTHON_UVLOOP_SITE = https://files.pythonhosted.org/packages/ba/86/6dda1760481abf244cbd3908b79a4520d757040ca9ec37a79fc0fd01e2a0
+PYTHON_UVLOOP_SITE = https://files.pythonhosted.org/packages/80/f9/94d2d914d351c7d5db80e102fb0d7ab3bbb798e8322ab71a9fe9f8bfa31b
 PYTHON_UVLOOP_SETUP_TYPE = setuptools
 PYTHON_UVLOOP_LICENSE = Apache-2.0, MIT
 PYTHON_UVLOOP_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
