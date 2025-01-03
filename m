Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC395C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2D03606D5;
	Fri, 28 Feb 2025 16:50:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ocytcgoi2Mvr; Fri, 28 Feb 2025 16:50:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D5F86FB1E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D5F86FB1E;
	Fri, 28 Feb 2025 16:50:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 160D194F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25B3742EA7
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Ui-f3gDl65G for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C7C1419E4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C7C1419E4
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 168F386612; Fri, 28 Feb 2025 16:29:57 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 3 Jan 2025 22:34:01 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 696de595e028daaec4d66792bb2d3db74c72f07e
X-Git-Newrev: ba2fb599cd002b57fa70e978d91884c98d8aad05
X-Patchwork-Hint: ignore
Message-Id: <20250228162957.168F386612@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pixman: bump to
 version 0.44.2
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0714480886810975148=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0714480886810975148==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ba2fb599cd002b57fa70e978d91884c98d8aad05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For release announces since 0.42.2, see:
0.43.0: [1], 0.43.2: [2], 0.43.4: [3], 0.44.0: [4], 0.44.2: [5].

In version 0.43.0, pixman dropped the autotools build system, and
moved to meson, so this package update follows along. Some notes:

- The arm-iwmmxt has no equivalent (in 0.44.2, there's a patch in
  master re-adding such an option)

- The new mmx, sse2, ssse3 and a64-neon options are handled.

- Patch 0001 is no longer needed as the new build system as a 'tests'
  option that allows to disable test.

- Patches 0002 and 0003 are dropped as they are all upstream.

This bump was tested with a significant subset of the pixman reverse
dependencies:

BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_FOOT=y
BR2_PACKAGE_IGT_GPU_TOOLS=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_XDRIVER_XF86_VIDEO_FBTURBO=y
BR2_PACKAGE_WLROOTS=y
BR2_PACKAGE_WLROOTS_X11=y
BR2_PACKAGE_WLROOTS_XWAYLAND=y
BR2_PACKAGE_QEMU=y
BR2_PACKAGE_QEMU_SYSTEM=y

See test result at:
https://gitlab.com/tpetazzoni/buildroot/-/pipelines/1609533944. Note
that the overall pipeline failed because the build of Qemu fails on
RISC-V for completely unrelated reasons.

[1] https://lists.cairographics.org/archives/cairo-announce/2024-January/000230.html
[2] https://lists.cairographics.org/archives/cairo-announce/2024-January/000233.html
[3] https://lists.cairographics.org/archives/cairo-announce/2024-February/000234.html
[4] https://lists.cairographics.org/archives/cairo-announce/2024-November/000235.html
[5] https://lists.cairographics.org/archives/cairo-announce/2024-December/000236.html

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Julien: add links to release announces]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |   1 -
 package/pixman/0001-Disable-tests.patch            |  29 ------
 ...n-Adjust-arm-assembly-for-binutils-change.patch | 108 ---------------------
 ...combine-float.c-fix-inlining-failed-error.patch |  56 -----------
 package/pixman/pixman.hash                         |   5 +-
 package/pixman/pixman.mk                           |  54 ++++++++---
 6 files changed, 41 insertions(+), 212 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 7e575dc950..84b1e7ae00 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -986,7 +986,6 @@ package/pifmrds/0003-Makefile-fix-static-link.patch lib_patch.Upstream
 package/pigpio/S50pigpio Shellcheck lib_sysv.Variables
 package/pistache/0001-src-common-transport.cc-fallback-value-for-RUSAGE_TH.patch lib_patch.Upstream
 package/pistache/0002-src-server-listener.cc-fix-libressl-build.patch lib_patch.Upstream
-package/pixman/0001-Disable-tests.patch lib_patch.Upstream
 package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch lib_patch.Upstream
 package/pkgconf/pkg-config.in Shellcheck
 package/poke/0001-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch lib_patch.Upstream
