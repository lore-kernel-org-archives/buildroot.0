Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5809BCA1014
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 19:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02CB283B7D;
	Wed,  3 Sep 2025 19:55:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L6eVJkYR2up2; Wed,  3 Sep 2025 19:55:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D4A983AFA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D4A983AFA;
	Wed,  3 Sep 2025 19:55:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 08A734C6
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 19:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EEF73616A6
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 19:55:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ernVm6Dp0bi for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 19:55:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.146;
 helo=smtpcmd13146.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 107796169C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 107796169C
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 107796169C
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 19:55:09 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id ttZSusB4J6z5ZttZTuMAOx; Wed, 03 Sep 2025 21:55:07 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed,  3 Sep 2025 21:55:06 +0200
Message-ID: <20250903195506.1502722-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfOsWQurReqM4i6+zHMIr5mGuvETocWmglYcyyjuoxt2XA0kd2AAB8Axf7tuCppfr0bJGJcPifSlYDAmpxzeAYZmxAXmyYdBDpwYYrzTOb972Dir1AyZZ
 YPRNzNf7AkNX6AZrphMC4MsmadDzqzfOirBVJrSRiiIpeUyMO8DuOxWpdc1smsAL9BrtUM8UwBM6sFDRYugwueY8Il8DLRQnSePiOjlL/O8YGADg+pj4Mac1
 SX9PGlV7mYFhh3RVTWvGKczWclSkz/885nNQu3CBlIQGYz2zqKHJe+TP9pFj9znKJ1fUqj3/F2Bp7IbXCMTG8w==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1756929307; bh=VqdHgkAIRi5VCPyiMT1V5/WAZVGv03g2yCmnP/7y0d0=;
 h=From:To:Subject:Date:MIME-Version;
 b=RYb4U9LvTIqgeqVYO3An40VMb1+1yXLcvL7Imx5ARSWhdmR7wOAsNpZAA+628IQ1V
 KddLfoLuXuyPa8fedWSSaNPvIHfXZPeWYE/WpYL60pn5vZ3urei0nJs9dJvqrPElIY
 NKRMFJUH9KWJgZaDikrZX3rCrvGjcKGkesjrrhaPKGUPIyY5OfyWFttoR6zc7kkGEF
 qxd7MGR4Js21T+tqF4tTiBg6MpwOtTz+alk6DZEdL/poa1DaU6CHuI7Vi89WfR+iVk
 uzJ7aD1VDAwNbRWVwUT/y/YsYeTLjRsLUdYnXqWbyH60Nz1DpqsWv32nS5MAiPyEBY
 UXVVAxLGKJErg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=RYb4U9Lv
Subject: [Buildroot] [PATCH] package/rtl8188eu: fix build failure with linux
 6.16
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump to version 2025-09-03 on branch v5.2.2.4 to fix build failure with
Linux 6.16.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8188eu/rtl8188eu.hash | 2 +-
 package/rtl8188eu/rtl8188eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8188eu/rtl8188eu.hash b/package/rtl8188eu/rtl8188eu.hash
index 204ee9406b..1c14791802 100644
--- a/package/rtl8188eu/rtl8188eu.hash
+++ b/package/rtl8188eu/rtl8188eu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e1e39a5e2682b799ec113e4d7db4b4e30259ab7d2525add8a1530da87ced0fdc  rtl8188eu-702a90b02edca722cc0d139260ba02c23f406333.tar.gz
+sha256  39e9891433cb5d3a4b1b3ec3bdc8f4e1f11892da7ab69be356616625b1230400  rtl8188eu-c3104bd094970dd5944e2b28141b552630933bde.tar.gz
 sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index 6161ffd5d6..cfe048b514 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8188EU_VERSION = 702a90b02edca722cc0d139260ba02c23f406333
+RTL8188EU_VERSION = c3104bd094970dd5944e2b28141b552630933bde
 RTL8188EU_SITE = $(call github,benetti-engineering,rtl8188eu,$(RTL8188EU_VERSION))
 RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
 RTL8188EU_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
