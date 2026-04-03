Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B09E85388
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 17:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3D5C411FD;
	Fri,  3 Apr 2026 17:36:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ie7pLakEuOo2; Fri,  3 Apr 2026 17:36:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1ADA41201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775237817;
	bh=0q49m+guPK5Xctg+QLTrK62R6Gf45P4zf+OxTgZb/8Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=V4fLfE2JMj5XIX5I9NE0YmuTxRPGI4iF+7WRxew9fFzv/CvR916zIM8IYPwBfLQl5
	 T5SUBnJfR3iqXYld/nJk2lBA3rLUg6qtff44beAyYZjhfzeIKXWdt86rJYpwWoBT5D
	 JPJqScRnkuwnyiLxmyvNie7W/5FeEIdxNwleH4cOod9qB5zz6aqzg9ZTray308nKv5
	 1ykC2nvKZ2zzMBi+sW8YGrP+UUJU4mBl0mM+hBUs34QlvllP5YFAoDYQW0U5n6kQmH
	 NUGTqAVZZkI4Z1wpZCaM8mbBJReJ0Bl5cjBiy3gT7B40+FKzZvm9S/7eqHp0ZJ08dP
	 6EJsPvLelhNQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1ADA41201;
	Fri,  3 Apr 2026 17:36:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 45A8B1AF
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4294040226
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:36:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i9FrPe1Q2b8X for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 17:36:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55DEA40202
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55DEA40202
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:36:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B534480124; Fri,  3 Apr 2026 17:36:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Apr 2026 19:35:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3664f8ad49bf09180e766efc0e07856fad6913ec
X-Git-Newrev: d2b2246517d089b15baef288c23bed026576b866
X-Patchwork-Hint: ignore
Message-Id: <20260403173654.B534480124@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/igt-gpu-tools: bump version to 2.4
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d2b2246517d089b15baef288c23bed026576b866
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.x.org/archives/xorg-announce/2026-March/003676.html

Upstream added a dependency to pciutils:
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/a97925a6d7cac457a5d46020f38fbef59e74abc5

Upstream replaced json-c with jansson library:
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/b24cdab174240399a6ac377dbeb7923d4f429680

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/igt-gpu-tools/Config.in          | 1 +
 package/igt-gpu-tools/igt-gpu-tools.hash | 6 +++---
 package/igt-gpu-tools/igt-gpu-tools.mk   | 7 ++++---
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/igt-gpu-tools/Config.in b/package/igt-gpu-tools/Config.in
index 87268969a1..00dc59a2ae 100644
--- a/package/igt-gpu-tools/Config.in
+++ b/package/igt-gpu-tools/Config.in
@@ -20,6 +20,7 @@ config BR2_PACKAGE_IGT_GPU_TOOLS
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBPCIACCESS
+	select BR2_PACKAGE_PCIUTILS
 	select BR2_PACKAGE_PIXMAN
 	select BR2_PACKAGE_PROCPS_NG
 	select BR2_PACKAGE_ZLIB
diff --git a/package/igt-gpu-tools/igt-gpu-tools.hash b/package/igt-gpu-tools/igt-gpu-tools.hash
index b1899cd986..b66d856da9 100644
--- a/package/igt-gpu-tools/igt-gpu-tools.hash
+++ b/package/igt-gpu-tools/igt-gpu-tools.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2025-December/003648.html
-sha256  429f2578fb16cff7402e9beb325c5c267ad30a2b7b957343c77e8ea24af03887  igt-gpu-tools-2.3.tar.xz
-sha512  669e5f124c1177ed58c43b8b9b945f6436fc37b1162b16bbd1db78c5e170c68be98cc3b08b5ecb438d1313722fee2ab8bba8ca86a971443401c2acc3f3ec68ff  igt-gpu-tools-2.3.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2026-March/003676.html
+sha256  a44b7d089a27555944d4cd5da372c9339501539e3cd2735bbdb30e0d802f1cbe  igt-gpu-tools-2.4.tar.xz
+sha512  3f8e8202e3a613faf077ecb3fcc6a13840a8df94f94cb7d3a7933e51888757ea22e4154f2e0f88b896583e23bc8fd472bd286a0b50630b8b5eeb13878a1a2d9f  igt-gpu-tools-2.4.tar.xz
 
 # Hash for license file:
 sha256  1b7e266857b05808660f42369a4a797459d7b7bec7245e378aa28a8db2f213da  COPYING
diff --git a/package/igt-gpu-tools/igt-gpu-tools.mk b/package/igt-gpu-tools/igt-gpu-tools.mk
index 85ed999ed4..6e6d4278f1 100644
--- a/package/igt-gpu-tools/igt-gpu-tools.mk
+++ b/package/igt-gpu-tools/igt-gpu-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IGT_GPU_TOOLS_VERSION = 2.3
+IGT_GPU_TOOLS_VERSION = 2.4
 IGT_GPU_TOOLS_SOURCE = igt-gpu-tools-$(IGT_GPU_TOOLS_VERSION).tar.xz
 IGT_GPU_TOOLS_SITE = https://www.x.org/releases/individual/app
 IGT_GPU_TOOLS_LICENSE = MIT
@@ -18,6 +18,7 @@ IGT_GPU_TOOLS_DEPENDENCIES = \
 	libdrm \
 	libglib2 \
 	libpciaccess \
+	pciutils \
 	pixman \
 	procps-ng \
 	udev \
@@ -44,9 +45,9 @@ ifeq ($(BR2_i386)$(BR2_x86_64)x$(BR2_RELRO_NONE),yx)
 IGT_GPU_TOOLS_LDFLAGS = $(TARGET_LDFLAGS) -Wl,-z,lazy
 endif
 
-ifeq ($(BR2_PACKAGE_JSON_C),y)
+ifeq ($(BR2_PACKAGE_JANSSON),y)
 IGT_GPU_TOOLS_CONF_OPTS += -Drunner=enabled
-IGT_GPU_TOOLS_DEPENDENCIES += json-c
+IGT_GPU_TOOLS_DEPENDENCIES += jansson
 else
 IGT_GPU_TOOLS_CONF_OPTS += -Drunner=disabled
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
