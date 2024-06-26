Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDA3C30653
	for <buildroot@archiver.kernel.org>; Wed, 26 Jun 2024 08:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4A71606C4;
	Wed, 26 Jun 2024 08:48:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ZAqLEnJ8R7D; Wed, 26 Jun 2024 08:48:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08F1F606E0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08F1F606E0;
	Wed, 26 Jun 2024 08:48:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7AFB01BF976
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 08:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74C3581397
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 08:48:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Okv9xE445e2r for <buildroot@lists.busybox.net>;
 Wed, 26 Jun 2024 08:48:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2D4808138E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D4808138E
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D4808138E
 for <buildroot@busybox.net>; Wed, 26 Jun 2024 08:48:34 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.75]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYvY8-1rrXdl2FPs-00Y0sS; Wed, 26
 Jun 2024 10:48:29 +0200
To: buildroot@busybox.net
Date: Wed, 26 Jun 2024 10:48:28 +0200
Message-ID: <20240626084828.20267-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:PPX7qjva5uHgUyF0dVgdFlCncNgpmP6YNSU5mPoOBajd+deUFgc
 9hjnbIcINKDb6Rgxs/ApHIUJZY1KgRlRjs7Gx9Wd7cH/jW+sSbafR/gMqZBwrmEJ/+JZlUU
 J1cXGz1QLSuGnZYxzRtHNlHnf+e/G1E8+PD2VIaaeU000f9X/frOXak+0qmB2OI5YmNZEFx
 2Nf2p9UQDFXlrdHP707Kg==
UI-OutboundReport: notjunk:1;M01:P0:U4blEnTA8kU=;Ej3WD3UtFWauUej5tMXJHxTQMz9
 9szVAX4CmSI6+Oypu2R6+tZoNY9UIu8Q/cXHt4s+j4g3BAyZCmbhm6hdYLahDf7qpupiH/mUK
 bl5W2WexCFPRlk5AnctIqg+dPCvLSWjqrDSVj4rL8JUsJopUlK/DD0nJ95fnpspdYEhUJxJba
 r3ktgrzYy5J0oYpapg9STrUUPLlR/lbN3uo1UNGSgLOw8xhgpmaS678eodEe/GZ3XwJWviEew
 +mNrhJSTD+NR/PYPzWuRHbSoixyV1qDmiYWcozMzyIm7rEva9+F6M0CpPPeD7MiOcQeGEpFuj
 u7kLmrjN6vvCeoMbhCfifPeKf9DJyKh2OIoOZi/FXN6rSzkJxxQAf3y3Z4ngCt1QjTNiQC0Ko
 3scEGME5tYiGGQ2XMAPTK/GllaPwrqdTFkUXwb4ptl8WTwmanUY5L4OUf9Y1P60/cgU/d00Wq
 LT1DqGD6VEQH3aguvxm9HamW96eHqcDrrQqmscsrj9x2tYZDE6x/ZBDw67aWh2uX9nJxNZThB
 d/z98/SwoakPVzxHHE88yUZnJoUSHdXEyKEFt71VitAL4/ylZiAckBrwbJmZwmrp5THb038+u
 nK+Dx8oXx7m6LqI9+xp3osy3WDLXab9ENn1vg8JKzJ+cZqmWyuatNg4bAm38NR+DyW4EVUxRP
 gu34R8IXhkgGIfPVXHEgI/lXWP3KvjE2+91MBpplZYgpmAdthniqmV1Dpwb832rhxDLVOdDV7
 7qCeDIfNKlPv9PeELubDZixTVFeqXXRl/BWYhuaxiRD/YvOA+PS0x4Kd9OC89V7+PjLpVwikq
 eeEoE1k15HZ2/KzkXZOxRcOMPEnmqexIN7HiqNQEpi4/4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1719391709; x=1719996509; i=ps.report@gmx.net;
 bh=4jXMBkh8wcm+b3kchWiOqg5S+1ZwQW+gqOm72LOMj7c=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=l2a1AakdAS9HKUXtrnKZ50S/x4nJG/qaLMQ+8bT7EmkU1RW1xQI6jPx8dnX7Wes9
 7BWZ5MQwliNUyKOpFvtNqJ7JzqjL6sEWocTGfgs+ud51e/bYKBeAMotkZ7rM7qfW6
 3PvKLk/5OGVrQAZuENnpNuyC9bS7ZRz+s/0XNMJjxpZIcHEv9VJIQe0Y2CxPpdBhp
 xZrhekLPKtggm+usYUfNuh2BZuCkq+//kykWSv+CF2GFTARVm3vSM6W+kamEVXJmN
 zqzc44qXK+YnfK9wj0Au+iXNl2JKLKJkH126atBTOXk0fE3Tw/WAUdNrmU3zH2WlJ
 Ga71eUhLlTiyWyt0+w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=l2a1Aakd
Subject: [Buildroot] [PATCH v1] package/nghttp2: bump version to 1.62.1
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: Anisse Astier <anisse@astier.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For details see [1].

[1] https://github.com/nghttp2/nghttp2/releases

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/nghttp2/nghttp2.hash | 2 +-
 package/nghttp2/nghttp2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nghttp2/nghttp2.hash b/package/nghttp2/nghttp2.hash
index dddf6fe1bd..336b0b7dfc 100644
--- a/package/nghttp2/nghttp2.hash
+++ b/package/nghttp2/nghttp2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4a68a3040da92fd9872c056d0f6b0cd60de8410de10b578f8ade9ecc14d297e0  nghttp2-1.58.0.tar.xz
+sha256  2345d4dc136fda28ce243e0bb21f2e7e8ef6293d62c799abbf6f633a6887af72  nghttp2-1.62.1.tar.xz
 sha256  6b94f3abc1aabd0c72a7c7d92a77f79dda7c8a0cb3df839a97890b4116a2de2a  COPYING
diff --git a/package/nghttp2/nghttp2.mk b/package/nghttp2/nghttp2.mk
index 7a05e38fa9..d9985c7ac6 100644
--- a/package/nghttp2/nghttp2.mk
+++ b/package/nghttp2/nghttp2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGHTTP2_VERSION = 1.58.0
+NGHTTP2_VERSION = 1.62.1
 NGHTTP2_SOURCE =  nghttp2-$(NGHTTP2_VERSION).tar.xz
 NGHTTP2_SITE = https://github.com/nghttp2/nghttp2/releases/download/v$(NGHTTP2_VERSION)
 NGHTTP2_LICENSE = MIT
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
