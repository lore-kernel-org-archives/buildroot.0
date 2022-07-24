Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D3AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 19:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E278D40C6F;
	Sun, 24 Jul 2022 19:58:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E278D40C6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6jWgQKkhXo1g; Sun, 24 Jul 2022 19:58:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94735405D0;
	Sun, 24 Jul 2022 19:58:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94735405D0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AFCAE1BF20B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66AD340114
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:55:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66AD340114
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XFoGYYeVAhMe for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 19:55:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56B17405CD
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 19:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56B17405CD
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 95F1D85CC9; Sun, 24 Jul 2022 19:41:52 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 21:45:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6503b845343f0290f098e3d6fd792dff8e672227
X-Git-Newrev: 20c71ceea0363f0eb0ade4508e8bc78474587ba0
X-Patchwork-Hint: ignore
Message-Id: <20220724194152.95F1D85CC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-mach64:
 bump version to 6.9.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=20c71ceea0363f0eb0ade4508e8bc78474587ba0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed backported patch which is now included in this release.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...-Rename-bool-to-boolean-for-OptionInfoRec.patch | 84 ----------------------
 .../xdriver_xf86-video-mach64.hash                 | 10 ++-
 .../xdriver_xf86-video-mach64.mk                   |  6 +-
 3 files changed, 7 insertions(+), 93 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-mach64/0002-Rename-bool-to-boolean-for-OptionInfoRec.patch b/package/x11r7/xdriver_xf86-video-mach64/0002-Rename-bool-to-boolean-for-OptionInfoRec.patch
