Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9396CC05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 23:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19ED241741;
	Wed,  8 Feb 2023 23:07:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19ED241741
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yOlpnq9-tNpZ; Wed,  8 Feb 2023 23:07:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 007354109F;
	Wed,  8 Feb 2023 23:07:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 007354109F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 139181BF8A8
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 23:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1617820C2
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 23:07:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1617820C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h3pMUX3PZdZi for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 23:07:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEFF1820E6
Received: from smtpdh19-2.aruba.it (smtpdh19-2.aruba.it [62.149.155.149])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DEFF1820E6
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 23:07:24 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.151])
 by Aruba Outgoing Smtp  with ESMTPSA
 id PtX7pysl2niHoPtX8pTp8P; Thu, 09 Feb 2023 00:07:22 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu,  9 Feb 2023 00:07:20 +0100
Message-Id: <20230208230721.3269610-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230208230721.3269610-1-giulio.benetti@benettiengineering.com>
References: <20230208230721.3269610-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfIRFQOlkk/yCs7FD9zHu8vxTS9b5oBfZHGy0azkCJP0CvnMrpAIl25pV8iSbRADF8o7zMJWOW6p7jXmwniJDLuBNWwshYaxXOhP/YYvyXl83ukaB9rw7
 5K4r0GxNv1qDUPwH+di0Mdwnin1TtHYC7JZVXlk4JXa2ZdIntS7ALXqfOMZ3SvyXDC2Fn6QNQ/gGVLgWFWKxWWGhq+whV85rmkpAS0owxFSr0a9JXXinU4PO
 qj4mghoRKmWdeebru3WPRf3zbwVdItugl3PcAVwSmofMksIo+ofmOcGjpEo+69qEhfxBRG4Rf9+twMC9GUIjg7O4tMwEgrLQfowRcYHEtYE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1675897642; bh=JSPX6jc3JDuflsZ3oxfzYB3K5YzqGDijbkXOWvoNbRk=;
 h=From:To:Subject:Date:MIME-Version;
 b=JBv1bahSUZ09eX3Z+XFTilH/kCekmHton9E2OCO+8/ZmixEl01dztnZuDu384jaof
 pa303MVYGn2gxV+7nuSLsJX0lcL39Fq/NSYHucTY4dDYDOIZxWImHbSuazDNApgmpE
 t4WToPbECC4kc8xIW/xSbSN3VPefcfyV+EkehzAS1xAc1Qj3Aebcq/eRSyUvy5a5bS
 j+jQQG2xaoBv0tKcNrXrShSWygX6vfhjuqCv1LaI9Ly80jk3eFLcMUBhmMGOhlixxM
 KrSlFolPPTXmme43Fd2nPwvi0JZCpThN0lNBsB+hZrLRol5MF8RcOQTuRTYr0OQPdD
 /z08gxLI9K+qQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=JBv1bahS
Subject: [Buildroot] [PATCH 1/2] package/libgtk3: fix build failure on
 libinput due to the presence of atk-bridge-2.0 in gtk+-3.0.pc
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Patch 0001-disable-atk-bridge.patch misses to remove:
atk_pkgs += ['atk-bridge-2.0']
that is not affected by any meson variable, this results in having libgtk3
to have atk-bridge-2.0 in its gtk+-3.0.pc and so other libraries(i.e.
libinput) tries to {pkgconf}find it failing. So let's convert the patch to
git format and add the removal of such line.

Fixes:
still not found

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...h => 0001-Remove-atk-bridge-support.patch} | 31 +++++++++++++++++--
 1 file changed, 28 insertions(+), 3 deletions(-)
 rename package/libgtk3/{0001-disable-atk-bridge.patch => 0001-Remove-atk-bridge-support.patch} (59%)

diff --git a/package/libgtk3/0001-disable-atk-bridge.patch b/package/libgtk3/0001-Remove-atk-bridge-support.patch
similarity index 59%
rename from package/libgtk3/0001-disable-atk-bridge.patch
rename to package/libgtk3/0001-Remove-atk-bridge-support.patch
index f3e9bff2ba..b52c9be650 100644
--- a/package/libgtk3/0001-disable-atk-bridge.patch
+++ b/package/libgtk3/0001-Remove-atk-bridge-support.patch
@@ -1,16 +1,27 @@
-Remove atk-bridge support.
+From 923ba2a1653b942093e9d25f8f4d2e7c09a66328 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 8 Feb 2023 23:50:56 +0100
+Subject: [PATCH] Remove atk-bridge support.
 
 atk-bridge doesn't seem useful for now in Buildroot and requires to
 add two new packages just for it: at-spi2-core and at-spi2-atk.
 
 Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
+[Giulio: remove 'atk-bridge-2.0' too]
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ gtk/a11y/gtkaccessibility.c | 8 --------
+ meson.build                 | 4 +---
+ 2 files changed, 1 insertion(+), 11 deletions(-)
 
+diff --git a/gtk/a11y/gtkaccessibility.c b/gtk/a11y/gtkaccessibility.c
+index 7f0e5207d9..14da1e80e2 100644
 --- a/gtk/a11y/gtkaccessibility.c
 +++ b/gtk/a11y/gtkaccessibility.c
 @@ -37,10 +37,6 @@
  #include <gtk/gtktogglebutton.h>
  #include <gtk/gtkaccessible.h>
-
+ 
 -#ifdef GDK_WINDOWING_X11
 -#include <atk-bridge.h>
 -#endif
@@ -21,13 +32,15 @@ Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
 @@ -988,9 +984,5 @@ _gtk_accessibility_init (void)
    _gtk_accessibility_override_atk_util ();
    do_window_event_initialization ();
-
+ 
 -#ifdef GDK_WINDOWING_X11
 -  atk_bridge_adaptor_init (NULL, NULL);
 -#endif
 -
    atk_misc_instance = g_object_new (GTK_TYPE_MISC_IMPL, NULL);
  }
+diff --git a/meson.build b/meson.build
+index aed48fc3f6..370bf1cce1 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -564,7 +564,7 @@ if x11_enabled
@@ -39,3 +52,15 @@ Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
  
    backend_immodules += ['xim']
  
+@@ -583,8 +583,6 @@ if x11_enabled
+     x11_pkgs += ['xdamage']
+   endif
+ 
+-  atk_pkgs += ['atk-bridge-2.0']
+-
+   cdata.set('HAVE_XDAMAGE', xdamage_dep.found() ? 1 : false)
+   cdata.set('HAVE_XCURSOR', xcursor_dep.found() ? 1 : false)
+   cdata.set('HAVE_XCOMPOSITE', xcomposite_dep.found() ? 1 : false)
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
