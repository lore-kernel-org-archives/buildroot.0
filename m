Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6AF6C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 14:10:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8555A60F39
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 14:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8555A60F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F7C040351;
	Sun, 26 Sep 2021 14:10:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nr2zoTB0F1wo; Sun, 26 Sep 2021 14:10:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A79E740340;
	Sun, 26 Sep 2021 14:10:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BFCF61BF41F
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 14:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC41880F92
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 14:10:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AsvLVDQkPVeh for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 14:10:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 29E0B80F5A
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 14:10:53 +0000 (UTC)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
 by mailout05.t-online.de (Postfix) with SMTP id 48DB31898F
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 16:08:39 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.205.79]) by fwd86.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mUUpO-4fYDuz0; Sun, 26 Sep 2021 16:08:26 +0200
Received: from [192.168.1.109] (port=47032 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.94.2)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mUUpO-00068H-Ah
 for buildroot@buildroot.org; Sun, 26 Sep 2021 16:08:26 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 16:08:26 +0200
Message-Id: <20210926140826.3460762-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1632665306-00001467-111D15F9/0/0 CLEAN NORMAL
X-TOI-MSGID: 11ab28fd-1678-4afc-a71e-87b1277b130e
Subject: [Buildroot] [PATCH 1/1] package/kodi-screensaver-rsxs: fix build
 with gcc11
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...01-impSurface.h-fix-build-with-gcc11.patch | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/kodi-screensaver-rsxs/0001-impSurface.h-fix-build-with-gcc11.patch

diff --git a/package/kodi-screensaver-rsxs/0001-impSurface.h-fix-build-with-gcc11.patch b/package/kodi-screensaver-rsxs/0001-impSurface.h-fix-build-with-gcc11.patch
new file mode 100644
index 0000000000..4bc127b860
--- /dev/null
+++ b/package/kodi-screensaver-rsxs/0001-impSurface.h-fix-build-with-gcc11.patch
@@ -0,0 +1,30 @@
+From fb23e136f88a94aa497e8eb4369bb06435c2aaf8 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 26 Sep 2021 15:59:29 +0200
+Subject: [PATCH] impSurface.h: fix build with gcc11
+
+lib/Implicit/impSurface.h:44:9: error: 'size_t' does not name a type
+   44 |         size_t vertex_data_size;
+
+Patch sent upstream as PR 52.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ lib/Implicit/impSurface.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/Implicit/impSurface.h b/lib/Implicit/impSurface.h
+index 388701aa..3319820e 100644
+--- a/lib/Implicit/impSurface.h
++++ b/lib/Implicit/impSurface.h
+@@ -21,6 +21,7 @@
+ #ifndef IMPSURFACE_H
+ #define IMPSURFACE_H
+ 
++#include <cstddef>
+ #include <functional>
+ 
+ #ifdef WIN32
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
