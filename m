Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19944C433F5
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 20:30:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B32861181
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 20:30:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6B32861181
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D6ED608C5;
	Tue,  9 Nov 2021 20:30:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Ie2QQ1rZLVm; Tue,  9 Nov 2021 20:30:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9ED6E6086F;
	Tue,  9 Nov 2021 20:30:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1CB631BF3B5
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 20:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BEFB401C4
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 20:30:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tUHNkWhppWfX for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 20:30:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D2C8840018
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 20:30:42 +0000 (UTC)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
 by mailout02.t-online.de (Postfix) with SMTP id EC1DF15FE;
 Tue,  9 Nov 2021 21:29:22 +0100 (CET)
Received: from fli4l.lan.fli4l ([91.58.5.80]) by fwd88.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mkXk9-0PmCFV0; Tue, 9 Nov 2021 21:29:22 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:50348)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mkXk9-0001Mn-Bw;
 Tue, 09 Nov 2021 21:29:21 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue,  9 Nov 2021 21:29:20 +0100
Message-Id: <20211109202921.2031664-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1636489762-00001485-8FB2245D/0/0 CLEAN NORMAL
X-TOI-MSGID: 62aa554c-fd38-4568-93a0-d2d952e5c65f
Subject: [Buildroot] [PATCH 1/2] package/glmark2: drm-glesv2 needs libdrm
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
Cc: Spenser Gilliland <spenser@gillilanding.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/58a/58a498fac83cbb55b252ab54cd8db04570bb5ec9/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
re-sent deferred patch
http://patchwork.ozlabs.org/project/buildroot/patch/20200104193919.91589-1-bernd.kuhls@t-online.de/

 package/glmark2/Config.in  | 3 +++
 package/glmark2/glmark2.mk | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/glmark2/Config.in b/package/glmark2/Config.in
index 40d0adcc8a..96b34f971a 100644
--- a/package/glmark2/Config.in
+++ b/package/glmark2/Config.in
@@ -7,7 +7,10 @@ config BR2_PACKAGE_GLMARK2_FLAVOR_DRM_GLESV2
 	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_PACKAGE_HAS_LIBGLES
 	depends on BR2_PACKAGE_HAS_UDEV
+	# libpthread-stubs -> libdrm
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_GLMARK2_FLAVOR_ANY
+	select BR2_PACKAGE_LIBDRM
 
 config BR2_PACKAGE_GLMARK2_FLAVOR_DRM_GL
 	bool
diff --git a/package/glmark2/glmark2.mk b/package/glmark2/glmark2.mk
index 5c2dd06362..5ad3ea2cb4 100644
--- a/package/glmark2/glmark2.mk
+++ b/package/glmark2/glmark2.mk
@@ -11,7 +11,7 @@ GLMARK2_LICENSE_FILES = COPYING COPYING.SGI
 GLMARK2_DEPENDENCIES = host-pkgconf jpeg libegl libpng
 
 ifeq ($(BR2_PACKAGE_GLMARK2_FLAVOR_DRM_GLESV2),y)
-GLMARK2_DEPENDENCIES += libgles udev
+GLMARK2_DEPENDENCIES += libdrm libgles udev
 GLMARK2_FLAVORS += drm-glesv2
 endif
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
