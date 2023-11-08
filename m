Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9EAC4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 07:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 877BA40948;
	Wed,  8 Nov 2023 07:23:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 877BA40948
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fWSY9zps4IiH; Wed,  8 Nov 2023 07:23:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B2C040734;
	Wed,  8 Nov 2023 07:23:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B2C040734
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8FD3F1BF487
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 07:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 652EB408BC
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 07:23:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 652EB408BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XGi3l9brlAwL for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 07:23:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53DA040734
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 07:23:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53DA040734
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3FE1786C67; Wed,  8 Nov 2023 07:23:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Nov 2023 08:21:39 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: fb42a4bb79b282f34669fd2da3c6b9d42a255f4f
X-Git-Newrev: 588e9a6e87ca3479c5648765693658f3051aa295
X-Patchwork-Hint: ignore
Message-Id: <20231108072308.3FE1786C67@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/conmon: fix
 static build
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=588e9a6e87ca3479c5648765693658f3051aa295
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Fix the following static build failure raised since commit
8144dd1b4cca2d5c89e329b0497f49f512c9caed which fixed dynamic build but
broke static build:

src/seccomp_notify.c:10:10: fatal error: dlfcn.h: No such file or directory
   10 | #include <dlfcn.h>
      |          ^~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/71b4f35b3150183c7b44bc3897f01b0019e10ebe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5e10a0678196a708eeb99b4a87006798bfab1572)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...001-src-seccomp_notify.c-fix-static-build.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/package/conmon/0001-src-seccomp_notify.c-fix-static-build.patch b/package/conmon/0001-src-seccomp_notify.c-fix-static-build.patch
new file mode 100644
index 0000000000..afffa909c8
--- /dev/null
+++ b/package/conmon/0001-src-seccomp_notify.c-fix-static-build.patch
@@ -0,0 +1,44 @@
+From 6cfcea9a16017f2a49cd792d39ebd9c86395946a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 1 Nov 2023 16:45:21 +0100
+Subject: [PATCH] src/seccomp_notify.c: fix static build
+
+Fix the following static build failure raised even when seccomp is
+disabled:
+
+src/seccomp_notify.c:10:10: fatal error: dlfcn.h: No such file or directory
+   10 | #include <dlfcn.h>
+      |          ^~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/71b4f35b3150183c7b44bc3897f01b0019e10ebe
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/containers/conmon/issues/462
+---
+ src/seccomp_notify.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/seccomp_notify.c b/src/seccomp_notify.c
+index 8d34d9d..bf738ea 100644
+--- a/src/seccomp_notify.c
++++ b/src/seccomp_notify.c
+@@ -7,7 +7,6 @@
+ 
+ #include <errno.h>
+ #include <sys/ioctl.h>
+-#include <dlfcn.h>
+ #include <sys/wait.h>
+ #include <sys/mount.h>
+ #include <signal.h>
+@@ -19,6 +18,7 @@
+ 
+ #ifdef USE_SECCOMP
+ 
++#include <dlfcn.h>
+ #include <sys/sysmacros.h>
+ #include <linux/seccomp.h>
+ #include <seccomp.h>
+-- 
+2.42.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
