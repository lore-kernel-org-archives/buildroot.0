Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD3AC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 15:16:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EED5360184
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 15:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EED5360184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7F6783613;
	Tue,  3 Aug 2021 15:16:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7blwwk7VimFP; Tue,  3 Aug 2021 15:16:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AE168354D;
	Tue,  3 Aug 2021 15:16:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8AC501BF304
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 15:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A19F605DE
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 15:15:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4e07MBYDrfxd for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 15:15:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C455B607C0
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 15:15:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A6CEE8A710; Tue,  3 Aug 2021 15:15:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Aug 2021 17:05:23 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: f2263ab187379d5852af88a37f52fb1a5ae6dcac
X-Git-Newrev: 04cd33ab53c36b65ef97bcfa75cf6f667c876fc3
X-Patchwork-Hint: ignore
Message-Id: <20210803151550.A6CEE8A710@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/keepalived: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=04cd33ab53c36b65ef97bcfa75cf6f667c876fc3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
