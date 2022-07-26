Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3568C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 19:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E8A4400C6;
	Tue, 26 Jul 2022 19:41:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E8A4400C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rL0W0mnXPOBV; Tue, 26 Jul 2022 19:41:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 362DE40101;
	Tue, 26 Jul 2022 19:41:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 362DE40101
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3238E1BF27A
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 19:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D0E760644
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 19:41:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D0E760644
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 61Gf7oOEwM5E for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 19:41:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF9E4605D5
Received: from mxd1.seznam.cz (mxd1.seznam.cz [77.75.78.210])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF9E4605D5
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 19:41:51 +0000 (UTC)
Received: from email.seznam.cz
 by email-smtpc1b.ko.seznam.cz (email-smtpc1b.ko.seznam.cz [10.53.13.15])
 id 1e5b34b5a87b8bee1e5c8ac2; Tue, 26 Jul 2022 21:41:40 +0200 (CEST)
Received: from localhost.localdomain (mail.ms-free.net [185.147.46.46])
 by email-relay29.ko.seznam.cz (Seznam SMTPD 1.3.137) with ESMTP;
 Tue, 26 Jul 2022 21:41:37 +0200 (CEST)  
From: Petr Vorel <pevik@seznam.cz>
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 21:41:29 +0200
Message-Id: <20220726194129.44446-1-pevik@seznam.cz>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-szn-frgn: <3ff463d3-6592-43eb-90e9-aa203cdd2cba>
X-szn-frgc: <0>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=seznam.cz; s=beta; 
 t=1658864500; bh=yfhvLm0mYHw4t/LA4aZgBoQ14uu9Gcg2+q5sOM5qTcY=;
 h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-szn-frgn:X-szn-frgc;
 b=WFbZSgxZFMPptDl9wAdIDze1dVWhngtDEoneVZJ6mQIm8u8Ig78IQYSGFvDPGWbnu
 UllDQ/31RW5c4yw7VJP3ftQ+OSlqYGbDhgHlYSrMZS6+hAJ3DObkxuifo0HcO+Y+V4
 H9NeF+7TBsGu8mnBEgcHJfBY7uuBqNFNq9ReLNio=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=seznam.cz header.i=@seznam.cz
 header.a=rsa-sha256 header.s=beta header.b=WFbZSgxZ
Subject: [Buildroot] [PATCH 1/1] package/iproute2: bump version to 5.18.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Petr Vorel <petr.vorel@gmail.com>

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Tested with test-pkg.

 .../0001-bpf_glue-include-errno.h.patch       | 32 +++++++++++++++++++
 package/iproute2/iproute2.hash                |  2 +-
 package/iproute2/iproute2.mk                  |  2 +-
 3 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 package/iproute2/0001-bpf_glue-include-errno.h.patch

diff --git a/package/iproute2/0001-bpf_glue-include-errno.h.patch b/package/iproute2/0001-bpf_glue-include-errno.h.patch
new file mode 100644
index 0000000000..4273c044ad
--- /dev/null
+++ b/package/iproute2/0001-bpf_glue-include-errno.h.patch
@@ -0,0 +1,32 @@
+From f8decf82af07591833f89004e9b72cc39c1b5c52 Mon Sep 17 00:00:00 2001
+From: Juhee Kang <claudiajkang@gmail.com>
+Date: Tue, 19 Jul 2022 00:58:27 +0900
+Subject: [PATCH] bpf_glue: include errno.h
+
+If __NR_bpf is not enabled, bpf() function set errno and return -1. Thus,
+this patch includes the header.
+
+Fixes: ac4e0913beb1 ("bpf: Export bpf syscall wrapper")
+Signed-off-by: Juhee Kang <claudiajkang@gmail.com>
+Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
+
+[ upstream status: f8decf82af07591833f89004e9b72cc39c1b5c52 ]
+---
+ lib/bpf_glue.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/bpf_glue.c b/lib/bpf_glue.c
+index c1cf351b..88a24751 100644
+--- a/lib/bpf_glue.c
++++ b/lib/bpf_glue.c
+@@ -7,6 +7,7 @@
+ #include <sys/syscall.h>
+ #include <limits.h>
+ #include <unistd.h>
++#include <errno.h>
+ 
+ #include "bpf_util.h"
+ #ifdef HAVE_LIBBPF
+-- 
+2.37.1
+
diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index eafe7a6c9a..2bb1ddbc72 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  6e384f1b42c75e1a9daac57866da37dcff909090ba86eb25a6e764da7893660e  iproute2-5.17.0.tar.xz
+sha256  5ba3d464d51c8c283550d507ffac3d10f7aec587b7c66b0ccb6950643646389e  iproute2-5.18.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 8ecde069f5..b9347ed367 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 5.17.0
+IPROUTE2_VERSION = 5.18.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
