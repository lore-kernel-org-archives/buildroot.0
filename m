Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F70DE92724
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 23:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E967B406C4;
	Sat, 27 Dec 2025 23:40:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6r8tLuHRd0Hh; Sat, 27 Dec 2025 23:40:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07FB2406D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766878807;
	bh=Z/BkOqF4JCB0VHBrOCVi/NiA4BNIMYL7FIN3exNkYMw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KiXmc8vtSDTykt21vK9+6NaHC7dnMbEBfTqy+qSvxu6gNKqrTcyaQovh7vxz1zFaV
	 AxDG2patEWi0vw1hn+GsZaZHNWe4WzDjeSYn04SwLxkzpmaPNScrosJeKc+QNmd2Tc
	 whq6DCT7IUv17uQeNQG3xhxbIHmG+GrNDQoHI/QRvqcZMd6oC4Ye9s+lV6Sr0/rjkb
	 6ncC2rhEGOOJLnJ5cmV1ogA9NJ/pihtXEEteSbCOzS3SezPZTHf+13pbSKx0LXfRii
	 Au+thGKMx1Q43Di1IsXPOV+h7oi2t/HZ6Bb1RO41cip4ajMzX6FtS5DzuEGz6njQr5
	 YFB7xPNxR/BQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07FB2406D4;
	Sat, 27 Dec 2025 23:40:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B562119
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EBF540689
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:39:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oY0VPJyVGOO3 for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 23:39:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 642F5406A1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 642F5406A1
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:39:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 42676878FE; Sat, 27 Dec 2025 23:39:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 00:15:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e235a191dd8bd6d5bdb9434352deae86953cfa49
X-Git-Newrev: d5bb2902ec53070ac2db82f77f45f1e0fc3ab160
X-Patchwork-Hint: ignore
Message-Id: <20251227233954.42676878FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/matchbox-panel: add patch fixing
 GCC 14.x build issue
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
Content-Type: multipart/mixed; boundary="===============7100609003129853948=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7100609003129853948==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d5bb2902ec53070ac2db82f77f45f1e0fc3ab160
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

mb-applet-launcher.c: In function ‘get_launch_window’:
mb-applet-launcher.c:269:18: error: implicit declaration of function ‘time’ [-Wimplicit-function-declaration]
  269 |   time_t stime = time(NULL);
      |                  ^~~~

No autobuilder failures, it was hidden by other failures.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...s-mb-applet-launcher.c-add-missing-time.h.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/matchbox-panel/0005-applets-mb-applet-launcher.c-add-missing-time.h.patch b/package/matchbox-panel/0005-applets-mb-applet-launcher.c-add-missing-time.h.patch
new file mode 100644
index 0000000000..999394157d
--- /dev/null
+++ b/package/matchbox-panel/0005-applets-mb-applet-launcher.c-add-missing-time.h.patch
@@ -0,0 +1,36 @@
+From 7608e4f755b1fb3a99c387c58f79b0c4b6aadfbe Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sat, 27 Dec 2025 23:53:23 +0100
+Subject: [PATCH] applets/mb-applet-launcher.c: add missing <time.h>
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+
+mb-applet-launcher.c: In function ‘get_launch_window’:
+mb-applet-launcher.c:269:18: error: implicit declaration of function ‘time’ [-Wimplicit-function-declaration]
+  269 |   time_t stime = time(NULL);
+      |                  ^~~~
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream: N/A, dead
+---
+ applets/mb-applet-launcher.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/applets/mb-applet-launcher.c b/applets/mb-applet-launcher.c
+index 08a6a10..f7685de 100644
+--- a/applets/mb-applet-launcher.c
++++ b/applets/mb-applet-launcher.c
+@@ -26,6 +26,7 @@
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <signal.h>
++#include <time.h>
+ 
+ #ifdef USE_LIBSN
+ #define SN_API_NOT_YET_FROZEN 1
+-- 
+2.52.0
+

--===============7100609003129853948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7100609003129853948==--
