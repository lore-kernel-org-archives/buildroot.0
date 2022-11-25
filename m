Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 224C0C4332F
	for <buildroot@archiver.kernel.org>; Fri, 25 Nov 2022 06:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A43A41802;
	Fri, 25 Nov 2022 06:52:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A43A41802
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uYaN7K7949Et; Fri, 25 Nov 2022 06:52:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31C2541811;
	Fri, 25 Nov 2022 06:52:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31C2541811
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A92C11BF5DD
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 06:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 915E560BD9
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 06:52:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 915E560BD9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mczH7L8t1BNR for <buildroot@lists.busybox.net>;
 Fri, 25 Nov 2022 06:52:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EAAF60BAA
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8EAAF60BAA
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 06:52:00 +0000 (UTC)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
 by mailout04.t-online.de (Postfix) with SMTP id ACE10875D;
 Fri, 25 Nov 2022 07:50:57 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.198.224]) by fwd88.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1oySY5-1GZJOT0; Fri, 25 Nov 2022 07:50:57 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:46918)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1oySY4-0007Qs-2l;
 Fri, 25 Nov 2022 07:50:56 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Fri, 25 Nov 2022 07:50:56 +0100
Message-Id: <20221125065056.7998-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1669359057-E28B3E65-D3DA7909/0/0 CLEAN NORMAL
X-TOI-MSGID: 5f945d5c-536d-4c3e-8c8d-e36df269a666
Subject: [Buildroot] [PATCH/next 1/1] package/intel-mediadriver: fix build
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

Fixes build error not yet found by autobuilders:
https://github.com/intel/media-driver/issues/1549

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...ld-error-va-va_dricommon-h-not-found.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/intel-mediadriver/0001-Fix-build-error-va-va_dricommon-h-not-found.patch

diff --git a/package/intel-mediadriver/0001-Fix-build-error-va-va_dricommon-h-not-found.patch b/package/intel-mediadriver/0001-Fix-build-error-va-va_dricommon-h-not-found.patch
new file mode 100644
index 0000000000..e79ead88fb
--- /dev/null
+++ b/package/intel-mediadriver/0001-Fix-build-error-va-va_dricommon-h-not-found.patch
@@ -0,0 +1,41 @@
+From 999f736843b4db09364a862cbd91028124ba484d Mon Sep 17 00:00:00 2001
+From: Sachin kumar <sachin.kumar@intel.com>
+Date: Tue, 22 Nov 2022 10:31:42 +0530
+Subject: [PATCH] Fix_build error va/va_dricommon.h not found
+
+Downloaded from upstream PR:
+https://github.com/intel/media-driver/pull/1555
+
+Signed-off-by: Sachin kumar <sachin.kumar@intel.com>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ media_softlet/linux/common/vp/ddi/ddi_vp_functions.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/media_softlet/linux/common/vp/ddi/ddi_vp_functions.cpp b/media_softlet/linux/common/vp/ddi/ddi_vp_functions.cpp
+index 99a7b790b..03ba101c4 100644
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
+@@ -33,6 +32,7 @@
+ #include "media_libva_interface_next.h"
+ #include "media_libva_vp.h"
+ #if !defined(ANDROID) && defined(X11_FOUND)
++#include <va/va_dricommon.h>
+ #include <X11/Xutil.h>
+ #include "media_libva_putsurface_linux.h"
+ #endif
+@@ -4699,4 +4699,4 @@ VAStatus DdiVpFunctions::PutSurfaceLinuxHW(
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