deleted file mode 100644
index fe3e21f8c2..0000000000
--- a/package/x11r7/xdriver_xf86-video-mach64/0002-Rename-bool-to-boolean-for-OptionInfoRec.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From 3ab2c144ef34199ceaf95115538a67f932e76f7d Mon Sep 17 00:00:00 2001
-From: Josselin Poiret <dev@jpoiret.xyz>
-Date: Thu, 18 Nov 2021 13:18:25 +0000
-Subject: [PATCH] Rename bool to boolean for OptionInfoRec.
-
-* src/aticonfig.c: Change uses of .value.bool to .value.boolean
-
-Downloaded from upstream commit
-https://gitlab.freedesktop.org/xorg/driver/xf86-video-mach64/-/commit/3ab2c144ef34199ceaf95115538a67f932e76f7d
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/aticonfig.c | 38 +++++++++++++++++++-------------------
- 1 file changed, 19 insertions(+), 19 deletions(-)
-
-diff --git a/src/aticonfig.c b/src/aticonfig.c
-index bad6474..6995b9a 100644
---- a/src/aticonfig.c
-+++ b/src/aticonfig.c
-@@ -311,42 +311,42 @@ ATIProcessOptions
- 
-     (void)memcpy(PublicOption, ATIPublicOptions, ATIPublicOptionSize);
- 
--#   define ProbeSparse   PublicOption[ATI_OPTION_PROBE_SPARSE].value.bool
--#   define Accel         PublicOption[ATI_OPTION_ACCEL].value.bool
--#   define BIOSDisplay   PrivateOption[ATI_OPTION_BIOS_DISPLAY].value.bool
--#   define Blend         PrivateOption[ATI_OPTION_BLEND].value.bool
--#   define CRTDisplay    PublicOption[ATI_OPTION_CRT_DISPLAY].value.bool
--#   define CRTScreen     PrivateOption[ATI_OPTION_CRT_SCREEN].value.bool
--#   define CSync         PublicOption[ATI_OPTION_CSYNC].value.bool
--#   define Devel         PrivateOption[ATI_OPTION_DEVEL].value.bool
--#   define HWCursor      PublicOption[ATI_OPTION_HWCURSOR].value.bool
-+#   define ProbeSparse   PublicOption[ATI_OPTION_PROBE_SPARSE].value.boolean
-+#   define Accel         PublicOption[ATI_OPTION_ACCEL].value.boolean
-+#   define BIOSDisplay   PrivateOption[ATI_OPTION_BIOS_DISPLAY].value.boolean
-+#   define Blend         PrivateOption[ATI_OPTION_BLEND].value.boolean
-+#   define CRTDisplay    PublicOption[ATI_OPTION_CRT_DISPLAY].value.boolean
-+#   define CRTScreen     PrivateOption[ATI_OPTION_CRT_SCREEN].value.boolean
-+#   define CSync         PublicOption[ATI_OPTION_CSYNC].value.boolean
-+#   define Devel         PrivateOption[ATI_OPTION_DEVEL].value.boolean
-+#   define HWCursor      PublicOption[ATI_OPTION_HWCURSOR].value.boolean
- 
- #ifdef XF86DRI_DEVEL
- 
--#   define IsPCI       PublicOption[ATI_OPTION_IS_PCI].value.bool
-+#   define IsPCI       PublicOption[ATI_OPTION_IS_PCI].value.boolean
- #   define DMAMode     PublicOption[ATI_OPTION_DMA_MODE].value.str
- #   define AGPMode     PublicOption[ATI_OPTION_AGP_MODE].value.num
- #   define AGPSize     PublicOption[ATI_OPTION_AGP_SIZE].value.num
--#   define LocalTex    PublicOption[ATI_OPTION_LOCAL_TEXTURES].value.bool
-+#   define LocalTex    PublicOption[ATI_OPTION_LOCAL_TEXTURES].value.boolean
- #   define BufferSize  PublicOption[ATI_OPTION_BUFFER_SIZE].value.num
- 
- #endif /* XF86DRI_DEVEL */
- 
- #ifdef TV_OUT
- 
--#   define TvOut        PublicOption[ATI_OPTION_TV_OUT].value.bool
-+#   define TvOut        PublicOption[ATI_OPTION_TV_OUT].value.boolean
- #   define TvStd        PublicOption[ATI_OPTION_TV_STD].value.str
- 
- #endif /* TV_OUT */
- 
--#   define CacheMMIO     PublicOption[ATI_OPTION_MMIO_CACHE].value.bool
--#   define TestCacheMMIO PublicOption[ATI_OPTION_TEST_MMIO_CACHE].value.bool
--#   define PanelDisplay  PublicOption[ATI_OPTION_PANEL_DISPLAY].value.bool
--#   define ShadowFB      PublicOption[ATI_OPTION_SHADOW_FB].value.bool
--#   define SWCursor      PublicOption[ATI_OPTION_SWCURSOR].value.bool
-+#   define CacheMMIO     PublicOption[ATI_OPTION_MMIO_CACHE].value.boolean
-+#   define TestCacheMMIO PublicOption[ATI_OPTION_TEST_MMIO_CACHE].value.boolean
-+#   define PanelDisplay  PublicOption[ATI_OPTION_PANEL_DISPLAY].value.boolean
-+#   define ShadowFB      PublicOption[ATI_OPTION_SHADOW_FB].value.boolean
-+#   define SWCursor      PublicOption[ATI_OPTION_SWCURSOR].value.boolean
- #   define AccelMethod   PublicOption[ATI_OPTION_ACCELMETHOD].value.str
--#   define RenderAccel   PublicOption[ATI_OPTION_RENDER_ACCEL].value.bool
--#   define LCDSync       PrivateOption[ATI_OPTION_LCDSYNC].value.bool
-+#   define RenderAccel   PublicOption[ATI_OPTION_RENDER_ACCEL].value.boolean
-+#   define LCDSync       PrivateOption[ATI_OPTION_LCDSYNC].value.boolean
- 
- #   define ReferenceClock \
-         PublicOption[ATI_OPTION_REFERENCE_CLOCK].value.freq.freq
--- 
-GitLab
-
diff --git a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.hash b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.hash
index 55acd74652..e33036f4c9 100644
--- a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.hash
+++ b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-May/002896.html
-md5 0e12f9a3b5659e1e27e03adc42b04d99  xf86-video-mach64-6.9.6.tar.bz2
-sha1 1fdf0c3488ab88cb46b563efee166a5d54a01932  xf86-video-mach64-6.9.6.tar.bz2
-sha256 7a0707c71bb522430f83bb5e9d9ee697e661e35534a3a2d10834f86b327a3c9c  xf86-video-mach64-6.9.6.tar.bz2
-sha512 687f6ac60491b704d5c4788463763d2f4bf725611e10bd2163156963fe0a8fdbffe0a1b7c737eff131f01759e43b5ec3544a7dabe66a67e85b286dcb969da2f1  xf86-video-mach64-6.9.6.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-July/003183.html
+sha256  50d78abffa7c8227e6f187976f23a244ae2095e97f08de275529b70fba9481ba  xf86-video-mach64-6.9.7.tar.xz
+sha512  a511525ceb8eab95d28e815f462897ead8b99ac455c548598cc061907636e1acff8cad66621feeb33558dbfdbf59ca0648422aae8edaab7d1dcd7e386348177b  xf86-video-mach64-6.9.7.tar.xz
 # Locally computed
-sha256 a7d68021893bced0d709338a59a137c74b11e624880e110e4a2f14ccef475120  COPYING
+sha256  a7d68021893bced0d709338a59a137c74b11e624880e110e4a2f14ccef475120  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
index 7b4fa80834..2e41208ab4 100644
--- a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
+++ b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_MACH64_VERSION = 6.9.6
-XDRIVER_XF86_VIDEO_MACH64_SOURCE = xf86-video-mach64-$(XDRIVER_XF86_VIDEO_MACH64_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_MACH64_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_MACH64_VERSION = 6.9.7
+XDRIVER_XF86_VIDEO_MACH64_SOURCE = xf86-video-mach64-$(XDRIVER_XF86_VIDEO_MACH64_VERSION).tar.xz
+XDRIVER_XF86_VIDEO_MACH64_SITE = https://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_MACH64_LICENSE = MIT
 XDRIVER_XF86_VIDEO_MACH64_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_MACH64_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
