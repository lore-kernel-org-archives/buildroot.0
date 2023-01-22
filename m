Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A18C25B4E
	for <buildroot@archiver.kernel.org>; Sun, 22 Jan 2023 11:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79D3440452;
	Sun, 22 Jan 2023 11:57:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79D3440452
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nZqUmCPmeoU9; Sun, 22 Jan 2023 11:57:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B40CE404A1;
	Sun, 22 Jan 2023 11:56:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B40CE404A1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0E56B1BF861
 for <buildroot@lists.busybox.net>; Sun, 22 Jan 2023 11:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE68160AC1
 for <buildroot@lists.busybox.net>; Sun, 22 Jan 2023 11:56:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE68160AC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 390L-8a3l-ls for <buildroot@lists.busybox.net>;
 Sun, 22 Jan 2023 11:56:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA66760A92
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BA66760A92
 for <buildroot@buildroot.org>; Sun, 22 Jan 2023 11:56:43 +0000 (UTC)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
 by mailout01.t-online.de (Postfix) with SMTP id 485DB14795
 for <buildroot@buildroot.org>; Sun, 22 Jan 2023 12:56:41 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.185.38]) by fwd86.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pJYxl-29ALRa0; Sun, 22 Jan 2023 12:56:41 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:36428)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pJYxl-0007vS-0E
 for buildroot@buildroot.org; Sun, 22 Jan 2023 12:56:41 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 22 Jan 2023 12:56:40 +0100
Message-Id: <20230122115640.24776-6-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230122115640.24776-1-bernd.kuhls@t-online.de>
References: <20230122115640.24776-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1674388601-927EB95E-7F691480/0/0 CLEAN NORMAL
X-TOI-MSGID: 01999256-4bd1-4f93-bb82-bdb6669e8dc0
Subject: [Buildroot] [PATCH 6/6] package/kodi: fix riscv build
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

Fixes build error not yet found by autobuilders

-- System type: Linux
CMake Error at cmake/scripts/linux/ArchSetup.cmake:42 (message):
  Unknown CPU: riscv32

using this defconfig:

BR2_riscv=y
BR2_RISCV_32=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_KODI=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON3_PY_ONLY=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/kodi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 5a320a8e5b..469cfc7aad 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -136,7 +136,7 @@ else ifeq ($(BR2_powerpc)$(BR2_powerpc64le),y)
 KODI_CONF_OPTS += \
 	-DWITH_ARCH=powerpc$(if $(BR2_ARCH_IS_64),64) \
 	-DWITH_CPU=powerpc$(if $(BR2_ARCH_IS_64),64)
-else ifeq ($(BR2_or1k)$(BR2_powerpc64)$(BR2_sparc64)$(BR2_sh4)$(BR2_xtensa),y)
+else ifeq ($(BR2_or1k)$(BR2_powerpc64)$(BR2_riscv)$(BR2_sparc64)$(BR2_sh4)$(BR2_xtensa),y)
 KODI_CONF_OPTS += -DWITH_ARCH=$(BR2_ARCH) -DWITH_CPU=$(BR2_ARCH)
 else
 # Kodi auto-detects ARCH, tested: arm, aarch64, i386, x86_64
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
