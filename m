Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCEE2C77B7C
	for <buildroot@archiver.kernel.org>; Sun, 21 May 2023 20:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16BF4417A9;
	Sun, 21 May 2023 20:26:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16BF4417A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HzoGgrf5xy0p; Sun, 21 May 2023 20:26:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D64DF41770;
	Sun, 21 May 2023 20:26:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D64DF41770
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 486231BF3CB
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 20:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E5794046A
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 20:26:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E5794046A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cORdc3ulGy6F for <buildroot@lists.busybox.net>;
 Sun, 21 May 2023 20:26:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 380AA40148
 for <buildroot@buildroot.org>; Sun, 21 May 2023 20:26:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 380AA40148
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21057867AA; Sun, 21 May 2023 20:26:24 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 21 May 2023 22:24:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 62b64c56b8714e159d9f4812fb05e6442d2837f2
X-Git-Newrev: 735354d58726875109fb73a669565b4e4dd3e858
X-Patchwork-Hint: ignore
Message-Id: <20230521202624.21057867AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-pvr-vbox: needs tinyxml2
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

commit: https://git.buildroot.net/buildroot/commit/?id=735354d58726875109fb73a669565b4e4dd3e858
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream added the tinyxml2 dependency in the Nexus bump:
https://github.com/kodi-pvr/pvr.vbox/commit/99ae08a5fd10771773b9d35c180674c8c8cb3e9d

Buildroot commit 7f3762ae1579 (package/kodi-pvr-*: mass version bump to
Nexus) forgot to add this dependency causing a configure error.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/kodi-pvr-vbox/Config.in        | 1 +
 package/kodi-pvr-vbox/kodi-pvr-vbox.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/kodi-pvr-vbox/Config.in b/package/kodi-pvr-vbox/Config.in
index 202e3c66e8..590877e1d7 100644
--- a/package/kodi-pvr-vbox/Config.in
+++ b/package/kodi-pvr-vbox/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_KODI_PVR_VBOX
 	bool "kodi-pvr-vbox"
+	select BR2_PACKAGE_TINYXML2
 	help
 	  Kodi PVR addon for interfacing with VBox Communications XTi TV
 	  Gateway
diff --git a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
index 60a8a819b0..e5e86274fc 100644
--- a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
+++ b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
@@ -8,6 +8,6 @@ KODI_PVR_VBOX_VERSION = 20.4.2-Nexus
 KODI_PVR_VBOX_SITE = $(call github,kodi-pvr,pvr.vbox,$(KODI_PVR_VBOX_VERSION))
 KODI_PVR_VBOX_LICENSE = GPL-2.0+
 KODI_PVR_VBOX_LICENSE_FILES = LICENSE.md
-KODI_PVR_VBOX_DEPENDENCIES = kodi
+KODI_PVR_VBOX_DEPENDENCIES = kodi tinyxml2
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
