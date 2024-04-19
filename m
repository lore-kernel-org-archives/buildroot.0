Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839D1C4345F
	for <buildroot@archiver.kernel.org>; Fri, 19 Apr 2024 06:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0328C605F7;
	Fri, 19 Apr 2024 06:13:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PME10Q4jlX68; Fri, 19 Apr 2024 06:13:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E410160764
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E410160764;
	Fri, 19 Apr 2024 06:13:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A9D41BF307
 for <buildroot@lists.busybox.net>; Fri, 19 Apr 2024 06:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06CA060764
 for <buildroot@lists.busybox.net>; Fri, 19 Apr 2024 06:13:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kwZRfik_APCO for <buildroot@lists.busybox.net>;
 Fri, 19 Apr 2024 06:13:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=eagle.alexander923@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A07BF605F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A07BF605F7
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A07BF605F7
 for <buildroot@buildroot.org>; Fri, 19 Apr 2024 06:13:06 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2d9fe2b37acso21073201fa.2
 for <buildroot@buildroot.org>; Thu, 18 Apr 2024 23:13:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713507184; x=1714111984;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QxT2sjxENVe9VOisUUaSe7CIVhBt+YTbREVI+/w7ZKg=;
 b=XsKjrJgEs9ktNy2RosA8XyPp+PDL87m4ISI7tt24pIt/wPS/jcVVoeyCW82ElGowpp
 3m0SMGhePzzI5lhPh136WN7vAFL5J7ljDY8uVZpuaoU/0dnNAdc9m4BCDkDtHssaaL37
 D3AcPAtQNwAeBDATufMhCpY7bujJqqDmjFTI4798QGFJrNUpwfCrlnPwirGJo3Ilb2HT
 644q4HRDMUmj9HjtCmpTXDnxG/ZE7Xgd9ipEFnYp7Ym+umP7EPjpSs2ZBTsag+EvO5y5
 vbE0V2evNxg7lZK6FuKg4nmx2BYmojLzMZydmHZtIswKidEOTUHfR0/uyDnGw0z6yxY1
 T8Cw==
X-Gm-Message-State: AOJu0Yy0hmVhSJpKYDay6c1psDRQvm5ymViLw3R9AH8PouKoT63VxqjB
 esev2BDm6v7DGJ11bxTeEhi+aBflQlPWOWou3HgvJVBxbpkqHvqnCvpAsQ==
X-Google-Smtp-Source: AGHT+IHugSwAMOtC3I5r7FgU10FiVgRV1O34ANzjqxkzJjI4XrIHJgwom6GpMZQTMLHi/gj884UHTw==
X-Received: by 2002:a19:2d13:0:b0:519:4e86:a52a with SMTP id
 k19-20020a192d13000000b005194e86a52amr622566lfj.26.1713507183649; 
 Thu, 18 Apr 2024 23:13:03 -0700 (PDT)
Received: from localhost.localdomain ([188.243.23.53])
 by smtp.gmail.com with ESMTPSA id
 eo14-20020a056512480e00b00518e09e0024sm558507lfb.200.2024.04.18.23.13.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Apr 2024 23:13:03 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 19 Apr 2024 09:12:41 +0300
Message-Id: <20240419061241.116608-1-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713507184; x=1714111984; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QxT2sjxENVe9VOisUUaSe7CIVhBt+YTbREVI+/w7ZKg=;
 b=cYKw7+rWdPpLnZBAUoRvHJbEI9ZuCUjh1TzhyG2tn63ZOBXmocKaaiJJU/dHtFZrCu
 SVWvssyDPjRCSQicvIbBmzO6p/HRzVkLSHCiapG1lfRTPVx4WEPI2AsS9dW1tp1/QyxM
 G0AISulDEzXvwp+tFQwlp+1BTeFPZ9yiBtE5s58ygdBLjmhVuphMSqiTiy24u9/kkj1r
 eq3rbn/680mL0ZI0VW0N2uzdZ4+LgJibVow/pgi2i0ojVw7zhvXj/PE0wynq6rz5xVWZ
 yNw6W07QVQ7v+IvBX+bhPFT7+rxyeFMkYLv+TxgMKIHZr7AovUOWyJ74txGTSti0j7FN
 7LUw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cYKw7+rW
Subject: [Buildroot] [PATCH] libusbgx: Update package from git
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
Cc: Alexander Shiyan <eagle.alexander923@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The current version is more than 6 years old. Update to the latest git
version.
The current version contains many fixes and improvements and supports
several new types of USB gadgets.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 .../0001-Add-include-of-sys-sysmacro.h.patch  | 98 -------------------
 package/libusbgx/libusbgx.hash                |  2 +-
 package/libusbgx/libusbgx.mk                  |  5 +-
 3 files changed, 4 insertions(+), 101 deletions(-)
 delete mode 100644 package/libusbgx/0001-Add-include-of-sys-sysmacro.h.patch

