Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A552CC7619A
	for <buildroot@archiver.kernel.org>; Wed,  5 Apr 2023 20:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B38B60F40;
	Wed,  5 Apr 2023 20:35:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B38B60F40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b33q5u2KetbH; Wed,  5 Apr 2023 20:35:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C76661427;
	Wed,  5 Apr 2023 20:35:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C76661427
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7AD631BF364
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 20:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53B60419D3
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 20:35:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53B60419D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JL92l3Xh-hqF for <buildroot@lists.busybox.net>;
 Wed,  5 Apr 2023 20:35:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 461F44195F
 for <buildroot@buildroot.org>; Wed,  5 Apr 2023 20:35:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 461F44195F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F6A28394B; Wed,  5 Apr 2023 20:35:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 5 Apr 2023 22:35:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 402e06a02f8a4c97c621eac827a56118423337f7
X-Git-Newrev: 6d80b5ddbf13eb2e2cd71bc3db72e15b562b0e0c
X-Patchwork-Hint: ignore
Message-Id: <20230405203540.2F6A28394B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/domoticz: bump to version 2023.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=6d80b5ddbf13eb2e2cd71bc3db72e15b562b0e0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version)

https://github.com/domoticz/domoticz/blob/2023.1/History.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...rdware-EnOceanRawValue.h-include-stdarg.h.patch | 33 ----------------------
 package/domoticz/domoticz.hash                     |  2 +-
 package/domoticz/domoticz.mk                       |  2 +-
 3 files changed, 2 insertions(+), 35 deletions(-)

diff --git a/package/domoticz/0001-hardware-EnOceanRawValue.h-include-stdarg.h.patch b/package/domoticz/0001-hardware-EnOceanRawValue.h-include-stdarg.h.patch
deleted file mode 100644
index bc3e60023d..0000000000
--- a/package/domoticz/0001-hardware-EnOceanRawValue.h-include-stdarg.h.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 6296d7112089a0f3bfb3056f6d9637e13ce4ce83 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 18 Dec 2022 12:27:38 +0100
-Subject: [PATCH] hardware/EnOceanRawValue.h: include stdarg.h
-
-Include stdarg.h to avoid the following build failure on uclibc:
-
-In file included from /home/fabrice/buildroot/output/build/domoticz-2022.2/hardware/EnOceanRawValue.cpp:2:
-/home/fabrice/buildroot/output/build/domoticz-2022.2/hardware/EnOceanRawValue.h:109:83: error: 'va_list' has not been declared
-  109 | uint32_t SetRawValuesNb(uint8_t * data, T_DATAFIELD * OffsetDes, int NbParameter, va_list value);
-      |                                                                                   ^~~~~~~
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/domoticz/domoticz/pull/5472]
----
- hardware/EnOceanRawValue.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/hardware/EnOceanRawValue.h b/hardware/EnOceanRawValue.h
-index 84f38d17a..df858f27d 100644
---- a/hardware/EnOceanRawValue.h
-+++ b/hardware/EnOceanRawValue.h
-@@ -1,6 +1,7 @@
- #ifndef _SetGetRawValue
- #define _SetGetRawValue
- 
-+#include <stdarg.h>
- #include <stdint.h>
- #include <vector>
- #include <stdio.h>
--- 
-2.35.1
-
diff --git a/package/domoticz/domoticz.hash b/package/domoticz/domoticz.hash
index c439238800..fccb4ea420 100644
--- a/package/domoticz/domoticz.hash
+++ b/package/domoticz/domoticz.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  8f84098bb64bec12ff7aac5f1fb6b6230a88c5781c2b75bc89861caea73cbccf  domoticz-2022.2.tar.gz
+sha256  3144372d0847cb4d22a8c4b1362cd31885b37671adc682c3a8e9435762cde338  domoticz-2023.1.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  License.txt
diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index 451021150b..ed82131dd3 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOMOTICZ_VERSION = 2022.2
+DOMOTICZ_VERSION = 2023.1
 DOMOTICZ_SITE = $(call github,domoticz,domoticz,$(DOMOTICZ_VERSION))
 DOMOTICZ_LICENSE = GPL-3.0
 DOMOTICZ_LICENSE_FILES = License.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
