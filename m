Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7865AC433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 09:30:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9770610CE
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 09:30:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C9770610CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94F2C823CB;
	Sat, 13 Nov 2021 09:30:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H3AIjKBnYzZh; Sat, 13 Nov 2021 09:30:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA51C823AA;
	Sat, 13 Nov 2021 09:30:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8EC1B1BF95C
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 09:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E3AD60723
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 09:30:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2kKeos8R37rL for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 09:30:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5971160685
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 09:30:15 +0000 (UTC)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
 by mailout03.t-online.de (Postfix) with SMTP id CA498186E
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 10:30:12 +0100 (CET)
Received: from fli4l.lan.fli4l ([91.58.5.80]) by fwd72.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mlpMQ-1qqOPJ0; Sat, 13 Nov 2021 10:30:10 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:57760)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mlpMP-0001Dq-SX
 for buildroot@buildroot.org; Sat, 13 Nov 2021 10:30:10 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 10:30:08 +0100
Message-Id: <20211113093009.6915-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211113093009.6915-1-bernd.kuhls@t-online.de>
References: <20211113093009.6915-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1636795810-00001454-1F4A6949/0/0 CLEAN NORMAL
X-TOI-MSGID: 75c21123-4d4b-4199-93ad-500d4df6b14f
Subject: [Buildroot] [PATCH v2 2/3] package/glmark2: drm-glesv2 needs libgbm
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes build error with defconfig from:
http://autobuild.buildroot.net/results/e393dbfba7c2989fe983df47ea0638c3ba62ae7a/

  Checking for 'libdrm': yes
  Checking for 'gbm'   : not found

after http://patchwork.ozlabs.org/project/buildroot/patch/20200104193919.91589-1-bernd.kuhls@t-online.de/
was applied. Both patches are needed to fix the build error.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: no changes

 package/glmark2/Config.in  | 1 +
 package/glmark2/glmark2.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/glmark2/Config.in b/package/glmark2/Config.in
index 3ef3a0e8e3..6761397d3f 100644
--- a/package/glmark2/Config.in
+++ b/package/glmark2/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_GLMARK2_FLAVOR_DRM_GLESV2
 	bool
 	default y
 	depends on BR2_PACKAGE_HAS_LIBEGL
+	depends on BR2_PACKAGE_HAS_LIBGBM
 	depends on BR2_PACKAGE_HAS_LIBGLES
 	depends on BR2_PACKAGE_HAS_UDEV
 	# libpthread-stubs -> libdrm
diff --git a/package/glmark2/glmark2.mk b/package/glmark2/glmark2.mk
index 5ad3ea2cb4..e8d6f71dad 100644
--- a/package/glmark2/glmark2.mk
+++ b/package/glmark2/glmark2.mk
@@ -11,7 +11,7 @@ GLMARK2_LICENSE_FILES = COPYING COPYING.SGI
 GLMARK2_DEPENDENCIES = host-pkgconf jpeg libegl libpng
 
 ifeq ($(BR2_PACKAGE_GLMARK2_FLAVOR_DRM_GLESV2),y)
-GLMARK2_DEPENDENCIES += libdrm libgles udev
+GLMARK2_DEPENDENCIES += libdrm libgbm libgles udev
 GLMARK2_FLAVORS += drm-glesv2
 endif
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
