Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51128C021B2
	for <buildroot@archiver.kernel.org>; Sun, 23 Feb 2025 21:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE3D560BF2;
	Sun, 23 Feb 2025 21:36:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GGPjfVJzslDU; Sun, 23 Feb 2025 21:36:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F8F160C13
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F8F160C13;
	Sun, 23 Feb 2025 21:36:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 72EC6920
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 21:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61D524094B
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 21:36:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J2yeuctPOEPP for <buildroot@buildroot.org>;
 Sun, 23 Feb 2025 21:36:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.116;
 helo=smtpcmd03116.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2C082405A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C082405A7
Received: from smtpcmd03116.aruba.it (smtpcmd03116.aruba.it [62.149.158.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2C082405A7
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 21:36:20 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id mJe6tJGgKmHkSmJe6tC3TT; Sun, 23 Feb 2025 22:36:18 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 23 Feb 2025 22:36:17 +0100
Message-Id: <20250223213617.93274-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfB45VeOrsEGv/ze9Ff2gCBjn4C01545W9PLYCjxE2sruayfV0K2MR7V9PpbJZUJ3Sd3sFBNBy+5zci7rj5v8oZcAckgZ4YyEX6PpDWl3QDyUrLeAh1GY
 olyRuE9c/Imch/YujAYfl14/MpjWZuPCAgCcZKaf1UvRbYEzPDRHG4i8o5eMonnzxrumsqxsyXDfV5gKPKRwJwrV6HZ8L3rsNYlSwil76QhXxw1fFEyamEtR
 hrjh6lWrlwDg5e4qx+MsFjmUAHisVL0PEyAqB0jSvgw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1740346578; bh=9GFQ63+l/5p8qrntL5K8+E9p/wkIW5DNGz9JVQbLNn4=;
 h=From:To:Subject:Date:MIME-Version;
 b=NxVQGIFm3XHTyfkD9rSUUyC3f26xlOqrgUBUODh8W/sLDM/MYC4Qwxnn7Y0Ndmtlv
 ArAapXgCXbNh5C7tIROETmA2aYeYBqxqSsufiALeHwviXaoRKsTWrxRtBuxc6aY5U9
 7PklQ85ZZNnmwHTDc4ohX8iL9F7WT/Uhni5yRijCfvgb6lr0iSGsjJBa1QsMv4HDS8
 1rymuYBj0x9CQsSftld4LhCmNi4Mg15cpGDrOsnEO9sdoVlzYVemwHAxewn1c9M5lg
 8rt3n4ZCih71S28tiusdQ3feIXk2eKOvfisIwjbCHEzxkGwsofp9zGYH1bQWx6aoGL
 Tesvqpl8n/3IA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=NxVQGIFm
Subject: [Buildroot] [PATCH] package/rtl8812au-aircrack-ng: bump to version
 2025-02-10 on branch v5.6.4.2
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

This version adds support up to Linux version 6.13.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash | 2 +-
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
index ea5ca3c56b..d6da50a694 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d08bad19680047cb178d8984bfdd09d9ff7765b8c9ee35a9f8f87676f0c41a64  rtl8812au-aircrack-ng-b44d288f423ede0fc7cdbf92d07a7772cd727de4.tar.gz
+sha256  56b43fa608c0b8587a03076f9beb21833e3259682f01c63df5855b3c82a61ee9  rtl8812au-aircrack-ng-80d4ba5a672f69a4a8b2c4b4dacfe804844e6952.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
index 3a7c56a3fc..afb8d25ac8 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8812AU_AIRCRACK_NG_VERSION = b44d288f423ede0fc7cdbf92d07a7772cd727de4
+RTL8812AU_AIRCRACK_NG_VERSION = 80d4ba5a672f69a4a8b2c4b4dacfe804844e6952
 RTL8812AU_AIRCRACK_NG_SITE = $(call github,aircrack-ng,rtl8812au,$(RTL8812AU_AIRCRACK_NG_VERSION))
 RTL8812AU_AIRCRACK_NG_LICENSE = GPL-2.0
 RTL8812AU_AIRCRACK_NG_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
