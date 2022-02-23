Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BDA0C433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 15:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2918828C5;
	Wed, 23 Feb 2022 15:51:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WrXVlUZ0hS4z; Wed, 23 Feb 2022 15:51:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD2CF828AF;
	Wed, 23 Feb 2022 15:51:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3FE471BF83B
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 15:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2EA4160F81
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 15:51:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QxkBRHngffGW for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 15:51:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 24DAA60F7E
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 15:51:33 +0000 (UTC)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
 by mailout07.t-online.de (Postfix) with SMTP id 3BC45AB14
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 16:51:30 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.196.238]) by fwd85.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nMtvM-1scw4H0; Wed, 23 Feb 2022 16:51:28 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:44822)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nMtvM-0006iq-3p
 for buildroot@buildroot.org; Wed, 23 Feb 2022 16:51:28 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Wed, 23 Feb 2022 16:51:28 +0100
Message-Id: <20220223155128.818822-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1645631488-00014AB5-57B19F17/0/0 CLEAN NORMAL
X-TOI-MSGID: c18fa089-63ba-4ade-bcd4-aa0636b34d7d
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-mach64:
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add upstream commit to fix build with xorg-server 21.1 which was bumped
with commit d9185c6ba38430a017ed996c4180e141881ba570.

Fixes:
http://autobuild.buildroot.net/results/f0a/f0a0224a2b368c11236fcc7d14db5175c0a829d1/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...me-bool-to-boolean-for-OptionInfoRec.patch | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 package/x11r7/xdriver_xf86-video-mach64/0002-Rename-bool-to-boolean-for-OptionInfoRec.patch

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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
