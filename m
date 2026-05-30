Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE3BCD6E53
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 10:53:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E67A685173;
	Sat, 30 May 2026 10:53:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dZuAVog2RV85; Sat, 30 May 2026 10:53:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D756852E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780138384;
	bh=Axu7xQhunSi4JpleL8JX6pi0LI3PzZZukaNeExTMSsM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gaAK/6uF6c2jyu5uX87b96ucmB1wK9k5wuA4wcgM5tw6RFKBskvytumvUZZ8AWn6R
	 6gxLVtb7+mSFWFsG075sg+vxuptLkpqHDUUQVxEx5Kl/asdDF7Bdvew29DlXc/2vQ2
	 vKc/no+YGLcDXEu2KwkNNoZMp6MvYAiUz6mVTPQl2LXkGYI35F6PV/ek2fCjrC9sK2
	 jBxw4NYyFmbBZAcb88JQlRlAuHT68siDxapCeZZtjOS3K4Wpu3JWd/ID6X5CQi6hv1
	 CEt38vDLYoXo4x4+HoBD8v0+7E7rPyOOGbEUv1tJ0YiiPP831iSMF41m7Ij8l9fmuu
	 +aoT5vs2s9e1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D756852E9;
	Sat, 30 May 2026 10:53:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 26171F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC0B560093
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:53:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZotLNOhA-ykf for <buildroot@buildroot.org>;
 Sat, 30 May 2026 10:53:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6D8061C22
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6D8061C22
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:53:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D36478749A; Sat, 30 May 2026 10:52:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 12:50:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a0b3c2f84e1e048cfe11243645b4df7dc73bc41d
X-Git-Newrev: 1fed1a6c754245977fa828a281d5d7cd977c8c8d
X-Patchwork-Hint: ignore
Message-Id: <20260530105248.D36478749A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi: fix wayland build
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1fed1a6c754245977fa828a281d5d7cd977c8c8d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
---
 package/kodi/kodi.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 0c177a94dd..f82d5c0eb5 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -126,7 +126,8 @@ endif
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
