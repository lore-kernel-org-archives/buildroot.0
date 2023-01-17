Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E032C3DA78
	for <buildroot@archiver.kernel.org>; Tue, 17 Jan 2023 21:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3319A60B46;
	Tue, 17 Jan 2023 21:31:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3319A60B46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7laTNdmDUtBN; Tue, 17 Jan 2023 21:31:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79DF960AD4;
	Tue, 17 Jan 2023 21:31:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79DF960AD4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 318E81BF5DB
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 21:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1AA54819FC
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 21:30:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AA54819FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g8nzjNIJ_PJe for <buildroot@lists.busybox.net>;
 Tue, 17 Jan 2023 21:30:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F4FA81959
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F4FA81959
 for <buildroot@buildroot.org>; Tue, 17 Jan 2023 21:30:32 +0000 (UTC)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
 by mailout09.t-online.de (Postfix) with SMTP id 2AA1DA8D8
 for <buildroot@buildroot.org>; Tue, 17 Jan 2023 22:30:25 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.183.179]) by fwd71.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pHtXB-4Msp4E0; Tue, 17 Jan 2023 22:30:21 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:51842)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pHsFp-0000Im-1u
 for buildroot@buildroot.org; Tue, 17 Jan 2023 21:08:21 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue, 17 Jan 2023 21:08:21 +0100
Message-Id: <20230117200821.2882597-3-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117200821.2882597-1-bernd.kuhls@t-online.de>
References: <20230117200821.2882597-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1673991021-417E8C4D-542E69AA/0/0 CLEAN NORMAL
X-TOI-MSGID: a2949f49-b05f-4a7d-a735-c7dcfe281f6c
Subject: [Buildroot] [PATCH 3/3] package/kodi: fix riscv build
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
index aaa165871c..093b3aa9ae 100644
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
