Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5712C4332F
	for <buildroot@archiver.kernel.org>; Sun, 18 Dec 2022 13:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77CE7409E7;
	Sun, 18 Dec 2022 13:58:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77CE7409E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jGsDlMqxSSat; Sun, 18 Dec 2022 13:58:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 701AB40F4E;
	Sun, 18 Dec 2022 13:58:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 701AB40F4E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D22D51BF852
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 13:58:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB9DC605E0
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 13:58:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB9DC605E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zi578Tib0pyc for <buildroot@lists.busybox.net>;
 Sun, 18 Dec 2022 13:58:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD013605D8
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 13:58:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD013605D8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CBF33868D0; Sun, 18 Dec 2022 13:58:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Dec 2022 14:57:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 78504fca92c33cfd23beddd1c9b83fe58b9e0e9a
X-Git-Newrev: 384b75098ba936277379fbaf6e9b78ad8e6fa25f
X-Patchwork-Hint: ignore
Message-Id: <20221218135821.CBF33868D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/domoticz: bump to version 2022.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=384b75098ba936277379fbaf6e9b78ad8e6fa25f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/domoticz/domoticz/blob/2022.2/History.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...rdware-EnOceanRawValue.h-include-stdarg.h.patch | 33 ++++++++++++++++++++++
 package/domoticz/domoticz.hash                     |  2 +-
 package/domoticz/domoticz.mk                       |  2 +-
 3 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/package/domoticz/0001-hardware-EnOceanRawValue.h-include-stdarg.h.patch b/package/domoticz/0001-hardware-EnOceanRawValue.h-include-stdarg.h.patch
new file mode 100644
index 0000000000..bc3e60023d
--- /dev/null
+++ b/package/domoticz/0001-hardware-EnOceanRawValue.h-include-stdarg.h.patch
@@ -0,0 +1,33 @@
+From 6296d7112089a0f3bfb3056f6d9637e13ce4ce83 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 18 Dec 2022 12:27:38 +0100
+Subject: [PATCH] hardware/EnOceanRawValue.h: include stdarg.h
+
+Include stdarg.h to avoid the following build failure on uclibc:
+
+In file included from /home/fabrice/buildroot/output/build/domoticz-2022.2/hardware/EnOceanRawValue.cpp:2:
+/home/fabrice/buildroot/output/build/domoticz-2022.2/hardware/EnOceanRawValue.h:109:83: error: 'va_list' has not been declared
+  109 | uint32_t SetRawValuesNb(uint8_t * data, T_DATAFIELD * OffsetDes, int NbParameter, va_list value);
+      |                                                                                   ^~~~~~~
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/domoticz/domoticz/pull/5472]
+---
+ hardware/EnOceanRawValue.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/hardware/EnOceanRawValue.h b/hardware/EnOceanRawValue.h
+index 84f38d17a..df858f27d 100644
+--- a/hardware/EnOceanRawValue.h
++++ b/hardware/EnOceanRawValue.h
+@@ -1,6 +1,7 @@
+ #ifndef _SetGetRawValue
+ #define _SetGetRawValue
+ 
++#include <stdarg.h>
+ #include <stdint.h>
+ #include <vector>
+ #include <stdio.h>
+-- 
+2.35.1
+
diff --git a/package/domoticz/domoticz.hash b/package/domoticz/domoticz.hash
index 9de241015c..c439238800 100644
--- a/package/domoticz/domoticz.hash
+++ b/package/domoticz/domoticz.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  8282cb71c924b6ef92503976d50f966f2c785eab8f8cffa1136ac133f0241157  domoticz-2022.1.tar.gz
+sha256  8f84098bb64bec12ff7aac5f1fb6b6230a88c5781c2b75bc89861caea73cbccf  domoticz-2022.2.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  License.txt
diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index bc4a2def41..451021150b 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOMOTICZ_VERSION = 2022.1
+DOMOTICZ_VERSION = 2022.2
 DOMOTICZ_SITE = $(call github,domoticz,domoticz,$(DOMOTICZ_VERSION))
 DOMOTICZ_LICENSE = GPL-3.0
 DOMOTICZ_LICENSE_FILES = License.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
