Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F10C433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Dec 2021 21:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D59960EE0;
	Tue,  7 Dec 2021 21:41:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3WTQ1N_gHqbF; Tue,  7 Dec 2021 21:41:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CECDD60EDB;
	Tue,  7 Dec 2021 21:41:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D00361BF470
 for <buildroot@lists.busybox.net>; Tue,  7 Dec 2021 21:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CBC7341CA3
 for <buildroot@lists.busybox.net>; Tue,  7 Dec 2021 21:41:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NOQyxD1bxwYF for <buildroot@lists.busybox.net>;
 Tue,  7 Dec 2021 21:41:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A55CB41C93
 for <buildroot@buildroot.org>; Tue,  7 Dec 2021 21:41:34 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 c6-20020a05600c0ac600b0033c3aedd30aso457964wmr.5
 for <buildroot@buildroot.org>; Tue, 07 Dec 2021 13:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A+qwmKxeYrLQg71hdGvuFhD5bQJJ1ihpOSQz33BRqM4=;
 b=BKnpgSyupFZc70MvLTBxaWdLCde9DoBGxIigK818Ha5ikSNQKAqpbo1R0JxGdwT8vJ
 v5ocbUYVi18quf89unLeNG+34QFmykc4lwfmWGWVVUPZDOGDFFulGmTKNAkkRU8bQBu1
 PnA4CijnlvmvZADx1HQkmLmSMjY0Hxdsy+WKNz3ReeuFKDstLurSrXhDmQG+hjJlSg4Z
 UAgR81ykMjTR+gh3QoeYN1p8+6RvJJI/SMJcTaZeDknF7p2FBGya1GamAuJBN7ArXNWo
 aENr+252gbKKOFmHtL/8apc2eaHr9jQCCiyUI7z9GjeMtbSRJ4AEIRjy6T+BS4lB0KoY
 hd7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A+qwmKxeYrLQg71hdGvuFhD5bQJJ1ihpOSQz33BRqM4=;
 b=TdhG11jnZMNJFq9EAzHihd3grHFXkzvZGfqAdisbNUqDZz3uZdayO+CgonPHi1Do/q
 +Szrea8xToCJIG6uMV977GIBPyw/bMEw+/zbWfCzOLwdxAmtLBKOxmIIKvF6XWX1Wlll
 OWfi1eZMF7VP1JYrsroJ7zA7D3vMpltCSqJMG/Pjb2U2PdY43bH1yV5IwE5vGxOucBKG
 wwcvOlabGGn49W6+ZCl8UrWoSuXMvwAwPKQ5tCc0wAA3r9qb+KxsQw2v9IUHwJJhFX+U
 +XVnL6dch6bQnQgUwZB3+kfC+smjtnkvTx+ioTB3G4pzhkZM9RUkJzQc4NTZJw2OVGa5
 6S+g==
X-Gm-Message-State: AOAM532CKP4L3r5ueLNNF37zlsDctI6/c87obT0NKXp46cz72gZzb290
 YyhrfWuyjeFjTRnUL8Urjjk8PIB35pn3Nw==
X-Google-Smtp-Source: ABdhPJyBgPBQ0+zzDcDB+TUJr3L80pcnV1+Fkb6g2lj0ezWg/jW4oVP2hya0rSIx9eA2R7ufsPjNzw==
X-Received: by 2002:a7b:cbd1:: with SMTP id n17mr10485595wmi.145.1638913292318; 
 Tue, 07 Dec 2021 13:41:32 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id i7sm864030wro.58.2021.12.07.13.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 13:41:31 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  7 Dec 2021 22:41:22 +0100
Message-Id: <20211207214122.3307980-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-trident:
 fix build
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of xserver_xorg-server
to version 21.1.1 in commit d9185c6ba38430a017ed996c4180e141881ba570:

In file included from trident_bank.c:37:
trident.h:41:10: fatal error: xf86RamDac.h: No such file or directory
   41 | #include "xf86RamDac.h"
      |          ^~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/c81ac8075af257e8626d9d097270be7a7b4a1496

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-Remove-ramdac.patch                  | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/x11r7/xdriver_xf86-video-trident/0001-Remove-ramdac.patch

diff --git a/package/x11r7/xdriver_xf86-video-trident/0001-Remove-ramdac.patch b/package/x11r7/xdriver_xf86-video-trident/0001-Remove-ramdac.patch
new file mode 100644
index 0000000000..38ca9afebf
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-trident/0001-Remove-ramdac.patch
@@ -0,0 +1,56 @@
+From 07a5c4732f1c28ffcb873ee04500e3cb813c50b4 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 7 Dec 2021 22:28:04 +0100
+Subject: [PATCH] Remove ramdac
+
+ramdac drivers have been removed from xserver since version 21.0.99.1
+and
+https://gitlab.freedesktop.org/xorg/xserver/-/commit/f0385fb420158ac3bc1c4c325431ffc5c62344bb
+resulting in the following build failure:
+
+In file included from trident_bank.c:37:
+trident.h:41:10: fatal error: xf86RamDac.h: No such file or directory
+   41 | #include "xf86RamDac.h"
+      |          ^~~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/c81ac8075af257e8626d9d097270be7a7b4a1496
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/xorg/driver/xf86-video-trident/-/merge_requests/1]
+---
+ src/trident.h | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/src/trident.h b/src/trident.h
+index 5cadf52..c82de4c 100644
+--- a/src/trident.h
++++ b/src/trident.h
+@@ -38,7 +38,6 @@
+ #include "xaa.h"
+ #endif
+ #include "xf86fbman.h"
+-#include "xf86RamDac.h"
+ #include "compiler.h"
+ #include "vgaHW.h"
+ #include "xf86i2c.h"
+@@ -103,7 +102,6 @@ typedef struct {
+     int			useEXA;
+     int			Chipset;
+     int			DACtype;
+-    int			RamDac;
+     int                 ChipRev;
+     int			HwBpp;
+     int			BppShift;
+@@ -169,7 +167,6 @@ typedef struct {
+     CARD32		BltScanDirection;
+     CARD32		DrawFlag;
+     CARD16		LinePattern;
+-    RamDacRecPtr	RamDacRec;
+     int			CursorOffset;
+     xf86CursorInfoPtr	CursorInfoRec;
+     xf86Int10InfoPtr	Int10;
+-- 
+2.33.0
+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
