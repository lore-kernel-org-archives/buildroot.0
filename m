Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1478CD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 770A060E64;
	Fri,  5 Jun 2026 12:40:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id soW3ULm9H645; Fri,  5 Jun 2026 12:40:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 281DB60E53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663221;
	bh=GCo/tewT/zkkG3rhVHDU/SSZosY/xoNTrThllA3FYEY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Zn/KQ+LazWCCxBqgSt/y4jJKIAkOBU0W+L63Dag8i5LWNfrfJP0GIhRcGsJWp+z3o
	 xCsflEtLVWWRqtrnUnkwAqCm6zftm5PtAw4UJmvaTYU44Ti9HoO8zzlmFK6uRfSG4f
	 RicxfLUf98wIWEJ500uVJkhL23IBIztewKvvec++ma2AIGYD6ttj1AWsNkWtlSj/Nn
	 /DXS7MqC2xrtOM6Z46d7K6OFwuJzpyu2aHLe16fqQkYuld5D6OuH0WPuz6sFsch9cE
	 6LCy+AuYs8onZsM1zrA/MRykY0vUH2AzHjnm6trjVMXK7UHMcvsAnZnzpBTZ5UwFci
	 4/NH07ATEuLBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 281DB60E53;
	Fri,  5 Jun 2026 12:40:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D8983B7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC77441066
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7DtvXjPP2tMZ for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 704D841055
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 704D841055
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9A53F87B3B; Fri,  5 Jun 2026 12:38:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:03:46 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: d874ecf8d0c88aad740f17541cf7862360a841d1
X-Git-Newrev: 22803c9d617bd046af86d1ac71638a5bf90c0c6c
X-Patchwork-Hint: ignore
Message-Id: <20260605123837.9A53F87B3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/kodi: fix wayland
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/22803c9d617bd046af86d1ac71638a5bf90c0c6c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
index c31e789503..02feb17b4d 100644
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
