Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 278ACD30CC1
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C42F83D4A;
	Tue, 13 Jan 2026 20:59:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eKfAR_-aXpaQ; Tue, 13 Jan 2026 20:59:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4409283C19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337946;
	bh=3GeTkc9YBhMvmr1pTw01MxDBfvvSdHwqMe4r8FUWk9w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=F8Mz8BI8KZmm/0zFl+W5QZNJQion+OXjjYJIbglqwo4o19qjmNYJiXOBztJa0lGeE
	 Re3czyBeGsA8/IYnOHwTxZw+HfQPeiUZfk/Agh+yiB1xzLp/X4SJkpkW9n4AnKDlHJ
	 1lBtF0divFOZvaXiL2kdv79SHnuNUBKDsACXBaQp9I+v3s+kEGXgeACKkONW68z9Ib
	 CV8wofXajX9il+SRFnJ2Cld2tRykaft5evlRXwPfzP1Cn4X+23HN+2IbPsTg/8+ea9
	 +e8PN6vSZW/4qUl2OsB/LG1BST0kaKbs8vSeb4wmXEI67itCpH8jbtLfI9aEflPFyz
	 6tv7h3yXAIeig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4409283C19;
	Tue, 13 Jan 2026 20:59:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E219A231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7D7981109
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oBFSy1UoPRSO for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABBD5811AF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABBD5811AF
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A829F88570; Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0193daf7a53f5e2724aa648d5f3de145081747b2
X-Git-Newrev: 51c05053658c9874145cec6da425e881b03ae107
X-Patchwork-Hint: ignore
Message-Id: <20260113205850.A829F88570@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-amdgpu:
 bump version to 25.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=51c05053658c9874145cec6da425e881b03ae107
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.freedesktop.org/archives/amd-gfx/2025-July/127936.html

Switched build system to meson after autotools removal.

Added optional dependency to udev provided by meson build system.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../xdriver_xf86-video-amdgpu.hash                       |  6 +++---
 .../xdriver_xf86-video-amdgpu.mk                         | 16 ++++++++++------
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash
index 962cb0e16b..e69a7baab4 100644
--- a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash
+++ b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2023-February/003334.html
-sha256  4f04f0ea66f3ced0dcc58f617409860163a19c4e8c285cfb5285f36ba09cc061  xf86-video-amdgpu-23.0.0.tar.xz
-sha512  bf26f147629a34e84a0ae8435119e170b9c95edafcab1995b63bb8f55abef32f2efbf4536eb070e64b2ae1460424b1b27a4206cb9836d33ddc6dfbee404f718b  xf86-video-amdgpu-23.0.0.tar.xz
+# From https://lists.freedesktop.org/archives/amd-gfx/2025-July/127936.html
+sha256  7653cead024a6820ed1139958503278d78b4b3f80befcacf54ce87a5199b0ce2  xf86-video-amdgpu-25.0.0.tar.xz
+sha512  d143294fead7073c14100299ccab20d1f5eab8b7e36c1770b12aaade958211e1961f4353dc47123c3b9af9f7a911d913def71d25b83dab3dee1d289043869891  xf86-video-amdgpu-25.0.0.tar.xz
 # Locally computed
 sha256  58847c8e97190c401afa84b3f0b8b147379c876a184e99af2cb51bfd40ac8936  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
index 84f8e39ddd..688f09c7a1 100644
--- a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
+++ b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_AMDGPU_VERSION = 23.0.0
+XDRIVER_XF86_VIDEO_AMDGPU_VERSION = 25.0.0
 XDRIVER_XF86_VIDEO_AMDGPU_SOURCE = xf86-video-amdgpu-$(XDRIVER_XF86_VIDEO_AMDGPU_VERSION).tar.xz
 XDRIVER_XF86_VIDEO_AMDGPU_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_VIDEO_AMDGPU_LICENSE = MIT
@@ -17,12 +17,16 @@ XDRIVER_XF86_VIDEO_AMDGPU_DEPENDENCIES = \
 	xserver_xorg-server
 
 ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGL)$(BR2_PACKAGE_LIBEPOXY),yyy)
-XDRIVER_XF86_VIDEO_AMDGPU_CONF_OPTS += --enable-glamor
+XDRIVER_XF86_VIDEO_AMDGPU_CONF_OPTS += -Dglamor=enabled
 else
-XDRIVER_XF86_VIDEO_AMDGPU_CONF_OPTS += --disable-glamor
+XDRIVER_XF86_VIDEO_AMDGPU_CONF_OPTS += -Dglamor=disabled
 endif
 
-# xdriver_xf86-video-amdgpu requires O_CLOEXEC
-XDRIVER_XF86_VIDEO_AMDGPU_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+XDRIVER_XF86_VIDEO_AMDGPU_CONF_OPTS += -Dudev=enabled
+XDRIVER_XF86_VIDEO_AMDGPU_DEPENDENCIES += udev
+else
+XDRIVER_XF86_VIDEO_AMDGPU_CONF_OPTS += -Dudev=disabled
+endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
