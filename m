Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C819C4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 19:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E657B40438;
	Sun, 26 Nov 2023 19:27:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E657B40438
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mxjS-f0if7sF; Sun, 26 Nov 2023 19:27:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41DCC404D0;
	Sun, 26 Nov 2023 19:27:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41DCC404D0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C5351BF41D
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 19:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E745240291
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 19:27:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E745240291
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CdYO6yJY8Ax0 for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 19:27:23 +0000 (UTC)
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F442400D7
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 19:27:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F442400D7
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 7KmirVOXdiNRN7KmjrJRuf; Sun, 26 Nov 2023 20:27:17 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 26 Nov 2023 20:27:16 +0100
Message-Id: <20231126192716.14091-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfAGwOC0MfpvThbP5UMOrIe6LK5EAbOwyZ7OkcYK9x2wWg8jDPtbDfwWjMTlkQXdSU0ARnuiuzXlI+v0VkzF0a7d3a0CWa8QkBFIjoL2Calej/XgmPb20
 ih+B/ZUG2CpZjb1bMk5P8Xvg+KsuN/HnnuvKBl7NFI95jDfRM8KcfSOwJiQHNPa7tV/NEFEbAo0IIgJtlhniX2OYqQmDxoBhkcCLIWbl0pv5bII2Gs0cu1sa
 EpZ/vHJ3/UdMaoS/YLdx/RPE8HQYnvQyxiG4iSly+A6UZgVh0jE7UAdJUkBgpB6I3xVepTD4kLetZ/nDwXlK2Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1701026837; bh=i70prCY9NRopOR+euHN1wsNnDthmUorJLAdxBqnB6Fg=;
 h=From:To:Subject:Date:MIME-Version;
 b=Ewe29Yofi7VuDS13OL9S16YNpe3FP+DObo90sThsfkehE7PY2Zjbq7+DduJKypufx
 7IhMVfOLvRrdjnSt3nrowgNyx4AMBKCYbl/Q4meMYIBMetta4jhbVCZ/JqEUkOHMsd
 sXCmdwQpBN8CDRen+1qFQjm7sFUzTkaXeU6XA8o/dbfexIo/riS2JHGvBIoRlgR0af
 pZHd4GL/HvW5w04HkQ2XJws1sNhctREZ6EX/6j/FSJiw+bChbDig5SKBgxd2Hha2Kb
 Che6EcSbzZmr63UI62dk5eSambHWnP/Er+IVftmnw8QiEdO8tVSJeYRLmG3DGDHfzE
 mRkZfJg1JFDEQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Ewe29Yof
Subject: [Buildroot] [PATCH] package/rtl8821cu: bump to version 2023-09-26
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

With this version we can build with Linux 6.7.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8821cu/rtl8821cu.hash | 2 +-
 package/rtl8821cu/rtl8821cu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8821cu/rtl8821cu.hash b/package/rtl8821cu/rtl8821cu.hash
index c98fd6234f..3d7a1be9d1 100644
--- a/package/rtl8821cu/rtl8821cu.hash
+++ b/package/rtl8821cu/rtl8821cu.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8e155db366b5a97bc629534131e4fe1e29b455aa0ec9e1f42af23a9b6f610107  rtl8821cu-de36dfeff890086a9f30cd0052715fbaa9554087.tar.gz
+sha256  5226fefd72d2dd2b8048a8d836f731139ddcb9a34eab68e9b07acee6ee5d8553  rtl8821cu-eb52ece92607394ecc22e96b41671ec3e5b1fa30.tar.gz
 sha256  22cdb0a9cf492dbf05c5b27381a5c0e73ae0d4622427b522b0ba92b7495e5fb0  LICENSE
diff --git a/package/rtl8821cu/rtl8821cu.mk b/package/rtl8821cu/rtl8821cu.mk
index 09fca49eb3..8f344d518f 100644
--- a/package/rtl8821cu/rtl8821cu.mk
+++ b/package/rtl8821cu/rtl8821cu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8821CU_VERSION = de36dfeff890086a9f30cd0052715fbaa9554087
+RTL8821CU_VERSION = eb52ece92607394ecc22e96b41671ec3e5b1fa30
 RTL8821CU_SITE = $(call github,morrownr,8821cu-20210916,$(RTL8821CU_VERSION))
 RTL8821CU_LICENSE = GPL-2.0
 RTL8821CU_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
