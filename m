Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2B10C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:43:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C38B61040
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8C38B61040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53E9C404FA;
	Tue,  3 Aug 2021 23:43:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cvYS8fc5Ukhq; Tue,  3 Aug 2021 23:43:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E20B400C8;
	Tue,  3 Aug 2021 23:43:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 773F81BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B80CB40E58
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B0bRHC16hHKv for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DCB140EB4
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 974B086AA7; Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 18 Jul 2021 14:02:36 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1176b02a1cf562b5d13fe176b9aed35c6e19868d
X-Git-Newrev: 2f0ae33afd371fa528d5872f62248d7b394794a0
X-Patchwork-Hint: ignore
Message-Id: <20210803211007.974B086AA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/trinity: fix build
 with kernel >= 5.13
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=2f0ae33afd371fa528d5872f62248d7b394794a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:
 - http://autobuild.buildroot.org/results/c58119baed8d7711da799e34a5ee1117f46b96f4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...proto-ip-raw.c-fix-build-with-kernel-5.13.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/trinity/0002-net-proto-ip-raw.c-fix-build-with-kernel-5.13.patch b/package/trinity/0002-net-proto-ip-raw.c-fix-build-with-kernel-5.13.patch
new file mode 100644
index 0000000000..4c747f41c9
--- /dev/null
+++ b/package/trinity/0002-net-proto-ip-raw.c-fix-build-with-kernel-5.13.patch
@@ -0,0 +1,37 @@
+From da65f0aa2bfcb4a2d9a77abfaa2955c6be3d37c9 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 17 Jul 2021 08:02:31 +0200
+Subject: [PATCH] net/proto-ip-raw.c: fix build with kernel >= 5.13
+
+Fix the following build failure with kernel >= 5.13:
+
+In file included from /home/buildroot/autobuild/instance-2/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/usr/include/linux/icmp.h:23,
+                 from net/proto-ip-raw.c:1:
+/home/buildroot/autobuild/instance-2/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/usr/include/netinet/in.h:33:5: error: redeclaration of enumerator 'IPPROTO_IP'
+   33 |     IPPROTO_IP = 0,    /* Dummy protocol for TCP.  */
+      |     ^~~~~~~~~~
+/home/buildroot/autobuild/instance-2/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/usr/include/linux/in.h:29:3: note: previous definition of 'IPPROTO_IP' was here
+   29 |   IPPROTO_IP = 0,  /* Dummy protocol for TCP  */
+      |   ^~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/c58119baed8d7711da799e34a5ee1117f46b96f4
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/kernelslacker/trinity/pull/35]
+---
+ net/proto-ip-raw.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/net/proto-ip-raw.c b/net/proto-ip-raw.c
+index 95f2cb13..b407bb68 100644
+--- a/net/proto-ip-raw.c
++++ b/net/proto-ip-raw.c
+@@ -1,3 +1,4 @@
++#include <netinet/in.h>
+ #include <linux/icmp.h>
+ #include "net.h"
+ #include "trinity.h"
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
