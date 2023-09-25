Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E79CE7A94
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 11:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 981296104D;
	Mon, 25 Sep 2023 11:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 981296104D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UOTx0TtDGUfW; Mon, 25 Sep 2023 11:46:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC5296080A;
	Mon, 25 Sep 2023 11:46:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC5296080A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AC9661BF2C9
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 11:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 862AA6080A
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 11:46:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 862AA6080A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8lRXYyoVSXNb for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 11:46:20 +0000 (UTC)
Received: from smtpdh18-2.aruba.it (smtpdh18-2.aruba.it [62.149.155.133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BADB561004
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 11:46:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BADB561004
Received: from localhost.localdomain ([146.241.127.78])
 by Aruba Outgoing Smtp  with ESMTPSA
 id kk2aqwAP1WqnNkk2aqQ5A7; Mon, 25 Sep 2023 13:46:16 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 25 Sep 2023 13:46:15 +0200
Message-Id: <20230925114615.1354491-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfBE82xuC2JyQBnHiH0X1Yvgw6ET//AvrwK2WHgF9AJxTNg7CAwZSdnK7K+GlNfa1e33V0gJzsM0Hov9FimF/jytXq6GZ0Wz31r1VShQAjuXbeiE3/T6R
 bhFFZQ19+ImF6rrSHhuDdEubzUUWB+GxXxn0WGSXu6YIOjZ9MGRXSug69ceCRpNc1fzan2EGt7ysyGbzG8F0asj+LxlZAmTEmTtrSlOWlGeMxWqla/nVoSQ8
 55MM5tF/gpeAA4z2EYRNom2ph2DX/B6+27gYkvpipxG5f4X8gv4WM/KNhMvqmEQpZX4U36rTmgNhLmJLkgkKZw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1695642376; bh=3xJEdoXfM5wFHr2LYV8CdwQapVJ7SjLrm8xyHL9ZVf0=;
 h=From:To:Subject:Date:MIME-Version;
 b=F9Yg8bZyknOyniwN6U6tBmossZRXeoFyqvN0myoopS3d61/uzgLHH5HPnOOBELyq4
 V07nJT122eoelyr+9XcizZrcGrQ9xWM3M8y0+QOKsKjg4LDFnkE+sEWxnfxCt8ZQ6Q
 mlEMlil3Mnsba7eoGPE5j2ayLwv7sn6cD77VfT0E68BV0aOZBOAhJ48VSz18Qm43ns
 a0TaHKwAEpRD14kVWsItw7SGu369pcI2YEBCxpu5Ww1bhMKs3F/XUSERvFWg56kSLa
 9r+g1bfEpZGhxZhADuWcUA4OyWEhLKf36Gu0w6z9R/O9thPU4Du5iIImusRl4d0U5H
 YJJdKDrIxcR8A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=F9Yg8bZy
Subject: [Buildroot] [PATCH] package/rtl8821cu: bump to version 2023-09-25
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
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With this version we can build with Linux 6.5.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8821cu/rtl8821cu.hash | 2 +-
 package/rtl8821cu/rtl8821cu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8821cu/rtl8821cu.hash b/package/rtl8821cu/rtl8821cu.hash
index 84c724c044..c98fd6234f 100644
--- a/package/rtl8821cu/rtl8821cu.hash
+++ b/package/rtl8821cu/rtl8821cu.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  78a8e730ad1ec05b10c4ee97b5cf0a8f5bcd1654b2c5332533c5cf4bd77078d8  rtl8821cu-dc9ee6c6a8b47d0e365fcf1977439c7243da71d5.tar.gz
+sha256  8e155db366b5a97bc629534131e4fe1e29b455aa0ec9e1f42af23a9b6f610107  rtl8821cu-de36dfeff890086a9f30cd0052715fbaa9554087.tar.gz
 sha256  22cdb0a9cf492dbf05c5b27381a5c0e73ae0d4622427b522b0ba92b7495e5fb0  LICENSE
diff --git a/package/rtl8821cu/rtl8821cu.mk b/package/rtl8821cu/rtl8821cu.mk
index 5b21b04404..09fca49eb3 100644
--- a/package/rtl8821cu/rtl8821cu.mk
+++ b/package/rtl8821cu/rtl8821cu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8821CU_VERSION = dc9ee6c6a8b47d0e365fcf1977439c7243da71d5
+RTL8821CU_VERSION = de36dfeff890086a9f30cd0052715fbaa9554087
 RTL8821CU_SITE = $(call github,morrownr,8821cu-20210916,$(RTL8821CU_VERSION))
 RTL8821CU_LICENSE = GPL-2.0
 RTL8821CU_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
