Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F7AC76196
	for <buildroot@archiver.kernel.org>; Sun,  2 Apr 2023 11:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E298340497;
	Sun,  2 Apr 2023 11:17:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E298340497
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yOHeRPhu9Nx0; Sun,  2 Apr 2023 11:17:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13BE54013D;
	Sun,  2 Apr 2023 11:17:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13BE54013D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 39F5C1BF47A
 for <buildroot@lists.busybox.net>; Sun,  2 Apr 2023 11:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D96E60C2A
 for <buildroot@lists.busybox.net>; Sun,  2 Apr 2023 11:17:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D96E60C2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id np1N7B_UjzeR for <buildroot@lists.busybox.net>;
 Sun,  2 Apr 2023 11:17:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEC88607C9
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BEC88607C9
 for <buildroot@buildroot.org>; Sun,  2 Apr 2023 11:17:31 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 m6-20020a05600c3b0600b003ee6e324b19so16459271wms.1
 for <buildroot@buildroot.org>; Sun, 02 Apr 2023 04:17:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680434249;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KADs+lC2Yuf/tEqdxiS/9QGFLryxz59lYaKJk2hrjMU=;
 b=QxLZr2HYf+uNkFvLerBADgep4nPFukgxr5C7AKXsEidSLcfqs3WLYakYFQKVfp0PuN
 ldWlPld+rpPZq2AE2JfO2F7l9qPKNGKkzzXfvlsosLJqDf+kqhAKs5hJF81E08Ih+LmH
 THgPZYAIzN9o0tBdNvOSBBnycTixg4U3U5HxtWL4wfH3JhOqgTAA89Pnq5fZQH0dlGzA
 zGCuCvoR0Yu3oXgtdWqETvncUluFdIEJE2FKtiyI3aiIxrIdx/ywobM6z9Q3oFLmfwxn
 imuo5AWcUNoN4ulgUqzRyvJB7rQeeomaIbFGyDOBvbRj+9XFMXekU5/d3K54yhsHD7DG
 a31A==
X-Gm-Message-State: AO0yUKU5b83VQCMNI+Tndu0KNr9pABfdvQxf+8yzEOijtfi7Nv+fArA8
 y6mujOZDPPudS7o9Hue8WvSR8NKdSDI=
X-Google-Smtp-Source: AK7set8ibiw3mPeugM1Rfpw9Rp0Jm6FQlWHFknvvJJ3Ez1A30iZ+aKdI18XN+czwoJU+24hdEZJ6Lw==
X-Received: by 2002:a7b:c7ce:0:b0:3ed:8360:e54 with SMTP id
 z14-20020a7bc7ce000000b003ed83600e54mr25074265wmk.8.1680434249481; 
 Sun, 02 Apr 2023 04:17:29 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 o9-20020a05600c4fc900b003ef6bc71cccsm16414566wmq.27.2023.04.02.04.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Apr 2023 04:17:29 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  2 Apr 2023 13:17:22 +0200
Message-Id: <20230402111722.925128-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680434249;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KADs+lC2Yuf/tEqdxiS/9QGFLryxz59lYaKJk2hrjMU=;
 b=VcuXNt/OgJ88fej/NEuOnHLOQO4w+ffJNc5SAjqscgreyufHutDPsHWpBCj1msunUa
 f/Qi9nkAPAzQaefBOnGOkujQoCsX6TNHAFQgoUnVSAaTLkaYCElqq1JHvPgnk1hP4jkv
 K/wZ61paxtcHNpvRyYw82+md7nSGOR9bRjElH4dkJazvZ4wuN4ScLpUw3iothHSQPbWu
 Pdt5rX1fyn5sPfVM5g/o6RWYlz65yXvu0c/bWmk28Y/VTqmGYVLJ9bbjgeJzr0uS9U69
 A5BKVLDe5FSyVClaWfuMNp8sI7lXuCiF8BEE5SlAbfvSeDwYYkiyTHpiXXUaeWpb7iyZ
 cGGQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=VcuXNt/O
Subject: [Buildroot] [PATCH 1/1] package/domoticz: bump to version 2023.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch (already in version)

https://github.com/domoticz/domoticz/blob/2023.1/History.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...e-EnOceanRawValue.h-include-stdarg.h.patch | 33 -------------------
 package/domoticz/domoticz.hash                |  2 +-
 package/domoticz/domoticz.mk                  |  2 +-
 3 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 package/domoticz/0001-hardware-EnOceanRawValue.h-include-stdarg.h.patch

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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
