Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC4DC4167B
	for <buildroot@archiver.kernel.org>; Wed,  6 Dec 2023 20:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21C4460D65;
	Wed,  6 Dec 2023 20:07:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21C4460D65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NeGo87C2B0Dh; Wed,  6 Dec 2023 20:07:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74AF560AE4;
	Wed,  6 Dec 2023 20:07:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74AF560AE4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F093D1BF82C
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 20:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D657160AE4
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 20:07:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D657160AE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kwbs5nuQgguF for <buildroot@lists.busybox.net>;
 Wed,  6 Dec 2023 20:07:35 +0000 (UTC)
Received: from smtpdh19-2.aruba.it (smtpdh19-2.aruba.it [62.149.155.149])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 08F2860AE2
 for <buildroot@buildroot.org>; Wed,  6 Dec 2023 20:07:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08F2860AE2
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id AyB9rIchy0L7VAyB9r36Hd; Wed, 06 Dec 2023 21:07:32 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  6 Dec 2023 21:07:30 +0100
Message-Id: <20231206200730.1948165-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfIzQkfO+DJ2LrVFJpsQBurGsQTI9u918+EXLMCEOQsTsTPbhTJeMvCxcUq6Dm6u5HHY8iEIY2/QulAxW0QhkQxlbjzve1IWskdKui20R90F0V2r+5jd5
 SrRwAeYGbhq77aX02u6JXR90KPiMSovrHevXgEi0/4G9wgxjZWQ0VqsWIpCLaNX4SNG0yQz7wWLmSLlYuXWve84X8Q7YpLUouIK1X8EZb8Gs+GGkrSeeHoN1
 qIi3sJc0rNlf73MOc0GY9tVv25u+BatFI4tbDUTZSBXoBKJq2TN+2Ogx2Tx7QnqETDosNG5Du4NzPAxvqioOKQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1701893252; bh=WHD5+EOu33W2FtCsXb9+pE4jkLgBmZ9JORDd7pwy3Ps=;
 h=From:To:Subject:Date:MIME-Version;
 b=ZsQkN+AOpviJaLmhkHlrTYAIqVYu8r6b+yfLfKP69TijFr1jYwlv2kQNInHVvq2QP
 NYHjXZTmcXkBdyEGHewh6DX80O4HFr+UIPHRjArHFrbUkA97cfqtMgby9ALQPy5ovx
 khQaP7AlZIQMeo4FuJFNzvxEr3n+ivo0ETzmbK9EwLQ/UOn3p7SPmqcwWCewrsgKdg
 WpB2oeStRCMZBltqknAgMJolIFtv/CElfMbBEXiWEeIVSwVA51yTTwGCLLnmx2SNhc
 TXThoS+kdPifkHbTVG88mWaPGIDf6s8mh4d+uUF/sXrLHw3A4DsxOWd9QvSDHt4pyx
 VFJ68/rTYqtJg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=ZsQkN+AO
Subject: [Buildroot] [PATCH] package/rtl8188eu: bump to 2023-12-04 version
 on v5.2.2.4 branch
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

This version allows to build with Linux 6.7

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8188eu/rtl8188eu.hash | 2 +-
 package/rtl8188eu/rtl8188eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8188eu/rtl8188eu.hash b/package/rtl8188eu/rtl8188eu.hash
index b3ead087d4..eb28e6cf0a 100644
--- a/package/rtl8188eu/rtl8188eu.hash
+++ b/package/rtl8188eu/rtl8188eu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6bf8c026c7d875248f18f14de6fd116cac178db9bdb5bdbc1e267c8ac6b6237f  rtl8188eu-3ff6f7d84cb5346ed8d5dc21056769f2e03746d9.tar.gz
+sha256  8cb10a047d39f13c776b0097ef1290f6b3c63590fd57bc0827e8638c878819f0  rtl8188eu-306f3e62cf7cddf8cee74f70f88a7a7b3af46f56.tar.gz
 sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index f475bf3cab..36a84d34de 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8188EU_VERSION = 3ff6f7d84cb5346ed8d5dc21056769f2e03746d9
+RTL8188EU_VERSION = 306f3e62cf7cddf8cee74f70f88a7a7b3af46f56
 RTL8188EU_SITE = $(call github,lwfinger,rtl8188eu,$(RTL8188EU_VERSION))
 RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
 RTL8188EU_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
