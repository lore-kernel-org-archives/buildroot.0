Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 300E8D3A67C
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 18:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB02C401C4;
	Tue, 29 Oct 2024 18:37:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OzVDqjLGPZ5t; Tue, 29 Oct 2024 18:37:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A09B4400E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A09B4400E8;
	Tue, 29 Oct 2024 18:37:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CA01A494E
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 18:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B89A3400E8
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 18:37:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x7UKbNEr9apI for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 18:37:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA9AD400DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA9AD400DC
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 18:37:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A7C7B846FF; Tue, 29 Oct 2024 18:37:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 29 Oct 2024 19:36:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7ff8d5abd5b056ea38d83ceab6c5a2c35285b070
X-Git-Newrev: 028d047cebf0cb2089063ee16bc48770ae277c61
X-Patchwork-Hint: ignore
Message-Id: <20241029183715.A7C7B846FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apache: include ap_config_auto.h
 to define _GNU_SOURCE
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=028d047cebf0cb2089063ee16bc48770ae277c61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/2f6/2f6b7bbb4c97e4c91b3abd6bb205e237e57045fa/
and many more.

The bug was introduced by bumping apache to 2.4.59 with buildroot commit
e0bbfaea0e983c1ce42a9c3085f3ca3dd796852f which includes
https://github.com/apache/httpd/commit/008e6afcfdae36bce1b5f3fc0cb9519375fd99cf

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...r-Include-ap_config_auto.h-to-define-_GNU.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/apache/0004-ap_log_error-Include-ap_config_auto.h-to-define-_GNU.patch b/package/apache/0004-ap_log_error-Include-ap_config_auto.h-to-define-_GNU.patch
new file mode 100644
index 0000000000..40386147cf
--- /dev/null
+++ b/package/apache/0004-ap_log_error-Include-ap_config_auto.h-to-define-_GNU.patch
@@ -0,0 +1,40 @@
+From f7a85d0d2b76db75dc976e8dfa1101c954ea1a74 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Mon, 28 Oct 2024 23:13:05 +0100
+Subject: [PATCH] ap_log_error: Include ap_config_auto.h to define
+ _GNU_SOURCE
+
+gettid() needs _GNU_SOURCE defined which is provided by ap_config_auto.h
+
+Fixes buildroot error:
+http://autobuild.buildroot.net/results/2f6/2f6b7bbb4c97e4c91b3abd6bb205e237e57045fa//build-end.log
+
+log.c: In function 'log_tid':
+log.c:637:21: error: implicit declaration of function 'gettid'; did you mean 'getgid'? [-Wimplicit-function-declaration]
+  637 |         pid_t tid = gettid();
+
+Upstream: https://github.com/apache/httpd/pull/496
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ server/log.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/server/log.c b/server/log.c
+index 91dcf2c3eb..e709288858 100644
+--- a/server/log.c
++++ b/server/log.c
+@@ -21,6 +21,10 @@
+  *
+  */
+ 
++#if !defined(WIN32) && !defined(NETWARE)
++#include "ap_config_auto.h"
++#endif
++
+ #include "apr.h"
+ #include "apr_general.h"        /* for signal stuff */
+ #include "apr_strings.h"
+-- 
+2.39.5
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
