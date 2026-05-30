Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC68FCD8CA4
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D44285817;
	Tue,  9 Jun 2026 13:02:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gm9-5EcBYU6I; Tue,  9 Jun 2026 13:02:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53E0385808
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010155;
	bh=10ImnJ+3q+MNcvByIZgkvP7W8yL5xqFYNrlmN0OLRuw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aKoAn3DiXCUSpSI7q6M1pQAh+Y2JF27qVR7/5zUrg1rXGW1manL7F+zWZCtk+YDtI
	 eZcHqIhmGjbfZHhXsnQh9lt/WMy/AKqcA2Ap07qEBjo0D/W2roQu9L3p4uVmVJ70Mj
	 bY4HR7TWdW1IflqeQMCDGDFDrfU2+L43BAtmZ3TZqn7Ml2F1NpDG3XYh++h6fYxnn8
	 Og4xghPpY+FT2XxKEUVb5lny0XULzhdV7EhA4snzRFk0d2/4Vf2fc5qCxnC6RfmStK
	 Uj7LS8hQS6H1h94riSsg2tLgZY0gkHKxi0fFVMY/R4EGOYKvzMqDmeccNAaD8GbVAk
	 rvqMo3Or++xWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53E0385808;
	Tue,  9 Jun 2026 13:02:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 146E62EE
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 15B098553F
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lOxt5M4WeIHf for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F3C0855EF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F3C0855EF
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B1FA87E8F; Tue,  9 Jun 2026 13:01:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 12:51:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8d6c49f8d86eb81e143e8dee7806d9896f3eaec1
X-Git-Newrev: b6a2f494290d85a26798564992ddd1ac46c1a48d
X-Patchwork-Hint: ignore
Message-Id: <20260609130121.9B1FA87E8F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi: depend on host-openjdk-bin
 instead of selecting BR2_NEEDS_HOST_JAVA
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b6a2f494290d85a26798564992ddd1ac46c1a48d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This patch removes the dependency on java being installed on the host,
instead we make use of our host-openjdk-bin package.

Build-tested using this defconfig

BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_KODI=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON3_PY_ONLY=y

by running 'utils/docker-run make kodi'.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/kodi/Config.in | 2 +-
 package/kodi/kodi.mk   | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index e91b8cfb96..25b4832164 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	bool
 	default y if BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
+	default y if BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
 	# i386: needs sse (see upstream PR 10351)
 	depends on !(BR2_i386 && !BR2_X86_CPU_HAS_SSE)
 	depends on BR2_USE_MMU # libcdio, and others
@@ -66,7 +67,6 @@ menuconfig BR2_PACKAGE_KODI
 	depends on BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
 	depends on BR2_PACKAGE_PYTHON3
 	depends on !BR2_PACKAGE_PYTHON3_PYC_ONLY
-	select BR2_NEEDS_HOST_JAVA
 	select BR2_HOST_CMAKE_AT_LEAST_3_24
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_GPL
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 85c15926ae..6a49f5df0c 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -33,6 +33,7 @@ KODI_DEPENDENCIES = \
 	host-kodi-jsonschemabuilder \
 	host-kodi-texturepacker \
 	host-nasm \
+	host-openjdk-bin \
 	host-swig \
 	host-xmlstarlet \
 	jpeg \
@@ -100,6 +101,7 @@ KODI_CONF_OPTS += \
 	-DDEPENDS_PATH=$(STAGING_DIR)/usr \
 	-DENABLE_TESTING=OFF \
 	-DENABLE_DEBUGFISSION=OFF \
+	-DJAVA_HOME=$(HOST_OPENJDK_BIN_ROOT_DIR) \
 	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python \
 	-DPYTHON_INCLUDE_DIRS=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 	-DPYTHON_PATH=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
