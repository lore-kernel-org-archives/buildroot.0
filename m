Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D035BC77B61
	for <buildroot@archiver.kernel.org>; Mon, 24 Apr 2023 07:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 392C540B9C;
	Mon, 24 Apr 2023 07:00:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 392C540B9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rxMcMoUK8w7j; Mon, 24 Apr 2023 07:00:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5207340BD6;
	Mon, 24 Apr 2023 07:00:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5207340BD6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD8071C2B82
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 07:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A58B1409B6
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 07:00:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A58B1409B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nHZXR1rcedO2 for <buildroot@lists.busybox.net>;
 Mon, 24 Apr 2023 07:00:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BE62409A8
Received: from smtp-190f.mail.infomaniak.ch (smtp-190f.mail.infomaniak.ch
 [185.125.25.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8BE62409A8
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 07:00:37 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [10.4.36.108])
 by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Q4bcf2jB5zMqTFh;
 Mon, 24 Apr 2023 09:00:34 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4Q4bcd3FWCzMprKn; Mon, 24 Apr 2023 09:00:33 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon, 24 Apr 2023 08:59:44 +0200
Message-Id: <20230424065944.40770-1-nicolas.serafini@ik.me>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Infomaniak-Routing: alpha
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ik.me;
 s=20200325; 
 t=1682319634; bh=Vt66xboJxnX9gM1sT7prJjdIV7KC3DJ78xuqO+VXsyY=;
 h=From:To:Cc:Subject:Date:From;
 b=28qS+ySChHzNjallpSUOc/ZyQ3HKJx/RqVBB6+mHaVWjgKFt9vf0q1Cunc/Cb7F80
 qbSJ/I1v9vMcNtCwCJBurdz8quwwXyHUCUznd0W3qisqkkX+WGQWyA4bStVzalMLSb
 j08kMj0cBHRLWpz7kvJgHCKWVmN4VyIcr84ZMqZ0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=ik.me header.i=@ik.me header.a=rsa-sha256
 header.s=20200325 header.b=28qS+ySC
Subject: [Buildroot] [PATCH] package/ofono: bump version to 2.1
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
From: Nicolas Serafini via buildroot <buildroot@buildroot.org>
Reply-To: Nicolas Serafini <nicolas.serafini@ik.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop local patch 0002 as the TEMP_FAILURE_RETRY macro was replaced by
L_TFR from ell library.
https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=765c6655f26304c45adfdb92081448d797ce3092

Release notes:
https://git.kernel.org/pub/scm/network/ofono/ofono.git/tree/ChangeLog?h=2.1

Signed-off-by: Nicolas Serafini <nicolas.serafini@ik.me>
---
 package/ofono/0002-fix-musl-compile.patch | 37 -----------------------
 package/ofono/ofono.hash                  |  2 +-
 package/ofono/ofono.mk                    |  2 +-
 3 files changed, 2 insertions(+), 39 deletions(-)
 delete mode 100644 package/ofono/0002-fix-musl-compile.patch

diff --git a/package/ofono/0002-fix-musl-compile.patch b/package/ofono/0002-fix-musl-compile.patch
deleted file mode 100644
index 369fb71791..0000000000
--- a/package/ofono/0002-fix-musl-compile.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 4a1d114fa3a5d6bef1f71222787c1f6c3a952284 Mon Sep 17 00:00:00 2001
-From: Nicolas Serafini <nicolas.serafini@sensefly.com>
-Date: Thu, 24 Jan 2019 10:11:42 +0100
-Subject: [PATCH] mbim: add optional copy of TEMP_FAILURE_RETRY macro (fix musl
- compile)
-
-TEMP_FAILURE_RETRY is not available on musl.
-
-Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
----
- drivers/mbimmodem/mbim.c | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/drivers/mbimmodem/mbim.c b/drivers/mbimmodem/mbim.c
-index 54b18acf..4b040528 100644
---- a/drivers/mbimmodem/mbim.c
-+++ b/drivers/mbimmodem/mbim.c
-@@ -37,6 +37,16 @@
- #include "mbim-message.h"
- #include "mbim-private.h"
- 
-+/* taken from glibc unistd.h for musl support */
-+#ifndef TEMP_FAILURE_RETRY
-+#define TEMP_FAILURE_RETRY(expression)             \
-+  (__extension__                                   \
-+    ({ long int __result;                          \
-+       do __result = (long int) (expression);      \
-+       while (__result == -1L && errno == EINTR);  \
-+       __result; }))
-+#endif
-+
- #define MAX_CONTROL_TRANSFER 4096
- #define HEADER_SIZE (sizeof(struct mbim_message_header) + \
- 					sizeof(struct mbim_fragment_header))
--- 
-2.20.1
-
diff --git a/package/ofono/ofono.hash b/package/ofono/ofono.hash
index 7edef0eb80..f1760d6f13 100644
--- a/package/ofono/ofono.hash
+++ b/package/ofono/ofono.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/network/ofono/sha256sums.asc
-sha256  c0b96d3013447ec2bcb74579bef90e4e59c68dbfa4b9c6fbce5d12401a43aac7  ofono-1.34.tar.xz
+sha256  92913dcce9a15cac2174daca249457716a0ec036878d22035e83af0e19e79c52  ofono-2.1.tar.xz
 # Locally computed
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index b7a2a923f9..5f91e4985d 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OFONO_VERSION = 1.34
+OFONO_VERSION = 2.1
 OFONO_SOURCE = ofono-$(OFONO_VERSION).tar.xz
 OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
 OFONO_LICENSE = GPL-2.0
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
