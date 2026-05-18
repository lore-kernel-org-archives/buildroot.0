Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC10CD4F4A
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 18:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D70F160709;
	Mon, 18 May 2026 18:31:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6HdA69lzJQcw; Mon, 18 May 2026 18:31:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 347F760703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779129081;
	bh=9wW3CS1jTgszMwYPt0HGms34y2W/97WM+yZ8jqtKiGU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ND03FJiQXC2hYwMcTdL19gd9RZxHjrfS6TQGLmpTZ0rdHsuXhO0chcFzzserSg3Tb
	 setlmqpKIvb0tBC8vlvRVdncnb35zRAGcTNzggY2ppzfpVc14DxMhiIz+fFpRWSGH+
	 +YAwQoqwbtMdyMpsYR5TqXQOuH2FaWLwqoIEKA5kewS5bjTBpAM+CTi2ueIHFN6zjU
	 /lrM6hUfdb6IH3t/EADDTht7uEkevrr3iZ44TM5+AQ9+zUlk7kBDk6s0qF8x4n8QEB
	 FENY4jbyLcaxeBnTJb/9rJbNvuNbhayzXlLC9SzdAp6z5TQ2MnJhVgUfLvaQD1vwlD
	 52m8EZa4JQ4aw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 347F760703;
	Mon, 18 May 2026 18:31:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0476A390
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE844400BA
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:31:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ozs8zf_firMl for <buildroot@buildroot.org>;
 Mon, 18 May 2026 18:31:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36F894004E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36F894004E
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:31:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F39228667F; Mon, 18 May 2026 18:31:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 18 May 2026 20:28:59 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 460700d38e1bb9ddb83bf8de81d69a2448099165
X-Git-Newrev: c4cd1d52408bdc955fe14fb138d98a37494f5abe
X-Patchwork-Hint: ignore
Message-Id: <20260518183110.F39228667F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mesa3d: add option to
 enable patented video codecs
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c4cd1d52408bdc955fe14fb138d98a37494f5abe
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

By default, mesa uses -Dvideo-codecs=all_free which only includes
royalty-free codecs (AV1, VP9, MPEG-1/2, JPEG).

Add a new BR2_PACKAGE_MESA3D_PATENTED_VIDEO_CODECS option to set
-Dvideo-codecs=all, which additionally enables patent-encumbered
codecs (H.264, H.265, VC-1) for both Gallium VA-API and Vulkan
video decode/encode.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
[Arnout: add PATENTED to the config symbol name]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/mesa3d/Config.in | 14 ++++++++++++++
 package/mesa3d/mesa3d.mk |  6 ++++++
 2 files changed, 20 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 0fab2e3ba8..e4a444efbb 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -520,6 +520,20 @@ comment "Gallium VA-API needs a gallium driver, incompatible with GLX w/o libglv
 	depends on !BR2_PACKAGE_MESA3D_GALLIUM_DRIVER || \
 		(BR2_PACKAGE_MESA3D_OPENGL_GLX && !BR2_PACKAGE_LIBGLVND)
 
+config BR2_PACKAGE_MESA3D_PATENTED_VIDEO_CODECS
+	bool "patented video codecs (H.264, H.265)"
+	depends on BR2_PACKAGE_MESA3D_GALLIUM_VA || BR2_PACKAGE_MESA3D_VULKAN_DRIVER
+	help
+	  Enable patent-encumbered video codec support (H.264, H.265,
+	  VC-1 decode/encode) for Gallium VA-API and/or Vulkan video.
+
+	  Without this, only royalty-free codecs are supported
+	  (AV1, VP9, MPEG-1/2, JPEG).
+
+comment "patented video codecs need Gallium VA-API or a Vulkan driver"
+	depends on !BR2_PACKAGE_MESA3D_GALLIUM_VA && \
+		!BR2_PACKAGE_MESA3D_VULKAN_DRIVER
+
 config BR2_PACKAGE_PROVIDES_LIBGBM
 	default "mesa3d" if BR2_PACKAGE_MESA3D_GBM
 
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index e1eb037a84..f46c50e878 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -206,6 +206,12 @@ else
 MESA3D_CONF_OPTS += -Dgallium-va=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_MESA3D_PATENTED_VIDEO_CODECS),y)
+MESA3D_CONF_OPTS += -Dvideo-codecs=all
+else
+MESA3D_CONF_OPTS += -Dvideo-codecs=all_free
+endif
+
 # libGL is only provided for a full xorg stack, without libglvnd
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX),y)
 MESA3D_PROVIDES += $(if $(BR2_PACKAGE_LIBGLVND),,libgl)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
