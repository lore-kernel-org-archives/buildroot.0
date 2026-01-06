Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73614D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 459BF413FA;
	Wed,  7 Jan 2026 18:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yRamkDAxy8M1; Wed,  7 Jan 2026 18:02:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 438A940D6D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808946;
	bh=FFpf+PAYOJ3xjnohyj/fCti7i1sYsa4bn6Ua3aWHNZg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rKkXZ8nFJXD0tcLWfMS1u5JeeD2lc9AZR4g046s3WBzr/AJLybHanuRZfRlyGqq6l
	 CklKgkAicS06TyISlidnEqojpjn5qcOv74xSx2+WK3/hJ1cH4RXoubSTKnbaLa6VFZ
	 pvqgc+ybDpgbpI30p/4MsyHjc0QTm/g9CY1EVWnikHP8ihQr34x9VTmFx/iiG25F0J
	 Olp6Or0E6CMVyNcnFz4+KPyWKhL+qHIF9WDOEmPd+5HwRx9OValCz/6lFmPGbi4Jg4
	 OrGf5TJPsAIBvOqYOdk5uqQ9wi+A95QnCMVqUL0OtPbWJd+JOXOcQktdPSB+3r8K9w
	 qtdcJhoWKktGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 438A940D6D;
	Wed,  7 Jan 2026 18:02:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DFFBA58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE20781124
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fsef7oZZ6D6a for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 247AF8107F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 247AF8107F
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2262C8268F; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:55:24 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: c7684b92f67509c82c884972e3fbf0604223985b
X-Git-Newrev: 934795b78d383863d7385c0a8c5c03e44e5733e2
X-Patchwork-Hint: ignore
Message-Id: <20260107180113.2262C8268F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/matchbox-panel:
 add patch fixing GCC 14.x build issue
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5156756727352472343=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5156756727352472343==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=934795b78d383863d7385c0a8c5c03e44e5733e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Fixes:

mb-applet-launcher.c: In function ‘get_launch_window’:
mb-applet-launcher.c:269:18: error: implicit declaration of function ‘time’ [-Wimplicit-function-declaration]
  269 |   time_t stime = time(NULL);
      |                  ^~~~

No autobuilder failures, it was hidden by other failures.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d5bb2902ec53070ac2db82f77f45f1e0fc3ab160)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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

--===============5156756727352472343==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5156756727352472343==--
