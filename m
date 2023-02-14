Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 573CFC6379F
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 11:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE07660B2A;
	Tue, 14 Feb 2023 11:08:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE07660B2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lSv0ySzju1Dz; Tue, 14 Feb 2023 11:08:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CE8C6058D;
	Tue, 14 Feb 2023 11:08:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CE8C6058D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0120E1BF5A2
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 11:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD25340AFC
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 11:08:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD25340AFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5AmmZJSol9So for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 11:08:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24A32404F6
Received: from smtpdh17-2.aruba.it (smtpdh17-2.aruba.it [62.149.155.117])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 24A32404F6
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 11:08:30 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.151])
 by Aruba Outgoing Smtp  with ESMTPSA
 id RtAhp0raxloaaRtAipA3iA; Tue, 14 Feb 2023 12:08:28 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 14 Feb 2023 12:08:27 +0100
Message-Id: <20230214110827.1281144-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfOxjKdZTL+J6kLGfkLm19dg9hYiR/RH1yrSTn0FSVyo1whTKWl7YtQy4CuM+BfDmlqZXFmgSBAMAGjlEYLo1XnLA64VwGSr1S7tlqLNgDergh2kud6Up
 vvBQmUku8EZrc/1GOVcpET1QLh3H3rlG+xvQSD2yYO6m7TM+jSnfFBDQijVXJ9O7cFDHNnrJdCWTDULromRCCoZnkO29tq5k5cp1ZzlD83LuaFVp3PaLNrix
 z0vwdAyg01GC3ZjlGxhUxps6WK/wCMMKbW/GgJrwSwtA6uPbR0QCv3MQtcRpBpIx
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1676372908; bh=T0WlA0yrn6afRt50xouEnIXS9pym1tkVXJsFPaUUicA=;
 h=From:To:Subject:Date:MIME-Version;
 b=C8MMaqcTZrElrBGWmwEpjJ/ArXV+4nn3GbjBz+L2oT48PcncqFypaTa5Z78TZGq/H
 R4q5ZxPkph60gsPabZN+5pXuo35no/ichLjfhuXU41VXfrgFmkRmRE6bCxUuxsDYRo
 obryuka+radWC+J3h3Ac3uRgPqjHJikUnHMrv9Zoky8oAi94QbuLxJ/G1GML7oeci8
 Yifony5oqr5kB5i+U9zsBu9fLYCVS1ArtoCaVjl6Fxcnk9d9x981oC8Kq+hGTL65KN
 VrSUGDjchm0QBy37HdaB+wuCczpt1Ilrk1RF2tKLczzj1DtwQnA3RMK3el5boMy/pl
 0a6dv2oXs88fQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=C8MMaqcT
Subject: [Buildroot] [PATCH] package/rtl8812au-aircrack-ng: bump to
 2023-02-03 version to fix build failure with Linux 6.1
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

Fixes:
http://autobuild.buildroot.net/results/e128298929fce31374687a566e50b00c150131b8/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash | 2 +-
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
index bc3a926314..cdf5f3b4e2 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  eed4888da9cfdc0f83ad3335beaf73af33ce0796b0a2637aeec102d47e1eb8f0  rtl8812au-aircrack-ng-e7a4a390ccbdd768411e1b2a8922c47837f76b47.tar.gz
+sha256  69891a35724a6c30fcb29d9eba783879e0bee3f5f7847341fce06101a7542f5f  rtl8812au-aircrack-ng-d98018d038a5db96066e79f26ed4a72f2fe1774e.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
index 45a6ce5729..ab3ebe2077 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8812AU_AIRCRACK_NG_VERSION = e7a4a390ccbdd768411e1b2a8922c47837f76b47
+RTL8812AU_AIRCRACK_NG_VERSION = d98018d038a5db96066e79f26ed4a72f2fe1774e
 RTL8812AU_AIRCRACK_NG_SITE = $(call github,aircrack-ng,rtl8812au,$(RTL8812AU_AIRCRACK_NG_VERSION))
 RTL8812AU_AIRCRACK_NG_LICENSE = GPL-2.0
 RTL8812AU_AIRCRACK_NG_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
