Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50843C369C2
	for <buildroot@archiver.kernel.org>; Fri, 25 Apr 2025 22:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4F60404E3;
	Fri, 25 Apr 2025 22:26:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fusK8V5EmDut; Fri, 25 Apr 2025 22:26:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEA7E405A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEA7E405A7;
	Fri, 25 Apr 2025 22:26:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EC8D631
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 22:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D351A40585
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 22:26:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0cB0C8HwoC_v for <buildroot@buildroot.org>;
 Fri, 25 Apr 2025 22:26:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.149;
 helo=smtpdh19-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8FADB404DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FADB404DE
Received: from smtpdh19-2.aruba.it (smtpdh19-2.aruba.it [62.149.155.149])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8FADB404DE
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 22:26:51 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 8RVQunzi3voVF8RVQumo4v; Sat, 26 Apr 2025 00:26:48 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Louis Aussedat <aussedat.louis@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Date: Sat, 26 Apr 2025 00:26:44 +0200
Message-Id: <20250425222647.2340402-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfIsSRTckPAZWMErcqA0hfZkE4k2aWYfKcNojXY09tmqAf5d+z6is3kuvJBBd1t+CFbNWPq7R8mqifAkB353B1Wp2nTBucOrZyIReZaZl9KM2LnlPLWpM
 V/u15+FlXjpGZdNvZeBxUvRdvtm73FMj71c6dF2rAHGNnkqRAxF5Dlf6h+gRfF+Telbcap1yWP3L9u1eOpgWQAF4ydiy4JoJfcvekYIbsX2yR2kYMn8zQr8G
 kUGtbTXmqckSmJ26D+Bs53V1ZE9ZzYxiKui3+gsOgSQryRskufB4VNNrgO+YHIK5TZhWa62qY2N0PlbINm0k3VzfJ0xTLA5YjitlX7u0PyyfA6GcB+l3ZsUO
 Q9e84yDU3SpeyRMJCDpumYQli/M/Mg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1745620009; bh=Cw2u27vfCHpsDt5obon/ZR3Q1505nJ2LMTk5Byztw7Q=;
 h=From:To:Subject:Date:MIME-Version;
 b=e8X90gwGKp8kRLmy1ZKpRT3jkSZldR7N+9Ggy+TbL2BghQlBKE9c+J6johDBTLXDd
 joBXWdF1EBbLZeHgdafjK/5T56K3Q0beklp1MfNxfojjXxSg8DXzeB22BZkKio40Nt
 OVcwaMr3wfnZm5WbvXlpflw2/umnU9aeaRpGFB5yWymi6GSXTFA/CPRnjmLymhdo6e
 MGhlS8CnQACzHeJgab6WEphm8d1xFYvTJ0pkMFYnVw050JiN8Lcw0REe9e1BnXgoQq
 6pIJEyB54dr4oGwaQXnhaSI2WBFOFZ6v4esqyz2LHpeVQDN74TGuc2U9TzuA57XulC
 4qVro1w0LvkHQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=e8X90gwG
Subject: [Buildroot] [PATCH] package/rtl8189es: bump to version 2025-02-24
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

With this version we can build with Linux 6.14.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8189es/rtl8189es.hash | 2 +-
 package/rtl8189es/rtl8189es.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8189es/rtl8189es.hash b/package/rtl8189es/rtl8189es.hash
index 4b176b56a5..28dedca8d3 100644
--- a/package/rtl8189es/rtl8189es.hash
+++ b/package/rtl8189es/rtl8189es.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  12bbf8e8c67722f6d350727aea3e9aeadfa9234e64756f3342fd3aac417a88f4  rtl8189es-6b4cfb5c37f10c099d330ece54436706161c2f2e.tar.gz
+sha256  85aa06192594d8e5885eaec72e3792c7816f714d682897ff0cbd0ba48a134dcc  rtl8189es-fcf2a5746e6fe11d9d71337ee5dac6cf43423a97.tar.gz
diff --git a/package/rtl8189es/rtl8189es.mk b/package/rtl8189es/rtl8189es.mk
index cbbfebe675..49a6ddfd1a 100644
--- a/package/rtl8189es/rtl8189es.mk
+++ b/package/rtl8189es/rtl8189es.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8189ES_VERSION = 6b4cfb5c37f10c099d330ece54436706161c2f2e
+RTL8189ES_VERSION = fcf2a5746e6fe11d9d71337ee5dac6cf43423a97
 RTL8189ES_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189ES_VERSION))
 RTL8189ES_LICENSE = GPL-2.0
 
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
