Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022BFC7618A
	for <buildroot@archiver.kernel.org>; Mon, 20 Mar 2023 12:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97286403A2;
	Mon, 20 Mar 2023 12:39:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97286403A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KTM4PC-cCELr; Mon, 20 Mar 2023 12:39:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3680405F5;
	Mon, 20 Mar 2023 12:39:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3680405F5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C64971BF3FC
 for <buildroot@lists.busybox.net>; Mon, 20 Mar 2023 12:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABEE24053C
 for <buildroot@lists.busybox.net>; Mon, 20 Mar 2023 12:39:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABEE24053C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KLaOSrDsKvn4 for <buildroot@lists.busybox.net>;
 Mon, 20 Mar 2023 12:39:30 +0000 (UTC)
X-Greylist: delayed 00:38:19 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC26A40364
Received: from smtp-8fa8.mail.infomaniak.ch (smtp-8fa8.mail.infomaniak.ch
 [83.166.143.168])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC26A40364
 for <buildroot@buildroot.org>; Mon, 20 Mar 2023 12:39:29 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [10.4.36.108])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4PgCwl4BrqzMq1Mn;
 Mon, 20 Mar 2023 13:00:23 +0100 (CET)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4PgCwl1sllzMtjgg; Mon, 20 Mar 2023 13:00:23 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 20 Mar 2023 12:59:44 +0100
Message-Id: <20230320115944.594762-1-nicolas.serafini@ik.me>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Infomaniak-Routing: alpha
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ik.me;
 s=20200325; 
 t=1679313623; bh=L9z8MYQWEvX4Me8uu1StXg6AI7X+NC2Q4JS9G6kVl00=;
 h=From:To:Cc:Subject:Date:From;
 b=vdSK6hWtHB68WQxVztSUG2zXAZf8N6zMuqAkv7CjeOzimfnPUGU+idEhwnlDewIFo
 OdJ0NAeKUQIfvE1nns9sG5qKpJra40OJU8zM1r5PjWnX5ElQ59MDyw6A1fXDrOC25q
 nMvXvUWDDxZ3/pSB0csxZC+/BjwLk9njb2jXmZIo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=ik.me header.i=@ik.me header.a=rsa-sha256
 header.s=20200325 header.b=vdSK6hWt
Subject: [Buildroot] [PATCH] package/ofono: bump version to 2.0
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
https://git.kernel.org/pub/scm/network/ofono/ofono.git/tree/ChangeLog?h=2.0

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
index 7edef0eb80..4b54e9bed4 100644
--- a/package/ofono/ofono.hash
+++ b/package/ofono/ofono.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/network/ofono/sha256sums.asc
-sha256  c0b96d3013447ec2bcb74579bef90e4e59c68dbfa4b9c6fbce5d12401a43aac7  ofono-1.34.tar.xz
+sha256  b0a31bf4d8ff3030c4aef9f8413df999c54df9db2ff0a1d3ec1710e0a9d1a49e  ofono-2.0.tar.xz
 # Locally computed
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index b7a2a923f9..424a76ae12 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OFONO_VERSION = 1.34
+OFONO_VERSION = 2.0
 OFONO_SOURCE = ofono-$(OFONO_VERSION).tar.xz
 OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
 OFONO_LICENSE = GPL-2.0
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
