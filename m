Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A05C4332F
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 10:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE45881DCA;
	Sat, 15 Oct 2022 10:56:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE45881DCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VEVJh9MtlyFu; Sat, 15 Oct 2022 10:56:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B92E81D7D;
	Sat, 15 Oct 2022 10:56:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B92E81D7D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A8281BF292
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 10:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA76860B50
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 10:56:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA76860B50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MniPrmWRu1cL for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 10:56:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3C8D60A77
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E3C8D60A77
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 10:56:15 +0000 (UTC)
X-QQ-mid: bizesmtp63t1665831180tvkmlsyp
Received: from pc.. ( [202.188.176.82]) by bizesmtp.qq.com (ESMTP) with 
 id ; Sat, 15 Oct 2022 18:53:00 +0800 (CST)
X-QQ-SSF: 01000000002000206000B00A0000000
X-QQ-FEAT: ERSZEewZJun5dVoIP9USDOnErcmq/z+zv7t8hirHWH7F/LfFEmfcZfhDA+jZt
 qcftMBZXmod9jNXl4Qe+r/X0XVteyZTdVVjq+hRYhXX4V249c4aYrpbMUG+qH1t4qBLQdyy
 jXs2bCSzfXxPRNZ/3z/oEDKQcpcLU3d4n4uLF5bKxxBMXV0pXcdmeBSq26m/gZETCBY53w0
 GVM+hSuYIs8e7a8YpVcz8QUHeRZnnWebJ/8C09AJnc+pUMwhfnr2fi7wUlzwncv3e7TzL3E
 yto4PxMxYrPEVX8IWGvL9UZnbw5bRCBDcK7EioYw3RGc4Y9UGz9ecIExCaooIilu6h5Hnsr
 rBehkv/uFgjFvWJ+fisgTx99BkSKDyTMGCf1cijdy/tlELjgklRs+wTA/NjYnm9n0dK50Ml
 ixmhywS/O9M=
X-QQ-GoodBg: 0
From: Tan En De <ende.tan@linux.starfivetech.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 16:47:55 +0800
Message-Id: <20221015084757.277050-2-ende.tan@linux.starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221015084757.277050-1-ende.tan@linux.starfivetech.com>
References: <20221015084757.277050-1-ende.tan@linux.starfivetech.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:linux.starfivetech.com:qybglogicsvr:qybglogicsvr4
Subject: [Buildroot] [1/3] package/libkcapi: bump version to 1.4.0
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
Cc: Tan En De <ende.tan@linux.starfivetech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed patch applied upstream:
https://github.com/smuellerDD/libkcapi/commit/455c4938f5822c017c7ff79dd2dca638b6410923

Signed-off-by: Tan En De <ende.tan@linux.starfivetech.com>
---
 ...f-__NR_io_getevents-when-not-defined.patch | 42 -------------------
 package/libkcapi/libkcapi.hash                |  4 +-
 package/libkcapi/libkcapi.mk                  |  2 +-
 3 files changed, 3 insertions(+), 45 deletions(-)
 delete mode 100644 package/libkcapi/0001-Disable-use-of-__NR_io_getevents-when-not-defined.patch

diff --git a/package/libkcapi/0001-Disable-use-of-__NR_io_getevents-when-not-defined.patch b/package/libkcapi/0001-Disable-use-of-__NR_io_getevents-when-not-defined.patch
deleted file mode 100644
index 20aa75b741..0000000000
--- a/package/libkcapi/0001-Disable-use-of-__NR_io_getevents-when-not-defined.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 455c4938f5822c017c7ff79dd2dca638b6410923 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 15 Nov 2020 18:05:48 -0800
-Subject: [PATCH] Disable use of __NR_io_getevents when not defined
-
-Architectures like riscv32 do not define this syscall, therefore return
-ENOSYS on such architectures
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Stephan Mueller <smueller@chronox.de>
-[Retrieved from:
-https://github.com/smuellerDD/libkcapi/commit/455c4938f5822c017c7ff79dd2dca638b6410923]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- lib/internal.h | 11 +++++++++--
- 1 file changed, 9 insertions(+), 2 deletions(-)
-
-diff --git a/lib/internal.h b/lib/internal.h
-index 1237827..f765461 100644
---- a/lib/internal.h
-+++ b/lib/internal.h
-@@ -325,10 +325,17 @@ static inline int io_submit(aio_context_t ctx, long n,  struct iocb **iocb)
-     return syscall(__NR_io_submit, ctx, n, iocb);
- }
- 
--static inline int io_getevents(aio_context_t ctx, long min, long max,
--            struct io_event *events, struct timespec *timeout)
-+static inline int io_getevents(__attribute__((unused)) aio_context_t ctx,
-+            __attribute__((unused)) long min,
-+            __attribute__((unused)) long max,
-+            __attribute__((unused)) struct io_event *events,
-+            __attribute__((unused)) struct timespec *timeout)
- {
-+#ifdef __NR_io_getevents
-     return syscall(__NR_io_getevents, ctx, min, max, events, timeout);
-+#else
-+    return -ENOSYS;
-+#endif
- }
- 
- /************************************************************
diff --git a/package/libkcapi/libkcapi.hash b/package/libkcapi/libkcapi.hash
index 49b0880211..d858086408 100644
--- a/package/libkcapi/libkcapi.hash
+++ b/package/libkcapi/libkcapi.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  8a08dcbb4d05ede4357cdc9d61c7f2a7f2cd96b7ce2eb41b28e45b2e378267ad  libkcapi-1.1.5.tar.xz
-sha256  c6b8402a68999b0f84560ab43cdf60f9ff33c4a9a8ced6a40db9d3b787ba5b4a  COPYING
+sha256  644b47593b3f27f08add7a8808ccdbe569a2f331d70fb8b52551e57379b917fa  libkcapi-1.4.0.tar.xz
+sha256  9765fad61726afb2b253db2c68153672e4178d6809667ae98141f3e90fe8645b  COPYING
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING.gplv2
 sha256  13aa749a5b0a454917a944ed8fffc530b784f5ead522b1aacaf4ec8aa55a6239  COPYING.bsd
diff --git a/package/libkcapi/libkcapi.mk b/package/libkcapi/libkcapi.mk
index 09c5c028bc..30d500696b 100644
--- a/package/libkcapi/libkcapi.mk
+++ b/package/libkcapi/libkcapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBKCAPI_VERSION = 1.1.5
+LIBKCAPI_VERSION = 1.4.0
 LIBKCAPI_SOURCE = libkcapi-$(LIBKCAPI_VERSION).tar.xz
 LIBKCAPI_SITE = http://www.chronox.de/libkcapi
 LIBKCAPI_AUTORECONF = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
