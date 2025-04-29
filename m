Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751A6C369DC
	for <buildroot@archiver.kernel.org>; Tue, 29 Apr 2025 15:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11D2560B6E;
	Tue, 29 Apr 2025 15:02:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rNBbBzrk-3Ro; Tue, 29 Apr 2025 15:02:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCCC960797
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCCC960797;
	Tue, 29 Apr 2025 15:02:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D7BB01E3
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 15:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8BCC4068E
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 15:02:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s7Kqnt28HlPN for <buildroot@buildroot.org>;
 Tue, 29 Apr 2025 15:02:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 358604068A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 358604068A
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 358604068A
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 15:02:47 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.124.177]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7zFj-1v5Zw71kDT-00viq8; Tue, 29
 Apr 2025 17:02:44 +0200
To: buildroot@buildroot.org
Cc: Andrey Yurovsky <yurovsky@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Tue, 29 Apr 2025 17:02:28 +0200
Message-ID: <20250429150228.790857-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:oj64fDPjAyO9X1O5gfpf1zd3k1D76vpd2+Z9vvGNY6mC51eGNu7
 9QKyL2Oi6/qWTa6UxgbhdfDS9vLFvR7UzbmxFxg3XEbTcXUz7M8/TQJYIiD+uZGXJ75focd
 0RzAx1aNTYI6QY53+d1x7v5Rm9VaNCxEwAQ4E81dpzXRsPLIplvaLZbu9xiJn1e/1BoADGw
 6nuD8G2/bg2/fsPqQwKLA==
UI-OutboundReport: notjunk:1;M01:P0:h2sMRSwp6Ls=;oKwpOIQRG/9GF42zF8MeoTkEAXf
 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
 m5FYrrCZCQSooBk2bUtDCQwwUim1HAx99z
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1745938964; x=1746543764; i=fiona.klute@gmx.de;
 bh=+gMdnwQmj7R7roiXjDWrT/xzBq9J2SgNc9SloY/0xRk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Qc4GUP1+uEQ1nFceiMHlfjLULnIwJy2YIIrm1WvQHtFYxl3Z1XoSCzGu8JPlNs2+
 guw3jfekublMyvsd/5Tvuog8enjG1YKxesG2vWm88kgY091SwMIO6knIb2T3mQJMQ
 fDcsiaKFlkYxP54SHwGKvyzmbxgmoCEiNLmpTNSvuasRS/5MsdwiMy8Auv8aLCWQA
 pbPUGALLsVKecZg27RQGyb8WNHmLcYkuqtXIJwhT3P8LRSM8UaXCejFHUkmd6pZon
 fcJmRnfaFX2kPz+N9V8WkeVlPOMTCkYpPXVBn/gm2O2xLXvZEFaNaR+tvU9tGeguD
 uDgChILEzpgBj+fhJA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=Qc4GUP1+
Subject: [Buildroot] [PATCH 1/1] package/rauc: optionally enable JSON output
 in host package
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

JSON output is useful for building integrations, e.g. reading bundle
information into other tools.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
I've added the config option to preserve the current default, making
JSON support opt-in. However host-rauc depends on host-libglib2
already, so host-json-glib is the only additional dependency. If
simplicity is preferred over avoiding a small dependency, I'm happy to
modify the patch so JSON support is enabled unconditionally.

 package/rauc/Config.in.host | 10 ++++++++++
 package/rauc/rauc.mk        |  8 +++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/package/rauc/Config.in.host b/package/rauc/Config.in.host
index 1bd9a7935a..401bb4449a 100644
--- a/package/rauc/Config.in.host
+++ b/package/rauc/Config.in.host
@@ -8,3 +8,13 @@ config BR2_PACKAGE_HOST_RAUC
 	  bundles that are handled by the target rauc service.
 
 	  http://rauc.io/
+
+if BR2_PACKAGE_HOST_RAUC
+
+config BR2_PACKAGE_HOST_RAUC_JSON
+	bool "JSON output support"
+	help
+	  This option enables support for providing output in
+	  JSON format.
+
+endif
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 6bed5ec129..3e36c599b5 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -70,9 +70,15 @@ HOST_RAUC_DEPENDENCIES = \
 HOST_RAUC_CONF_OPTS += \
 	-Dnetwork=false \
 	-Dstreaming=false \
-	-Djson=disabled \
 	-Dservice=false \
 	-Dtests=false
 
+ifeq ($(BR2_PACKAGE_HOST_RAUC_JSON),y)
+HOST_RAUC_DEPENDENCIES += host-json-glib
+HOST_RAUC_CONF_OPTS += -Djson=enabled
+else
+HOST_RAUC_CONF_OPTS += -Djson=disabled
+endif
+
 $(eval $(meson-package))
 $(eval $(host-meson-package))
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
