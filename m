Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C77DC433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 09:30:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF86F60F44
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 09:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BF86F60F44
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5795340212;
	Sat, 13 Nov 2021 09:30:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4ep7Lq02dY9k; Sat, 13 Nov 2021 09:30:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 921264015C;
	Sat, 13 Nov 2021 09:30:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 68E511BF35E
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 09:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6501F40628
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 09:30:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RE5rDAHk25Dw for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 09:30:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C6CD74059A
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 09:30:14 +0000 (UTC)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout03.t-online.de (Postfix) with SMTP id 372BF186A
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 10:30:11 +0100 (CET)
Received: from fli4l.lan.fli4l ([91.58.5.80]) by fwd79.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mlpMQ-0xvYpt0; Sat, 13 Nov 2021 10:30:10 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:57760)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mlpMQ-0001Dq-2Z
 for buildroot@buildroot.org; Sat, 13 Nov 2021 10:30:10 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 10:30:09 +0100
Message-Id: <20211113093009.6915-3-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211113093009.6915-1-bernd.kuhls@t-online.de>
References: <20211113093009.6915-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1636795810-0000146E-B30AB6E7/0/0 CLEAN NORMAL
X-TOI-MSGID: 555c14ed-e943-4eed-baec-77f85f0e9608
Subject: [Buildroot] [PATCH 3/3] package/glmark2: fix selection of
 dependencies
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

Commit 9c068b4be8 (package/glmark2: fix wayland build) extended the set
of required libraries for various "flavor" options by selecting those
libraries from the blind options.

However, that option is true as soon as the requirements are met (the
depends on), even when glmark2 itself is not enabled.

This means that extra libraries are pulled in to the build, even when
not required.

We fix that by moving the actual selects to the main symbol, along with
the proper conditions. This means that we have two lines that select
wayland-protocols, under two different conditions; we could make that a
single select, but the codition would need to be on two lines anyway,
so meh...

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
Requested by Yann:
http://lists.busybox.net/pipermail/buildroot/2021-November/628389.html

 package/glmark2/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glmark2/Config.in b/package/glmark2/Config.in
index 6761397d3f..5897ccb3ff 100644
--- a/package/glmark2/Config.in
+++ b/package/glmark2/Config.in
@@ -27,7 +27,6 @@ config BR2_PACKAGE_GLMARK2_FLAVOR_WAYLAND_GLESV2
 	depends on BR2_PACKAGE_HAS_LIBGLES
 	depends on BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_GLMARK2_FLAVOR_ANY
-	select BR2_PACKAGE_WAYLAND_PROTOCOLS
 
 config BR2_PACKAGE_GLMARK2_FLAVOR_WAYLAND_GL
 	bool
@@ -36,7 +35,6 @@ config BR2_PACKAGE_GLMARK2_FLAVOR_WAYLAND_GL
 	depends on BR2_PACKAGE_HAS_LIBGL
 	depends on BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_GLMARK2_FLAVOR_ANY
-	select BR2_PACKAGE_WAYLAND_PROTOCOLS
 
 config BR2_PACKAGE_GLMARK2_FLAVOR_X11_GLESV2
 	bool
@@ -68,6 +66,8 @@ config BR2_PACKAGE_GLMARK2
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_GLMARK2_FLAVOR_DRM_GLESV2
 	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_GLMARK2_FLAVOR_WAYLAND_GL
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_GLMARK2_FLAVOR_WAYLAND_GLESV2
 	help
 	  glmark2 is an OpenGL 2.0 and ES 2.0 benchmark.
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
