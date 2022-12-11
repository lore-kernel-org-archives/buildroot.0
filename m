Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AAAFC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 20:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 219F14056B;
	Sun, 11 Dec 2022 20:45:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 219F14056B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mxoFmmcFjV5S; Sun, 11 Dec 2022 20:45:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55B5240569;
	Sun, 11 Dec 2022 20:45:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55B5240569
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1CB2A1BF860
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ECA114047B
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:45:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECA114047B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jg7vGrqKfoLv for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 20:45:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C12B540569
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C12B540569
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 20:45:16 +0000 (UTC)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
 by mailout05.t-online.de (Postfix) with SMTP id 0BB411FB69;
 Sun, 11 Dec 2022 21:44:57 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd84.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p4TBv-4VxA5B0; Sun, 11 Dec 2022 21:44:55 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:59972)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p4TBv-0007ho-0e;
 Sun, 11 Dec 2022 21:44:55 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 21:44:55 +0100
Message-Id: <20221211204455.278996-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670791495-3F7EFB8C-69BD88B9/0/0 CLEAN NORMAL
X-TOI-MSGID: e4fde1e5-ff3a-4936-b302-46d98975ae39
Subject: [Buildroot] [PATCH 1/1] package/intel-mediadriver: fix build
 without X11
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/52c/52c8f5352b16ced4e85286950f95e1b57c564fa5/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-dont-include-va-dricommon-h.patch    | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/intel-mediadriver/0001-dont-include-va-dricommon-h.patch

diff --git a/package/intel-mediadriver/0001-dont-include-va-dricommon-h.patch b/package/intel-mediadriver/0001-dont-include-va-dricommon-h.patch
new file mode 100644
index 0000000000..9d512f9c0b
--- /dev/null
+++ b/package/intel-mediadriver/0001-dont-include-va-dricommon-h.patch
@@ -0,0 +1,36 @@
+From e0d2caafcd5e583a01f7792eaec5d1f2d540bdf1 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Fri, 18 Nov 2022 22:44:52 +1100
+Subject: [PATCH] [Media Common] [VP] dont include va_dricommon.h
+
+<va/va_dricommon.h> is not in non-X11 libva 2.16.0
+The header "media_libva_putsurface_linux.h" is included
+
+Downloaded from upstream commit
+https://github.com/intel/media-driver/commit/e0d2caafcd5e583a01f7792eaec5d1f2d540bdf1
+
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ media_softlet/linux/common/vp/ddi/ddi_vp_functions.cpp | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/media_softlet/linux/common/vp/ddi/ddi_vp_functions.cpp b/media_softlet/linux/common/vp/ddi/ddi_vp_functions.cpp
+index 8695d6c86..6719c07b3 100644
+--- a/media_softlet/linux/common/vp/ddi/ddi_vp_functions.cpp
++++ b/media_softlet/linux/common/vp/ddi/ddi_vp_functions.cpp
+@@ -23,7 +23,6 @@
+ //! \file     ddi_vp_functions.cpp
+ //! \brief    ddi vp functions implementaion.
+ //!
+-#include <va/va_dricommon.h>
+ #include "ddi_vp_functions.h"
+ #include "media_libva_util_next.h"
+ #include "media_libva_common_next.h"
+@@ -4700,4 +4699,4 @@ VAStatus DdiVpFunctions::PutSurfaceLinuxHW(
+ 
+     return VA_STATUS_SUCCESS;
+ }
+-#endif // !defined(ANDROID) && defined(X11_FOUND)
+\ No newline at end of file
++#endif // !defined(ANDROID) && defined(X11_FOUND)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
