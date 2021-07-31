Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90F53C4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 19:54:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15AAC60F35
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 19:54:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 15AAC60F35
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C218560780;
	Sat, 31 Jul 2021 19:54:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iR-joppLclKL; Sat, 31 Jul 2021 19:54:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10B1D606B6;
	Sat, 31 Jul 2021 19:54:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8CD981BF83A
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 19:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B6E540240
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 19:54:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zUi-HRfiQ3z1 for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 19:54:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FB65400C3
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 19:54:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D6E2B86194; Sat, 31 Jul 2021 19:54:30 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 31 Jul 2021 21:53:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a6a1810711f8d634fe04ab33d24929595d227782
X-Git-Newrev: 28c118814dbc394a4600f025b8e0f0f38b0d9eae
X-Patchwork-Hint: ignore
Message-Id: <20210731195430.D6E2B86194@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cegui: add missing <string.h>
 include
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=28c118814dbc394a4600f025b8e0f0f38b0d9eae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport an upstream patch to fix a missing <string.h> include.

Fixes:

  http://autobuild.buildroot.net/results/7507b3c5cdcae04804a750f688057adae93cd329/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-XMLParser.cpp-include-string.h.patch      | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/cegui/0001-XMLParser.cpp-include-string.h.patch b/package/cegui/0001-XMLParser.cpp-include-string.h.patch
new file mode 100644
index 0000000000..e117d6220d
--- /dev/null
+++ b/package/cegui/0001-XMLParser.cpp-include-string.h.patch
@@ -0,0 +1,37 @@
+From b98ed87225fa3c0f156b0798ca5c285d8fa8fac1 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 15 Jun 2021 07:27:41 +0200
+Subject: [PATCH] XMLParser.cpp: include string.h
+
+Include string.h to avoid the following build failure:
+
+/home/buildroot/autobuild/run/instance-3/output-1/build/cegui-00b4e1fe174da53b7ed726ab5970ba51bd5b5ee0/cegui/src/XMLParserModules/RapidXML/XMLParser.cpp:73:5: error: 'memcpy' was not declared in this scope
+   73 |     memcpy(buf, source.getDataPtr(), size);
+      |     ^~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/1cb09e5f52435efc505c61707b2d5d2ee871524b
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: 628f7edf4b420f752f1965ea11e5e747e3ff93b0
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ cegui/src/XMLParserModules/RapidXML/XMLParser.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/cegui/src/XMLParserModules/RapidXML/XMLParser.cpp b/cegui/src/XMLParserModules/RapidXML/XMLParser.cpp
+index 810ea6bbf..59822fc80 100644
+--- a/cegui/src/XMLParserModules/RapidXML/XMLParser.cpp
++++ b/cegui/src/XMLParserModules/RapidXML/XMLParser.cpp
+@@ -38,6 +38,8 @@
+ #include "CEGUI/Logger.h"
+ #include "CEGUI/Exceptions.h"
+ 
++#include <string.h>
++
+ // Start of CEGUI namespace section
+ namespace CEGUI
+ {
+-- 
+2.31.1
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
