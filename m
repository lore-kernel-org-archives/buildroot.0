Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF95C88CB2
	for <buildroot@archiver.kernel.org>; Mon, 12 Jun 2023 17:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAE7D418AD;
	Mon, 12 Jun 2023 17:29:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAE7D418AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8kZ2u542oGoV; Mon, 12 Jun 2023 17:29:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B34C9414DE;
	Mon, 12 Jun 2023 17:29:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B34C9414DE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3972F1BF306
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 17:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 111C4414E4
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 17:29:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 111C4414E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EuJzoo1KVMVN for <buildroot@lists.busybox.net>;
 Mon, 12 Jun 2023 17:29:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F1D9414D8
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7F1D9414D8
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 17:29:30 +0000 (UTC)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
 by mailout07.t-online.de (Postfix) with SMTP id B1314412DA;
 Mon, 12 Jun 2023 19:29:27 +0200 (CEST)
Received: from fli4l.lan.fli4l ([84.161.180.237]) by fwd76.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q8lM7-14Mpqj0; Mon, 12 Jun 2023 19:29:27 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:60138)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q8lM6-00073u-2p;
 Mon, 12 Jun 2023 19:29:26 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Mon, 12 Jun 2023 19:29:25 +0200
Message-Id: <20230612172926.1814129-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686590967-15FFC3A1-92365078/0/0 CLEAN NORMAL
X-TOI-MSGID: 68f8dcd1-504e-4b49-9d34-fc8f6ce8ca8b
Subject: [Buildroot] [PATCH 1/2] package/haproxy: fix build on aarch64
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/07c/07ccb8c45c709a4b6ed32aafa33cd04e74174b11/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...mic.h-may-need-compiler.h-on-ARMv8.2.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/haproxy/0001-BUILD-atomic-atomic.h-may-need-compiler.h-on-ARMv8.2.patch

diff --git a/package/haproxy/0001-BUILD-atomic-atomic.h-may-need-compiler.h-on-ARMv8.2.patch b/package/haproxy/0001-BUILD-atomic-atomic.h-may-need-compiler.h-on-ARMv8.2.patch
new file mode 100644
index 0000000000..b3b1f732ab
--- /dev/null
+++ b/package/haproxy/0001-BUILD-atomic-atomic.h-may-need-compiler.h-on-ARMv8.2.patch
@@ -0,0 +1,36 @@
+From 5ab3c61932af7619518169da744ba6346f060405 Mon Sep 17 00:00:00 2001
+From: Willy Tarreau <w@1wt.eu>
+Date: Thu, 8 Dec 2022 08:32:57 +0100
+Subject: [PATCH] BUILD: atomic: atomic.h may need compiler.h on ARMv8.2-a
+
+We get a build error in ncbuf.c when building for ARMv8.2-a because ncbuf
+has minimal includes and among them bug.h which includes atomic.h. Atomic.h
+may use "forceinline" without including compiler.h, hence the build error.
+It was verified that adding it doesn't inflate the total headers.
+
+Since all other C files include api.h which already covers this, there's
+no real need to bapkport this. The issue was already there in 2.3 though.
+
+Upstream: https://git.haproxy.org/?p=haproxy.git;a=commitdiff;h=5ab3c61932af7619518169da744ba6346f060405#patch1
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ include/haproxy/atomic.h |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/include/haproxy/atomic.h b/include/haproxy/atomic.h
+index f60be95..7e3c826 100644
+--- a/include/haproxy/atomic.h
++++ b/include/haproxy/atomic.h
+@@ -23,6 +23,8 @@
+ #ifndef _HAPROXY_ATOMIC_H
+ #define _HAPROXY_ATOMIC_H
+ 
++#include <haproxy/compiler.h>
++
+ /* A few notes for the macros and functions here:
+  *  - this file is painful to edit, most operations exist in 3 variants,
+  *    no-thread, threads with gcc<4.7, threads with gcc>=4.7. Be careful when
+-- 
+1.7.10.4
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
