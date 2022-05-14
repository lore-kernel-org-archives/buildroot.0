Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CF1C433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 17:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01F758132D;
	Sat, 14 May 2022 17:59:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WQPLXUi8vqJA; Sat, 14 May 2022 17:59:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE7B7827FD;
	Sat, 14 May 2022 17:59:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A5BC71BF3DE
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 17:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7986B4090E
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 17:56:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RX4jgzuzfd6U for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 17:56:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9123E408DB
 for <buildroot@buildroot.org>; Sat, 14 May 2022 17:56:21 +0000 (UTC)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout09.t-online.de (Postfix) with SMTP id 6BCF6D88A;
 Sat, 14 May 2022 19:56:16 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.4.164]) by fwd79.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1npvzy-2ZkJXy0; Sat, 14 May 2022 19:56:14 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:41714)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1npvzx-0005N1-5e;
 Sat, 14 May 2022 19:56:13 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 19:55:58 +0200
Message-Id: <20220514175612.2510884-5-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220514175612.2510884-1-bernd.kuhls@t-online.de>
References: <20220514175612.2510884-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1652550974-00010BFA-45B7399F/0/0 CLEAN NORMAL
X-TOI-MSGID: d4eef387-ac09-4c91-bf82-200fe6604b0d
Subject: [Buildroot] [PATCH 05/19] package/x11r7/xdriver_xf86-video-ati: fix
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
Cc: Gary Bisson <bisson.gary@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/ccc/ccc36c8cd3530153316190f378847081cb5c1c58/
http://autobuild.buildroot.net/results/bef/bef85a6a09bdd1d1a5035ee7baac1f2d2e7e1a2e/
http://autobuild.buildroot.net/results/7d6/7d65c8085a1ae122da4acc296538f2277b3ec15e/
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...dri-h-with-older-versions-of-xserver.patch | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/x11r7/xdriver_xf86-video-ati/0004-Only-include-dri-h-with-older-versions-of-xserver.patch

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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
