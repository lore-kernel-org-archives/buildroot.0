Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659E3C3ABCC
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 12:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A1756103F;
	Wed, 14 May 2025 12:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KOTcXc82dkG2; Wed, 14 May 2025 12:18:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37A006106C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37A006106C;
	Wed, 14 May 2025 12:18:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E2A8612A
 for <buildroot@buildroot.org>; Wed, 14 May 2025 12:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C90036106C
 for <buildroot@buildroot.org>; Wed, 14 May 2025 12:18:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4o7YOb1fTAXJ for <buildroot@buildroot.org>;
 Wed, 14 May 2025 12:18:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DDCCB6103F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDCCB6103F
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DDCCB6103F
 for <buildroot@buildroot.org>; Wed, 14 May 2025 12:18:29 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 1CBA02C845C5;
 Wed, 14 May 2025 14:18:27 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Paul Cercueil <paul@crapouillou.net>
Date: Wed, 14 May 2025 14:18:25 +0200
Message-ID: <20250514121826.2156543-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1747225107; bh=yllywJCO9hgUCiD/u/3orkvj4U3H3342msmxmfRo6PA=;
 h=From:To:Cc:Subject:Date;
 b=TUpKiJ8KsbpGXn5cpjhDwX7/clyDZimNCAamfWzmThxNpoXbq1x6hhAdQhXfOtVS/
 2VXG2s6xqeLcqh3o69w3Q9nU+3i2pHuD0fZB7rZaiBz5aQNo3Itng94PifLT59WC7X
 iO7C9m55/XgeSwHtEH+nf2rSfaKL3imj9GMiWHAlID24O6XKr1LK5tjzWEDuYRPcRQ
 ev9shFN/0NipcaMcxqwIP1zt0bbju6XlYwBvKXQgUhgOcnmVrxYxiJAU2VOy9uQZg8
 zcjkM1a+3CaaauCXGYlVohKm9tItyXi+YGn1TS1W/XxmcK19y3OGEs/GQ5wJaXjbx/
 WPYULfZyM/9VQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=TUpKiJ8K
Subject: [Buildroot] [PATCH] package/libiio: bump to 0.26
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch that is now merged upstream.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 ...l-Fix-compatibility-with-libxml-2-12.patch | 33 -------------------
 package/libiio/libiio.hash                    |  2 +-
 package/libiio/libiio.mk                      |  2 +-
 3 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 package/libiio/0001-xml-Fix-compatibility-with-libxml-2-12.patch

diff --git a/package/libiio/0001-xml-Fix-compatibility-with-libxml-2-12.patch b/package/libiio/0001-xml-Fix-compatibility-with-libxml-2-12.patch
deleted file mode 100644
index 56c272aad3..0000000000
--- a/package/libiio/0001-xml-Fix-compatibility-with-libxml-2-12.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From b1170cacff24cdfd3858edc2285c51cadef11488 Mon Sep 17 00:00:00 2001
-From: Jan Tojnar <jtojnar@gmail.com>
-Date: Sun, 10 Dec 2023 21:52:05 +0100
-Subject: [PATCH] xml: Fix compatibility with libxml 2.12
-
-libxml 2.12.0 reorganized includes, resulting in the following no longer being in scope:
-
-- XML_PARSE_DTDVALID
-- xmlReadMemory
-- xmlReadFile
-- xmlCleanupParser
-
-Signed-off-by: Jan Tojnar <jtojnar@gmail.com>
-(cherry picked from commit bb688d04294dda45e68dfaf13e3bc1187841e52a)
-
-Upstream: https://github.com/analogdevicesinc/libiio/commit/b1170cacff24cdfd3858edc2285c51cadef11488
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- xml.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/xml.c b/xml.c
-index 33f026103..3eaed92b3 100644
---- a/xml.c
-+++ b/xml.c
-@@ -10,6 +10,7 @@
- #include "iio-private.h"
- 
- #include <errno.h>
-+#include <libxml/parser.h>
- #include <libxml/tree.h>
- #include <string.h>
- 
diff --git a/package/libiio/libiio.hash b/package/libiio/libiio.hash
index 0f024af78c..65b4d5e5fb 100644
--- a/package/libiio/libiio.hash
+++ b/package/libiio/libiio.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  21972599a3c143ab1f98002ad2b3f28f4aff927fde5f677478311cd4e517730c  libiio-0.25.tar.gz
+sha256  fb445fb860ef1248759f45d4273a4eff360534480ec87af64c6b8db3b99be7e5  libiio-0.26.tar.gz
 sha256  102900208eef27b766380135906d431dba87edaa7ec6aa72e6ebd3dd67f3a97b  COPYING.txt
diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index 733a0c90ed..b85bb9786a 100644
--- a/package/libiio/libiio.mk
+++ b/package/libiio/libiio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIIO_VERSION = 0.25
+LIBIIO_VERSION = 0.26
 LIBIIO_SITE = $(call github,analogdevicesinc,libiio,v$(LIBIIO_VERSION))
 LIBIIO_INSTALL_STAGING = YES
 LIBIIO_LICENSE = LGPL-2.1+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
