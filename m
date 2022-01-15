Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A930FC433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 22:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BA0681A9C;
	Sat, 15 Jan 2022 22:54:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XJM_4mHNUkrU; Sat, 15 Jan 2022 22:54:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2ADE282681;
	Sat, 15 Jan 2022 22:54:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E22541BF373
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 22:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D051882681
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 22:53:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qw_0Q2_MvJeB for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 22:53:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 24A6F81A9C
 for <buildroot@busybox.net>; Sat, 15 Jan 2022 22:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642287233;
 bh=6ty5ArQkZ0EK86HVkAhuiV+jZPTimt0cZC3YjGSZeU8=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=GkvtFVxvVueCIiWMXjKgN8h30Kr/wdwwsMkakVa8PfQDU00MHAfo/L6WxvmoO/hOE
 wHa8IuXx6aYjB7vaOWw4N7IoYzirguq3E6uufxFUXl3HsH892nneKNLAkpmoZpBBWE
 gXoJHKWFQvL43DGhb31JdZlhOvvj0ZQbLX2Wo7TY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.238]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPogF-1mulKV37Lv-00MtkD; Sat, 15
 Jan 2022 23:53:52 +0100
Date: Sat, 15 Jan 2022 23:53:51 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220115235351.744cbf77@gmx.net>
In-Reply-To: <20220109150304.45e12aea@windsurf>
References: <20200306203410.25008-1-ps.report@gmx.net>
 <20220109150304.45e12aea@windsurf>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:vC1bChZnHFNzfc8lKbNq2OWInXdsgcyqDFe/T4vPh7c7UsvMXAB
 dC8VzVQ0nBoDYrfoO1zLROutTzoN3Udwaf+RjNE/0bNDNW2icNvQNoR+BypdkUuv7E58Dmq
 wAikonI1Xlc2oVDX4TRUNXFk6qzqqCEJH0XDJPDAQwF4BPbPQt9tC7jCYn4fUcu8crAf9rn
 WbgV0O7ng0LkKogM1GJrA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wGa4BlY5/q4=:jn9XPEY4WuZ2wJtCGG0rRW
 YvQnyiH+uK7QpD1YCCcY3LEaldGyZwiYIutCgSdH87I9KSDE1ESGQAYCtUufAJi6EB06iroHM
 9LKgPn4J4nmErTcLBIiE1L8GVw63Zff9jAR/IIeg9Rjh05I+kwgv+7bH5x2EJBadaDi6VNTq1
 qkDo807We9GonQYdfJy8aEY/UslVvtUnXuFPB6ePyc+bBwAG3dMVd86EQnRFettd56pa5f4Up
 lPCSAnrBk5lLIdue87iiYYA2oIS0T3Tcaa8z/9n2kCSEfSlC9eVmJ2ttATvpNr9CwiCWfejwn
 q1CxUDFC95htt0YecwCGp36dA59al2pbwCMu75k0pZVdiDKqriOJQ5trmufBykkL1sZh8jvfF
 HrDGonvQ2ZSyiDADSMit5SXchaD69v8on8+4cN29VpEOKPvSRIn1bE4cp30DzydufaYHccN8P
 qF3UsNM/6S6WUsdFcdH5kUR1WUb9BaKpOLKuu+VEfMdkArZre8UIJobkmwtbUQ1FPc5cKLjaz
 iebV+9bfnYGDgxRMXC5gM/t3Sq6TBpB9AljUVp8/CU8IH0KgRyFsmnNM9fd29YHvA+cJ1cu+n
 lOwSmKviRovbY1Ot4QrYDYuosA2KcmkvM3PKfEdGCJnjbwiRNKMqLs3yOSesYQvS8rPyfoXTs
 Zz2+HH9PxqbwnV6YYJ8FRsqWehhFZWbjGCznKEoanw4ISxC0UeT9gg1FnUI/nC+Y9A8Z/gWvR
 B3MHCaeWCFsSW4W2ROFm/frep99zg+9kltqigzRMVDSSUPkdQfw8yH29Ano73q56fDLyvti3W
 5B17nf44mkCPC14DKknpcQx89OpRaCbJHMomjgx6KbU0PHugUBMTv4H5P/JRw8DYcKrFY5R5k
 Go57FASQAOfd6YRgln9nK8EwyIS4VyxH+cbfist+7AgT22GVJ9W4rmfAs//+xwl0jRc+IZDp1
 bUv1AOhoWuKTsOKa6My2kSm6kdtdNF/rQWlN+ohLCD0zCVPXU2N5p3587Mhh9o3FfVoWwomo8
 qRzrVxGfLAfLLm7YD0VsPtY57MaLbmB4BITx4zx/KNttN99RbAQprHZyWZ//rx3FxloqZe+/5
 r9QA6hmVIcsOKc=
