Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F2A6EB64DA
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 10:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C61A961451;
	Fri, 14 Jul 2023 10:27:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C61A961451
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vq6_s5JhVlBC; Fri, 14 Jul 2023 10:27:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10FB961426;
	Fri, 14 Jul 2023 10:27:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10FB961426
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 98C4E1BF313
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 803B2417C4
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:27:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 803B2417C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V5DPJ897QPfj for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 10:27:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2CAA4173B
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 10:27:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2CAA4173B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 935908708D; Fri, 14 Jul 2023 10:27:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 14 Jul 2023 12:27:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ad276d94a392fb13244e042851a44269e6254d61
X-Git-Newrev: e738ea3ebd6d1024b71f4f0ad5b8e63cccc0b37c
X-Patchwork-Hint: ignore
Message-Id: <20230714102745.935908708D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nfs-utils: fix static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=e738ea3ebd6d1024b71f4f0ad5b8e63cccc0b37c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/f17/f17a554c86f0b24327b49fdc75612cc133f129ed/

f9dc4bab9f4576eed3a22ca7517bfc88d9812c34 bumped nfs-utils to version
2.6.3 which includes the addition of the two files patched here.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...xport-guard-dlfcn.h-include-with-HAVE_DLF.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/package/nfs-utils/0002-support-reexport-guard-dlfcn.h-include-with-HAVE_DLF.patch b/package/nfs-utils/0002-support-reexport-guard-dlfcn.h-include-with-HAVE_DLF.patch
new file mode 100644
index 0000000000..6612847be7
--- /dev/null
+++ b/package/nfs-utils/0002-support-reexport-guard-dlfcn.h-include-with-HAVE_DLF.patch
@@ -0,0 +1,44 @@
+From 274e4d212c30183242e48b639889865819f3ac33 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 11 Jun 2023 08:57:11 +0200
+Subject: [PATCH] support/reexport: guard dlfcn.h include with HAVE_DLFCN_H
+
+Upstream: http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commitdiff;h=8125c6f4ad156a9bad0dc2cc42e0243380fc478d
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
