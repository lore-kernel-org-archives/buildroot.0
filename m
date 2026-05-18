Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E3CCD8CA4
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D89E8574F;
	Tue,  9 Jun 2026 13:02:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d5eYdMZox8Ww; Tue,  9 Jun 2026 13:02:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 087BD85736
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010135;
	bh=6/j6kTALdk47X7cnFZpnlXE7cdvxd8PWPkUMMFwOslw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=X8RqRksIYEp0YbXg+iXPAwkZ0Kpj/NG8rn7Kqr4j0FsImDKnoOEupZxKTvUu9SN7D
	 6FRO1SSR/dd/eutDP4VaovW82hzqhe1S69BI4BYrDR0lHvlvdT3c5/NLqOZDBv2gu3
	 ysjNYp3PEmuvSJOhbdBvi2pz2jSgkSrQitwunz4Ql8Xgm+yz8Ebtw8bFdTB5QpGaWo
	 ICqenvZnq4bh5T0DF/vkbxvuyE1N+ymFDAbzydk8SjCKLDnkZ2is/OWdlyR5e0+369
	 j//oYbSgPE7y9OtB6uiO0R0sSIJCm417np+dCbgez4eMzVsV7QJxQ4NQyoIEKvx/SG
	 l771in0YkBHTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 087BD85736;
	Tue,  9 Jun 2026 13:02:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FC252EE
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E06C459F4
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uQNSqXPPnqHM for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6689641187
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6689641187
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A17CF87E7E; Tue,  9 Jun 2026 13:01:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 18 May 2026 20:19:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b5124a6ab3c34e8fafe858239ca4f54fa4a457ff
X-Git-Newrev: 460700d38e1bb9ddb83bf8de81d69a2448099165
X-Patchwork-Hint: ignore
Message-Id: <20260609130116.A17CF87E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: add Gallium VA-API support
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/460700d38e1bb9ddb83bf8de81d69a2448099165
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since commit 361bfbc70b2b (package/mesa3d: disable libva support),
VA-API has been unconditionally disabled in mesa3d due to a circular
dependency between mesa3d, libva and libgl.

The circular dependency only occurs when mesa3d is the libgl provider,
i.e. when GLX is enabled without libglvnd. In that case:
  mesa3d -> libva -> libgl -> mesa3d

Re-enable VA-API support as a new BR2_PACKAGE_MESA3D_GALLIUM_VA option,
guarded by a dependency that prevents the circular case. This allows
hardware video acceleration on AMD, Intel and other GPUs with Gallium
drivers.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/mesa3d/Config.in | 13 +++++++++++++
 package/mesa3d/mesa3d.mk |  7 +++++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 74c9f19487..0fab2e3ba8 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -507,6 +507,19 @@ config BR2_PACKAGE_MESA3D_OPENGL_ES
 
 endif # BR2_PACKAGE_MESA3D_DRIVER
 
+config BR2_PACKAGE_MESA3D_GALLIUM_VA
+	bool "Gallium VA-API"
+	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	# circular dependency: mesa3d -> libva -> libgl -> mesa3d
+	depends on !BR2_PACKAGE_MESA3D_OPENGL_GLX || BR2_PACKAGE_LIBGLVND
+	select BR2_PACKAGE_LIBVA
+	help
+	  Enable VA-API video acceleration support in Gallium drivers.
+
+comment "Gallium VA-API needs a gallium driver, incompatible with GLX w/o libglvnd"
+	depends on !BR2_PACKAGE_MESA3D_GALLIUM_DRIVER || \
+		(BR2_PACKAGE_MESA3D_OPENGL_GLX && !BR2_PACKAGE_LIBGLVND)
+
 config BR2_PACKAGE_PROVIDES_LIBGBM
 	default "mesa3d" if BR2_PACKAGE_MESA3D_GBM
 
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index a0be555860..e1eb037a84 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -199,9 +199,12 @@ endif
 #   - Building OpenGL ES without OpenGL is not supported, so always keep opengl enabled.
 MESA3D_CONF_OPTS += -Dopengl=true
 
-# libva and mesa3d have a circular dependency
-# we do not need libva support in mesa3d, therefore disable this option
+ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_VA),y)
+MESA3D_CONF_OPTS += -Dgallium-va=enabled
+MESA3D_DEPENDENCIES += libva
+else
 MESA3D_CONF_OPTS += -Dgallium-va=disabled
+endif
 
 # libGL is only provided for a full xorg stack, without libglvnd
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
