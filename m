Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE011C4707B
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 17:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62EFA81E8E;
	Sun, 14 Jan 2024 17:48:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62EFA81E8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SF_afLGCXCSx; Sun, 14 Jan 2024 17:48:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B65C181E70;
	Sun, 14 Jan 2024 17:48:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B65C181E70
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C8DD1BF316
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 17:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E642C409DB
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 17:48:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E642C409DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2pXXnjhmLkEm for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 17:48:39 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9314C405CF
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 17:48:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9314C405CF
Received: from fli4l.lan.fli4l (p5b3a01c2.dip0.t-ipconnect.de [91.58.1.194])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 593EDA4C0333
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 18:48:24 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42764)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rP4au-000000003DZ-0HDL
 for buildroot@buildroot.org; Sun, 14 Jan 2024 18:48:24 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 14 Jan 2024 18:48:23 +0100
Message-Id: <20240114174823.2732695-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240114174823.2732695-1-bernd@kuhls.net>
References: <20240114174823.2732695-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1705254504;
 bh=OGcpr/8AwKMxMVozjRHhOCzlNzHS7ms2x6iWbi9ddV0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=LptPmup/7Ymu03EHg/X/Q7gfp8t7IUIW+XMwwnZV8/ZUY8tax7Ye23A6tv2sbmwlG
 zYpZu052jnImG+PY6/253eXcMa2948aRYQKQkqqrwiDO7fynaP33aUCmc2dRmDXNdG
 b9/XUNIR0gwNehso2X1y9CgRoQjxU8SzmZrTxsjLqtcAPPJaKyP4VQH8LYJV/YkFc1
 XTURPPHIcGcC1wEyEx5iuNWKv41EXiScVW/Y/Z5vdVrk8alitWVFV9m4dhOHzQUwzp
 PQ3ANVwHfD+qC7DYJSl/ool0+5SAQx6NkmoPIpws8cvBniI1qza6pawDHF5ieG10Lr
 dAMdukdycR4kw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=LptPmup/
Subject: [Buildroot] [PATCH 2/2] package/glm: bump version
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

Fixes build error with packages depending on glm, like kodi-screensaver*
and kodi-visualisation*:

CMake Error at /home/buildroot/br2/output/per-package/kodi-screensaver-asteroids/host/share/cmake-3.28/Modules/FindPackageHandleStandardArgs.cmake:230 (message):
  Could NOT find glm (missing: GLM_INCLUDE_DIR)

Since glm release 0.9.9.8 (bumped in buildroot with commit
01ad11343172ea698e4dcc1c64cb02ce26671e49) many fixes were added for its
cmake support: https://github.com/g-truc/glm/pull/1054

Instead of backporting all of them we bump to latest git HEAD.
Preparations for glm 1.0.0 are underway:
https://github.com/g-truc/glm/pull/1180

Fixes build error with this defconfig:

BR2_x86_64=y
BR2_x86_x86_64_v4=y
BR2_BINUTILS_VERSION_2_41_X=y
BR2_GCC_VERSION_13_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_INIT_NONE=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_KODI=y
BR2_PACKAGE_KODI_SCREENSAVER_ASTEROIDS=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON3_PY_ONLY=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/glm/glm.hash | 2 +-
 package/glm/glm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glm/glm.hash b/package/glm/glm.hash
index c4e2101604..6bc88739b3 100644
--- a/package/glm/glm.hash
+++ b/package/glm/glm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7d508ab72cb5d43227a3711420f06ff99b0a0cb63ee2f93631b162bfe1fe9592  glm-0.9.9.8.tar.gz
+sha256  9dc8c27c2b00d44a0b9d4a619b13848f1092914e7ec60447ac3db528a8e9ba8a  glm-b06b775c1c80af51a1183c0e167f9de3b2351a79.tar.gz
 sha256  62d2d642c7d054d4fb4c9b42faad617d6c88fcd91e317f8035aa9f277cc159c3  copying.txt
diff --git a/package/glm/glm.mk b/package/glm/glm.mk
index ef549931f6..92357b4fe2 100644
--- a/package/glm/glm.mk
+++ b/package/glm/glm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GLM_VERSION = 0.9.9.8
+GLM_VERSION = b06b775c1c80af51a1183c0e167f9de3b2351a79
 GLM_SITE = $(call github,g-truc,glm,$(GLM_VERSION))
 GLM_LICENSE = MIT
 GLM_LICENSE_FILES = copying.txt
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
