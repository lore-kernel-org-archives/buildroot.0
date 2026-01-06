Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64076D0D150
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B89781919;
	Wed,  7 Jan 2026 17:47:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A6BwGGO3dLhp; Wed,  7 Jan 2026 17:47:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3447580BA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808054;
	bh=SN0rQExEm8LZmbSF7gdsPxRMdlR9EXzx5QkznziH0cA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dw3Mww2m4ArlKOGv8u7cX/dQU3mMEj+7AvH3U8UatpBAURg+iUMqeq80PsHZo2Bt6
	 5cyW64ZhrySyoQNZ/iZxeIeqcr+8tJYxj6KAap7SLxGF3iA/gIVZ3lgV19yaP1g7I0
	 pwl5juktS3WXF7vSlQGJNKFx8+Dta1Ptj/TNTOR+h2ZJ8B9f4t5ROG9WOnVI05somy
	 ChSYtxYuPpgE+NbNuPmWJ41RYwQhVTk555mowZY5CW9Pqq+OBwpxsUj3v0DyIafrrs
	 Sq1oe/u71M0IKA6IEqyuTFsHQzzTQEk4M0F8HJttZkFu7HZWZjvDbfpIATKoKq0SIC
	 U7zog6iGC14eQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3447580BA7;
	Wed,  7 Jan 2026 17:47:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F279625B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D23060B5E
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dNBbrvhTgiMO for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B36F60A62
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B36F60A62
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2AB8986FC2; Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:17:57 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 17d34db2e691f604fde971c17e3585015734c40d
X-Git-Newrev: 6974ee98f508bcfa96fbb936894ee826c55f0a4d
X-Patchwork-Hint: ignore
Message-Id: <20260107174642.2AB8986FC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/matchbox-panel:
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
Content-Type: multipart/mixed; boundary="===============6702259044223756430=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6702259044223756430==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6974ee98f508bcfa96fbb936894ee826c55f0a4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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

--===============6702259044223756430==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6702259044223756430==--