diff --git a/package/libusbgx/0001-Add-include-of-sys-sysmacro.h.patch b/package/libusbgx/0001-Add-include-of-sys-sysmacro.h.patch
deleted file mode 100644
index 0f47454f7a..0000000000
--- a/package/libusbgx/0001-Add-include-of-sys-sysmacro.h.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-From 45c14ef4d5d7ced0fbf984208de44ced6d5ed898 Mon Sep 17 00:00:00 2001
-From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
-Date: Mon, 10 Sep 2018 15:52:09 +0200
-Subject: [PATCH] libusbgx: fix build with glibc-2.28 since <sys/sysmacros.h>
- is no more included by <sys/types.h>
-
-Since https://sourceware.org/ml/libc-alpha/2015-11/msg00253.html sys/sysmacros.h
-must be explicitly included.
-Without sys/sysmacros.h and with glibc-2.28 build fails with error like:
-src/.libs/libusbgx.so: undefined reference to minor' src/.libs/libusbgx.so: undefined reference tomajor'
-src/.libs/libusbgx.so: undefined reference to `makedev'
-
-Signed-off-by: Sid Spry <R030t1@gmail.com>
-Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
----
- examples/gadget-acm-ecm.c              | 1 +
- examples/gadget-import.c               | 1 +
- examples/gadget-ms.c                   | 1 +
- examples/show-gadgets.c                | 1 +
- examples/show-udcs.c                   | 1 +
- include/usbg/usbg_internal_libconfig.h | 1 +
- 6 files changed, 6 insertions(+)
-
-diff --git a/examples/gadget-acm-ecm.c b/examples/gadget-acm-ecm.c
-index 1c5e2ca..29360da 100644
---- a/examples/gadget-acm-ecm.c
-+++ b/examples/gadget-acm-ecm.c
-@@ -20,6 +20,7 @@
- 
- #include <errno.h>
- #include <stdio.h>
-+#include <sys/sysmacros.h>
- #include <linux/usb/ch9.h>
- #include <usbg/usbg.h>
- 
-diff --git a/examples/gadget-import.c b/examples/gadget-import.c
-index e684fdb..63df449 100644
---- a/examples/gadget-import.c
-+++ b/examples/gadget-import.c
-@@ -25,6 +25,7 @@
- #include <errno.h>
- #include <string.h>
- #include <stdio.h>
-+#include <sys/sysmacros.h>
- #include <usbg/usbg.h>
- 
- int main(int argc, char **argv)
-diff --git a/examples/gadget-ms.c b/examples/gadget-ms.c
-index 478c370..a5c6681 100644
---- a/examples/gadget-ms.c
-+++ b/examples/gadget-ms.c
-@@ -23,6 +23,7 @@
- 
- #include <errno.h>
- #include <stdio.h>
-+#include <sys/sysmacros.h>
- #include <linux/usb/ch9.h>
- #include <usbg/usbg.h>
- #include <usbg/function/ms.h>
-diff --git a/examples/show-gadgets.c b/examples/show-gadgets.c
-index 707d448..a2a21c8 100644
---- a/examples/show-gadgets.c
-+++ b/examples/show-gadgets.c
-@@ -21,6 +21,7 @@
- #include <errno.h>
- #include <stdio.h>
- #include <string.h>
-+#include <sys/sysmacros.h>
- #include <netinet/ether.h>
- #include <usbg/usbg.h>
- #include <usbg/function/ms.h>
-diff --git a/examples/show-udcs.c b/examples/show-udcs.c
-index 66e950f..2f5cc45 100644
---- a/examples/show-udcs.c
-+++ b/examples/show-udcs.c
-@@ -23,6 +23,7 @@
- 
- #include <errno.h>
- #include <stdio.h>
-+#include <sys/sysmacros.h>
- #include <usbg/usbg.h>
- 
- int main(void)
-diff --git a/include/usbg/usbg_internal_libconfig.h b/include/usbg/usbg_internal_libconfig.h
-index ac51758..3fa55c0 100644
---- a/include/usbg/usbg_internal_libconfig.h
-+++ b/include/usbg/usbg_internal_libconfig.h
-@@ -12,6 +12,7 @@
- #ifndef USBG_INTERNAL_LIBCONFIG_H
- #define USBG_INTERNAL_LIBCONFIG_H
- 
-+#include <sys/sysmacros.h>
- #include <libconfig.h>
- #ifdef __cplusplus
- extern "C" {
--- 
-2.16.4
-
diff --git a/package/libusbgx/libusbgx.hash b/package/libusbgx/libusbgx.hash
index dd43ec7b97..0ae994c9b8 100644
--- a/package/libusbgx/libusbgx.hash
+++ b/package/libusbgx/libusbgx.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  b15abc89a0ef82c6a650cc1d58b5ba50f7ce076db392add84caabcd86c608ee2  libusbgx-0.2.0.tar.gz
+sha256  b66d8b1ee04087133ba841ad1cd0004951a18f695a378ee42a2a0a060ca0183c  libusbgx-a5bfa81017a9b2064bc449cf74f5f9d106445f62-br1.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/libusbgx/libusbgx.mk b/package/libusbgx/libusbgx.mk
index 516ad25970..c0ebabfeae 100644
--- a/package/libusbgx/libusbgx.mk
+++ b/package/libusbgx/libusbgx.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBUSBGX_VERSION = 0.2.0
-LIBUSBGX_SITE = $(call github,libusbgx,libusbgx,libusbgx-v$(LIBUSBGX_VERSION))
+LIBUSBGX_VERSION = a5bfa81017a9b2064bc449cf74f5f9d106445f62
+LIBUSBGX_SITE = https://github.com/linux-usb-gadgets/libusbgx.git
+LIBUSBGX_SITE_METHOD = git
 LIBUSBGX_LICENSE = GPL-2.0+ (examples), LGPL-2.1+ (library)
 LIBUSBGX_LICENSE_FILES = COPYING COPYING.LGPL
 LIBUSBGX_DEPENDENCIES = host-pkgconf libconfig
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
