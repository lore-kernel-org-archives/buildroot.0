Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC621C0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 23:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E2556070F;
	Sat, 25 Jan 2025 23:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S8G4t6ZR0xRS; Sat, 25 Jan 2025 23:07:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C035E60715
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C035E60715;
	Sat, 25 Jan 2025 23:07:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F1D8794A
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 23:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6893408C7
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 23:07:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 73nkB779UGqa for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 23:07:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 96EAF40649
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96EAF40649
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 96EAF40649
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 23:07:49 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.115.60]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MbzuH-1t47ri3yyl-00pyTE; Sun, 26
 Jan 2025 00:07:46 +0100
Message-ID: <96dea9c1-baad-4d4f-9c83-967fa773b862@gmx.de>
Date: Sun, 26 Jan 2025 00:07:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Daniel Lang <dalang@gmx.at>, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
References: <20250118083837.2883279-1-bernd@kuhls.net>
 <20250118083837.2883279-5-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20250118083837.2883279-5-bernd@kuhls.net>
X-Provags-ID: V03:K1:GoiVMeVwEs7TlProSzBmSS0Medf+3+gD2rTxaJG1lmtHb62CYx1
 U6xbZYaRpQyU0p3sfANwrGdHrAgWk6+l+5COJ9qOuWOG0pZmxrsirx6JiSbC3BLRG7wX8+7
 0pH8LfdAga+H3TArXx1bajBG5rNSPF0Zw76HMKCP8kcYeUsW/bvQf0pHk9ftHm2Q7nVVYL5
 L6uAmRF4L2bFQe1D0qJkw==
UI-OutboundReport: notjunk:1;M01:P0:jTi8SV9reuc=;7c/fG6HKuk5ThWyIXBXn/vsURJ9
 P1/49NW6cpx9uAOtaoD8ZJmvHae3/TqyGhRcMmewnLH3zvNzfwB27b7R59BC3rG1xVYU9pOtG
 ykhJwessrys0LzVr0vE/OI2PD6M0k3Q87fLHDoPXdPcMUbYoH90vEobUMznmOMQNH3BkxpoRe
 CY2qS+QVW7ScZb0gkCj5iwnduTYeejYe8cyozN0NNNB6y+Aafl099iqUn9Jb77G7Jb136DoNx
 atMHwMD5s/I35QzGKar4UsCHLhXf7MGn/Sbq1UlzdV9/30Tb5Z1IwY/si0OKLfym3cZIEi1da
 toGyoIfPzs7Ovs9LXbVwjgryBQ2UPsZaDbkIKu2tZsv9ADTlINewr2edZ5+0neqqIxrQopjIC
 RZQTe5Ma5mK7lAVg7sBApPRdLKeLoBVTYdq9zEjX1ZQQ0UpBW181Isl+ihVsJf/vwOu2ta0V0
 V1UVpiYlCBytFe9HEPzqMj7NY4kxhbBwOo7rJ4hW+7YyejsFBTsOdHna/JjM+Yy5vKIK7XJaT
 hEJhmsk0i+zh3+HYjmBS/JlwtLPuFqpO14Qkvp3eIiGEgx9E3m2XHuM16gX6p6FzK5M73eRLu
 2Xv5yAIQqKCHDXzjEadEeXHbZM5gvQIlDFwKa9ZUY9RcT8Rq938l+yEBYwNuWq1RGBWSwXAoq
 OLqqHMdEl+XRBo23uaXNf+06TG1c1AqJItlqIiOrWydjqd18K52qJWS1kKLXju/I1slY93TwD
 JeAdnXEC9yMoRVGmN4r5JsW/jIBKsBCt5KOWAVYUZwj2L/3G0RMKX4p+GzlYZLpLpz9DkX6Zv
 KftsWlBgpqAPn+EY1s9GoVKSc1Ed3PFmtg5LIpsPiwC0T+kmzRPFXPZC2owOeqMW6TkMBDrHC
 ij9nKQ5JR5yU/pw2ve0X0bSyXrdPOE/SVnSaM0m9tAW+R516xwkxQO0PfsdOc1zEMuFfaM+sp
 DbEB2btiwsNV7Q8BwrugN5iI+wIb21vgWPeHNORYxRwARRAjIpUNEo1i+S7JKPKX3ORH8d0rA
 ZimSiOe298ch1TQ80RQvpCxo+EwUbqm022fqNrnqdG8lzcWsJnMBE0+QkaWypJ4skKUEhUfhi
 3E5LS2Zt4UDdNAJvD3mIPn8gzhwxvfodWkmj/dm/JnWonhLvzhhY2Vc+xQbDH6/tuM8Q3JYE7
 DgwcbJO51uhXbr8jm8rtrKNusK9lOtOm8psJXWan4gg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1737846466; x=1738451266; i=fiona.klute@gmx.de;
 bh=XMGkm9CbV+TOEvq8ZnM1re8XMlqoiCGOKN8ynNnN2Uo=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=EAMDn7D2CfJEs758RH54CHIprUCr7VVsObL0B74zx23vAOcG5zxBL82lsh94a7bL
 n8sv+yBP/5As4HLo0W0bluFox/kQ7tE11U2ZH+p76iplo7x6x4wVIjFeXTrHMt1Vw
 7713Fq6+/0DrLebdP5VQYSdvJQDVz1pf8hdJR67kWDzjBL4H8QRjzw0lomyuhy6gE
 43YogzAmVr2GgU+4PQqtYymKNts60YcyYq4J7JaUFsmC8/ufx+MKNDtTNwknPvtTk
 ayhMWZZy+/hmA23LCMT/7dMNA9IpBQ8IrRSM0Ehw7ds8k+pk3vvZsbUiyS5vtQYq4
 1JK9wL9qZkJTOLjPJA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=EAMDn7D2
