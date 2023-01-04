Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B91C46467
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 21:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18219610D5;
	Wed,  4 Jan 2023 21:41:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18219610D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D93k33zx_dta; Wed,  4 Jan 2023 21:41:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6166E60DF6;
	Wed,  4 Jan 2023 21:41:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6166E60DF6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D9D0A1BF8C7
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 21:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2EDB4056D
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 21:41:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2EDB4056D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uliuIkP1yGmG for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 21:41:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C464E400DC
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 21:41:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C464E400DC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB0218756D; Wed,  4 Jan 2023 21:41:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 22:37:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8ebb0f810a21103af0bd6d988a24645503e7d10e
X-Git-Newrev: 98613ad592828a3626400f52a1504fe5234fc7f1
X-Patchwork-Hint: ignore
Message-Id: <20230104214119.AB0218756D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-mediadriver: bump version to
 22.6.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=98613ad592828a3626400f52a1504fe5234fc7f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch included in upstream release.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-dont-include-va-dricommon-h.patch         | 36 ----------------------
 package/intel-mediadriver/intel-mediadriver.hash   |  2 +-
 package/intel-mediadriver/intel-mediadriver.mk     |  2 +-
 3 files changed, 2 insertions(+), 38 deletions(-)

diff --git a/package/intel-mediadriver/0001-dont-include-va-dricommon-h.patch b/package/intel-mediadriver/0001-dont-include-va-dricommon-h.patch
deleted file mode 100644
index 9d512f9c0b..0000000000
--- a/package/intel-mediadriver/0001-dont-include-va-dricommon-h.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From e0d2caafcd5e583a01f7792eaec5d1f2d540bdf1 Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Fri, 18 Nov 2022 22:44:52 +1100
-Subject: [PATCH] [Media Common] [VP] dont include va_dricommon.h
-
-<va/va_dricommon.h> is not in non-X11 libva 2.16.0
-The header "media_libva_putsurface_linux.h" is included
-
-Downloaded from upstream commit
-https://github.com/intel/media-driver/commit/e0d2caafcd5e583a01f7792eaec5d1f2d540bdf1
-
-Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- media_softlet/linux/common/vp/ddi/ddi_vp_functions.cpp | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/media_softlet/linux/common/vp/ddi/ddi_vp_functions.cpp b/media_softlet/linux/common/vp/ddi/ddi_vp_functions.cpp
-index 8695d6c86..6719c07b3 100644
---- a/media_softlet/linux/common/vp/ddi/ddi_vp_functions.cpp
-+++ b/media_softlet/linux/common/vp/ddi/ddi_vp_functions.cpp
-@@ -23,7 +23,6 @@
- //! \file     ddi_vp_functions.cpp
- //! \brief    ddi vp functions implementaion.
- //!
--#include <va/va_dricommon.h>
- #include "ddi_vp_functions.h"
- #include "media_libva_util_next.h"
- #include "media_libva_common_next.h"
-@@ -4700,4 +4699,4 @@ VAStatus DdiVpFunctions::PutSurfaceLinuxHW(
- 
-     return VA_STATUS_SUCCESS;
- }
--#endif // !defined(ANDROID) && defined(X11_FOUND)
-\ No newline at end of file
-+#endif // !defined(ANDROID) && defined(X11_FOUND)
diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index a9b7c6407d..b2c45eb025 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0c04b9d74b92de41fd409b62913ce4afd799236c0b6bc1983a496990764e5d90  intel-media-22.6.4.tar.gz
+sha256  cbb6a514564f8c3349b1f78fc0906b636ea2074d7605cb0e820c5b727ce88cdc  intel-media-22.6.5.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index ff97445181..8d3fc09260 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 22.6.4
+INTEL_MEDIADRIVER_VERSION = 22.6.5
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
