Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AE4C5AD5A
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 16:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 205D480E83;
	Sat, 15 Aug 2026 16:20:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CnbQ5UtD71tM; Sat, 15 Aug 2026 16:20:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37CB980E85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786810821;
	bh=Er0/Yl8KhEzW68uhovjenraOaf9Szqsdji5578gUYBo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hkUDfWIWrbQzK2BGoI+5p6WsOMOGOgcu3U31UqSzEx3xlNxU3dV2Nia8dRVGS7pKn
	 TbFie6jQFXf174fQ+z25fSw2PF54rIcTNja94caDKlnS0J6qM3P109FC+3q9Q2mkQ6
	 GO7qDRkFkddDQniA37ojU7WwFbDEyegwMYnc+hsbJNleWPGOpurselZsT7oCRSIAlX
	 LRWEQy90xm0TU2f9BvykmI0+vJZW6DetZyypUSg//tLuNyfHnaZRr7ERVtEaUs06D0
	 4Ieo7XxjWF0F+zLN9TL2zaPIyGJbqctFykW463BPIcFaExx/o+Z2BovgCVVmz2wlCt
	 EOa6TVI1X3vQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37CB980E85;
	Sat, 15 Aug 2026 16:20:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 605A1109
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 16:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52179407E9
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 16:20:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RjGz-F5eu8-P for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 16:20:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F65C407E5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F65C407E5
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 16:20:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE7508D758; Sat, 15 Aug 2026 16:19:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 15 Aug 2026 18:17:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ec31fb67f5174c195f3c29b1f340c27dbfb42d1a
X-Git-Newrev: 060ab51e0a0969401eb57480bfb20ea4b24cccfa
X-Patchwork-Hint: ignore
Message-Id: <20260815161927.EE7508D758@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: Fix build with ARM
 soft-float
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/060ab51e0a0969401eb57480bfb20ea4b24cccfa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit 4ab91a29d8931105d3ff8f6263c59a5438ada1a1 bumped the
package to version 26.1.3 which first included upstream commit
https://gitlab.freedesktop.org/mesa/mesa/-/commit/94a6274275e6a16255357579898b366f858e270c

causing a build error with this defconfig

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_STABLE=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
BR2_PACKAGE_MESA3D_OPENGL_GLX=y
BR2_PACKAGE_XORG7=y

Add a patch to disable some assembler intructions which are not
available with a toolchain configure for soft-float.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...math.c-do-not-use-arm-fpu-instructions-if.patch | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/package/mesa3d/0004-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch b/package/mesa3d/0004-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch
new file mode 100644
index 0000000000..96d1902061
--- /dev/null
+++ b/package/mesa3d/0004-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch
@@ -0,0 +1,55 @@
+From 345b14a820a557b72f218637cb37ef39947b1f50 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Wed, 1 Jul 2026 22:48:15 +0200
+Subject: [PATCH] src/util/u_math.c: do not use arm fpu instructions if fpu is
+ not available
+
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/42682>
+
+Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/42682
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/util/u_math.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/util/u_math.c b/src/util/u_math.c
+index 722eac7f733..5683766a417 100644
+--- a/src/util/u_math.c
++++ b/src/util/u_math.c
+@@ -87,6 +87,7 @@ util_fpstate_get(void)
+    }
+ #endif
+ #if DETECT_ARCH_ARM
++#if !defined(__SOFTFP__)
+    if (util_get_cpu_caps()->has_neon) {
+ #ifdef HAVE___BUILTIN_ARM_GET_FPSCR
+       fpstate = __builtin_arm_get_fpscr();
+@@ -94,6 +95,7 @@ util_fpstate_get(void)
+       __asm__ volatile("vmrs %0, fpscr" : "=r"(fpstate));
+ #endif
+    }
++#endif
+ #elif DETECT_ARCH_AARCH64
+    {
+ #ifdef HAVE___BUILTIN_AARCH64_GET_FPCR
+@@ -154,6 +156,7 @@ util_fpstate_set(unsigned fpstate)
+    }
+ #endif
+ #if DETECT_ARCH_ARM
++#if !defined(__SOFTFP__)
+    if (util_get_cpu_caps()->has_neon) {
+ #ifdef HAVE___BUILTIN_ARM_SET_FPSCR
+       __builtin_arm_set_fpscr(fpstate);
+@@ -161,6 +164,7 @@ util_fpstate_set(unsigned fpstate)
+       __asm__ volatile("vmsr fpscr, %0" :: "r"(fpstate));
+ #endif
+    }
++#endif
+ #elif DETECT_ARCH_AARCH64
+    {
+ #ifdef HAVE___BUILTIN_AARCH64_SET_FPCR
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
