Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D096CC7618B
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 08:51:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A56640926;
	Wed, 15 Mar 2023 08:51:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A56640926
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XU5E8kAHLMBQ; Wed, 15 Mar 2023 08:51:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 316A64109B;
	Wed, 15 Mar 2023 08:51:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 316A64109B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AACA11BF962
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 08:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8473C81320
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 08:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8473C81320
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bPrdkcGXCPSH for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 08:51:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68B9F81317
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 68B9F81317
 for <buildroot@uclibc.org>; Wed, 15 Mar 2023 08:51:09 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 71B3E5C0A4B;
 Wed, 15 Mar 2023 04:51:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 15 Mar 2023 04:51:08 -0400
X-ME-Sender: <xms:_IYRZP_5t_z5m_-srKmQpNJGHCMQdHlmxwz6rzoISVmTP8m-L--Rpw>
 <xme:_IYRZLun-sXqWYXJeFnX0SA563vdjbGKnzKE0x4E8QCmntbHoS-gL21IXFYbHC7kH
 562-lPQoLa9hCoxXUE>
X-ME-Received: <xmr:_IYRZNDEL0Ac_NPG6svEZCcQ1Rgi7xB_HSAjR33jw1E-jBFlervhV4hrhI_sYzjiqqjU7eF8clpdy51Nt21tI8Cz3AET1FzkNbBxC_tm5Md_hWoQq3tgvEnhQA_Z>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddvjedguddvvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
 ekredtredttdenucfhrhhomhepfdfnuhhkvgcuffdrucflohhnvghsfdcuoehluhhkvges
 lhhjohhnvghsrdguvghvqeenucggtffrrghtthgvrhhnpeeiffdvfefgtdevleehffekue
 ejueehtedulefgieekgfdtfeeiffdtuefhteevheenucffohhmrghinheplhhisghsughl
 rdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eplhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:_IYRZLcYzVOyBnFoi0hE6zkAMFRwLQ-yBMb_XIjxZlFzs_RNNYh7nQ>
 <xmx:_IYRZEO0f6n-hu4Zn_A594jnoC1duuhpDTzOMLOajyvPkkJfp44LWw>
 <xmx:_IYRZNmO_q_WFl7N62VKhlow4IuQEyTSNdlgBXe0uegl110eqL3aXQ>
 <xmx:_IYRZPb2Rwa0CNdKb7vS3-dkx1xB1gz8Xx8x0T9D_Pncjbox_7-EIQ>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Mar 2023 04:51:07 -0400 (EDT)
From: "Luke D. Jones" <luke@ljones.dev>
To: buildroot@uclibc.org
Date: Wed, 15 Mar 2023 09:51:03 +0100
Message-Id: <20230315085103.1671888-2-luke@ljones.dev>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315085103.1671888-1-luke@ljones.dev>
References: <20230315085103.1671888-1-luke@ljones.dev>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ljones.dev; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1678870268; x=
 1678956668; bh=he7jwDvadt8c75fL+iOJ28iwLMCbjvFmmDt8scheLww=; b=E
 6zthiT4w7ZHocwNhCpXTsT9IoNHkXsqMbLPFVzSXGrBKEUWo9Rg9PVGk6106hwKV
 TJnBIUfVvdgzVXuFP2vxubRjIvO3Q6icW5qKEBCq3SNfrM2QUUgWECRxXBAeA6/c
 lDSFGpdlblZs8YknSUyek8jaWLGipPjA+zFJBsq22JT8ZuhLojGdiAJpCy5TkPL5
 E8mmGquaEuvRA1dHBSK9VGINnUGJMT5CKPdMHphy3UtUNjxOMrw0SYMGltlXXFEM
 L5uaTGbRJ/f0ExQs8R/48wNUyaG9MJSI0H9j4/jE+qW0ChbvF97vbs8HhwWbKHk+
 s+w6LXdapWhuTbnRE7s6g==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1678870268; x=
 1678956668; bh=he7jwDvadt8c75fL+iOJ28iwLMCbjvFmmDt8scheLww=; b=O
 h9VrdXDrbDObXfx/oH137Pi7czoLARGyFGI2s+hO2HF5j3A7ZA+BZcQ2sxBa9xEK
 Fo/T/EWd1OJtRFlA0ZOitLdwNmuggCzuVmXgbSSHklMVMLwpdGnybxaOhMNmyKhG
 oF3suRYxzqgeEn1YvWl8/mi/mcziVanSeHqh3H95txTOv2SGmIOXFxyNDfsFxo8N
 QmRARFmYWWTRD4v3jkUl52yHHT4ZJqHopxaCQDoHoJRL6mVhgMxjzG/26D2sIZ2g
 qnVnkNSeHtmwajTS5C+J8b441BoQXsLq3B2I/vRIurfMpUW8BsoBEwognuMJFK+6
 jhp2fkm/VzpJ1kZtYmx8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=ljones.dev header.i=@ljones.dev
 header.a=rsa-sha256 header.s=fm3 header.b=E6zthiT4; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Oh9VrdXD
