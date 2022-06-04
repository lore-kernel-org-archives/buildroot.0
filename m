Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4121BC433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Jun 2022 19:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B676541A07;
	Sat,  4 Jun 2022 19:06:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QoI3Fbd3B_tR; Sat,  4 Jun 2022 19:06:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AE644198C;
	Sat,  4 Jun 2022 19:06:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 82B281BF3EF
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 19:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 717F660759
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 19:06:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NDDQ-pyQ5uoM for <buildroot@lists.busybox.net>;
 Sat,  4 Jun 2022 19:06:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90A856060A
 for <buildroot@buildroot.org>; Sat,  4 Jun 2022 19:06:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 5D63B86B80; Sat,  4 Jun 2022 18:54:58 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 4 Jun 2022 21:06:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cb91d2e60fd1a38d257b731e8d4b7bf067f141de
X-Git-Newrev: f5899f480b2df8f6608051b4e586a255151fe8c1
X-Patchwork-Hint: ignore
Message-Id: <20220604185458.5D63B86B80@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-ati: fix
 build with newer versions of xserver
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

commit: https://git.buildroot.net/buildroot/commit/?id=f5899f480b2df8f6608051b4e586a255151fe8c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/ccc/ccc36c8cd3530153316190f378847081cb5c1c58/
http://autobuild.buildroot.net/results/bef/bef85a6a09bdd1d1a5035ee7baac1f2d2e7e1a2e/
http://autobuild.buildroot.net/results/7d6/7d65c8085a1ae122da4acc296538f2277b3ec15e/
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...lude-dri-h-with-older-versions-of-xserver.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/x11r7/xdriver_xf86-video-ati/0004-Only-include-dri-h-with-older-versions-of-xserver.patch b/package/x11r7/xdriver_xf86-video-ati/0004-Only-include-dri-h-with-older-versions-of-xserver.patch
new file mode 100644
index 0000000000..a969d61913
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-ati/0004-Only-include-dri-h-with-older-versions-of-xserver.patch
@@ -0,0 +1,32 @@
+From 5eba006e4129e8015b822f9e1d2f1e613e252cda Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>
+Date: Tue, 2 Feb 2021 12:45:54 +0100
+Subject: [PATCH] Only include dri.h with older versions of xserver
+
+Not needed anymore with current versions.
+
+Downloaded from upstream commit
+https://gitlab.freedesktop.org/xorg/driver/xf86-video-ati/-/commit/5eba006e4129e8015b822f9e1d2f1e613e252cda
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/drmmode_display.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/drmmode_display.c b/src/drmmode_display.c
+index 3099a729..a58f24dd 100644
+--- a/src/drmmode_display.c
++++ b/src/drmmode_display.c
+@@ -45,7 +45,9 @@
+ #include "radeon_glamor.h"
+ #include "radeon_reg.h"
+ 
++#if XORG_VERSION_CURRENT < XORG_VERSION_NUMERIC(1,19,99,1,0)
+ #include <dri.h>
++#endif
+ 
+ #include "drmmode_display.h"
+ 
+-- 
+GitLab
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
