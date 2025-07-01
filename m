Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE98FC7EE30
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 19:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7957C61185;
	Tue,  1 Jul 2025 19:08:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w7zsTvvgK11r; Tue,  1 Jul 2025 19:08:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE35A60DD0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE35A60DD0;
	Tue,  1 Jul 2025 19:08:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 50230179
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 19:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 424AE40B26
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 19:08:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZYe1ICYuE_NS for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 19:08:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.132;
 helo=smtpcmd12132.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 04B3F417B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04B3F417B3
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 04B3F417B3
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 19:08:44 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id WgLSuTx4S8eo9WgLSuLwxJ; Tue, 01 Jul 2025 21:08:42 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Kris Bahnsen <kris@embeddedTS.com>,
 Louis Aussedat <aussedat.louis@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Date: Tue,  1 Jul 2025 21:08:36 +0200
Message-Id: <20250701190841.714026-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPzrS4coI34HITms5Cy6a98mkOlUx58IhsEL/P4V0PkvhLSSV6S0OLOQSsGu5m9Cu2VA0N6g4ZYS/EiGug4s7oAzEOFBfMNOtBZHsK9v4bCXTM/sWiHX
 XuKnpvqrYE0lsLZ6XMhkc+4j5R1DviFMC7U+TU7vf2y7ib528B8ba10127rK6bFZ+QGkf9DiRiUsZGieCKamTzMPkaAp7tDc4szTQmpUxAOwCE0UK1Hxihlb
 aJkbBlkhelsn+GAIFHRDQ36JmZTGZ63wsk5oetZv7lqhQYfHjC5o0ipN2INWnHykHb0TcAlcD+KEV472gdSIijuq/Els6hT9AT+zMJUQmMbDjubgcc/8A1bF
 YkdTEQZI1YV9GmHhqq5QMpvR5P92CS8wycOhYWKF3Leb+NrmBakY87ZirWI2EWLiecHzDoXu
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1751396922; bh=JtIRz9sqOqZ86ApZ8pD+Ugtf3KjlYb0t7/js/vyr4bA=;
 h=From:To:Subject:Date:MIME-Version;
 b=KmmluUrAt41hQZxx1/EdntsS2g6XwUYnINkD4uf1YjhSVbtMd8FpeiL0zRiIh4u66
 oHYpkBGxh51uq27ktylsgaJ29gppxDIC/5tRZ88xQNkKmStvJTOpeV3VtntvfK71/g
 3TDE7Hepn4QJF+yYzMRCwBlzt/KhlrqhcDZAB9O3xgV3htLzaSMA/SxolXjRPRV+ek
 T9zagy71zWoZ0OKPrHZ1SNX6ahwqDpKGyKhLx4lr0FnyZ6iKkar442Puhj3PiJCpYR
 J6fecDj2TaIoIMlHeA4STQBJ5shauec6vBjjQBs8XQktSeKJvyDEqoqkKe9dpy09Sp
 tNrW+YqejUZCQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=KmmluUrA
Subject: [Buildroot] [PATCH] package/rtl8189es: bump to version 2025-06-21
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

With this version we can build with Linux 6.15.

Fixes:
still not occured.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8189es/rtl8189es.hash | 3 ++-
 package/rtl8189es/rtl8189es.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/rtl8189es/rtl8189es.hash b/package/rtl8189es/rtl8189es.hash
index 28dedca8d3..c0c7a7a0ea 100644
--- a/package/rtl8189es/rtl8189es.hash
+++ b/package/rtl8189es/rtl8189es.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256  85aa06192594d8e5885eaec72e3792c7816f714d682897ff0cbd0ba48a134dcc  rtl8189es-fcf2a5746e6fe11d9d71337ee5dac6cf43423a97.tar.gz
+sha256  a6a7455bb1533add9ebb3afa8634d85644bcdb76279020b663e6a3f03681aaff  rtl8189es-07f03cf721f5e0317012ece4159834327680ba8b.tar.gz
+
diff --git a/package/rtl8189es/rtl8189es.mk b/package/rtl8189es/rtl8189es.mk
index 49a6ddfd1a..b60b08fe34 100644
--- a/package/rtl8189es/rtl8189es.mk
+++ b/package/rtl8189es/rtl8189es.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8189ES_VERSION = fcf2a5746e6fe11d9d71337ee5dac6cf43423a97
+RTL8189ES_VERSION = 07f03cf721f5e0317012ece4159834327680ba8b
 RTL8189ES_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189ES_VERSION))
 RTL8189ES_LICENSE = GPL-2.0
 
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
