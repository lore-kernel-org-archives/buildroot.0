Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0725FCCD183
	for <buildroot@archiver.kernel.org>; Tue,  7 Oct 2025 18:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA22B40864;
	Tue,  7 Oct 2025 18:12:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cT6qDWwbhkPJ; Tue,  7 Oct 2025 18:12:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 797F74081A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 797F74081A;
	Tue,  7 Oct 2025 18:12:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B4735226
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 18:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97D686086C
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 18:12:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a4TzJzImYoHn for <buildroot@buildroot.org>;
 Tue,  7 Oct 2025 18:12:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.131;
 helo=smtpcmd04131.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8C18960855
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C18960855
Received: from smtpcmd04131.aruba.it (smtpcmd04131.aruba.it [62.149.158.131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C18960855
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 18:12:23 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 6CAevIulPcq1h6CAfv9UVe; Tue, 07 Oct 2025 20:12:21 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Louis Aussedat <aussedat.louis@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Date: Tue,  7 Oct 2025 20:12:19 +0200
Message-ID: <20251007181220.2696681-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfAjd5ALdy+QcP36RKHOV8cZw2f92zC1C2AigxTS3vOCpLN0NGxrfVkGH3I9vuk4+ndzQugKW+MgZYlJpqfIaSOrggtQJ3JG+Fe6yMDIvt6xT8+37QPul
 2WWQbFx5R4lNRltYz3mvjevO1NrwavoU8hR6NR9/YpJj/ygfc5dY7p3k36loNcl+7EuQkgd+ak0M6WLSdq92qje3wVKLEFMPW0EUd3pTO1TbqKKO7DyIBPmq
 ucWoauLGrYY/vhmxYkNUO9p704ebTGJVRZerjzIdkF+D1TvSSriCF1R3qPLBv3QtONq1UArA2x9DUAFtl2rOdLV6rY4E7c400HZYPzeC51H0SofJjhPs+5H1
 wmSCjxFO
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1759860741; bh=tXPaUtvyI19SnVxw6fltzkYGjkEJhnOzibdnvsnH5yM=;
 h=From:To:Subject:Date:MIME-Version;
 b=d/jErvFRAK68Yf9LmbhIvkkBVZOkHQPlAPlei8igpnUBFmgEcEbAK0w26yzBHGnZ1
 gTP/9BLwdnwSe+Jm+66rlhKSHdhX8ziwrMSb2KPIWAz9FMEp28jhGSzQ+aDFAcVKA/
 vnYn0ar/EYhS18PqXCxLW6Iy+AQOD+NHpHNRJF93BC4M329hQmWr10sicEhbeykJdO
 tHCgHTnx2pdxXB7UhiHWJLsE7tM1PpWM7+qOIOMFNQUjzTQtJ45eqdN6kVlp4C5rVj
 w+8zF24IJgzeOzbsSCSbCUqgWk7BU/MAX2zhV7iPfrsy4VyjmT4ziQ5v1DNdnsjEY2
 bo+8Yf40Os/RA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=d/jErvFR
Subject: [Buildroot] [PATCH] package/rtl8189es: bump to version 2025-09-26
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

With this version we can build with Linux 6.17.

Fixes:
still not occured.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8189es/rtl8189es.hash | 2 +-
 package/rtl8189es/rtl8189es.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8189es/rtl8189es.hash b/package/rtl8189es/rtl8189es.hash
index 7f8d18a56e..2eaa881d00 100644
--- a/package/rtl8189es/rtl8189es.hash
+++ b/package/rtl8189es/rtl8189es.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  a6a7455bb1533add9ebb3afa8634d85644bcdb76279020b663e6a3f03681aaff  rtl8189es-07f03cf721f5e0317012ece4159834327680ba8b.tar.gz
+sha256  e8beac10341e70779a7699cb806504d84107d59aee2b6c0919b1ffe5f8236bc4  rtl8189es-0a5d04114fac3c9f48a343cb905fbb6a3f9f5df5.tar.gz
diff --git a/package/rtl8189es/rtl8189es.mk b/package/rtl8189es/rtl8189es.mk
index 9a2ca09668..55536a5b59 100644
--- a/package/rtl8189es/rtl8189es.mk
+++ b/package/rtl8189es/rtl8189es.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8189ES_VERSION = 07f03cf721f5e0317012ece4159834327680ba8b
+RTL8189ES_VERSION = 0a5d04114fac3c9f48a343cb905fbb6a3f9f5df5
 RTL8189ES_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189ES_VERSION))
 RTL8189ES_LICENSE = GPL-2.0
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