Subject: Re: [Buildroot] [PATCH v3 1/2] package/qt5webengine: fix compile
 flags for arm
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
Cc: buildroot@busybox.net, James Hilliard <james.hilliard1@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 =?UTF-8?B?R2HDq2w=?= Portay <gael.portay@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On Sun, 9 Jan 2022 15:03:04 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello Peter,
>
> On Fri,  6 Mar 2020 21:34:09 +0100
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > The qt5webengine configure simple takes QT_ARCH ('arm') to determine the
> > chromium compiler flags and uses some hard coded ARMv7 default values
> > for the compiler command line: '... -march=armv7-a -mfloat-abi=hard
> > -mtune=generic-armv7-a -mfpu=vfpv3-d16 ...'.
> >
> > This results e.g. in an illegal instruction failure for rpi zero
> > (reported on the mailing list, see [1]).
> >
> > Disable all arm custom cpu flags (march/mfloat-abi/mtune/mfpu/mthumb) as
> > these are already set by the compiler wrapper (via a patch to the chromium
> > GN build system BUILD.gn file).
> >
> > Despite the patch set all known values in the chromium GN build
> > system config file chromium/build/config/arm.gni to not disturb
> > the compile defines settings logic.
>
> It's been a very long time since this patch was posted. Does the
> problem still occur? There is a patch series from James Hilliard
> upgrading qt5webengine:
>
>   https://patchwork.ozlabs.org/project/buildroot/list/?series=279766

Problem still exits with qt5webengine-5.15.2 and qt5webengine-5.15.8...

