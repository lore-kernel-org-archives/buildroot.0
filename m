Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE664C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 15:16:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 776AB60525
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 15:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 776AB60525
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58AC36087A;
	Tue,  3 Aug 2021 15:16:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N4siSRhZ4O8J; Tue,  3 Aug 2021 15:16:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C0BD6077C;
	Tue,  3 Aug 2021 15:16:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 729381BF304
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 15:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 524878290B
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 15:15:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QQhFiMIjY_ID for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 15:15:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF824817AF
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 15:15:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id AA81B8A6C7; Tue,  3 Aug 2021 15:15:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Aug 2021 17:05:54 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 0a9e1a5029ef97179a369250086a9c82b91e60d2
X-Git-Newrev: 710daa0001a64e4c8621ebd46ec5f9173b0cbee0
X-Patchwork-Hint: ignore
Message-Id: <20210803151542.AA81B8A6C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/keepalived: fix
 build with kernel >= 5.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=710daa0001a64e4c8621ebd46ec5f9173b0cbee0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Fixes:
 - http://autobuild.buildroot.org/results/9a93d7d76b0a4319c29fbf7b5986bcc78539ae8b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Tested-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit db67c4fcff8c99c0efb91896648666cd1f891a6d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-core-Fix-compiling-on-RHEL-9.patch        | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/keepalived/0001-core-Fix-compiling-on-RHEL-9.patch b/package/keepalived/0001-core-Fix-compiling-on-RHEL-9.patch
new file mode 100644
index 0000000000..39134fcc35
--- /dev/null
+++ b/package/keepalived/0001-core-Fix-compiling-on-RHEL-9.patch
@@ -0,0 +1,34 @@
+From 3fd0c21e4f63ac0a52b5d7a09575f0f364972e4d Mon Sep 17 00:00:00 2001
+From: Quentin Armitage <quentin@armitage.org.uk>
+Date: Tue, 8 Jun 2021 08:57:45 +0100
+Subject: [PATCH] core: Fix compiling on RHEL 9
+
+Signed-off-by: Quentin Armitage <quentin@armitage.org.uk>
+
+[Retrieved from:
+https://github.com/acassen/keepalived/commit/3fd0c21e4f63ac0a52b5d7a09575f0f364972e4d]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ keepalived/core/layer4.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/keepalived/core/layer4.c b/keepalived/core/layer4.c
+index d2cc971a3..fdca04913 100644
+--- a/keepalived/core/layer4.c
++++ b/keepalived/core/layer4.c
+@@ -27,13 +27,14 @@
+ #include <errno.h>
+ #include <unistd.h>
+ #include <fcntl.h>
++#include <netinet/in.h>
++#include <net/if.h>
+ #include <linux/icmp.h>
+ #include <linux/icmpv6.h>
+ #ifdef ERRQUEUE_NEEDS_SYS_TIME
+ #include <sys/time.h>
+ #endif
+ #include <linux/errqueue.h>
+-#include <netinet/in.h>
+ 
+ #include "layer4.h"
+ #include "logger.h"
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