Subject: Re: [Buildroot] [PATCH v4 5/6] package/{mesa3d,
 mesa3d-headers}: bump version to 24.3.3
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 18.01.25 um 09:38 schrieb Bernd Kuhls:
> Release notes:
> https://lists.freedesktop.org/archives/mesa-announce/2024-May/000762.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-June/000763.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-June/000765.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-July/000766.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-July/000767.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-July/000771.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-August/000773.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-August/000776.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-September/000778.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-September/000779.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-October/000780.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-October/000781.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-October/000782.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-November/000784.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-November/000786.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-December/000788.html
> https://docs.mesa3d.org/relnotes/24.3.2.html
> https://docs.mesa3d.org/relnotes/24.3.3.html
> ------------------------------------------------------------------------
> Changes needed for the bump to 24.1.x:
>
> Added dependency to llvm & Co. for iris driver due to upstream commit:
> https://cgit.freedesktop.org/mesa/mesa/commit/meson.build?h=24.1&id=a512c2a8b572c5da360873320dbbd343c6223cd6
>
> Added host version of mesa tool intel_clc needed for target build of the
> iris driver.
>
> Added dependency to host-python-pycparser for etnaviv driver due to
> upstream commit:
> https://cgit.freedesktop.org/mesa/mesa/commit/src/etnaviv/hwdb/meson.build?h=24.1&id=2192e620bb0c68b75ff45165d0b117c7ecb77268
>
> Added dependency to host-python-ply for intel vulkan driver due to
> upstream commit:
> https://cgit.freedesktop.org/mesa/mesa/commit/src/intel/vulkan/grl/meson.build?h=24.1&id=dc1aedef2bd054884685ad971a3ef5be07ecd101
>
> Although this dependency exists since mesa3d 22.3 it is only needed when
> intel-clc is enabled, this dependency is added with this patch so no need
> to backport this dependency to older buildroot trees.
>
> Update configure parameter of glvnd option due to upstream commit:
> https://cgit.freedesktop.org/mesa/mesa/commit/meson.build?h=24.1&id=4f25b84b2460524d375424a81b42faa4d99c8e60
> ------------------------------------------------------------------------
> Changes needed for the bump to 24.2.x:
>
> Added dependency to host-python-pyyaml to host and target build, needed
> due to upstream commit
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/a3813327575e8875c8c3ed24b5f45a0b7ba64446
>
> Rebased patch 0002 due to upstream commit:
> https://cgit.freedesktop.org/mesa/mesa/commit/src/gallium/drivers/vc4/meson.build?h=24.2&id=da70827656757cd070faac7aff5ca057f1e7fb8a
>
> Renamed BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST to
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE (also updated tests) and
> added new option BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LLVMPIPE due to
> upstream commit
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/010b2f9497ab256d9e8041207902948331af5b4b
> "gallium/meson: Deconflate swrast/softpipe/llvmpipe"
> ------------------------------------------------------------------------
> Changes needed for the bump to 24.3.x:
>
> Rebased patch 0002 again due to upstream commit:
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/25ba90fd888cef431c2098c8afdb0a2bbd34b303
>
> Removed dri3 configure option:
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/8f6fca89aa1812b03da6d9f7fac3966955abc41e
>
> Removed gallium-omx configure option:
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/9b6c27a320ab4b0fcf1fb16220ae7c3d3f06f7df
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Tested-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>  # tested with VC4

