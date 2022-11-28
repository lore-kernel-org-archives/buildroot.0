Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31FAC4332F
	for <buildroot@archiver.kernel.org>; Mon, 28 Nov 2022 19:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE04481882;
	Mon, 28 Nov 2022 19:41:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE04481882
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eHXRavmxqg1Q; Mon, 28 Nov 2022 19:41:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26CAA8175F;
	Mon, 28 Nov 2022 19:41:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26CAA8175F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A8C3E1BF86C
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 19:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 840C160A64
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 19:41:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 840C160A64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xb4eLXdlblNj for <buildroot@lists.busybox.net>;
 Mon, 28 Nov 2022 19:41:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4CEF60595
Received: from smtpdh19-2.aruba.it (smtpdh19-2.aruba.it [62.149.155.149])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4CEF60595
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 19:41:34 +0000 (UTC)
Received: from localhost.localdomain ([146.241.87.80])
 by Aruba Outgoing Smtp  with ESMTPSA
 id zk0SoHvlV40Ljzk0SoRpXb; Mon, 28 Nov 2022 20:41:32 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 28 Nov 2022 20:41:31 +0100
Message-Id: <20221128194131.3102770-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfA75+lx1U/eQ/eLd30Rn+WcRFoYQCpON9fJW04MS9i7oHvF7dmnVWXoxkOgoyTaCGSVJqrQdEF39vA8hMgulqCoapbMXUj0mzmgFYYLIkiSdGD5RiSky
 k2/zdB1VqjlAKrwMw2tjdNSomD7hKCmwACfMYnZ/MRbL1ejta239FDwXyO5P+uKizcGUrJN3uiEoC0Dm1aPb1Z+IvwqVtecWazK0X1vv2yzeIgcLSoJGruRK
 9ifuktxAgDKusbjNUT5U/ejAZSOJPaRa5xUG8sDLEpFMledJW5lRgo60A1i+lIJ+lip8o2I77ieCxK6nkq7+TZUpP/USNZ048RG2a3hIQBI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1669664492; bh=lSeBD/rloUE+MnDsEfyUg6PIv2/u2svaKQhf04GkdoM=;
 h=From:To:Subject:Date:MIME-Version;
 b=H85CKBrR5qUb0N4Se62y5XOrtqkCskQZp2SPEFjEQiMtxljJjBaGkX4jhEqJo6yl/
 9PXTxr+Gqz8l7oHw9IREn/oCQSPlEMccqgGvIwuQaHjBodQYP9xO0TCUGBy0UnZLz1
 t/jAHDRX19RDBb699Tuf7BvdE8hORp86HY7tANcsaorwLKu6c6FeslUEb+1hPUwgJJ
 Z+n68k6Fn8BmwCI95eNpkffW0IysCT+V6QJahfMbZizdt7Mf3tbCZhlGrto5cZ+nJg
 BBYOpT5M0UShInjGCMZTUBMm8ixS2xcTX2jeeFbD3DqpJq1UNCFGxmDZMdwZS8bU6c
 hxN6WAo/HxkcA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=H85CKBrR
Subject: [Buildroot] [for-next] package/rtl8723ds: bump to latest version
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop local patch since it's been upstreamed.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...TRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch | 39 -------------------
 package/rtl8723ds/rtl8723ds.hash              |  2 +-
 package/rtl8723ds/rtl8723ds.mk                |  2 +-
 3 files changed, 2 insertions(+), 41 deletions(-)
 delete mode 100644 package/rtl8723ds/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch

diff --git a/package/rtl8723ds/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch b/package/rtl8723ds/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch
deleted file mode 100644
index 4495817358..0000000000
--- a/package/rtl8723ds/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 769a1943cb409f89f3c91208294a89b09bf47b86 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Wed, 16 Nov 2022 16:08:21 +0100
-Subject: [PATCH] Makefile: move 'EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)' at the
- end of EXTRA_FLAGS assignment
-
-At the moment USER_EXTRA_CFLAGS can't override local Makfile EXTRA_CFLAGS
-since it's assigned at the beginning of the Makefile. For example it's not
-possible to undefine the hardcoded CONFIG_LITTLE_ENDIAN and this doesn't
-allow to build these modules for big endian architectures. So let's move
-the assignment of USER_EXTRA_CFLAGS to EXTRA_CFLAGS after the last
-EXTRA_CFLAGS assignment.
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- Makefile | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index aa57f85..3d91574 100644
---- a/Makefile
-+++ b/Makefile
-@@ -1,4 +1,3 @@
--EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)
- EXTRA_CFLAGS += -O1
- #EXTRA_CFLAGS += -O3
- #EXTRA_CFLAGS += -Wall
-@@ -1738,6 +1737,8 @@ ifneq ($(USER_MODULE_NAME),)
- MODULE_NAME := $(USER_MODULE_NAME)
- endif
- 
-+EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)
-+
- ifneq ($(KERNELRELEASE),)
- 
- rtk_core :=	core/rtw_cmd.o \
--- 
-2.34.1
-
diff --git a/package/rtl8723ds/rtl8723ds.hash b/package/rtl8723ds/rtl8723ds.hash
index cbc77e14c1..53ccbacab2 100644
--- a/package/rtl8723ds/rtl8723ds.hash
+++ b/package/rtl8723ds/rtl8723ds.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  691040a85d838f8d8d7da0f2ed460f1ea5f6734c40dc73770ba7e260b6cda9cc  rtl8723ds-5ab2d3f3858dc4c833013c47a79faa05b10198f6.tar.gz
+sha256  837fcd4cd2c7353b54c5356f4a4ef2e4ad556910386d79d1e2e03f35e9f94af9  rtl8723ds-fa06cb893c18755965f29f6bd4954b18628887da.tar.gz
diff --git a/package/rtl8723ds/rtl8723ds.mk b/package/rtl8723ds/rtl8723ds.mk
index 0d96e6b03a..41ef687c77 100644
--- a/package/rtl8723ds/rtl8723ds.mk
+++ b/package/rtl8723ds/rtl8723ds.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8723DS_VERSION = 5ab2d3f3858dc4c833013c47a79faa05b10198f6
+RTL8723DS_VERSION = fa06cb893c18755965f29f6bd4954b18628887da
 RTL8723DS_SITE = $(call github,lwfinger,rtl8723ds,$(RTL8723DS_VERSION))
 RTL8723DS_LICENSE = GPL-2.0
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
