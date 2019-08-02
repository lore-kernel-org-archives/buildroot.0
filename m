From: Romain Naour <romain.naour@smile.fr>
Date: Fri, 2 Aug 2019 16:49:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/waffle: bump version to 1.6.0
In-Reply-To: <20190704060635.11984-1-bernd.kuhls@t-online.de>
References: <20190704060635.11984-1-bernd.kuhls@t-online.de>
Message-ID: <20cae2c7-1d62-dea1-3bb5-93a0c7692a1a@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

Le 04/07/2019 ? 08:06, Bernd Kuhls a ?crit?:
> Removed patch 0001 which was applied upstream.
> 
> Switched _SITE to gitlab according to release notes:
> https://lists.freedesktop.org/archives/mesa-announce/2019-June/000520.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---

[...]

> index f496927e32..5bb65c9d93 100644
> --- a/package/waffle/waffle.hash
> +++ b/package/waffle/waffle.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256 d662f6743f688dc5ea4b7d29f558eb54bd8f57350080f04a006693d22e5d1d5b  waffle-1.5.2.tar.gz
> +sha256 b62bdc1c5ddea2f87c10a6d21d3812061e4c588a8a3bb45d9fd3ea3c9bd4fb30  waffle-1.6.0.tar.gz
>  sha256 630844d1911c8a1b7b888a1de9097c4860b7e381362fd5aa64141d58ab7ecc9b  LICENSE.txt
> diff --git a/package/waffle/waffle.mk b/package/waffle/waffle.mk
> index 280e295cb3..02a17f848b 100644
> --- a/package/waffle/waffle.mk
> +++ b/package/waffle/waffle.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -WAFFLE_VERSION = 1.5.2
> -WAFFLE_SITE = $(call github,waffle-gl,waffle,v$(WAFFLE_VERSION))
> +WAFFLE_VERSION = 1.6.0
> +WAFFLE_SITE = https://gitlab.freedesktop.org/mesa/waffle/-/archive/v$(WAFFLE_VERSION)/waffle-v$(WAFFLE_VERSION).tar.bz2
>  WAFFLE_INSTALL_STAGING = YES
>  WAFFLE_LICENSE = BSD-2-Clause
>  WAFFLE_LICENSE_FILES = LICENSE.txt
> 

Waffle 1.6.0 has a new option waffle_has_surfaceless_egl [1]

Since we don't provide platforms=surfaceless in mesa3d, I'm not sure waffle is
going to build if egl is enabled.

CXX is now listed in the project CMakeList.txt [1], we must add "depends on
BR2_INSTALL_LIBSTDCPP".

[1]
https://gitlab.freedesktop.org/mesa/waffle/commit/7318f22c4761035c03e99420edf3e92f07e06c9c

[2]
https://gitlab.freedesktop.org/mesa/waffle/commit/6ca943584e593aec2bd4f9c66d91859e63e02d61

Can you have a look?

Best regards,
Romain
