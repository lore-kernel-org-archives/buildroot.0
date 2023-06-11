Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE73C7EE2E
	for <buildroot@archiver.kernel.org>; Sun, 11 Jun 2023 17:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C90A40A93;
	Sun, 11 Jun 2023 17:51:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C90A40A93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B7ns6DeBKYLo; Sun, 11 Jun 2023 17:51:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CAD940A56;
	Sun, 11 Jun 2023 17:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CAD940A56
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 06E9D1BF27E
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 17:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E00E060FC9
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 17:51:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E00E060FC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jXyxc9RkxOxQ for <buildroot@lists.busybox.net>;
 Sun, 11 Jun 2023 17:51:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BFC960F2A
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9BFC960F2A
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 17:51:51 +0000 (UTC)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
 by mailout05.t-online.de (Postfix) with SMTP id 742CEFCBA;
 Sun, 11 Jun 2023 19:51:48 +0200 (CEST)
Received: from fli4l.lan.fli4l ([84.161.180.237]) by fwd78.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q8PE7-1dhtXl0; Sun, 11 Jun 2023 19:51:43 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:33292)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q8PE6-0000Vm-2s;
 Sun, 11 Jun 2023 19:51:42 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 11 Jun 2023 19:51:42 +0200
Message-Id: <20230611175142.5235-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686505903-08FC4714-151CCE9D/0/0 CLEAN NORMAL
X-TOI-MSGID: a382cbc3-62ad-4bcb-8d42-ded5fa59a73b
Subject: [Buildroot] [PATCH v2 1/1] package/nfs-utils: fix static build
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/f17/f17a554c86f0b24327b49fdc75612cc133f129ed/

f9dc4bab9f4576eed3a22ca7517bfc88d9812c34 bumped nfs-utils to version
2.6.3 which includes the addition of the two files patched here.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: added upstream URL

 ...-guard-dlfcn.h-include-with-HAVE_DLF.patch | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/nfs-utils/0002-support-reexport-guard-dlfcn.h-include-with-HAVE_DLF.patch

diff --git a/package/nfs-utils/0002-support-reexport-guard-dlfcn.h-include-with-HAVE_DLF.patch b/package/nfs-utils/0002-support-reexport-guard-dlfcn.h-include-with-HAVE_DLF.patch
new file mode 100644
index 0000000000..5ffb15d86d
--- /dev/null
+++ b/package/nfs-utils/0002-support-reexport-guard-dlfcn.h-include-with-HAVE_DLF.patch
@@ -0,0 +1,44 @@
+From 274e4d212c30183242e48b639889865819f3ac33 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 11 Jun 2023 08:57:11 +0200
+Subject: [PATCH] support/reexport: guard dlfcn.h include with HAVE_DLFCN_H
+
+Upstream: https://marc.info/?l=linux-nfs&m=168650558019402&w=2
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ support/reexport/fsidd.c    | 2 ++
+ support/reexport/reexport.c | 2 ++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/support/reexport/fsidd.c b/support/reexport/fsidd.c
+index 37649d06..d4b245e8 100644
+--- a/support/reexport/fsidd.c
++++ b/support/reexport/fsidd.c
+@@ -3,7 +3,9 @@
+ #endif
+ 
+ #include <assert.h>
++#ifdef HAVE_DLFCN_H
+ #include <dlfcn.h>
++#endif
+ #include <event2/event.h>
+ #include <limits.h>
+ #include <stdint.h>
+diff --git a/support/reexport/reexport.c b/support/reexport/reexport.c
+index d597a2f7..d9a700af 100644
+--- a/support/reexport/reexport.c
++++ b/support/reexport/reexport.c
+@@ -2,7 +2,9 @@
+ #include <config.h>
+ #endif
+ 
++#ifdef HAVE_DLFCN_H
+ #include <dlfcn.h>
++#endif
+ #include <stdint.h>
+ #include <stdio.h>
+ #include <sys/random.h>
+-- 
+2.39.2
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
