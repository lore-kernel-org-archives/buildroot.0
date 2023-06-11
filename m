Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3DEC77B7A
	for <buildroot@archiver.kernel.org>; Sun, 11 Jun 2023 07:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9826843A4;
	Sun, 11 Jun 2023 07:51:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9826843A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0PERFfhWlEj4; Sun, 11 Jun 2023 07:51:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2476583C10;
	Sun, 11 Jun 2023 07:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2476583C10
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 592F11BF2CD
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 07:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32FEE40162
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 07:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32FEE40162
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BA0pwQKSJaaY for <buildroot@lists.busybox.net>;
 Sun, 11 Jun 2023 07:51:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 584C040147
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 584C040147
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 07:51:51 +0000 (UTC)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
 by mailout02.t-online.de (Postfix) with SMTP id BB226654A;
 Sun, 11 Jun 2023 09:51:48 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd87.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q8FrY-0f2PXV0; Sun, 11 Jun 2023 09:51:48 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:54938)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q8FrY-0003a3-0e;
 Sun, 11 Jun 2023 09:51:48 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 11 Jun 2023 09:51:48 +0200
Message-Id: <20230611075148.327954-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686469908-4D7F3F7B-B2CB1E54/0/0 CLEAN NORMAL
X-TOI-MSGID: 96307b16-ed9b-4cb6-9e61-169996b8e12a
Subject: [Buildroot] [PATCH 1/1] package/nfs-utils: fix static build
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
After trying for an hour to register an account upstream I gave up
because all my public mail accounts were rejected. So I was unable to
send the patch upstream.

 ...-guard-dlfcn.h-include-with-HAVE_DLF.patch | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/nfs-utils/0002-support-reexport-guard-dlfcn.h-include-with-HAVE_DLF.patch

diff --git a/package/nfs-utils/0002-support-reexport-guard-dlfcn.h-include-with-HAVE_DLF.patch b/package/nfs-utils/0002-support-reexport-guard-dlfcn.h-include-with-HAVE_DLF.patch
new file mode 100644
index 0000000000..3af4b75623
--- /dev/null
+++ b/package/nfs-utils/0002-support-reexport-guard-dlfcn.h-include-with-HAVE_DLF.patch
@@ -0,0 +1,44 @@
+From 274e4d212c30183242e48b639889865819f3ac33 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 11 Jun 2023 08:57:11 +0200
+Subject: [PATCH] support/reexport: guard dlfcn.h include with HAVE_DLFCN_H
+
+Upstream: pending upload
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
