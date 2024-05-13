Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF6EC25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 19:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D5E460AAF;
	Mon, 13 May 2024 19:59:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Azw7IUnC8iLF; Mon, 13 May 2024 19:59:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04BDE60A98
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04BDE60A98;
	Mon, 13 May 2024 19:59:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2A4371BF2CA
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 19:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 17275606C4
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 19:59:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rk1koTwmUsHT for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 19:59:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56CEC60642
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56CEC60642
 for <buildroot@buildroot.org>; Mon, 13 May 2024 19:59:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C50787135; Mon, 13 May 2024 19:59:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 May 2024 21:59:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 67855e77c18949727e740571550a22495c1e8675
X-Git-Newrev: 682b61b5b1557a5006521e513fd3cf1f50a9a439
X-Patchwork-Hint: ignore
Message-Id: <20240513195929.4C50787135@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uclibc: fix compile with gcc 14.x
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=682b61b5b1557a5006521e513fd3cf1f50a9a439
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add missing header file.

Fixes:
 http://autobuild.buildroot.net/results/e022040c15e1b1aebc539a0ca0e00b5a1888ccfe

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../uclibc/0001-futimesat-add-missing-header.patch | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/package/uclibc/0001-futimesat-add-missing-header.patch b/package/uclibc/0001-futimesat-add-missing-header.patch
new file mode 100644
index 0000000000..f8af3290fa
--- /dev/null
+++ b/package/uclibc/0001-futimesat-add-missing-header.patch
@@ -0,0 +1,26 @@
+From 4bcf25e75df857806623ff80924675bf849a60d2 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Wed, 8 May 2024 10:08:08 +0200
+Subject: [PATCH] futimesat: add missing header
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=4bcf25e75df857806623ff80924675bf849a60d2
+---
+ libc/sysdeps/linux/common/futimesat.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libc/sysdeps/linux/common/futimesat.c b/libc/sysdeps/linux/common/futimesat.c
+index fd19fea7c..bf36550dd 100644
+--- a/libc/sysdeps/linux/common/futimesat.c
++++ b/libc/sysdeps/linux/common/futimesat.c
+@@ -7,6 +7,7 @@
+  */
+ 
+ #include <sys/syscall.h>
++#include <sys/stat.h>
+ #include <sys/time.h>
+ 
+ #ifdef __NR_futimesat
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
