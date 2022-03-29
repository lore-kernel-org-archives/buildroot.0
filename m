Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E82BC433EF
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 21:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FA326103E;
	Tue, 29 Mar 2022 21:57:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZObCMKhWXkfG; Tue, 29 Mar 2022 21:57:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2EA260BC5;
	Tue, 29 Mar 2022 21:57:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D82C91BF41A
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 21:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2EF340C0D
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 21:57:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rGy-uersXwGG for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 21:57:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8AB2C4011A
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 21:57:17 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 bx24-20020a17090af49800b001c6872a9e4eso4290168pjb.5
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 14:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=YXbY130oJ2yVVIn733A8I1bUGmo+dzwzFJrRdjgHxKs=;
 b=Oxnp0NVojeB0bcuDGQ2Ax5udOL3pq1oaL9sShOM0dIBGwWfdTBCN5pYs+oO+4ADrac
 3mv4Cx/noGhB3zwIgpn6oOSgm52AaUA5QeGJNjxwh+KJKjoGeodoIOoFrXHnq8t8W+uD
 TCuQ5mVsz+Npde6if9sPkRzYEKGaAeU3SRsmMVmErc2pyi0nsagSQxavzI2nWwLsVIvT
 yO1cFC5lQ9wDFj4ZXHxmaMZ8HeK1Uay8/l1TTIBOd7iTv1fyW7P4bncDV29S28s6t93d
 wge8jIxUUFcOLJSjzldV/pYcHnKZoXxlZz8bPYIY9r3gK1bZNTaKiLLhQ90RjLrv3XtA
 +7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=YXbY130oJ2yVVIn733A8I1bUGmo+dzwzFJrRdjgHxKs=;
 b=Hm6cMyDQMjsFzrEwEmeXjrXztaZ7nAf619tKYz39yb3Dg6y6YolUuQ/eYSZCbnB3R4
 QAjWEBE4vFTcF09KkLKot+KV1gUeuB90zRmRY/xPaTJ0jHJAu6t2w9LvXRKGl98kdeOf
 dS9NP7TgLOnAkJDA3k1/S1Z4lhXx/NSwgBrFASyjtVDxyHvaB6nBSgBNzsYOXQyDQFJI
 dPvyPvDimuUHIPPtL4UJ2+AjnztDloeMQyWJyvNhAATZTACr/r+iYoLExxnreyd+FauM
 +SoPzgsyAee6ovyxgtRLQ8MeXn/hyR99VHji37OpjslKDZFlUNljGSFsNHaxTjGsbHSq
 HBpA==
X-Gm-Message-State: AOAM532Sn+LdhqwSgHDJmjveqKUUB+EHzvwwAPL1yJZD04F5GX1VmrBz
 i9eprimMznctMNeiWzwAPTtOBXnyiqM9Jw==
X-Google-Smtp-Source: ABdhPJzfM0XHk7dbJwu9n50PBndkVVHWjH4FXyjlx9fptlaTVO9dIzY4LhKUkoIlMpe5s9YdcLR78w==
X-Received: by 2002:a17:90b:1d82:b0:1c6:d549:7b94 with SMTP id
 pf2-20020a17090b1d8200b001c6d5497b94mr1260778pjb.49.1648591036512; 
 Tue, 29 Mar 2022 14:57:16 -0700 (PDT)
Received: from smtpclient.apple ([2806:1000:8003:5c6c:6c2f:312d:b304:bc56])
 by smtp.gmail.com with ESMTPSA id
 ml16-20020a17090b361000b001c6c9141b0csm3848801pjb.45.2022.03.29.14.57.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 29 Mar 2022 14:57:15 -0700 (PDT)
From: Alsey Miller <alseycmiller@gmail.com>
X-Google-Original-From: Alsey Miller <Alseycmiller@gmail.com>
Message-Id: <2B3FDE91-2C84-4F3B-BDB8-DB0E85EFB3FF@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Date: Tue, 29 Mar 2022 14:57:14 -0700
In-Reply-To: <20220329215433.1018660-1-alseycmiller@gmail.com>
To: buildroot <buildroot@buildroot.org>
References: <20220329215433.1018660-1-alseycmiller@gmail.com>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
Subject: Re: [Buildroot] [PATCH 1/2] package/libdispatch: add libdispatch
 package
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
Cc: James Hillard <james.hilliard1@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: multipart/mixed; boundary="===============3657798697898012799=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============3657798697898012799==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_F1DBB432-2561-4B4E-975E-016D587B5F17"


