Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F371CC433EF
	for <buildroot@archiver.kernel.org>; Fri,  8 Jul 2022 07:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DCE76136A;
	Fri,  8 Jul 2022 07:38:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DCE76136A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qxgF7T4qDZie; Fri,  8 Jul 2022 07:38:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0951161373;
	Fri,  8 Jul 2022 07:38:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0951161373
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9B0FC1BF403
 for <buildroot@lists.busybox.net>; Fri,  8 Jul 2022 07:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7567423BA
 for <buildroot@lists.busybox.net>; Fri,  8 Jul 2022 07:38:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7567423BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pnPUvUxQ3zti for <buildroot@lists.busybox.net>;
 Fri,  8 Jul 2022 07:38:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BDA3D41A0F
 for <buildroot@buildroot.org>; Fri,  8 Jul 2022 07:38:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDA3D41A0F
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A2ADC80E37; Fri,  8 Jul 2022 07:25:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 8 Jul 2022 09:37:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3ad7ba90c0e87212b710376dcf61eeabbe4470f5
X-Git-Newrev: 73491bf4ecd573ca789ec466f8096e4afe59d571
X-Patchwork-Hint: ignore
Message-Id: <20220708072529.A2ADC80E37@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/alsa-lib: bump version to 1.2.7.1
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
Content-Type: multipart/mixed; boundary="===============6794694725082262967=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6794694725082262967==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=73491bf4ecd573ca789ec466f8096e4afe59d571
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://www.alsa-project.org/wiki/Changes_v1.2.7_v1.2.7.1

Removed patch which was applied upstream:
https://github.com/alsa-project/alsa-lib/commit/92fff4e9d06922fa3648d85c8501638c869d6184

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../alsa-lib/0002-output-include-stdarg.h.patch    | 40 ----------------------
 package/alsa-lib/alsa-lib.hash                     |  2 +-
 package/alsa-lib/alsa-lib.mk                       |  2 +-
 3 files changed, 2 insertions(+), 42 deletions(-)

diff --git a/package/alsa-lib/0002-output-include-stdarg.h.patch b/package/alsa-lib/0002-output-include-stdarg.h.patch
deleted file mode 100644
index cf7c25becd..0000000000
--- a/package/alsa-lib/0002-output-include-stdarg.h.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From b7c0169a62d4e6ad1a0a9de4ef8ae8089ee98872 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sat, 11 Jun 2022 19:12:19 +0200
-Subject: [PATCH] output: include stdarg.h
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes a build error with alsa-utils when build with a uClibc toolchain:
-
-alsa-utils/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/alsa/output.h:75:66:
- error: unknown type name ‘va_list’
-   75 | int snd_output_vprintf(snd_output_t *output, const char *format, va_list args);
-      |                                                                  ^~~~~~~
-alsa-utils/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/alsa/output.h:1:1:
- note: ‘va_list’ is defined in header ‘<stdarg.h>’; did you forget to ‘#include <stdarg.h>’?
-
-Patch sent upstream: https://github.com/alsa-project/alsa-lib/pull/237
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- include/output.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/include/output.h b/include/output.h
-index 4a970dc4..5e16420b 100644
---- a/include/output.h
-+++ b/include/output.h
-@@ -28,6 +28,8 @@
- #ifndef __ALSA_OUTPUT_H
- #define __ALSA_OUTPUT_H
- 
-+#include <stdarg.h>
-+
- #ifdef __cplusplus
- extern "C" {
- #endif
--- 
-2.30.2
-
diff --git a/package/alsa-lib/alsa-lib.hash b/package/alsa-lib/alsa-lib.hash
index a859505372..7c17e18ec3 100644
--- a/package/alsa-lib/alsa-lib.hash
+++ b/package/alsa-lib/alsa-lib.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  8814e61f7ec6812c76e23a85cab00e0b0d3bba40816af36b726beb1bc04c74a7  alsa-lib-1.2.7.tar.bz2
+sha256  046dc42dfcfad269217be05954686137e5e7397f3041372f8c6dcd7d79461e61  alsa-lib-1.2.7.1.tar.bz2
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
 sha256  bfe16cf823bcff261fc6a062c07ee96660e3c39678f42f39a788a68dbc234ced  aserver/COPYING
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index d6054bb000..61f625bcff 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_LIB_VERSION = 1.2.7
+ALSA_LIB_VERSION = 1.2.7.1
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = https://www.alsa-project.org/files/pub/lib
 ALSA_LIB_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (aserver)

--===============6794694725082262967==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6794694725082262967==--