Subject: [Buildroot] [PATCH] package/sdl2: Add config for wayland, vivante,
 pulseaudio
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
Cc: "Luke D. Jones" <luke@ljones.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add support for building SDL2 with the following enabled as either optional
or detected:

- Wayland video support, enables running SDL2 applications under
  pure wayland desktops/compositors
- Vivante video device support, this enables SDL2 to run on devices using
  this video chip without a full desktop (much like KMS/DRM)
- Pulseaudio support, this solves an ancient issue that still occurs in
  some cases. Described at: http://forums.libsdl.org/viewtopic.php?t=7609&sid=40fdb9756b8e22e1b8253cda3338845f

Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 package/sdl2/Config.in | 16 ++++++++++++++++
 package/sdl2/sdl2.mk   | 21 +++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/package/sdl2/Config.in b/package/sdl2/Config.in
index 7c8258fe73b3..365be28c8ddb 100644
--- a/package/sdl2/Config.in
+++ b/package/sdl2/Config.in
@@ -18,6 +18,22 @@ config BR2_PACKAGE_SDL2_DIRECTFB
 comment "DirectFB video driver needs directfb"
 	depends on !BR2_PACKAGE_DIRECTFB
 
+config BR2_PACKAGE_SDL2_WAYLAND
+	bool "wayland video driver"
+	depends on BR2_PACKAGE_WAYLAND
+
+comment "wayland video driver needs wayland"
+	depends on !BR2_PACKAGE_WAYLAND
+
+config BR2_PACKAGE_SDL2_PULSEAUDIO
+	bool "pulseaudio support"
+	depends on BR2_PACKAGE_PULSEAUDIO
+	depends on BR2_PACKAGE_ALSA_LIB
+
+comment "pulseaudio support needs the pulseaudio and alsa packages"
+	depends on !BR2_PACKAGE_PULSEAUDIO
+	depends on !BR2_PACKAGE_ALSA_LIB
+
 config BR2_PACKAGE_SDL2_X11
 	bool "X11 video driver"
 	depends on BR2_PACKAGE_XORG7
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index c01f12d12cf7..12bfe0eb1592 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -81,6 +81,20 @@ else
 SDL2_CONF_OPTS += --disable-video-directfb
 endif
 
+ifeq ($(BR2_PACKAGE_SDL2_WAYLAND),y)
+SDL2_DEPENDENCIES += wayland
+SDL2_CONF_OPTS += --enable-video-wayland
+else
+SDL2_CONF_OPTS += --disable-video-wayland
+endif
+
+ifeq ($(BR2_PACKAGE_SDL2_PULSEAUDIO),y)
+SDL2_DEPENDENCIES += pulseaudio
+SDL2_CONF_OPTS += --enable-pulseaudio
+else
+SDL2_CONF_OPTS += --disable-pulseaudio
+endif
+
 ifeq ($(BR2_PACKAGE_SDL2_OPENGLES)$(BR2_PACKAGE_RPI_USERLAND),yy)
 SDL2_DEPENDENCIES += rpi-userland
 SDL2_CONF_OPTS += --enable-video-rpi
@@ -181,4 +195,11 @@ else
 SDL2_CONF_OPTS += --disable-video-kmsdrm
 endif
 
+ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV),y)
+SDL2_DEPENDENCIES += libdrm_etnaviv
+SDL2_CONF_OPTS += --enable-video-vivante
+else
+SDL2_CONF_OPTS += --disable-video-vivante
+endif
+
 $(eval $(autotools-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
