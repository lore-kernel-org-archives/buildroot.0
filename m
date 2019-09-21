From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Sep 2019 23:14:58 +0200
Subject: [Buildroot] [PATCH v6 12/25] package/kodi-inputstream-adaptive:
 bump version
In-Reply-To: <20190921192826.10143-13-bernd.kuhls@t-online.de>
References: <20190921192826.10143-1-bernd.kuhls@t-online.de>
 <20190921192826.10143-13-bernd.kuhls@t-online.de>
Message-ID: <cf08695f-a7e3-d8f4-0a1c-e7a14a7a232b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21/09/2019 21:28, Bernd Kuhls wrote:
> Switched dependencies from libplatform & kodi-platform to kodi after
> upstream commit:
> https://github.com/peak3d/inputstream.adaptive/commit/0d1c5503ad809a23062aebd3c01837ca5d21ea3a
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi-inputstream-adaptive/Config.in                 | 2 --
>  .../kodi-inputstream-adaptive.hash                          | 2 +-
>  .../kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk  | 6 ++----
>  3 files changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/package/kodi-inputstream-adaptive/Config.in b/package/kodi-inputstream-adaptive/Config.in
> index cb5127363a..f9ba20adcf 100644
> --- a/package/kodi-inputstream-adaptive/Config.in
> +++ b/package/kodi-inputstream-adaptive/Config.in
> @@ -3,8 +3,6 @@ config BR2_PACKAGE_KODI_INPUTSTREAM_ADAPTIVE
>  	# wvdecrypter/cdm/build/build_config.h
>  	depends on BR2_aarch64 || BR2_arm || BR2_i386 || BR2_mipsel \
>  		|| BR2_mips64el || BR2_x86_64
> -	select BR2_PACKAGE_LIBPLATFORM
> -	select BR2_PACKAGE_KODI_PLATFORM
>  	help
>  	  Kodi inputstream addon for several manifest types
>  
> diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
> index 15ecf494f1..ee894b00df 100644
> --- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
> +++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
> @@ -1,2 +1,2 @@
>  # Locally computed
> -sha256 872a6ffefb90b6201a1e01fe5a52e05877e2040737e052b2f249725b9a8a44ff  kodi-inputstream-adaptive-c51b9a9b58a645f820883e6d99982277fc58aac5.tar.gz
> +sha256 d741222bee5cd719e703c9df5a99d5d6171918caa1f0ef949192bb5fa5db46bc  kodi-inputstream-adaptive-7322dc74093a371a8a41ddc16fed324381a11212.tar.gz
> diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
> index ab810d3248..17c2c5fcb4 100644
> --- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
> +++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
> @@ -4,12 +4,10 @@
>  #
>  ################################################################################
>  
> -# This cset is on the branch 'Krypton'
> -# When Kodi is updated, then this should be updated to the corresponding branch

 Why is this comment removed?

 Regards,
 Arnout

> -KODI_INPUTSTREAM_ADAPTIVE_VERSION = c51b9a9b58a645f820883e6d99982277fc58aac5
> +KODI_INPUTSTREAM_ADAPTIVE_VERSION = 7322dc74093a371a8a41ddc16fed324381a11212
>  KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,peak3d,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
>  KODI_INPUTSTREAM_ADAPTIVE_LICENSE = GPL-2.0+
>  KODI_INPUTSTREAM_ADAPTIVE_LICENSE_FILES = src/main.cpp
> -KODI_INPUTSTREAM_ADAPTIVE_DEPENDENCIES = libplatform kodi-platform
> +KODI_INPUTSTREAM_ADAPTIVE_DEPENDENCIES = kodi
>  
>  $(eval $(cmake-package))
> 