--Apple-Mail=_F1DBB432-2561-4B4E-975E-016D587B5F17
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

This patch successfully builds with =
https://patchwork.ozlabs.org/project/buildroot/patch/20220322232224.284226=
6-5-james.hilliard1@gmail.com/ =
<https://patchwork.ozlabs.org/project/buildroot/patch/20220322232224.28422=
66-5-james.hilliard1@gmail.com/> applied. Although its not required for =
this package, I suggest merging =
https://patchwork.ozlabs.org/project/buildroot/patch/20220329145904.63900-=
1-andreynech@gmail.com/ =
<https://patchwork.ozlabs.org/project/buildroot/patch/20220329145904.63900=
-1-andreynech@gmail.com/> as well.

> On Mar 29, 2022, at 2:54 PM, Alsey Coleman Miller =
<alseycmiller@gmail.com> wrote:
>=20
> Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
> ---
> DEVELOPERS                           |  3 ++
> package/Config.in                    |  1 +
> package/libdispatch/Config.in        | 43 +++++++++++++++++++++++
> package/libdispatch/libdispatch.hash |  1 +
> package/libdispatch/libdispatch.mk   | 52 ++++++++++++++++++++++++++++
> 5 files changed, 100 insertions(+)
> create mode 100644 package/libdispatch/Config.in
> create mode 100644 package/libdispatch/libdispatch.hash
> create mode 100644 package/libdispatch/libdispatch.mk
>=20
> diff --git a/DEVELOPERS b/DEVELOPERS
> index a66b9d7eee..555ec0175b 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -122,6 +122,9 @@ F:	boot/opensbi/
> F:	configs/hifive_unleashed_defconfig
> F:	package/xen/
>=20
> +N:	Alsey Miller <alseycmiller@gmail.com>
> +F:	package/libdispatch/
> +
> N:	Alvaro G. M <alvaro.gamez@hazent.com>
> F:	package/dcron/
> F:	package/libxmlrpc/
> diff --git a/package/Config.in b/package/Config.in
> index 0d5d763180..e217ff5282 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1968,6 +1968,7 @@ menu "Other"
> 	source "package/libcrossguid/Config.in"
> 	source "package/libcsv/Config.in"
> 	source "package/libdaemon/Config.in"
> +	source "package/libdispatch/Config.in"
> 	source "package/libeastl/Config.in"
> 	source "package/libee/Config.in"
> 	source "package/libev/Config.in"
> diff --git a/package/libdispatch/Config.in =
b/package/libdispatch/Config.in
> new file mode 100644
> index 0000000000..f4fa5e47fb
> --- /dev/null
> +++ b/package/libdispatch/Config.in
> @@ -0,0 +1,43 @@
> +config BR2_PACKAGE_LIBDISPATCH_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_x86_64
> +	default y if BR2_aarch64
> +	default y if BR2_arm
> +	default y if BR2_powerpc
> +	default y if BR2_mips
> +	default y if BR2_mipsel
> +	default y if BR2_mips64
> +	default y if BR2_mips64el
> +	default y if BR2_RISCV_64
> +
> +config BR2_PACKAGE_LIBDISPATCH_TARGET_ARCH
> +	string
> +	default "aarch64" if BR2_aarch64
> +	default "armv5" if BR2_ARM_CPU_ARMV5
> +	default "armv6" if BR2_ARM_CPU_ARMV6
> +	default "armv7" if BR2_ARM_CPU_ARMV7A
> +	default "x86_64" if BR2_x86_64
> +	default "powerpc" if BR2_powerpc
> +	default "mips" if BR2_mips
> +	default "mipsel" if BR2_mipsel
> +	default "mips64" if BR2_mips64
> +	default "mips64el" if BR2_mips64el
> +	default "riscv64" if BR2_RISCV_64
> +
> +config BR2_PACKAGE_LIBDISPATCH
> +	bool "libdispatch"
> +	depends on BR2_PACKAGE_LIBDISPATCH_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_STATIC_LIBS
> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	select BR2_PACKAGE_LIBBSD
> +=09
> +	help
> +	  Grand Central Dispatch (GCD or libdispatch) provides =
comprehensive support for concurrent code execution on multicore =
hardware.
> +
> +	  http://swift.org
> +
> +comment "libdispatch needs a toolchain w/ Glibc, wchar, threads, C++, =
dynamic library"
> +	depends on BR2_PACKAGE_LIBDISPATCH_ARCH_SUPPORTS
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC || =
!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP \
> +		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR
> \ No newline at end of file
> diff --git a/package/libdispatch/libdispatch.hash =
b/package/libdispatch/libdispatch.hash
> new file mode 100644
> index 0000000000..64543b56eb
> --- /dev/null
> +++ b/package/libdispatch/libdispatch.hash
> @@ -0,0 +1 @@
> +sha256 =
d2bbfb5b98d129caa2c6bd7662c850bf57cb434572d09844b56641c4558906ab =
libdispatch-swift-5.6-RELEASE.tar.gz
> diff --git a/package/libdispatch/libdispatch.mk =
b/package/libdispatch/libdispatch.mk
> new file mode 100644
> index 0000000000..79fc4f7780
> --- /dev/null
> +++ b/package/libdispatch/libdispatch.mk
> @@ -0,0 +1,52 @@
> +### Grand Central Dispatch
> +LIBDISPATCH_VERSION =3D 5.6
> +LIBDISPATCH_SITE =3D $(call =
github,apple,swift-corelibs-libdispatch,swift-$(LIBDISPATCH_VERSION)-RELEA=
SE)
> +LIBDISPATCH_LICENSE =3D Apache-2.0
> +LIBDISPATCH_LICENSE_FILES =3D LICENSE
> +LIBDISPATCH_INSTALL_STAGING =3D YES
> +LIBDISPATCH_SUPPORTS_IN_SOURCE_BUILD =3D NO
> +LIBDISPATCH_DEPENDENCIES =3D host-clang host-lld libbsd
> +
> +LIBDISPATCH_TARGET_ARCH =3D $(call =
qstrip,$(BR2_PACKAGE_LIBDISPATCH_TARGET_ARCH))
> +LIBDISPATCH_CLANG_PATH =3D $(HOST_DIR)/bin
> +
> +ifeq ($(LIBDISPATCH_TARGET_ARCH),armv7)
> +LIBDISPATCH_TARGET_NAME		=3D =
armv7-unknown-linux-gnueabihf
> +else ifeq ($(LIBDISPATCH_TARGET_ARCH),armv6)
> +LIBDISPATCH_TARGET_NAME		=3D =
armv6-unknown-linux-gnueabihf
> +else ifeq ($(LIBDISPATCH_TARGET_ARCH),armv5)
> +LIBDISPATCH_TARGET_NAME		=3D armv5-unknown-linux-gnueabi
> +else
> +LIBDISPATCH_TARGET_NAME		=3D =
$(LIBDISPATCH_TARGET_ARCH)-unknown-linux-gnu
> +endif
> +
> +ifeq ($(LIBDISPATCH_TARGET_ARCH),armv5)
> +LIBDISPATCH_EXTRA_FLAGS		=3D -march=3Darmv5te
> +else ifeq ($(LIBDISPATCH_TARGET_ARCH),riscv64)
> +LIBDISPATCH_EXTRA_FLAGS		=3D -mno-relax -mabi=3Dlp64 =
-march=3Drv64imac -mfloat-abi=3Dsoft
> +else ifeq ($(LIBDISPATCH_TARGET_ARCH),mipsel)
> +LIBDISPATCH_EXTRA_FLAGS		=3D -msoft-float
> +else ifeq ($(LIBDISPATCH_TARGET_ARCH),mips64el)
> +LIBDISPATCH_EXTRA_FLAGS		=3D -msoft-float
> +else ifeq ($(LIBDISPATCH_TARGET_ARCH),powerpc)
> +LIBDISPATCH_EXTRA_FLAGS		=3D -mcpu=3D7400
> +else
> +LIBDISPATCH_EXTRA_FLAGS		=3D=20
> +endif
> +
> +LIBDISPATCH_CONF_OPTS +=3D \
> +	-DLibRT_LIBRARIES=3D"${STAGING_DIR}/usr/lib/librt.a" \
> +	-DCMAKE_C_COMPILER=3D$(LIBDISPATCH_CLANG_PATH)/clang \
> +	-DCMAKE_CXX_COMPILER=3D$(LIBDISPATCH_CLANG_PATH)/clang++ \
> +	-DCMAKE_C_FLAGS=3D"-w -fuse-ld=3Dlld $(LIBDISPATCH_EXTRA_FLAGS) =
-target $(LIBDISPATCH_TARGET_NAME) --sysroot=3D$(STAGING_DIR) =
-I$(STAGING_DIR)/usr/include -B$(STAGING_DIR)/usr/lib =
-B$(HOST_DIR)/lib/gcc/$(GNU_TARGET_NAME)/$(call =
qstrip,$(BR2_GCC_VERSION)) =
-L$(HOST_DIR)/lib/gcc/$(GNU_TARGET_NAME)/$(call =
qstrip,$(BR2_GCC_VERSION))" \
> +	-DCMAKE_C_LINK_FLAGS=3D"-target $(LIBDISPATCH_TARGET_NAME) =
--sysroot=3D$(STAGING_DIR)" \
> +	-DCMAKE_CXX_FLAGS=3D"-w -fuse-ld=3Dlld =
$(LIBDISPATCH_EXTRA_FLAGS) -target $(LIBDISPATCH_TARGET_NAME) =
--sysroot=3D$(STAGING_DIR) -I$(STAGING_DIR)/usr/include =
-I$(HOST_DIR)/$(GNU_TARGET_NAME)/include/c++/$(call =
qstrip,$(BR2_GCC_VERSION))/ =
-I$(HOST_DIR)/$(GNU_TARGET_NAME)/include/c++/$(call =
qstrip,$(BR2_GCC_VERSION))/$(GNU_TARGET_NAME) -B$(STAGING_DIR)/usr/lib =
-B$(HOST_DIR)/lib/gcc/$(GNU_TARGET_NAME)/$(call =
qstrip,$(BR2_GCC_VERSION)) =
-L$(HOST_DIR)/lib/gcc/$(GNU_TARGET_NAME)/$(call =
qstrip,$(BR2_GCC_VERSION))" \
> +	-DCMAKE_CXX_LINK_FLAGS=3D"-target $(LIBDISPATCH_TARGET_NAME) =
--sysroot=3D$(STAGING_DIR)" \
> +
> +define LIBDISPATCH_INSTALL_TARGET_CMDS
> +	(cd $(LIBDISPATCH_BUILDDIR) && \
> +	cp ./*.so $(TARGET_DIR)/usr/lib/ \
> +	)
> +endef
> +
> +$(eval $(cmake-package))
> --=20
> 2.30.2
>=20


--Apple-Mail=_F1DBB432-2561-4B4E-975E-016D587B5F17
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">This =
patch successfully builds with&nbsp;<a =
href=3D"https://patchwork.ozlabs.org/project/buildroot/patch/2022032223222=
4.2842266-5-james.hilliard1@gmail.com/" =
class=3D"">https://patchwork.ozlabs.org/project/buildroot/patch/2022032223=
2224.2842266-5-james.hilliard1@gmail.com/</a>&nbsp;applied. Although its =
not required for this package, I suggest merging&nbsp;<a =
href=3D"https://patchwork.ozlabs.org/project/buildroot/patch/2022032914590=
4.63900-1-andreynech@gmail.com/" =
class=3D"">https://patchwork.ozlabs.org/project/buildroot/patch/2022032914=
5904.63900-1-andreynech@gmail.com/</a>&nbsp;as well.<br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Mar 29, 2022, at 2:54 PM, Alsey Coleman Miller &lt;<a =
href=3D"mailto:alseycmiller@gmail.com" =
class=3D"">alseycmiller@gmail.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div =
class=3D"">Signed-off-by: Alsey Coleman Miller &lt;<a =
href=3D"mailto:alseycmiller@gmail.com" =
class=3D"">alseycmiller@gmail.com</a>&gt;<br class=3D"">---<br class=3D"">=
 DEVELOPERS =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;| &nbsp;3 ++<br class=3D""> package/Config.in =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;1 +<br class=3D""> =
package/libdispatch/Config.in =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 43 =
+++++++++++++++++++++++<br class=3D""> =
package/libdispatch/libdispatch.hash | &nbsp;1 +<br class=3D""> =
package/libdispatch/libdispatch.mk &nbsp;&nbsp;| 52 =
++++++++++++++++++++++++++++<br class=3D""> 5 files changed, 100 =
insertions(+)<br class=3D""> create mode 100644 =
package/libdispatch/Config.in<br class=3D""> create mode 100644 =
package/libdispatch/libdispatch.hash<br class=3D""> create mode 100644 =
package/libdispatch/libdispatch.mk<br class=3D""><br class=3D"">diff =
--git a/DEVELOPERS b/DEVELOPERS<br class=3D"">index =
a66b9d7eee..555ec0175b 100644<br class=3D"">--- a/DEVELOPERS<br =
class=3D"">+++ b/DEVELOPERS<br class=3D"">@@ -122,6 +122,9 @@ F:<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>boot/opensbi/<br class=3D""> F:<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	=
</span>configs/hifive_unleashed_defconfig<br class=3D""> F:<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>package/xen/<br class=3D""><br class=3D"">+N:<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>Alsey =
Miller &lt;<a href=3D"mailto:alseycmiller@gmail.com" =
class=3D"">alseycmiller@gmail.com</a>&gt;<br class=3D"">+F:<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>package/libdispatch/<br class=3D"">+<br class=3D""> N:<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>Alvaro G. =
M &lt;<a href=3D"mailto:alvaro.gamez@hazent.com" =
class=3D"">alvaro.gamez@hazent.com</a>&gt;<br class=3D""> F:<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>package/dcron/<br class=3D""> F:<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>package/libxmlrpc/<br =
class=3D"">diff --git a/package/Config.in b/package/Config.in<br =
class=3D"">index 0d5d763180..e217ff5282 100644<br class=3D"">--- =
a/package/Config.in<br class=3D"">+++ b/package/Config.in<br class=3D"">@@=
 -1968,6 +1968,7 @@ menu "Other"<br class=3D""> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>source =
"package/libcrossguid/Config.in"<br class=3D""> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>source =
"package/libcsv/Config.in"<br class=3D""> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>source =
"package/libdaemon/Config.in"<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>source =
"package/libdispatch/Config.in"<br class=3D""> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>source =
"package/libeastl/Config.in"<br class=3D""> <span class=3D"Apple-tab-span"=
 style=3D"white-space:pre">	</span>source =
"package/libee/Config.in"<br class=3D""> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>source =
"package/libev/Config.in"<br class=3D"">diff --git =
a/package/libdispatch/Config.in b/package/libdispatch/Config.in<br =
class=3D"">new file mode 100644<br class=3D"">index =
0000000000..f4fa5e47fb<br class=3D"">--- /dev/null<br class=3D"">+++ =
b/package/libdispatch/Config.in<br class=3D"">@@ -0,0 +1,43 @@<br =
class=3D"">+config BR2_PACKAGE_LIBDISPATCH_ARCH_SUPPORTS<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>bool<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>default y if BR2_x86_64<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>default y if BR2_aarch64<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>default y =
if BR2_arm<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>default y if BR2_powerpc<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>default y if BR2_mips<br class=3D"">+<span class=3D"Apple-tab-span"=
 style=3D"white-space:pre">	</span>default y if BR2_mipsel<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>default y if BR2_mips64<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>default y =
if BR2_mips64el<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>default y if BR2_RISCV_64<br =
class=3D"">+<br class=3D"">+config =
BR2_PACKAGE_LIBDISPATCH_TARGET_ARCH<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>string<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>default "aarch64" if BR2_aarch64<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>default =
"armv5" if BR2_ARM_CPU_ARMV5<br class=3D"">+<span class=3D"Apple-tab-span"=
 style=3D"white-space:pre">	</span>default "armv6" if =
BR2_ARM_CPU_ARMV6<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>default "armv7" if =
BR2_ARM_CPU_ARMV7A<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>default "x86_64" if BR2_x86_64<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>default "powerpc" if BR2_powerpc<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>default =
"mips" if BR2_mips<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>default "mipsel" if BR2_mipsel<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>default "mips64" if BR2_mips64<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>default =
"mips64el" if BR2_mips64el<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>default "riscv64" if =
BR2_RISCV_64<br class=3D"">+<br class=3D"">+config =
BR2_PACKAGE_LIBDISPATCH<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>bool "libdispatch"<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>depends on BR2_PACKAGE_LIBDISPATCH_ARCH_SUPPORTS<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>depends on BR2_TOOLCHAIN_HAS_THREADS<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>depends =
on !BR2_STATIC_LIBS<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>depends on =
BR2_TOOLCHAIN_USES_GLIBC<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>select BR2_PACKAGE_LIBBSD<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>help<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> =
&nbsp;Grand Central Dispatch (GCD or libdispatch) provides comprehensive =
support for concurrent code execution on multicore hardware.<br =
class=3D"">+<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span> &nbsp;<a href=3D"http://swift.org"=
 class=3D"">http://swift.org</a><br class=3D"">+<br class=3D"">+comment =
"libdispatch needs a toolchain w/ Glibc, wchar, threads, C++, dynamic =
library"<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>depends on =
BR2_PACKAGE_LIBDISPATCH_ARCH_SUPPORTS<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>depends =
on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_TOOLCHAIN_HAS_THREADS || =
!BR2_INSTALL_LIBSTDCPP \<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>|| BR2_STATIC_LIBS || =
!BR2_USE_WCHAR<br class=3D"">\ No newline at end of file<br =
class=3D"">diff --git a/package/libdispatch/libdispatch.hash =
b/package/libdispatch/libdispatch.hash<br class=3D"">new file mode =
100644<br class=3D"">index 0000000000..64543b56eb<br class=3D"">--- =
/dev/null<br class=3D"">+++ b/package/libdispatch/libdispatch.hash<br =
class=3D"">@@ -0,0 +1 @@<br class=3D"">+sha256 =
d2bbfb5b98d129caa2c6bd7662c850bf57cb434572d09844b56641c4558906ab =
libdispatch-swift-5.6-RELEASE.tar.gz<br class=3D"">diff --git =
a/package/libdispatch/libdispatch.mk =
b/package/libdispatch/libdispatch.mk<br class=3D"">new file mode =
100644<br class=3D"">index 0000000000..79fc4f7780<br class=3D"">--- =
/dev/null<br class=3D"">+++ b/package/libdispatch/libdispatch.mk<br =
class=3D"">@@ -0,0 +1,52 @@<br class=3D"">+### Grand Central Dispatch<br =
class=3D"">+LIBDISPATCH_VERSION =3D 5.6<br class=3D"">+LIBDISPATCH_SITE =
=3D $(call =
github,apple,swift-corelibs-libdispatch,swift-$(LIBDISPATCH_VERSION)-RELEA=
SE)<br class=3D"">+LIBDISPATCH_LICENSE =3D Apache-2.0<br =
class=3D"">+LIBDISPATCH_LICENSE_FILES =3D LICENSE<br =
class=3D"">+LIBDISPATCH_INSTALL_STAGING =3D YES<br =
class=3D"">+LIBDISPATCH_SUPPORTS_IN_SOURCE_BUILD =3D NO<br =
class=3D"">+LIBDISPATCH_DEPENDENCIES =3D host-clang host-lld libbsd<br =
class=3D"">+<br class=3D"">+LIBDISPATCH_TARGET_ARCH =3D $(call =
qstrip,$(BR2_PACKAGE_LIBDISPATCH_TARGET_ARCH))<br =
class=3D"">+LIBDISPATCH_CLANG_PATH =3D $(HOST_DIR)/bin<br class=3D"">+<br =
class=3D"">+ifeq ($(LIBDISPATCH_TARGET_ARCH),armv7)<br =
class=3D"">+LIBDISPATCH_TARGET_NAME<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>=3D =
armv7-unknown-linux-gnueabihf<br class=3D"">+else ifeq =
($(LIBDISPATCH_TARGET_ARCH),armv6)<br =
class=3D"">+LIBDISPATCH_TARGET_NAME<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>=3D =
armv6-unknown-linux-gnueabihf<br class=3D"">+else ifeq =
($(LIBDISPATCH_TARGET_ARCH),armv5)<br =
class=3D"">+LIBDISPATCH_TARGET_NAME<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>=3D =
armv5-unknown-linux-gnueabi<br class=3D"">+else<br =
class=3D"">+LIBDISPATCH_TARGET_NAME<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>=3D =
$(LIBDISPATCH_TARGET_ARCH)-unknown-linux-gnu<br class=3D"">+endif<br =
class=3D"">+<br class=3D"">+ifeq ($(LIBDISPATCH_TARGET_ARCH),armv5)<br =
class=3D"">+LIBDISPATCH_EXTRA_FLAGS<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>=3D -march=3Darmv5te<br =
class=3D"">+else ifeq ($(LIBDISPATCH_TARGET_ARCH),riscv64)<br =
class=3D"">+LIBDISPATCH_EXTRA_FLAGS<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>=3D -mno-relax -mabi=3Dlp64 =
-march=3Drv64imac -mfloat-abi=3Dsoft<br class=3D"">+else ifeq =
($(LIBDISPATCH_TARGET_ARCH),mipsel)<br =
class=3D"">+LIBDISPATCH_EXTRA_FLAGS<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>=3D -msoft-float<br =
class=3D"">+else ifeq ($(LIBDISPATCH_TARGET_ARCH),mips64el)<br =
class=3D"">+LIBDISPATCH_EXTRA_FLAGS<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>=3D -msoft-float<br =
class=3D"">+else ifeq ($(LIBDISPATCH_TARGET_ARCH),powerpc)<br =
class=3D"">+LIBDISPATCH_EXTRA_FLAGS<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>=3D -mcpu=3D7400<br =
class=3D"">+else<br class=3D"">+LIBDISPATCH_EXTRA_FLAGS<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>=3D <br =
class=3D"">+endif<br class=3D"">+<br class=3D"">+LIBDISPATCH_CONF_OPTS =
+=3D \<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	=
</span>-DLibRT_LIBRARIES=3D"${STAGING_DIR}/usr/lib/librt.a" \<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>-DCMAKE_C_COMPILER=3D$(LIBDISPATCH_CLANG_PATH)/clang \<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>-DCMAKE_CXX_COMPILER=3D$(LIBDISPATCH_CLANG_PATH)/clang++ \<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>-DCMAKE_C_FLAGS=3D"-w -fuse-ld=3Dlld $(LIBDISPATCH_EXTRA_FLAGS) =
-target $(LIBDISPATCH_TARGET_NAME) --sysroot=3D$(STAGING_DIR) =
-I$(STAGING_DIR)/usr/include -B$(STAGING_DIR)/usr/lib =
-B$(HOST_DIR)/lib/gcc/$(GNU_TARGET_NAME)/$(call =
qstrip,$(BR2_GCC_VERSION)) =
-L$(HOST_DIR)/lib/gcc/$(GNU_TARGET_NAME)/$(call =
qstrip,$(BR2_GCC_VERSION))" \<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>-DCMAKE_C_LINK_FLAGS=3D"-target $(LIBDISPATCH_TARGET_NAME) =
--sysroot=3D$(STAGING_DIR)" \<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>-DCMAKE_CXX_FLAGS=3D"-w -fuse-ld=3Dlld $(LIBDISPATCH_EXTRA_FLAGS) =
-target $(LIBDISPATCH_TARGET_NAME) --sysroot=3D$(STAGING_DIR) =
-I$(STAGING_DIR)/usr/include =
-I$(HOST_DIR)/$(GNU_TARGET_NAME)/include/c++/$(call =
qstrip,$(BR2_GCC_VERSION))/ =
-I$(HOST_DIR)/$(GNU_TARGET_NAME)/include/c++/$(call =
qstrip,$(BR2_GCC_VERSION))/$(GNU_TARGET_NAME) -B$(STAGING_DIR)/usr/lib =
-B$(HOST_DIR)/lib/gcc/$(GNU_TARGET_NAME)/$(call =
qstrip,$(BR2_GCC_VERSION)) =
-L$(HOST_DIR)/lib/gcc/$(GNU_TARGET_NAME)/$(call =
qstrip,$(BR2_GCC_VERSION))" \<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>-DCMAKE_CXX_LINK_FLAGS=3D"-target $(LIBDISPATCH_TARGET_NAME) =
--sysroot=3D$(STAGING_DIR)" \<br class=3D"">+<br class=3D"">+define =
LIBDISPATCH_INSTALL_TARGET_CMDS<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>(cd =
$(LIBDISPATCH_BUILDDIR) &amp;&amp; \<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>cp ./*.so =
$(TARGET_DIR)/usr/lib/ \<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>)<br class=3D"">+endef<br =
class=3D"">+<br class=3D"">+$(eval $(cmake-package))<br class=3D"">-- =
<br class=3D"">2.30.2<br class=3D""><br =
class=3D""></div></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_F1DBB432-2561-4B4E-975E-016D587B5F17--

--===============3657798697898012799==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3657798697898012799==--
