Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91AD6C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:56:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3939160F9E
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:56:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3939160F9E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EA1E81C04;
	Sun, 26 Sep 2021 19:56:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2E78VA_MaO9A; Sun, 26 Sep 2021 19:56:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C73781BCF;
	Sun, 26 Sep 2021 19:56:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2EE431BF97A
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 128DF607B7
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:52:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3gWaDbiq9e4Y for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 19:52:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A507260590
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 19:52:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4150A8D25B; Sun, 26 Sep 2021 19:50:18 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 21:29:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f46f080d64318680bdf6c9fe1f4280ec57e7abe1
X-Git-Newrev: 4e6de6d541b7dcc56d4872600d9ea133800d5f48
X-Patchwork-Hint: ignore
Message-Id: <20210926195018.4150A8D25B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi: fix build with fmt 8.x
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4e6de6d541b7dcc56d4872600d9ea133800d5f48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport upstream patch, no autobuild errors detected so far.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/0002-utils-include-fmt-xchar.h.patch | 34 +++++++++++++++++++++++
 1 file changed, 34 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
