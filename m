Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62CE9C61DA4
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 14:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F229081D9F;
	Tue, 14 Feb 2023 14:42:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F229081D9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2vQSC-GhPASq; Tue, 14 Feb 2023 14:42:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DE3E81AC1;
	Tue, 14 Feb 2023 14:42:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DE3E81AC1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 380431BF3E1
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 14:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F5F840222
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 14:42:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F5F840222
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cWHtF2FnaGdK for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 14:42:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5240D40116
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 14:42:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5240D40116
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F59A85C83; Tue, 14 Feb 2023 14:42:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Feb 2023 15:00:36 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: dad63d9ec99d676f6d7b90fd17181433d56864d9
X-Git-Newrev: cf37b32e4022dfd8176ad54337e708da67eb7c33
X-Patchwork-Hint: ignore
Message-Id: <20230214144233.3F59A85C83@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/kodi: fix
 openrisc build
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cf37b32e4022dfd8176ad54337e708da67eb7c33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Fixes build error not yet found by autobuilders

-- System type: Linux
CMake Error at cmake/scripts/linux/ArchSetup.cmake:42 (message):
  Unknown CPU: or1k

with this defconfig:

BR2_or1k=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_STABLE=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_KODI=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON3_PY_ONLY=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 86fac589fbe1ec03ddc2478bff225e369302abfb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi/kodi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 74c800e5b4..2d8bcb4e83 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -136,7 +136,7 @@ else ifeq ($(BR2_powerpc)$(BR2_powerpc64le),y)
 KODI_CONF_OPTS += \
 	-DWITH_ARCH=powerpc$(if $(BR2_ARCH_IS_64),64) \
 	-DWITH_CPU=powerpc$(if $(BR2_ARCH_IS_64),64)
-else ifeq ($(BR2_powerpc64)$(BR2_sparc64)$(BR2_sh4)$(BR2_xtensa),y)
+else ifeq ($(BR2_or1k)$(BR2_powerpc64)$(BR2_sparc64)$(BR2_sh4)$(BR2_xtensa),y)
 KODI_CONF_OPTS += -DWITH_ARCH=$(BR2_ARCH) -DWITH_CPU=$(BR2_ARCH)
 else
 # Kodi auto-detects ARCH, tested: arm, aarch64, i386, x86_64
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
