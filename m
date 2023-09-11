Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28928EE57DF
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 19:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3D4581F20;
	Mon, 11 Sep 2023 19:56:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3D4581F20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NwwSlLf0pn4R; Mon, 11 Sep 2023 19:56:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2777881F14;
	Mon, 11 Sep 2023 19:56:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2777881F14
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CC6C91BF2BB
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF79260E62
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:56:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF79260E62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MIfqSfXmF3zj for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 19:56:45 +0000 (UTC)
Received: from smtpdh16-1.aruba.it (smtpdh16-1.aruba.it [62.149.155.100])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7AD7F6068B
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 19:56:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AD7F6068B
Received: from localhost.localdomain ([146.241.108.254])
 by Aruba Outgoing Smtp  with ESMTPSA
 id fn1VqfjYkQSEzfn1VqqyEJ; Mon, 11 Sep 2023 21:56:41 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 21:56:40 +0200
Message-Id: <20230911195640.1487444-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfG7v+fKONfBktb99Rq+e2Q+WvJ7T65C68XSvK6F+Bhv+4X0DAzJ0UrBIviU9RD7moOfxT8rhaA20wu/9q7kcaq2c+jYZ/x52H8UdE5F0bqaH5zMOfy0b
 hhhe57tBB+ZWHcMDuyQKBCDWFBFP1gcxpnd3pV+sBz+4OwlnoIVS3ElFrkwfHmpF2opk/uy87iy0Qz/khcfV+CwIFq/CmV8b4yLACLY08B0u4JHrss4Ky82F
 Y5QuPBn/f9EfxZjpASJIV7y/wmiLXzOrSC3t+w1/NAbQi99wseHFZ4Mra9hP6tjZ
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1694462201; bh=/6anQVaA4m2Vl1yNhRWbtlrGUml0JR8yH4oCOLIHpfs=;
 h=From:To:Subject:Date:MIME-Version;
 b=D3ydzUa8PEHMVl1i/b3sQmjdleZ5vR32ckCRk6X9/YsqNKII9Yn2GwFboD3SiwtcR
 hvWHlARJzN1jgclhdwHcfMX86/BXcz//V9+gEK3zNDBtDPyOapZg5oyY/BrC6rxEXl
 N+9vs4EsLBJHMehsqaQs+TTKzXYNKAADG/TBRwDjQcZ4+Y7qmPydDtTctvapOx0Uzv
 ymtUEMJh9BCEEtyF8Pn83Fx5fkbWxo8D+ION1KAJDIRjgBVmAfrjgUzT2dhfybQwJA
 lW8ta5fa9XWvW/19S1Xz+sQO3q+VG9HorYZ6lQ0AT6kU7H1wktTUMPvKTHcDFt99ga
 FjPRb1NV6P3Dg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=D3ydzUa8
Subject: [Buildroot] [PATCH] package/rtl8812au-aircrack-ng: bump to version
 2023-07-23
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

This version fix build failure on Linux version < 5.15.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash | 2 +-
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
index ed75b09816..bd6c87d56e 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3545efb56ecba757e1e27a5479653835e3f5be4f5b49eb9e1e4ff87cbeb6e783  rtl8812au-aircrack-ng-35308f4dd73e77fa572c48867cce737449dd8548.tar.gz
+sha256  78926af85bd1630ff599d0ec174d7c4c130141cb210a187946ea48ac1015809b  rtl8812au-aircrack-ng-04f600ee54a414b871aea509fcd4709838c8c522.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
index a666757449..99d63432a4 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8812AU_AIRCRACK_NG_VERSION = 35308f4dd73e77fa572c48867cce737449dd8548
+RTL8812AU_AIRCRACK_NG_VERSION = 04f600ee54a414b871aea509fcd4709838c8c522
 RTL8812AU_AIRCRACK_NG_SITE = $(call github,aircrack-ng,rtl8812au,$(RTL8812AU_AIRCRACK_NG_VERSION))
 RTL8812AU_AIRCRACK_NG_LICENSE = GPL-2.0
 RTL8812AU_AIRCRACK_NG_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
