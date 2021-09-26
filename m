Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D89FEC433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:53:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A84460F9E
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A84460F9E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7915881AEF;
	Sun, 26 Sep 2021 19:53:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TqVcdYA82bTB; Sun, 26 Sep 2021 19:53:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4C7C81B6D;
	Sun, 26 Sep 2021 19:53:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6E9171BF97A
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5877481B71
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:52:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s5H8TkLZP_Ga for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 19:52:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99FB281B6D
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 19:52:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2E83F8D25B; Sun, 26 Sep 2021 19:50:18 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 21:29:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2d8e45289531fda33d1a157dffc60b758d6a8377
X-Git-Newrev: 0a9a26b3c231221dffabb4a00365f229c9440b0c
X-Patchwork-Hint: ignore
Message-Id: <20210926195018.2E83F8D25B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-screensaver-rsxs: fix build
 with gcc11
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

commit: https://git.buildroot.net/buildroot/commit/?id=0a9a26b3c231221dffabb4a00365f229c9440b0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-impSurface.h-fix-build-with-gcc11.patch   | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/kodi-screensaver-rsxs/0001-impSurface.h-fix-build-with-gcc11.patch b/package/kodi-screensaver-rsxs/0001-impSurface.h-fix-build-with-gcc11.patch
new file mode 100644
index 0000000000..9080731918
--- /dev/null
+++ b/package/kodi-screensaver-rsxs/0001-impSurface.h-fix-build-with-gcc11.patch
@@ -0,0 +1,29 @@
+From fb23e136f88a94aa497e8eb4369bb06435c2aaf8 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 26 Sep 2021 15:59:29 +0200
+Subject: [PATCH] impSurface.h: fix build with gcc11
+
+lib/Implicit/impSurface.h:44:9: error: 'size_t' does not name a type
+   44 |         size_t vertex_data_size;
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+Upstream status: https://github.com/xbmc/screensavers.rsxs/pull/52
+---
+ lib/Implicit/impSurface.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/Implicit/impSurface.h b/lib/Implicit/impSurface.h
+index 388701aa..3319820e 100644
+--- a/lib/Implicit/impSurface.h
++++ b/lib/Implicit/impSurface.h
+@@ -21,6 +21,7 @@
+ #ifndef IMPSURFACE_H
+ #define IMPSURFACE_H
+ 
++#include <cstddef>
+ #include <functional>
+ 
+ #ifdef WIN32
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