diff --git a/package/pixman/0001-Disable-tests.patch b/package/pixman/0001-Disable-tests.patch
deleted file mode 100644
index dfadd69a67..0000000000
--- a/package/pixman/0001-Disable-tests.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 9b8132738c364fc3c886e81e7d383aaff80dc867 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sat, 5 Dec 2015 12:00:53 +0100
-Subject: [PATCH] Disable tests
-
-Tests are causing build failures on some architectures that are missing
-a proper fenv.h, so just disable them.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
----
-Status: Buildroot specific, not suitable for upstream in this state.
----
- Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 5137c9e..eae79fd 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1,4 +1,4 @@
--SUBDIRS = pixman demos test
-+SUBDIRS = pixman demos
- 
- pkgconfigdir=$(libdir)/pkgconfig
- pkgconfig_DATA=pixman-1.pc
--- 
-1.9.1
-
diff --git a/package/pixman/0002-pixman-Adjust-arm-assembly-for-binutils-change.patch b/package/pixman/0002-pixman-Adjust-arm-assembly-for-binutils-change.patch
deleted file mode 100644
index 2f0fe9f01a..0000000000
--- a/package/pixman/0002-pixman-Adjust-arm-assembly-for-binutils-change.patch
+++ /dev/null
@@ -1,108 +0,0 @@
-From 9c000faabe1730c1ec7dbefe7e290e025adf7b69 Mon Sep 17 00:00:00 2001
-From: Mike Hommey <mh@glandium.org>
-Date: Fri, 12 Jul 2024 11:11:17 -0400
-Subject: [PATCH] pixman: Adjust arm assembly for binutils change
-
-A change in the latest version of binutils broke building pixman for arm.
-
-The binutils change:
-https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=226749d5a6ff0d5c607d6428d6c81e1e7e7a994b
-
-Closes: https://gitlab.freedesktop.org/pixman/pixman/-/issues/96
-(cherry picked from commit 865e6ce00bb79a6b925ed4c2c436e1533e4472aa)
-Upstream: https://gitlab.freedesktop.org/pixman/pixman/-/commit/865e6ce00bb79a6b925ed4c2c436e1533e4472aa
-[Peter: rebase on 0.42.2]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- pixman/pixman-arm-simd-asm.S | 44 ++++++++++++++++++------------------
- 1 file changed, 22 insertions(+), 22 deletions(-)
-
-diff --git a/pixman/pixman-arm-simd-asm.S b/pixman/pixman-arm-simd-asm.S
-index a74a0a8..959a0ba 100644
---- a/pixman/pixman-arm-simd-asm.S
-+++ b/pixman/pixman-arm-simd-asm.S
-@@ -818,13 +818,13 @@ generate_composite_function \
- .macro over_white_8888_8888_ca_1pixel_tail
-         mvn     TMP0, WK1
-         teq     WK1, WK1, asr #32
--        bne     01f
--        bcc     03f
-+        bne     1f
-+        bcc     3f
-         mov     WK3, WK1
--        b       02f
--01:     over_white_8888_8888_ca_combine WK1, WK3
--02:     pixst   , 4, 3, DST
--03:
-+        b       2f
-+1:     over_white_8888_8888_ca_combine WK1, WK3
-+2:     pixst   , 4, 3, DST
-+3:
- .endm
- 
- .macro over_white_8888_8888_ca_2pixels_head
-@@ -835,21 +835,21 @@ generate_composite_function \
-         pixld   , 8, 3, DST
-         mvn     TMP0, WK1
-         teq     WK1, WK1, asr #32
--        bne     01f
-+        bne     1f
-         movcs   WK3, WK1
--        bcs     02f
-+        bcs     2f
-         teq     WK2, #0
--        beq     05f
--        b       02f
--01:     over_white_8888_8888_ca_combine WK1, WK3
--02:     mvn     TMP0, WK2
-+        beq     5f
-+        b       2f
-+1:     over_white_8888_8888_ca_combine WK1, WK3
-+2:     mvn     TMP0, WK2
-         teq     WK2, WK2, asr #32
--        bne     03f
-+        bne     3f
-         movcs   WK4, WK2
--        b       04f
--03:     over_white_8888_8888_ca_combine WK2, WK4
--04:     pixst   , 8, 3, DST
--05:
-+        b       4f
-+3:     over_white_8888_8888_ca_combine WK2, WK4
-+4:     pixst   , 8, 3, DST
-+5:
- .endm
- 
- .macro over_white_8888_8888_ca_process_head  cond, numbytes, firstreg, unaligned_src, unaligned_mask, preload
-@@ -1065,9 +1065,9 @@ generate_composite_function \
-   .if offset != 0
-         ldrb    ORIG_W, [SRC, #offset]
-   .endif
--        beq     01f
-+        beq     1f
-         teq     STRIDE_M, #0xFF
--        beq     02f
-+        beq     2f
-  .endif
-         uxtb16  SCRATCH, d                 /* rb_dest */
-         uxtb16  d, d, ror #8               /* ag_dest */
-@@ -1077,13 +1077,13 @@ generate_composite_function \
-         uxtab16 d, d, d, ror #8
-         mov     SCRATCH, SCRATCH, ror #8
-         sel     d, SCRATCH, d
--        b       02f
-+        b       2f
-  .if offset == 0
- 48:     /* Last mov d,#0 of the set - used as part of shortcut for
-          * source values all 0 */
-  .endif
--01:     mov     d, #0
--02:
-+1:     mov     d, #0
-+2:
- .endm
- 
- .macro in_reverse_8888_8888_tail  numbytes, reg1, reg2, reg3, reg4
--- 
-2.39.5
-
diff --git a/package/pixman/0003-pixman-combine-float.c-fix-inlining-failed-error.patch b/package/pixman/0003-pixman-combine-float.c-fix-inlining-failed-error.patch
deleted file mode 100644
index 1c4b153fc5..0000000000
--- a/package/pixman/0003-pixman-combine-float.c-fix-inlining-failed-error.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 643f098a3922592c82f3ea19668a1596d92a3e7b Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Tue, 16 Jul 2024 15:31:16 +0800
-Subject: [PATCH] pixman-combine-float.c: fix inlining failed error
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Refer [1], always-inline is not suggested to be used if you have indirect
-calls. so replace force_inline with inline to fix error like:
-In function ‘combine_inner’,
-    inlined from ‘combine_soft_light_ca_float’ at ../pixman/pixman-combine-float.c:655:511:
-../pixman/pixman-combine-float.c:655:211: error: inlining failed in call to ‘always_inline’ ‘combine_soft_light_c’: function not considered for inlining
-
-Test with gcc-9 and gcc-14, both works well
-
-[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=115679
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-Upstream: https://gitlab.freedesktop.org/pixman/pixman/-/commit/643f098a3922592c82f3ea19668a1596d92a3e7b
----
- pixman/pixman-combine-float.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/pixman/pixman-combine-float.c b/pixman/pixman-combine-float.c
-index e1f8030..230164f 100644
---- a/pixman/pixman-combine-float.c
-+++ b/pixman/pixman-combine-float.c
-@@ -261,7 +261,7 @@ get_factor (combine_factor_t factor, float sa, float da)
- }
- 
- #define MAKE_PD_COMBINERS(name, a, b)					\
--    static float force_inline						\
-+    static float							\
-     pd_combine_ ## name (float sa, float s, float da, float d)		\
-     {									\
- 	const float fa = get_factor (a, sa, da);			\
-@@ -360,13 +360,13 @@ MAKE_PD_COMBINERS (conjoint_xor,		ONE_MINUS_DA_OVER_SA,		ONE_MINUS_SA_OVER_DA)
-  */
- 
- #define MAKE_SEPARABLE_PDF_COMBINERS(name)				\
--    static force_inline float						\
-+    static float							\
-     combine_ ## name ## _a (float sa, float s, float da, float d)	\
-     {									\
- 	return da + sa - da * sa;					\
-     }									\
-     									\
--    static force_inline float						\
-+    static float							\
-     combine_ ## name ## _c (float sa, float s, float da, float d)	\
-     {									\
- 	float f = (1 - sa) * d + (1 - da) * s;				\
--- 
-2.47.1
-
diff --git a/package/pixman/pixman.hash b/package/pixman/pixman.hash
index 78407bf048..c49b9c9e76 100644
--- a/package/pixman/pixman.hash
+++ b/package/pixman/pixman.hash
@@ -1,6 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-October/003228.html
-sha256  5747d2ec498ad0f1594878cc897ef5eb6c29e91c53b899f7f71b506785fc1376  pixman-0.42.2.tar.xz
-sha512  3476e2676e66756b1af61b1e532cd80c985c191fb7956eb01702b419726cce99e79163b7f287f74f66414680e7396d13c3fee525cd663f12b6ac4877070ff4e8  pixman-0.42.2.tar.xz
+# From https://lists.cairographics.org/archives/cairo/2024-December/029586.html
+sha512  b24907f9a0bf6a9aa3278d31986c562c5f2d68f8c178021497c8648aca9f91e4c6f1ecfacf93eb01ba4f03ce4cfc5970fc40bb0fe6724bac9210fc57da09cba4  pixman-0.44.2.tar.xz
 
 # Locally computed
 sha256  fac9270f0987b96ff4533fca3548c633e02083cbba4a0172a3b149b2e4019793  COPYING
diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 8a4f16318f..391950cbfc 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIXMAN_VERSION = 0.42.2
+PIXMAN_VERSION = 0.44.2
 PIXMAN_SOURCE = pixman-$(PIXMAN_VERSION).tar.xz
 PIXMAN_SITE = https://xorg.freedesktop.org/releases/individual/lib
 PIXMAN_LICENSE = MIT
@@ -15,14 +15,16 @@ PIXMAN_INSTALL_STAGING = YES
 PIXMAN_DEPENDENCIES = host-pkgconf
 HOST_PIXMAN_DEPENDENCIES = host-pkgconf
 
-# For 0001-Disable-tests.patch
-PIXMAN_AUTORECONF = YES
-
 # don't build gtk based demos
 PIXMAN_CONF_OPTS = \
-	--disable-gtk \
-	--disable-loongson-mmi \
-	--disable-arm-iwmmxt
+	-Dloongson-mmi=disabled \
+	-Dvmx=disabled \
+	-Dmips-dspr2=disabled \
+	-Dopenmp=disabled \
+	-Dgnuplot=false \
+	-Dgtk=disabled \
+	-Dlibpng=disabled \
+	-Dtests=disabled
 
 # Affects only tests, and we don't build tests (see
 # 0001-Disable-tests.patch). See
@@ -31,21 +33,45 @@ PIXMAN_CONF_OPTS = \
 # test executable".
 PIXMAN_IGNORE_CVES += CVE-2023-37769
 
+ifeq ($(BR2_X86_CPU_HAS_MMX),y)
+PIXMAN_CONF_OPTS += -Dmmx=enabled
+else
+PIXMAN_CONF_OPTS += -Dmmx=disabled
+endif
+
+ifeq ($(BR2_X86_CPU_HAS_SSE2),y)
+PIXMAN_CONF_OPTS += -Dsse2=enabled
+else
+PIXMAN_CONF_OPTS += -Dsse2=disabled
+endif
+
+ifeq ($(BR2_X86_CPU_HAS_SSSE3),y)
+PIXMAN_CONF_OPTS += -Dssse3=enabled
+else
+PIXMAN_CONF_OPTS += -Dssse3=disabled
+endif
+
 # The ARM SIMD code from pixman requires a recent enough ARM core, but
 # there is a runtime CPU check that makes sure it doesn't get used if
 # the HW doesn't support it. The only case where the ARM SIMD code
 # cannot be *built* at all is when the platform doesn't support ARM
 # instructions at all, so we have to disable that explicitly.
 ifeq ($(BR2_ARM_CPU_HAS_ARM),y)
-PIXMAN_CONF_OPTS += --enable-arm-simd
+PIXMAN_CONF_OPTS += -Darm-simd=enabled
 else
-PIXMAN_CONF_OPTS += --disable-arm-simd
+PIXMAN_CONF_OPTS += -Darm-simd=disabled
 endif
 
 ifeq ($(BR2_ARM_CPU_HAS_ARM)$(BR2_ARM_CPU_HAS_NEON),yy)
-PIXMAN_CONF_OPTS += --enable-arm-neon
+PIXMAN_CONF_OPTS += -Dneon=enabled
 else
-PIXMAN_CONF_OPTS += --disable-arm-neon
+PIXMAN_CONF_OPTS += -Dneon=disabled
+endif
+
+ifeq ($(BR2_aarch64)$(BR2_ARM_CPU_HAS_NEON),yy)
+PIXMAN_CONF_OPTS += -Da64-neon=enabled
+else
+PIXMAN_CONF_OPTS += -Da64-neon=disabled
 endif
 
 PIXMAN_CFLAGS = $(TARGET_CFLAGS)
@@ -54,7 +80,5 @@ ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_101737),y)
 PIXMAN_CFLAGS += -O0
 endif
 
-PIXMAN_CONF_OPTS += CFLAGS="$(PIXMAN_CFLAGS)"
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+$(eval $(meson-package))
+$(eval $(host-meson-package))

--===============0714480886810975148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0714480886810975148==--