Note maintainers, half of the patch I sent on Friday to add options to
enable the zink and kmsro Gallium drivers [1] is obsolete (and broken)
if this series is applied, because Mesa now enables kmsro automatically
if any of the GPU drivers that can use kmsro is enabled, and the option
is invalid. Probably easiest to apply this Mesa update first, and then I
can respin the patch.

Thanks,
Fiona

[1]
https://patchwork.ozlabs.org/project/buildroot/patch/20250124101900.99783-1-fiona.klute@gmx.de/

> ---
> v4: bumped to 24.3.3
> v3: bumped to 24.3.2
>      renamed remaining occurences of BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
>      to BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE (Andreas)
> v2: sed -i 's/SWRAST/SOFTPIPE/g' support/testing/tests/package/test_*.py
>      (Julien)
>
>   Config.in.legacy                              |  7 +++
>   package/mesa3d-headers/mesa3d-headers.mk      |  2 +-
>   ...tion-to-disable-optional-neon-suppor.patch | 18 +++---
>   package/mesa3d/Config.in                      | 32 ++++++++--
>   package/mesa3d/mesa3d.hash                    |  6 +-
>   package/mesa3d/mesa3d.mk                      | 58 ++++++++++++++-----
>   support/testing/tests/package/test_flutter.py |  2 +-
>   .../tests/package/test_glslsandbox_player.py  |  2 +-
>   support/testing/tests/package/test_glxinfo.py |  2 +-
>   support/testing/tests/package/test_kmscube.py |  2 +-
>   .../tests/package/test_python_pyqt5.py        |  2 +-
>   support/testing/tests/package/test_weston.py  |  2 +-
>   12 files changed, 96 insertions(+), 39 deletions(-)
>
> diff --git a/Config.in.legacy b/Config.in.legacy
> index e091fd8c0a..965097208e 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,13 @@ endif
>
>   comment "Legacy options removed in 2025.02"
>
> +config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
> +	bool "mesa Gallium swrast driver was replaced by softpipe"
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE
> +	help
> +	  The Gallium swrast driver was replaced by softpipe.
> +
>   config BR2_nios2
>   	bool "nios2 architecture removed"
>   	select BR2_LEGACY
> diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
> index 33c60b285f..abe4350061 100644
> --- a/package/mesa3d-headers/mesa3d-headers.mk
> +++ b/package/mesa3d-headers/mesa3d-headers.mk
> @@ -12,7 +12,7 @@ endif
>
>   # Not possible to directly refer to mesa3d variables, because of
>   # first/second expansion trickery...
> -MESA3D_HEADERS_VERSION = 24.0.9
> +MESA3D_HEADERS_VERSION = 24.3.3
>   MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
>   MESA3D_HEADERS_SITE = https://archive.mesa3d.org
>   MESA3D_HEADERS_DL_SUBDIR = mesa3d
> diff --git a/package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch b/package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
> index f3919478a6..3b9bca0693 100644
> --- a/package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
> +++ b/package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
> @@ -9,8 +9,8 @@ to force disabling it at compile time.
>
>   Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4114
>   Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> -Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> -[rebased for 20.2.0, 20.3.0, 21.1.0, 23.1.0 & 23.2.0]
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +[rebased for 20.2.0, 20.3.0, 21.1.0, 23.1.0, 23.2.0 & 24.3.0]
>   Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>   [fix syntax error after previous rebases]
>   ---
> @@ -23,7 +23,7 @@ diff --git a/meson_options.txt b/meson_options.txt
>   index 8e0bf2a..1cf0e07 100644
>   --- a/meson_options.txt
>   +++ b/meson_options.txt
> -@@ -124,6 +124,13 @@ option(
> +@@ -117,6 +117,13 @@ option(
>      description : 'enable gallium va frontend.',
>    )
>
> @@ -41,18 +41,18 @@ diff --git a/src/gallium/drivers/vc4/meson.build b/src/gallium/drivers/vc4/meson
>   index 84da951..7f950de 100644
>   --- a/src/gallium/drivers/vc4/meson.build
>   +++ b/src/gallium/drivers/vc4/meson.build
> -@@ -84,7 +84,7 @@ files_libvc4 = files(
> - vc4_c_args = []
> +@@ -72,7 +72,7 @@ files_libvc4 = files(
> + ]
>
>    libvc4_neon = []
>   -if host_machine.cpu_family() == 'arm'
>   +if host_machine.cpu_family() == 'arm' and not get_option('gallium-vc4-neon').disabled()
>      libvc4_neon = static_library(
>        'vc4_neon',
> -     'vc4_tiling_lt_neon.c',
> -@@ -93,7 +93,7 @@ if host_machine.cpu_family() == 'arm'
> -     ],
> -     c_args : '-mfpu=neon',
> +     'vc4_tiling_lt.c',
> +@@ -82,7 +82,7 @@ if host_machine.cpu_family() == 'arm'
> +     c_args : ['-mfpu=neon', '-DV3D_BUILD_NEON'],
> +     dependencies : vc4_deps,
>      )
>   -  vc4_c_args += '-DUSE_ARM_ASM'
>   +  vc4_c_args += '-DVC4_TILING_LT_NEON'
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 7761b0a650..16bd189a55 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -50,7 +50,8 @@ config BR2_PACKAGE_MESA3D_OPENCL
>   	bool "OpenCL support"
>   	depends on BR2_PACKAGE_MESA3D_LLVM
>   	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600 || \
> -		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
> +		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI || \
> +		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
>   	select BR2_PACKAGE_LLVM_RTTI
>   	select BR2_PACKAGE_CLANG
>   	select BR2_PACKAGE_LIBCLC
> @@ -129,10 +130,18 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915
>   config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
>   	bool "Gallium iris driver"
>   	depends on BR2_i386 || BR2_x86_64
> +	depends on BR2_PACKAGE_MESA3D_LLVM
>   	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> +	select BR2_PACKAGE_MESA3D_OPENCL
> +	select BR2_PACKAGE_SPIRV_LLVM_TRANSLATOR
> +	select BR2_PACKAGE_SPIRV_TOOLS
>   	help
>   	  Mesa driver for iris-based Intel GPUs.
>
> +comment "iris driver needs llvm"
> +	depends on BR2_i386 || BR2_x86_64
> +	depends on !BR2_PACKAGE_MESA3D_LLVM
> +
>   config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA
>   	bool "Gallium lima driver"
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
> @@ -140,6 +149,17 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA
>   	help
>   	  Mesa driver for ARM Mali Utgard GPUs.
>
> +config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LLVMPIPE
> +	bool "Gallium llvmpipe driver"
> +	depends on BR2_PACKAGE_MESA3D_LLVM
> +	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> +	help
> +	  This is a llvm opengl implementation using the Gallium3D
> +	  infrastructure.
> +
> +comment "llvmpipe driver needs llvm"
> +	depends on !BR2_PACKAGE_MESA3D_LLVM
> +
>   config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
>   	bool "Gallium nouveau driver"
>   	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> @@ -212,8 +232,8 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA
>   	help
>   	  This is a virtual GPU driver for VMWare virtual machines.
>
> -config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
> -	bool "Gallium swrast driver"
> +config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE
> +	bool "Gallium softpipe driver"
>   	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
>   	help
>   	  This is a software opengl implementation using the Gallium3D
> @@ -285,7 +305,7 @@ comment "Vulkan drivers"
>   config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM
>   	bool "Vulkan broadcom driver"
>   	depends on BR2_arm || BR2_aarch64
> -	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # dri3/libxshmfence
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libxshmfence
>   	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
>   	help
>   	  Vulkan broadcom driver.
> @@ -309,7 +329,7 @@ comment "intel vulkan needs a glibc toolchain w/ headers >= 3.17"
>   config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_SWRAST
>   	bool "Vulkan swrast driver"
>   	depends on BR2_PACKAGE_MESA3D_LLVM
> -	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
> +	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE
>   	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
>   	help
>   	  Vulkan swrast driver.
> @@ -318,7 +338,7 @@ comment "Off-screen Rendering"
>
>   config BR2_PACKAGE_MESA3D_OSMESA_GALLIUM
>   	bool "OSMesa (Gallium) library"
> -	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
> +	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE
>   	help
>   	  The OSMesa API provides functions for off-screen rendering.
>
> diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
> index d506d398b8..c9240b23ef 100644
> --- a/package/mesa3d/mesa3d.hash
> +++ b/package/mesa3d/mesa3d.hash
> @@ -1,5 +1,5 @@
> -# From https://lists.freedesktop.org/archives/mesa-announce/2024-June/000764.html
> -sha256  51aa686ca4060e38711a9e8f60c8f1efaa516baf411946ed7f2c265cd582ca4c  mesa-24.0.9.tar.xz
> -sha512  de2ee6c9df1fc106ee10befe0a76be1e9cfe83d65dbdb83bad6d8d7cfaa085232fb115293a1a790b37b50b1fe14bd58aafbcfe5a15e953b5901a7105d57569a5  mesa-24.0.9.tar.xz
> +# From https://docs.mesa3d.org/relnotes/24.3.3.html
> +sha256  105afc00a4496fa4d29da74e227085544919ec7c86bd92b0b6e7fcc32c7125f4  mesa-24.3.3.tar.xz
> +sha512  280d7a6dd64503ec398d449430270c78b5558c03bfeed3a42346573fd2db1aa3f96f5a212e49288718a7fe27447ee40235b066517622d68b0dfdd7b251a4e85f  mesa-24.3.3.tar.xz
>   # License
>   sha256  a00275a53178e2645fb65be99a785c110513446a5071ff2c698ed260ad917d75  docs/license.rst
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index ce460c4475..bd46d4b893 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>
>   # When updating the version, please also update mesa3d-headers
> -MESA3D_VERSION = 24.0.9
> +MESA3D_VERSION = 24.3.3
>   MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
>   MESA3D_SITE = https://archive.mesa3d.org
>   MESA3D_LICENSE = MIT, SGI, Khronos
> @@ -21,19 +21,20 @@ MESA3D_DEPENDENCIES = \
>   	host-bison \
>   	host-flex \
>   	host-python-mako \
> +	host-python-pyyaml \
>   	expat \
>   	libdrm \
>   	zlib
>
>   MESA3D_CONF_OPTS = \
> -	-Dgallium-omx=disabled \
> +	-Dgallium-opencl=disabled \
> +	-Dgallium-rusticl=false \
> +	-Dmicrosoft-clc=disabled \
> +	-Dopencl-spirv=false \
>   	-Dpower8=disabled
>
>   ifeq ($(BR2_PACKAGE_MESA3D_DRIVER)$(BR2_PACKAGE_XORG7),yy)
> -MESA3D_CONF_OPTS += -Ddri3=enabled
>   MESA3D_DEPENDENCIES += xlib_libxshmfence
> -else
> -MESA3D_CONF_OPTS += -Ddri3=disabled
>   endif
>
>   ifeq ($(BR2_PACKAGE_MESA3D_LLVM),y)
> @@ -50,14 +51,9 @@ else
>   MESA3D_CONF_OPTS += -Dllvm=disabled
>   endif
>
> -# Disable opencl-icd: OpenCL lib will be named libOpenCL instead of
> -# libMesaOpenCL and CL headers are installed
>   ifeq ($(BR2_PACKAGE_MESA3D_OPENCL),y)
>   MESA3D_PROVIDES += libopencl
>   MESA3D_DEPENDENCIES += clang libclc
> -MESA3D_CONF_OPTS += -Dgallium-opencl=standalone
> -else
> -MESA3D_CONF_OPTS += -Dgallium-opencl=disabled
>   endif
>
>   ifeq ($(BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS),y)
> @@ -99,13 +95,14 @@ MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO) += freedre
>   MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915)     += i915
>   MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS)     += iris
>   MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA)     += lima
> +MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LLVMPIPE) += llvmpipe
>   MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU)  += nouveau
>   MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST) += panfrost
>   MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R300)     += r300
>   MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600)     += r600
>   MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI) += radeonsi
>   MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA)     += svga
> -MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST)   += swrast
> +MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE) += softpipe
>   MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_TEGRA)    += tegra
>   MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D)      += v3d
>   MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4)      += vc4
> @@ -126,6 +123,19 @@ MESA3D_CONF_OPTS += \
>   	-Dgallium-extra-hud=true
>   endif
>
> +ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV),y)
> +MESA3D_DEPENDENCIES += host-python-pycparser
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL),y)
> +MESA3D_DEPENDENCIES += host-python-ply
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS),y)
> +MESA3D_CONF_OPTS += -Dintel-clc=system
> +MESA3D_DEPENDENCIES += host-mesa3d spirv-llvm-translator spirv-tools
> +endif
> +
>   ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),)
>   MESA3D_CONF_OPTS += \
>   	-Dvulkan-drivers=
> @@ -251,12 +261,32 @@ endif
>   ifeq ($(BR2_PACKAGE_LIBGLVND),y)
>   ifneq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX)$(BR2_PACKAGE_MESA3D_OPENGL_EGL),)
>   MESA3D_DEPENDENCIES += libglvnd
> -MESA3D_CONF_OPTS += -Dglvnd=true
> +MESA3D_CONF_OPTS += -Dglvnd=enabled
>   else
> -MESA3D_CONF_OPTS += -Dglvnd=false
> +MESA3D_CONF_OPTS += -Dglvnd=disabled
>   endif
>   else
> -MESA3D_CONF_OPTS += -Dglvnd=false
> +MESA3D_CONF_OPTS += -Dglvnd=disabled
>   endif
>
> +HOST_MESA3D_CONF_OPTS = \
> +	-Dglvnd=disabled \
> +	-Dgallium-drivers=iris \
> +	-Dgallium-vdpau=disabled \
> +	-Dplatforms= \
> +	-Dglx=disabled \
> +	-Dvulkan-drivers=""
> +
> +HOST_MESA3D_DEPENDENCIES = \
> +	host-libclc \
> +	host-libdrm \
> +	host-python-mako \
> +	host-python-pyyaml \
> +	host-spirv-tools
> +
> +define HOST_MESA3D_INSTALL_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/build/src/intel/compiler/intel_clc $(HOST_DIR)/bin/intel_clc
> +endef
> +
>   $(eval $(meson-package))
> +$(eval $(host-meson-package))
> diff --git a/support/testing/tests/package/test_flutter.py b/support/testing/tests/package/test_flutter.py
> index 08aa497417..e4040ca7dc 100644
> --- a/support/testing/tests/package/test_flutter.py
> +++ b/support/testing/tests/package/test_flutter.py
> @@ -22,7 +22,7 @@ class TestFlutter(infra.basetest.BRTest, GraphicsBase):
>           BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{infra.filepath("tests/package/test_flutter/linux-vkms.fragment")}"
>           BR2_PACKAGE_LIBDRM=y
>           BR2_PACKAGE_MESA3D=y
> -        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
> +        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
>           BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL=y
>           BR2_PACKAGE_MESA3D_OPENGL_ES=y
>           BR2_PACKAGE_FLUTTER_PI=y
> diff --git a/support/testing/tests/package/test_glslsandbox_player.py b/support/testing/tests/package/test_glslsandbox_player.py
> index 3b0dd60395..f72ac2adce 100644
> --- a/support/testing/tests/package/test_glslsandbox_player.py
> +++ b/support/testing/tests/package/test_glslsandbox_player.py
> @@ -17,7 +17,7 @@ class TestGlslsandboxPlayer(infra.basetest.BRTest):
>           BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
>           BR2_PACKAGE_LIBDRM=y
>           BR2_PACKAGE_MESA3D=y
> -        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
> +        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
>           BR2_PACKAGE_MESA3D_LLVM=y
>           BR2_PACKAGE_MESA3D_OPENGL_EGL=y
>           BR2_PACKAGE_MESA3D_OPENGL_ES=y
> diff --git a/support/testing/tests/package/test_glxinfo.py b/support/testing/tests/package/test_glxinfo.py
> index 3ccbdca8d9..2fece52372 100644
> --- a/support/testing/tests/package/test_glxinfo.py
> +++ b/support/testing/tests/package/test_glxinfo.py
> @@ -19,7 +19,7 @@ class TestGlxinfo(infra.basetest.BRTest):
>           BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux.config"
>           BR2_PACKAGE_MESA3D_DEMOS=y
>           BR2_PACKAGE_MESA3D=y
> -        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
> +        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
>           BR2_PACKAGE_MESA3D_OPENGL_GLX=y
>           BR2_PACKAGE_XORG7=y
>           BR2_PACKAGE_XSERVER_XORG_SERVER=y
> diff --git a/support/testing/tests/package/test_kmscube.py b/support/testing/tests/package/test_kmscube.py
> index 0ddeb67939..4a0eb07c32 100644
> --- a/support/testing/tests/package/test_kmscube.py
> +++ b/support/testing/tests/package/test_kmscube.py
> @@ -18,7 +18,7 @@ class TestKmsCube(infra.basetest.BRTest):
>           BR2_PACKAGE_KMSCUBE=y
>           BR2_PACKAGE_LIBDRM=y
>           BR2_PACKAGE_MESA3D=y
> -        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
> +        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
>           BR2_PACKAGE_MESA3D_LLVM=y
>           BR2_PACKAGE_MESA3D_OPENGL_EGL=y
>           BR2_PACKAGE_MESA3D_OPENGL_ES=y
> diff --git a/support/testing/tests/package/test_python_pyqt5.py b/support/testing/tests/package/test_python_pyqt5.py
> index 5f1952b559..65130f9c03 100644
> --- a/support/testing/tests/package/test_python_pyqt5.py
> +++ b/support/testing/tests/package/test_python_pyqt5.py
> @@ -28,7 +28,7 @@ class TestPythonPyQt5(infra.basetest.BRTest):
>           BR2_PACKAGE_DEJAVU=y
>           BR2_PACKAGE_LIBDRM=y
>           BR2_PACKAGE_MESA3D=y
> -        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
> +        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
>           BR2_PACKAGE_MESA3D_LLVM=y
>           BR2_PACKAGE_MESA3D_OPENGL_EGL=y
>           BR2_PACKAGE_MESA3D_OPENGL_ES=y
> diff --git a/support/testing/tests/package/test_weston.py b/support/testing/tests/package/test_weston.py
> index 2ed59a7f15..461ae50544 100644
> --- a/support/testing/tests/package/test_weston.py
> +++ b/support/testing/tests/package/test_weston.py
> @@ -22,7 +22,7 @@ class TestWeston(infra.basetest.BRTest, GraphicsBase):
>           BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
>           BR2_PACKAGE_LIBDRM=y
>           BR2_PACKAGE_MESA3D=y
> -        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
> +        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
>           BR2_PACKAGE_MESA3D_LLVM=y
>           BR2_PACKAGE_MESA3D_OPENGL_EGL=y
>           BR2_PACKAGE_MESA3D_OPENGL_ES=y

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
