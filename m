Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A179DC433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:45:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DB8760555
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:45:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6DB8760555
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3763060753;
	Sat,  4 Sep 2021 18:45:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EwbnhXoEnZiP; Sat,  4 Sep 2021 18:45:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8785A60731;
	Sat,  4 Sep 2021 18:45:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0480A1BF5DD
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 527224017C
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k1NFCs_BlPce for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 18:25:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9083C4021F
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 18:25:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 62EAC8834C; Sat,  4 Sep 2021 18:23:56 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 17:49:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6d664e9cfe6475cf7020e0f7e802b53f082c2250
X-Git-Newrev: 17a7abbafee9bf4a971e00da7870ae439910e47e
X-Patchwork-Hint: ignore
Message-Id: <20210904182356.62EAC8834C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpv: use BR2_PACKAGE_MESA3D_GBM
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=17a7abbafee9bf4a971e00da7870ae439910e47e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use BR2_PACKAGE_MESA3D_GBM instead of BR2_PACKAGE_MESA3D_OPENGL_EGL as
GBM can also be provided by a DRI driver

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mpv/Config.in | 2 +-
 package/mpv/mpv.mk    | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/mpv/Config.in b/package/mpv/Config.in
index 81b1e24b5f..51c9799de8 100644
--- a/package/mpv/Config.in
+++ b/package/mpv/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_MPV_SUPPORTS_VAAPI
 	bool
-	default y if BR2_PACKAGE_LIBDRM && BR2_PACKAGE_MESA3D_OPENGL_EGL
+	default y if BR2_PACKAGE_LIBDRM && BR2_PACKAGE_MESA3D_GBM
 	default y if BR2_PACKAGE_WAYLAND
 	default y if BR2_PACKAGE_XORG7
 
diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index acda93f381..a71a4b3114 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -47,8 +47,7 @@ else
 MPV_CONF_OPTS += --disable-alsa
 endif
 
-# GBM support is provided by mesa3d when EGL=y
-ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
+ifeq ($(BR2_PACKAGE_MESA3D_GBM),y)
 MPV_CONF_OPTS += --enable-gbm
 MPV_DEPENDENCIES += mesa3d
 ifeq ($(BR2_PACKAGE_LIBDRM),y)
@@ -185,7 +184,7 @@ endif
 ifeq ($(BR2_PACKAGE_LIBVA)$(BR2_PACKAGE_MPV_SUPPORTS_VAAPI),yy)
 MPV_CONF_OPTS += --enable-vaapi
 MPV_DEPENDENCIES += libva
-ifeq ($(BR2_PACKAGE_LIBDRM)$(BR2_PACKAGE_MESA3D_OPENGL_EGL),yy)
+ifeq ($(BR2_PACKAGE_LIBDRM)$(BR2_PACKAGE_MESA3D_GBM),yy)
 MPV_CONF_OPTS += --enable-vaapi-drm
 else
 MPV_CONF_OPTS += --disable-vaapi-drm
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
