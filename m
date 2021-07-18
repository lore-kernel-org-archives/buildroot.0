Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1439CC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:10:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEA7A600EF
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:10:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CEA7A600EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 874B14046D;
	Tue,  3 Aug 2021 22:10:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TipEQiMmac85; Tue,  3 Aug 2021 22:10:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 549A2400C7;
	Tue,  3 Aug 2021 22:10:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 788F51BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 810794057C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cNzyBBYMnWRy for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D162C40567
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 274188766C; Tue,  3 Aug 2021 21:10:09 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 18 Jul 2021 23:33:06 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 031df474c24f92757ac95ade572b90995ebdc6a2
X-Git-Newrev: 6ec47c4e59c7c8c57e972dab985c8a2ba0bf7174
X-Patchwork-Hint: ignore
Message-Id: <20210803211009.274188766C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mpv: add optional
 support for DRM/EGL-based vaapi acceleration
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=6ec47c4e59c7c8c57e972dab985c8a2ba0bf7174
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://github.com/mpv-player/mpv/blob/master/wscript#L647

Runtime-tested using mesa3d iris driver on a non-x11 system.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mpv/Config.in |  6 ++++++
 package/mpv/mpv.mk    | 11 +++++------
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/package/mpv/Config.in b/package/mpv/Config.in
index 812491e3a9..81b1e24b5f 100644
--- a/package/mpv/Config.in
+++ b/package/mpv/Config.in
@@ -1,3 +1,9 @@
+config BR2_PACKAGE_MPV_SUPPORTS_VAAPI
+	bool
+	default y if BR2_PACKAGE_LIBDRM && BR2_PACKAGE_MESA3D_OPENGL_EGL
+	default y if BR2_PACKAGE_WAYLAND
+	default y if BR2_PACKAGE_XORG7
+
 config BR2_PACKAGE_MPV
 	bool "mpv"
 	depends on BR2_INSTALL_LIBSTDCPP # libass
diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index 4292abb876..d4d4d4811d 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -178,17 +178,16 @@ MPV_CONF_OPTS += --disable-rpi
 endif
 
 # va-api support
-# This requires one or more of the egl-drm, wayland, x11 backends
-# For now we support wayland and x11
-ifeq ($(BR2_PACKAGE_LIBVA),y)
-ifneq ($(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_XORG7),)
+ifeq ($(BR2_PACKAGE_LIBVA)$(BR2_PACKAGE_MPV_SUPPORTS_VAAPI),yy)
 MPV_CONF_OPTS += --enable-vaapi
 MPV_DEPENDENCIES += libva
+ifeq ($(BR2_PACKAGE_LIBDRM),y)
+MPV_CONF_OPTS += --enable-vaapi-drm
 else
-MPV_CONF_OPTS += --disable-vaapi
+MPV_CONF_OPTS += --disable-vaapi-drm
 endif
 else
-MPV_CONF_OPTS += --disable-vaapi
+MPV_CONF_OPTS += --disable-vaapi --disable-vaapi-drm
 endif
 
 # wayland support
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
