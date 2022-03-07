Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022FEC433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 10:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6F644012D;
	Mon,  7 Mar 2022 10:42:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ST1OqPa90Bwo; Mon,  7 Mar 2022 10:42:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C80440396;
	Mon,  7 Mar 2022 10:42:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D26251BF3A8
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 10:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C21EA40914
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 10:42:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5zNk6GwuCWBK for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 10:42:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE36940910
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 10:42:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 338CD82A79; Mon,  7 Mar 2022 10:33:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 7 Mar 2022 11:32:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0e60d4f11cd56544d6c23a1f7c3c8bbd98edbec3
X-Git-Newrev: 5beea70361d08cf737c6be4fafd7f8e32b8434b4
X-Patchwork-Hint: ignore
Message-Id: <20220307103351.338CD82A79@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-mach64:
 fix build error
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

commit: https://git.buildroot.net/buildroot/commit/?id=5beea70361d08cf737c6be4fafd7f8e32b8434b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add upstream commit to fix build with xorg-server 21.1 which was bumped
with commit d9185c6ba38430a017ed996c4180e141881ba570.

Fixes:
http://autobuild.buildroot.net/results/f0a/f0a0224a2b368c11236fcc7d14db5175c0a829d1/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-Rename-bool-to-boolean-for-OptionInfoRec.patch | 84 ++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/package/x11r7/xdriver_xf86-video-mach64/0002-Rename-bool-to-boolean-for-OptionInfoRec.patch b/package/x11r7/xdriver_xf86-video-mach64/0002-Rename-bool-to-boolean-for-OptionInfoRec.patch
new file mode 100644
index 0000000000..fe3e21f8c2
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-mach64/0002-Rename-bool-to-boolean-for-OptionInfoRec.patch
@@ -0,0 +1,84 @@
+From 3ab2c144ef34199ceaf95115538a67f932e76f7d Mon Sep 17 00:00:00 2001
+From: Josselin Poiret <dev@jpoiret.xyz>
+Date: Thu, 18 Nov 2021 13:18:25 +0000
+Subject: [PATCH] Rename bool to boolean for OptionInfoRec.
+
+* src/aticonfig.c: Change uses of .value.bool to .value.boolean
+
+Downloaded from upstream commit
+https://gitlab.freedesktop.org/xorg/driver/xf86-video-mach64/-/commit/3ab2c144ef34199ceaf95115538a67f932e76f7d
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/aticonfig.c | 38 +++++++++++++++++++-------------------
+ 1 file changed, 19 insertions(+), 19 deletions(-)
+
+diff --git a/src/aticonfig.c b/src/aticonfig.c
+index bad6474..6995b9a 100644
+--- a/src/aticonfig.c
++++ b/src/aticonfig.c
+@@ -311,42 +311,42 @@ ATIProcessOptions
+ 
+     (void)memcpy(PublicOption, ATIPublicOptions, ATIPublicOptionSize);
+ 
+-#   define ProbeSparse   PublicOption[ATI_OPTION_PROBE_SPARSE].value.bool
+-#   define Accel         PublicOption[ATI_OPTION_ACCEL].value.bool
+-#   define BIOSDisplay   PrivateOption[ATI_OPTION_BIOS_DISPLAY].value.bool
+-#   define Blend         PrivateOption[ATI_OPTION_BLEND].value.bool
+-#   define CRTDisplay    PublicOption[ATI_OPTION_CRT_DISPLAY].value.bool
+-#   define CRTScreen     PrivateOption[ATI_OPTION_CRT_SCREEN].value.bool
+-#   define CSync         PublicOption[ATI_OPTION_CSYNC].value.bool
+-#   define Devel         PrivateOption[ATI_OPTION_DEVEL].value.bool
+-#   define HWCursor      PublicOption[ATI_OPTION_HWCURSOR].value.bool
++#   define ProbeSparse   PublicOption[ATI_OPTION_PROBE_SPARSE].value.boolean
++#   define Accel         PublicOption[ATI_OPTION_ACCEL].value.boolean
++#   define BIOSDisplay   PrivateOption[ATI_OPTION_BIOS_DISPLAY].value.boolean
++#   define Blend         PrivateOption[ATI_OPTION_BLEND].value.boolean
++#   define CRTDisplay    PublicOption[ATI_OPTION_CRT_DISPLAY].value.boolean
++#   define CRTScreen     PrivateOption[ATI_OPTION_CRT_SCREEN].value.boolean
++#   define CSync         PublicOption[ATI_OPTION_CSYNC].value.boolean
++#   define Devel         PrivateOption[ATI_OPTION_DEVEL].value.boolean
++#   define HWCursor      PublicOption[ATI_OPTION_HWCURSOR].value.boolean
+ 
+ #ifdef XF86DRI_DEVEL
+ 
+-#   define IsPCI       PublicOption[ATI_OPTION_IS_PCI].value.bool
++#   define IsPCI       PublicOption[ATI_OPTION_IS_PCI].value.boolean
+ #   define DMAMode     PublicOption[ATI_OPTION_DMA_MODE].value.str
+ #   define AGPMode     PublicOption[ATI_OPTION_AGP_MODE].value.num
+ #   define AGPSize     PublicOption[ATI_OPTION_AGP_SIZE].value.num
+-#   define LocalTex    PublicOption[ATI_OPTION_LOCAL_TEXTURES].value.bool
++#   define LocalTex    PublicOption[ATI_OPTION_LOCAL_TEXTURES].value.boolean
+ #   define BufferSize  PublicOption[ATI_OPTION_BUFFER_SIZE].value.num
+ 
+ #endif /* XF86DRI_DEVEL */
+ 
+ #ifdef TV_OUT
+ 
+-#   define TvOut        PublicOption[ATI_OPTION_TV_OUT].value.bool
++#   define TvOut        PublicOption[ATI_OPTION_TV_OUT].value.boolean
+ #   define TvStd        PublicOption[ATI_OPTION_TV_STD].value.str
+ 
+ #endif /* TV_OUT */
+ 
+-#   define CacheMMIO     PublicOption[ATI_OPTION_MMIO_CACHE].value.bool
+-#   define TestCacheMMIO PublicOption[ATI_OPTION_TEST_MMIO_CACHE].value.bool
+-#   define PanelDisplay  PublicOption[ATI_OPTION_PANEL_DISPLAY].value.bool
+-#   define ShadowFB      PublicOption[ATI_OPTION_SHADOW_FB].value.bool
+-#   define SWCursor      PublicOption[ATI_OPTION_SWCURSOR].value.bool
++#   define CacheMMIO     PublicOption[ATI_OPTION_MMIO_CACHE].value.boolean
++#   define TestCacheMMIO PublicOption[ATI_OPTION_TEST_MMIO_CACHE].value.boolean
++#   define PanelDisplay  PublicOption[ATI_OPTION_PANEL_DISPLAY].value.boolean
++#   define ShadowFB      PublicOption[ATI_OPTION_SHADOW_FB].value.boolean
++#   define SWCursor      PublicOption[ATI_OPTION_SWCURSOR].value.boolean
+ #   define AccelMethod   PublicOption[ATI_OPTION_ACCELMETHOD].value.str
+-#   define RenderAccel   PublicOption[ATI_OPTION_RENDER_ACCEL].value.bool
+-#   define LCDSync       PrivateOption[ATI_OPTION_LCDSYNC].value.bool
++#   define RenderAccel   PublicOption[ATI_OPTION_RENDER_ACCEL].value.boolean
++#   define LCDSync       PrivateOption[ATI_OPTION_LCDSYNC].value.boolean
+ 
+ #   define ReferenceClock \
+         PublicOption[ATI_OPTION_REFERENCE_CLOCK].value.freq.freq
+-- 
+GitLab
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
