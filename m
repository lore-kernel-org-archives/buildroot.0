Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6354FC433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 16:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BEED9404D3;
	Tue, 19 Apr 2022 16:33:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mk3NxijLlinl; Tue, 19 Apr 2022 16:33:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CCF340328;
	Tue, 19 Apr 2022 16:33:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0E0CD1BF873
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 16:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A54040328
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 16:32:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XFTDCQi7TtfH for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 16:32:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB0FF40190
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 16:32:57 +0000 (UTC)
Received: from pwmachine.localnet (unknown [92.186.13.154])
 by linux.microsoft.com (Postfix) with ESMTPSA id 2134820C3620;
 Tue, 19 Apr 2022 09:32:54 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2134820C3620
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1650385976;
 bh=i/jDVrrU74/DHKyV1nc8kdM/vmT/aXm0EjBgN+Szpnk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ip620jb7ZSX0kM6lOcRHaO87wfdpUfXyETVSPNkgpp4PGZrFKIxUzQIox4qnAoz0R
 3Z/4EyNSAE6luA3vr+etCUNJ0rZdZ8O8IA9kDO2MlEal+HIPjmkaNfD3lgnM8SMF0f
 FSgeyqjcC+EyG7Dy0KfFzUhsfORuEcKeT3ApOZtM=
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 19 Apr 2022 17:32:51 +0100
Message-ID: <4391488.LvFx2qVVIh@pwmachine>
Organization: Microsoft
In-Reply-To: <20220416210750.3065016-1-fontaine.fabrice@gmail.com>
References: <20220416210750.3065016-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/tbb: bump to version 2021.5.0
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi.

Le samedi 16 avril 2022, 22:07:49 BST Fabrice Fontaine a =E9crit :
> - Switch to cmake-package
> - Drop DO_ITT_NOTIFY which is only used in example and test
> - license file has been renamed to LICENSE.txt
> - Add upstream patches to fix musl build
> =

> https://www.intel.com/content/www/us/en/developer/articles/release-notes/=
int
> el-oneapi-threading-building-blocks-release-notes.html
> =

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/sysdig/Config.in                      |  2 +-
>  ...Musl-linux-can-not-use-RTLD_DEEPBIND.patch | 33 ++++++++++++
>  ...is-only-defined-on-glibc-and-android.patch | 42 ++++++++++++++++
>  package/tbb/Config.in                         | 12 +++--
>  package/tbb/tbb.hash                          |  4 +-
>  package/tbb/tbb.mk                            | 50 +++----------------
>  6 files changed, 94 insertions(+), 49 deletions(-)
>  create mode 100644
> package/tbb/0001-Musl-linux-can-not-use-RTLD_DEEPBIND.patch create mode
> 100644 package/tbb/0002-mallinfo-is-only-defined-on-glibc-and-android.pat=
ch
> =

> diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
> index 3a4c033b2b..c124054105 100644
> --- a/package/sysdig/Config.in
> +++ b/package/sysdig/Config.in
> @@ -7,7 +7,7 @@ config BR2_PACKAGE_SYSDIG
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils, jq, protobuf, tbb
>  	depends on !BR2_STATIC_LIBS # elfutils, protobuf, tbb
>  	depends on BR2_USE_WCHAR # elfutils
> -	depends on BR2_TOOLCHAIN_USES_GLIBC # elfutils, tbb
> +	depends on BR2_TOOLCHAIN_USES_GLIBC # elfutils
>  	depends on BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
>  	select BR2_PACKAGE_C_ARES
>  	select BR2_PACKAGE_ELFUTILS
> diff --git a/package/tbb/0001-Musl-linux-can-not-use-RTLD_DEEPBIND.patch
> b/package/tbb/0001-Musl-linux-can-not-use-RTLD_DEEPBIND.patch new file mo=
de
> 100644
> index 0000000000..82182ce109
> --- /dev/null
> +++ b/package/tbb/0001-Musl-linux-can-not-use-RTLD_DEEPBIND.patch
> @@ -0,0 +1,33 @@
> +From 883c2e5245c39624b3b5d6d56d5b203cf09eac38 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 15 Dec 2021 08:08:07 -0800
> +Subject: [PATCH] Musl/linux can not use RTLD_DEEPBIND (#684)
> +
> +Exclude non-glibc linux systems along with android
> +Fixes
> +src/tbb/dynamic_link.cpp:417:29: error: use
> + of undeclared identifier 'RTLD_DEEPBIND'                               =
   =

>                                                  |             flags =3D
> flags | RTLD_DEEPBIND; +|                             ^
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +[Retrieved from:
> +https://github.com/oneapi-src/oneTBB/commit/883c2e5245c39624b3b5d6d56d5b=
203
> cf09eac38] +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + src/tbb/dynamic_link.cpp | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/tbb/dynamic_link.cpp b/src/tbb/dynamic_link.cpp
> +index 3f1342503..5330d7107 100644
> +--- a/src/tbb/dynamic_link.cpp
> ++++ b/src/tbb/dynamic_link.cpp
> +@@ -413,7 +413,7 @@ namespace r1 {
> +         int flags =3D RTLD_NOW;
> +         if (local_binding) {
> +             flags =3D flags | RTLD_LOCAL;
> +-#if __linux__ && !__ANDROID__ && !__TBB_USE_SANITIZERS
> ++#if (__linux__ && __GLIBC__) && !__TBB_USE_SANITIZERS
> +             flags =3D flags | RTLD_DEEPBIND;
> + #endif
> +         } else {
> diff --git
> a/package/tbb/0002-mallinfo-is-only-defined-on-glibc-and-android.patch
> b/package/tbb/0002-mallinfo-is-only-defined-on-glibc-and-android.patch new
> file mode 100644
> index 0000000000..9b397cac41
> --- /dev/null
> +++ b/package/tbb/0002-mallinfo-is-only-defined-on-glibc-and-android.patch
> @@ -0,0 +1,42 @@
> +From 3a7f96db56cc9821055cbc769d3065db86b8b4c9 Mon Sep 17 00:00:00 2001
> +From: Julien Voisin <jvoisin@users.noreply.github.com>
> +Date: Mon, 7 Feb 2022 07:56:15 +0100
> +Subject: [PATCH] mallinfo is only defined on glibc and android (#764)
> +
> +It currently prevents compilation under musl:
> +
> +```
> +[ 90%] Building CXX object
> src/tbbmalloc_proxy/CMakeFiles/tbbmalloc_proxy.dir/proxy.cpp.o
> +/__w/mimalloc-bench/mimalloc-bench/extern/tbb/src/tbbmalloc_proxy/proxy.=
cp
> p:263:26: error: return type 'struct mallinfo' is incomplete +  263 | str=
uct
> mallinfo mallinfo() __THROW
> +      |                          ^
> +compilation terminated due to -Wfatal-errors.
> +``
> +
> +[Retrieved from:
> +https://github.com/oneapi-src/oneTBB/commit/3a7f96db56cc9821055cbc769d30=
65d
> b86b8b4c9] +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + src/tbbmalloc_proxy/proxy.cpp | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/src/tbbmalloc_proxy/proxy.cpp b/src/tbbmalloc_proxy/proxy.c=
pp
> +index e58e55e0b..23b9c19c1 100644
> +--- a/src/tbbmalloc_proxy/proxy.cpp
> ++++ b/src/tbbmalloc_proxy/proxy.cpp
> +@@ -260,6 +260,7 @@ int mallopt(int /*param*/, int /*value*/) __THROW
> +     return 1;
> + }
> +
> ++#if defined(__GLIBC__) || defined(__ANDROID__)
> + struct mallinfo mallinfo() __THROW
> + {
> +     struct mallinfo m;
> +@@ -267,6 +268,7 @@ struct mallinfo mallinfo() __THROW
> +
> +     return m;
> + }
> ++#endif
> +
> + #if __ANDROID__
> + // Android doesn't have malloc_usable_size, provide it to be compatible
> diff --git a/package/tbb/Config.in b/package/tbb/Config.in
> index 0f40b74d31..b2e97829b5 100644
> --- a/package/tbb/Config.in
> +++ b/package/tbb/Config.in
> @@ -1,9 +1,11 @@
>  config BR2_PACKAGE_TBB
>  	bool "tbb"
> -	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	# tbb needs fenv.h which is not provided by uclibc
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC
>  	depends on !BR2_STATIC_LIBS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
>  	help
>  	  Intel(R) Threading Building Blocks (Intel(R) TBB) lets you
>  	  easily write parallel C++ programs that take full advantage
> @@ -12,5 +14,9 @@ config BR2_PACKAGE_TBB
> =

>  	  https://www.threadingbuildingblocks.org/
> =

> -comment "tbb needs a glibc toolchain w/ dynamic library, threads, C++"
> -	depends on !BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS ||
> !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP +comment "tbb needs a
> glibc or musl toolchain w/ dynamic library, threads, C++" +	depends on
> BR2_TOOLCHAIN_USES_UCLIBC || BR2_STATIC_LIBS || \
> +		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
> +
> +comment "tbb needs exception_ptr"
> +	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> diff --git a/package/tbb/tbb.hash b/package/tbb/tbb.hash
> index 81d224b3ca..9992fb3c4f 100644
> --- a/package/tbb/tbb.hash
> +++ b/package/tbb/tbb.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  b8dbab5aea2b70cf07844f86fa413e549e099aa3205b6a04059ca92ead93a372 =

> tbb-2018_U5.tar.gz -sha256 =

> c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
> +sha256  e5b57537c741400cf6134b428fc1689a649d7d38d9bb9c1b6d64f092ea28178a =

> tbb-2021.5.0.tar.gz +sha256 =

> c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4 =

> LICENSE.txt diff --git a/package/tbb/tbb.mk b/package/tbb/tbb.mk
> index 87e83551fe..afe756a85a 100644
> --- a/package/tbb/tbb.mk
> +++ b/package/tbb/tbb.mk
> @@ -4,52 +4,16 @@
>  #
>  ########################################################################=
###
> #####
> =

> -TBB_VERSION =3D 2018_U5
> -TBB_SITE =3D $(call github,01org,tbb,$(TBB_VERSION))
> +TBB_VERSION =3D 2021.5.0
> +TBB_SITE =3D $(call github,01org,tbb,v$(TBB_VERSION))
>  TBB_INSTALL_STAGING =3D YES
>  TBB_LICENSE =3D Apache-2.0
> -TBB_LICENSE_FILES =3D LICENSE
> +TBB_LICENSE_FILES =3D LICENSE.txt
>  TBB_CPE_ID_VENDOR =3D intel
>  TBB_CPE_ID_PRODUCT =3D threading_building_blocks
> =

> -TBB_SO_VERSION =3D 2
> -TBB_LIBS =3D libtbb libtbbmalloc libtbbmalloc_proxy
> -TBB_BIN_PATH =3D $(@D)/build/linux_*
> +TBB_CONF_OPTS =3D \
> +	-DTBB_STRICT=3DOFF \
> +	-DTBB_TEST=3DOFF
> =

> -# arch is normally set based on uname -m with some conversions. However,
> -# it is not really used for much:
> -# - to decide between 32 or 64-bit files (based on '64' in the name)
> -# - to decide on some arch-specific CFLAGS like -m32, which we don't
> actually want -# - to set DO_ITT_NOTIFY if it's x86 (32 or 64 bit)
> -# - to include assembler source, but it only exists for ia64
> -# The only thing we actually want from the above is the 32/64-bit, and
> -# DO_ITT_NOTIFY. Therefore, set arch to a fixed value which is unknown to
> -# the tbb build system, and set DO_ITT_NOTIFY explicitly.
> -TBB_ARCH =3D $(if $(BR2_ARCH_IS_64),buildroot64,buildroot32)
> -TBB_ITT_NOTIFY =3D $(if $(BR2_i386)$(BR2_x86_64),-DDO_ITT_NOTIFY)
> -TBB_CXXFLAGS =3D $(TARGET_CXXFLAGS) $(TBB_ITT_NOTIFY)
> -
> -define TBB_BUILD_CMDS
> -	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) arch=3D$(TBB_ARCH) \
> -		CPLUS=3D"$(TARGET_CXX)" CONLY=3D"$(TARGET_CC)" CXXFLAGS=3D"$
(TBB_CXXFLAGS)"
> -endef
> -
> -define TBB_INSTALL_LIBS
> -	$(foreach lib,$(TBB_LIBS),
> -		$(INSTALL) -D -m 0755 $(TBB_BIN_PATH)/$(lib).so.$
(TBB_SO_VERSION) \
> -			$(1)/usr/lib/$(lib).so.$(TBB_SO_VERSION) ;
> -		ln -sf $(lib).so.$(TBB_SO_VERSION) $(1)/usr/lib/$(lib).so
> -	)
> -endef
> -
> -define TBB_INSTALL_STAGING_CMDS
> -	mkdir -p $(STAGING_DIR)/usr/include/
> -	cp -a $(@D)/include/* $(STAGING_DIR)/usr/include/
> -	$(call TBB_INSTALL_LIBS,$(STAGING_DIR))
> -endef
> -
> -define TBB_INSTALL_TARGET_CMDS
> -	$(call TBB_INSTALL_LIBS,$(TARGET_DIR))
> -endef
> -
> -$(eval $(generic-package))
> +$(eval $(cmake-package))

I tested your patch and it builds succesfully and sysdig (0.27.1) is still =

running like a charm.
So, thank you for the bumping (I should have do it...) and the simplificati=
on =

of tbb.mk.


Best regards.


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
