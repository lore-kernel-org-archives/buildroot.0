Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467B6C5472F
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 16:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 027796088E;
	Tue, 27 Aug 2024 16:27:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L00t7B4Q0Ydu; Tue, 27 Aug 2024 16:27:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0434608AC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0434608AC;
	Tue, 27 Aug 2024 16:27:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 07ACA1BF4E5
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 16:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7A5080F38
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 16:27:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w74Ti9bW7OB3 for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 16:27:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FE1380EB5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FE1380EB5
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 16:27:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0DC1886506; Tue, 27 Aug 2024 16:27:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Aug 2024 18:26:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e5cc7ad5fd04c080a81de1b857537f392ee88dbb
X-Git-Newrev: 250a9b7c0a2eca4c46c192d2b7167e847d84adfe
X-Patchwork-Hint: ignore
Message-Id: <20240827162752.0DC1886506@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/enscript: fix gcc 14.x compile
 issue
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

commit: https://git.buildroot.net/buildroot/commit/?id=250a9b7c0a2eca4c46c192d2b7167e847d84adfe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

 http://autobuild.buildroot.org/results/eb5/eb53b42db0d4bcaf574380d5a89a096cc4ce4b14

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ompatible-implicit-declaration-of-built-i.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/enscript/0001-Solving-incompatible-implicit-declaration-of-built-i.patch b/package/enscript/0001-Solving-incompatible-implicit-declaration-of-built-i.patch
new file mode 100644
index 0000000000..ae950c331a
--- /dev/null
+++ b/package/enscript/0001-Solving-incompatible-implicit-declaration-of-built-i.patch
@@ -0,0 +1,29 @@
+From 300ecf85a8fe166a39f9dd818945c7b8a970db39 Mon Sep 17 00:00:00 2001
+From: Wim Stockman <wim@thinkerwim.org>
+Date: Mon, 12 Feb 2024 22:52:50 +0100
+Subject: [PATCH] Solving incompatible implicit declaration of built-in
+ function 'strlen'
+
+Signed-off-by: Wim Stockman <wim@thinkerwim.org>
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://git.savannah.gnu.org/cgit/enscript.git/commit/?id=300ecf85a8fe166a39f9dd818945c7b8a970db39
+---
+ compat/getopt.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/compat/getopt.c b/compat/getopt.c
+index 752f28a..19f50e1 100644
+--- a/compat/getopt.c
++++ b/compat/getopt.c
+@@ -34,6 +34,8 @@
+ #include <config.h>
+ #endif
+ 
++#include <string.h>
++
+ #if !defined (__STDC__) || !__STDC__
+ /* This is a separate conditional since some stdc systems
+    reject `defined (const)'.  */
+-- 
+2.39.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
