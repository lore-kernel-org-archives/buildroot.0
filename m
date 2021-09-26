Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B1CC433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 11:05:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E727860F92
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 11:05:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E727860F92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C6406066B;
	Sun, 26 Sep 2021 11:05:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fzXyehJpTGnn; Sun, 26 Sep 2021 11:05:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A05FB60622;
	Sun, 26 Sep 2021 11:05:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D347A1BF354
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 11:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF63D400E6
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 11:05:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id acy8LEpuABf3 for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 11:05:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C960B400A8
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 11:05:18 +0000 (UTC)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout04.t-online.de (Postfix) with SMTP id BAB82C24
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 13:05:15 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.205.79]) by fwd79.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mURy6-2kJK2j0; Sun, 26 Sep 2021 13:05:14 +0200
Received: from [192.168.1.109] (port=47020 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.94.2)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mURy5-0000Ea-Pc
 for buildroot@buildroot.org; Sun, 26 Sep 2021 13:05:13 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 13:05:13 +0200
Message-Id: <20210926110513.1660955-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1632654314-0000146E-25F540B1/0/0 CLEAN NORMAL
X-TOI-MSGID: 18801a3e-7c2e-41c6-86bc-d63a3de0555e
Subject: [Buildroot] [PATCH 1/1] package/kodi: fix build with fmt 8.x
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

Backport upstream patch, no autobuild errors detected so far.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi/0002-utils-include-fmt-xchar.h.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/kodi/0002-utils-include-fmt-xchar.h.patch

diff --git a/package/kodi/0002-utils-include-fmt-xchar.h.patch b/package/kodi/0002-utils-include-fmt-xchar.h.patch
new file mode 100644
index 0000000000..70c88412e9
--- /dev/null
+++ b/package/kodi/0002-utils-include-fmt-xchar.h.patch
@@ -0,0 +1,34 @@
+From 18ff80a9c169fb969b75e2143d9f1f234b71a730 Mon Sep 17 00:00:00 2001
+From: Craig Andrews <candrews@integralblue.com>
+Date: Thu, 24 Jun 2021 20:41:11 -0400
+Subject: [PATCH] [utils] include fmt/xchar.h
+
+fmt 8 moved wchar/custom char overloads to xchar.h, so for fmt 8 compatibility, xchar.h must be included
+
+See https://github.com/fmtlib/fmt/commit/76ee490468212f8705a1421b4c88f8f814b2d351
+
+Downloaded from upstream commit
+https://github.com/xbmc/xbmc/commit/18ff80a9c169fb969b75e2143d9f1f234b71a730
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ xbmc/utils/StringUtils.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/xbmc/utils/StringUtils.h b/xbmc/utils/StringUtils.h
+index ca6f82953d..2dc5c3f03a 100644
+--- a/xbmc/utils/StringUtils.h
++++ b/xbmc/utils/StringUtils.h
+@@ -36,6 +36,9 @@
+ #if FMT_VERSION >= 40000
+ #include <fmt/printf.h>
+ #endif
++#if FMT_VERSION >= 80000
++#include <fmt/xchar.h>
++#endif
+ 
+ #include "XBDateTime.h"
+ #include "utils/params_check_macros.h"
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