>
> Some more questions below.
>
> > +diff --git a/src/3rdparty/chromium/build/config/compiler/BUILD.gn b/src/3rdparty/chromium/build/config/compiler/BUILD.gn
> > +index d223a4f6f..16dec5c6a 100644
> > +--- a/src/3rdparty/chromium/build/config/compiler/BUILD.gn
> > ++++ b/src/3rdparty/chromium/build/config/compiler/BUILD.gn
> > +@@ -672,7 +672,8 @@ config("compiler") {
> > +     # TODO(pcc): The contents of .ARM.attributes should be based on the
> > +     # -march flag passed at compile time (see llvm.org/pr36291).
> > +     if (current_cpu == "arm") {
> > +-      ldflags += [ "-march=$arm_arch" ]
> > ++      # disabled for the buildroot compile
> > ++      # ldflags += [ "-march=$arm_arch" ]
> > +     }
> > +   }
> > +
> > +@@ -752,13 +753,15 @@ config("compiler_cpu_abi") {
> > +         ldflags += [ "--target=arm-linux-gnueabihf" ]
> > +       }
> > +       if (!is_nacl) {
> > +-        cflags += [
> > +-          "-march=$arm_arch",
> > +-          "-mfloat-abi=$arm_float_abi",
> > +-        ]
> > ++        # disabled for the buildroot compile
> > ++        # cflags += [
> > ++        #   "-march=$arm_arch",
> > ++        #   "-mfloat-abi=$arm_float_abi",
> > ++        # ]
> > +       }
> > +       if (arm_tune != "") {
> > +-        cflags += [ "-mtune=$arm_tune" ]
> > ++        # disabled for the buildroot compile
> > ++        # cflags += [ "-mtune=$arm_tune" ]
> > +       }
> > +     } else if (current_cpu == "arm64") {
> > +       if (is_clang && !is_android && !is_nacl && !is_fuchsia) {
> > +@@ -1130,7 +1133,9 @@ config("clang_revision") {
> > +
> > + config("compiler_arm_fpu") {
> > +   if (current_cpu == "arm" && !is_ios && !is_nacl) {
> > +-    cflags = [ "-mfpu=$arm_fpu" ]
> > ++    # disabled for the buildroot compile
> > ++    # cflags = [ "-mfpu=$arm_fpu" ]
> > ++    cflags = []
> > +     asmflags = cflags
> > +   }
> > + }
> > +@@ -1138,7 +1143,9 @@ config("compiler_arm_fpu") {
> > + config("compiler_arm_thumb") {
> > +   if (current_cpu == "arm" && arm_use_thumb && is_posix &&
> > +       !(is_mac || is_ios || is_nacl)) {
> > +-    cflags = [ "-mthumb" ]
> > ++    # disabled for the buildroot compile
> > ++    # cflags = [ "-mthumb" ]
> > ++    cflags = []
> > +     if (is_android && !is_clang) {
> > +       # Clang doesn't support this option.
> > +       cflags += [ "-mthumb-interwork" ]
>
> You're fixing the problem for ARM, but is there some similar mess for
> other CPU architectures?
>
> > +# configure arm architecture paramter for chromium compile
> > +ifeq ($(BR2_arm),y)
> > +ifeq ($(BR2_ARM_CPU_ARMV4),y)
> > +define QT5WEBENGINE_CONFIGURE_ARM_VERSION
> > +	$(SED) 's/^    arm_version = 7$$/    arm_version = 4/' $(@D)/src/3rdparty/chromium/build/config/arm.gni
> > +endef
> > +endif
> > +
> > +ifeq ($(BR2_ARM_CPU_ARMV5),y)
> > +define QT5WEBENGINE_CONFIGURE_ARM_VERSION
> > +	$(SED) 's/^    arm_version = 7$$/    arm_version = 5/' $(@D)/src/3rdparty/chromium/build/config/arm.gni
> > +endef
> > +endif
> > +
> > +ifeq ($(BR2_ARM_CPU_ARMV6),y)
> > +define QT5WEBENGINE_CONFIGURE_ARM_VERSION
> > +	$(SED) 's/^    arm_version = 7$$/    arm_version = 6/' $(@D)/src/3rdparty/chromium/build/config/arm.gni
> > +endef
> > +endif
> > +
> > +# no entriy for BR2_ARM_CPU_ARMV7A/BR2_ARM_CPU_ARMV7M, arm_vesion = 7 is already set by default
> > +
> > +ifeq ($(BR2_ARM_CPU_ARMV8A),y)
> > +define QT5WEBENGINE_CONFIGURE_ARM_VERSION
> > +	$(SED) 's/^    arm_version = 7$$/    arm_version = 8/' $(@D)/src/3rdparty/chromium/build/config/arm.gni
> > +endef
> > +endif
> > +
> > +# not known by buildroot, set to some dummy to disable all default logic
> > +define QT5WEBENGINE_CONFIGURE_ARM_ARCH
> > +	$(SED) 's/^    arm_arch = ""$$/    arm_arch = "arm-dummy-arch"/' $(@D)/src/3rdparty/chromium/build/config/arm.gni
> > +endef
> > +
> > +define QT5WEBENGINE_CONFIGURE_ARM_FPU
> > +	$(SED) 's/^    arm_fpu = ""$$/    arm_fpu = $(BR2_GCC_TARGET_FPU)/' $(@D)/src/3rdparty/chromium/build/config/arm.gni
> > +endef
> > +
> > +define QT5WEBENGINE_CONFIGURE_ARM_FLOAT_ABI
> > +	$(SED) 's/^    arm_float_abi = ""$$/    arm_float_abi = $(BR2_GCC_TARGET_FLOAT_ABI)/' $(@D)/src/3rdparty/chromium/build/config/arm.gni
> > +endef
> > +
> > +define QT5WEBENGINE_CONFIGURE_ARM_TUNE
> > +	$(SED) 's/^    arm_tune = ""$$/    arm_tune = $(BR2_GCC_TARGET_CPU)/' $(@D)/src/3rdparty/chromium/build/config/arm.gni
> > +endef
> > +
> > +ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
> > +define QT5WEBENGINE_CONFIGURE_ARM_NEON
> > +	$(SED) 's/^    arm_use_neon = ""$$/    arm_use_neon = "true"/' $(@D)/src/3rdparty/chromium/build/config/arm.gni
> > +endef
> > +else
> > +define QT5WEBENGINE_CONFIGURE_ARM_NEON
> > +	$(SED) 's/^    arm_use_neon = ""$$/    arm_use_neon = "false"/' $(@D)/src/3rdparty/chromium/build/config/arm.gni
> > +endef
> > +endif
> > +
> > +ifeq ($(BR2_ARM_CPU_HAS_THUMB),)
> > +define QT5WEBENGINE_CONFIGURE_ARM_THUMB
> > +	$(SED) 's/^    arm_use_thumb = true$$/    arm_use_thumb = false/' $(@D)/src/3rdparty/chromium/build/config/arm.gni
> > +endef
> > +endif
> > +endif
>
> What are all those variables doing in the GN Chromium stuff?

Setting compiler flags e.g.

	arm_use_thumb --> -mthumb
	arm_use_neon  --> -DUSE_NEON and influences arm_fpu setting (if not already set)...

>
> I'm kind of worried by two aspects:
>
>  - This is all very ARM specific, but we have other CPU architectures
>    supported in Buildroot

Yes there is a although some x86/x64 logic setting e.g. -m32/-m64 and
-msse2/-mfpmath=sse/-mmmx and some mips/ppc/s390 and more..., but did
only take a deeper look at the arm part as the reported failure was
about rpi-zero...

>
>  - We already pass the proper CFLAGS, so it's always annoying to
>    duplicate this logic into package-specific flags

Yes... ;-)

Regards,
Peter

>
> Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
