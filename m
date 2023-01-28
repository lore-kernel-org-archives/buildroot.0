Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC10C6379F
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8523884059;
	Mon, 20 Feb 2023 23:45:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8523884059
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4quspNMTnGlD; Mon, 20 Feb 2023 23:45:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B80F780E42;
	Mon, 20 Feb 2023 23:45:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B80F780E42
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1ECBA1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D02141599
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D02141599
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cyg1B8WTgd3y for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D94041766
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D94041766
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B22C8648F; Mon, 20 Feb 2023 20:52:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Jan 2023 22:44:09 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: acc4570bf41d10573c73cda08defb385324becc6
X-Git-Newrev: 2952832a40b08e93bb3dc614bb2068b152b1919f
X-Patchwork-Hint: ignore
Message-Id: <20230220205242.4B22C8648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/kodi: fix armv5 build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2952832a40b08e93bb3dc614bb2068b152b1919f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Disable neon support when not available.

Fixes build error not yet found by autobuilders

/tmp/cc8LvPwi.s: Assembler messages:
/tmp/cc8LvPwi.s:28: Error: selected processor does not support `vldmia r1,{ q4-q7 }' in ARM mode
/tmp/cc8LvPwi.s:29: Error: selected processor does not support `vldmia r0,{ q8-q11 }' in ARM mode
/tmp/cc8LvPwi.s:30: Error: selected processor does not support `vmul.f32 q0,q8,d8[0]' in ARM mode
/tmp/cc8LvPwi.s:31: Error: selected processor does not support `vmul.f32 q1,q8,d10[0]' in ARM mode
/tmp/cc8LvPwi.s:32: Error: selected processor does not support `vmul.f32 q2,q8,d12[0]' in ARM mode
/tmp/cc8LvPwi.s:33: Error: selected processor does not support `vmul.f32 q3,q8,d14[0]' in ARM mode
/tmp/cc8LvPwi.s:34: Error: selected processor does not support `vmla.f32 q0,q9,d8[1]' in ARM mode
/tmp/cc8LvPwi.s:35: Error: selected processor does not support `vmla.f32 q1,q9,d10[1]' in ARM mode
/tmp/cc8LvPwi.s:36: Error: selected processor does not support `vmla.f32 q2,q9,d12[1]' in ARM mode
/tmp/cc8LvPwi.s:37: Error: selected processor does not support `vmla.f32 q3,q9,d14[1]' in ARM mode
/tmp/cc8LvPwi.s:38: Error: selected processor does not support `vmla.f32 q0,q10,d9[0]' in ARM mode
/tmp/cc8LvPwi.s:39: Error: selected processor does not support `vmla.f32 q1,q10,d11[0]' in ARM mode
/tmp/cc8LvPwi.s:40: Error: selected processor does not support `vmla.f32 q2,q10,d13[0]' in ARM mode
/tmp/cc8LvPwi.s:41: Error: selected processor does not support `vmla.f32 q3,q10,d15[0]' in ARM mode
/tmp/cc8LvPwi.s:42: Error: selected processor does not support `vmla.f32 q0,q11,d9[1]' in ARM mode
/tmp/cc8LvPwi.s:43: Error: selected processor does not support `vmla.f32 q1,q11,d11[1]' in ARM mode
/tmp/cc8LvPwi.s:44: Error: selected processor does not support `vmla.f32 q2,q11,d13[1]' in ARM mode
/tmp/cc8LvPwi.s:45: Error: selected processor does not support `vmla.f32 q3,q11,d15[1]' in ARM mode
/tmp/cc8LvPwi.s:46: Error: selected processor does not support `vstmia r0,{ q0-q3 }' in ARM mode

with this defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_STABLE=y
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
---
 package/kodi/kodi.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index dbe6c1e8f6..7d15e992fb 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -144,6 +144,14 @@ else
 KODI_CONF_OPTS += -DWITH_CPU=$(BR2_ARCH)
 endif
 
+ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
+KODI_CONF_OPTS += -DENABLE_NEON=ON
+else ifeq ($(BR2_aarch64),y)
+KODI_CONF_OPTS += -DENABLE_NEON=ON
+else
+KODI_CONF_OPTS += -DENABLE_NEON=OFF
+endif
+
 ifeq ($(BR2_X86_CPU_HAS_SSE),y)
 KODI_CONF_OPTS += -D_SSE_OK=ON -D_SSE_TRUE=ON
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
