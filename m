Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C57CD6E77
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C29A40F1E;
	Fri,  5 Jun 2026 12:38:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U6rF5xKFjKSX; Fri,  5 Jun 2026 12:38:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9584040FC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663114;
	bh=YGvhXW/No5dKwj5/4HxMgvmhjmyhr799ADXQB7jRDbw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QluwGoSSzeHW4lYWw/EnhSYPs8hjPP3AnXPp2vDDeY+ccm7ScUq4wNe8/XgmlvEjM
	 s6vdj+sPYI22yVDwIOWyn9dAJJVC4Iedx2xwsjpoRdXolbm6+mWvmGhZO5Gi5XvxfW
	 /U7jIg4DlyVLrNffWR8uKC+WpmLP4wqhJiTv3c7lGm5Ooz3s29UM2HTDvh+OUmfFUD
	 no8XtSQrvfxyqR1jk6ik212ddQI5NIb4r0zpU1sYdKNfHyunAnMzFc4qy+fU9gHGAo
	 RIgNnJOCHkpOfD9mdw1GC6lSaM8AlN2xIqXfMW2KCXPk9k1dd4e/jBnT3EgbdhcZ6D
	 AtfkaBk8fH5UQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9584040FC0;
	Fri,  5 Jun 2026 12:38:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 04589F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C948681EB8
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T_4P0ArDjYPh for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2B7881E9B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2B7881E9B
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 192A487B3F; Fri,  5 Jun 2026 12:37:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:03:43 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b7e60b2db258a31a47d8f35505a0fa445bad87c2
X-Git-Newrev: 97ac16c71cab8aa7388b3f52d0634e0b558b354d
X-Patchwork-Hint: ignore
Message-Id: <20260605123713.192A487B3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/kodi: fix wayland
 build
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/97ac16c71cab8aa7388b3f52d0634e0b558b354d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes wayland-related build error:
make[4]: *** No rule to make target '/usr/share/waylandpp/protocols/presentation-time.xml',
 needed by 'wayland-extra-protocols.hpp'.  Stop.

by adding a configure parameter pointing to STAGING_DIR.

The build error was not recorded by the autobuilders and can be
reproduced by this defconfig:

BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_KODI=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON3_PY_ONLY=y
BR2_PACKAGE_WAYLAND=y

LibreELEC added this configure parameter seven years ago:
https://github.com/LibreELEC/LibreELEC.tv/commit/d19ab98bf324364bf36b7c2d630524267dfaaa01

so a backport to LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 1fed1a6c754245977fa828a281d5d7cd977c8c8d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/kodi/kodi.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index f68c38f891..988ea55ea1 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -123,7 +123,8 @@ endif
 ifeq ($(BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND),y)
 KODI_CONF_OPTS += \
 	-DPC_WAYLANDPP_SCANNER=$(HOST_DIR)/bin/wayland-scanner \
-	-DPC_WAYLANDPP_SCANNER_FOUND=ON
+	-DPC_WAYLANDPP_SCANNER_FOUND=ON \
+	-DWAYLANDPP_PROTOCOLS_DIR=$(STAGING_DIR)/usr/share/waylandpp/protocols
 KODI_CORE_PLATFORM_NAME += wayland
 KODI_DEPENDENCIES += libxkbcommon waylandpp
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
