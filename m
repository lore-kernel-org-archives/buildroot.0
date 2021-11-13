Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40FEDC433EF
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 09:30:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCA9F60F44
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 09:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DCA9F60F44
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69EB3823AA;
	Sat, 13 Nov 2021 09:30:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lB80Oe8YNYxY; Sat, 13 Nov 2021 09:30:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AD5582419;
	Sat, 13 Nov 2021 09:30:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E321F1BF35E
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 09:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0B604059A
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 09:30:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HIbXdaWlwi0i for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 09:30:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D594C405FE
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 09:30:15 +0000 (UTC)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
 by mailout01.t-online.de (Postfix) with SMTP id B525C42E5
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 10:30:13 +0100 (CET)
Received: from fli4l.lan.fli4l ([91.58.5.80]) by fwd86.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mlpMQ-4VV75t0; Sat, 13 Nov 2021 10:30:10 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:57760)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mlpMP-0001Dq-Lh
 for buildroot@buildroot.org; Sat, 13 Nov 2021 10:30:09 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 10:30:07 +0100
Message-Id: <20211113093009.6915-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1636795810-00001467-3EE4DE92/0/0 CLEAN NORMAL
X-TOI-MSGID: e73fa141-947b-4e14-b8fa-379f90fa5558
Subject: [Buildroot] [PATCH v2 1/3] package/glmark2: drm-glesv2 needs libdrm
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

Fixes:
http://autobuild.buildroot.net/results/58a/58a498fac83cbb55b252ab54cd8db04570bb5ec9/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: moved libdrm select to main symbol (Yann)

 package/glmark2/Config.in  | 3 +++
 package/glmark2/glmark2.mk | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/glmark2/Config.in b/package/glmark2/Config.in
index 40d0adcc8a..3ef3a0e8e3 100644
--- a/package/glmark2/Config.in
+++ b/package/glmark2/Config.in
@@ -7,6 +7,8 @@ config BR2_PACKAGE_GLMARK2_FLAVOR_DRM_GLESV2
 	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_PACKAGE_HAS_LIBGLES
 	depends on BR2_PACKAGE_HAS_UDEV
+	# libpthread-stubs -> libdrm
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_GLMARK2_FLAVOR_ANY
 
 config BR2_PACKAGE_GLMARK2_FLAVOR_DRM_GL
@@ -63,6 +65,7 @@ config BR2_PACKAGE_GLMARK2
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
 	depends on BR2_PACKAGE_GLMARK2_FLAVOR_ANY
 	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_GLMARK2_FLAVOR_DRM_GLESV2
 	select BR2_PACKAGE_LIBPNG
 	help
 	  glmark2 is an OpenGL 2.0 and ES 2.0 benchmark.
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
