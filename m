Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E720C77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 21:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1492B417BE;
	Sun,  7 May 2023 21:43:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1492B417BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BwTxRglcKmMF; Sun,  7 May 2023 21:43:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32B3C408CF;
	Sun,  7 May 2023 21:43:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32B3C408CF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 744761BF861
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59C69415CF
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:43:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59C69415CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3g35Z_niT6CY for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 21:43:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F62E41584
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2F62E41584
 for <buildroot@buildroot.org>; Sun,  7 May 2023 21:43:26 +0000 (UTC)
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
 by mailout02.t-online.de (Postfix) with SMTP id 64FB624D11;
 Sun,  7 May 2023 23:43:24 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.192.80]) by fwd70.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pvmA1-0rQR8b0; Sun, 7 May 2023 23:43:18 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:50572)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pvmA1-0006xu-1x;
 Sun, 07 May 2023 23:43:17 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun,  7 May 2023 23:43:13 +0200
Message-Id: <20230507214317.409305-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1683495798-DDD43C15-788A28FF/0/0 CLEAN NORMAL
X-TOI-MSGID: 59cf77f8-fe46-4a22-a04f-0ea01980f17b
Subject: [Buildroot] [PATCH 1/5] package/intel-mediasdk: fix build with
 gcc-13
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...dd-missing-stdint.h-to-mfxparser-cpp.patch | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/intel-mediasdk/0002-add-missing-stdint.h-to-mfxparser-cpp.patch

diff --git a/package/intel-mediasdk/0002-add-missing-stdint.h-to-mfxparser-cpp.patch b/package/intel-mediasdk/0002-add-missing-stdint.h-to-mfxparser-cpp.patch
new file mode 100644
index 0000000000..d2a095c39a
--- /dev/null
+++ b/package/intel-mediasdk/0002-add-missing-stdint.h-to-mfxparser-cpp.patch
@@ -0,0 +1,31 @@
+From 8fb9f5feaf738f69b278d2cac15baada1447aae8 Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyich@gmail.com>
+Date: Mon, 28 Nov 2022 23:31:29 +0000
+Subject: [PATCH] add missing <stdint.h> to mfxparser.cpp
+
+Without the change build fails on `gcc-13` as:
+
+    MediaSDK/api/mfx_dispatch/linux/mfxparser.cpp: In function 'std::string MFX::printCodecId(mfxU32)':
+    MediaSDK/api/mfx_dispatch/linux/mfxparser.cpp:60:3: error: 'uint8_t' was not declared in this scope
+       60 |   uint8_t* data = reinterpret_cast<uint8_t*>(&id);
+          |   ^~~~~~~
+
+Upstream: https://github.com/Intel-Media-SDK/MediaSDK/pull/2998
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ api/mfx_dispatch/linux/mfxparser.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/api/mfx_dispatch/linux/mfxparser.cpp b/api/mfx_dispatch/linux/mfxparser.cpp
+index 9d3823ec3e..12e46d1881 100644
+--- a/api/mfx_dispatch/linux/mfxparser.cpp
++++ b/api/mfx_dispatch/linux/mfxparser.cpp
+@@ -20,6 +20,7 @@
+ 
+ #include <ctype.h>
+ #include <stdio.h>
++#include <stdint.h>
+ #include <stdlib.h>
+ #include <string.h>
+ 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
