From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jan 2020 13:22:56 +0100
Subject: [Buildroot] [PATCH v2] toolchain: bump ARC prebuild toolchain
 to arc-2019.09
In-Reply-To: <20200118094923.40679-1-Evgeniy.Didin@synopsys.com>
References: <20200118094923.40679-1-Evgeniy.Didin@synopsys.com>
Message-ID: <20200118122256.GT22540@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Evgeniy, All,

On 2020-01-18 12:49 +0300, Evgeniy Didin spake thusly:
> Lets update prebuilt ARC toolchain to the most recent arc-2019.09.
> 
> We are dropping dependency of BR2_ARCH_NEEDS_GCC_AT_LEAST_*
> as for ARC arch there is no any selection of
> BR2_ARCH_NEEDS_GCC_AT_LEAST_* option.
> 
> Signed-off-by: Evgeniy Didin <didin@synopsys.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: arc-buildroot at synopsys.com

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes since v1:
> -Drop dependency of BR2_ARCH_NEEDS_GCC_AT_LEAST_*
> 
>  .../toolchain-external-synopsys-arc/Config.in                  |  5 ++---
>  .../toolchain-external-synopsys-arc.hash                       | 10 +++++-----
>  .../toolchain-external-synopsys-arc.mk                         |  2 +-
>  3 files changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
> index 5cb0ce2a3e..c3483f331c 100644
> --- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
> +++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
> @@ -1,7 +1,6 @@
>  config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
> -	bool "Synopsys ARC 2018.09 toolchain"
> +	bool "Synopsys ARC 2019.09 toolchain"
>  	depends on BR2_arc
> -	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_8
>  	depends on BR2_HOSTARCH = "x86_64"
>  	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
>  	select BR2_INSTALL_LIBSTDCPP
> @@ -12,7 +11,7 @@ config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
>  	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
>  	select BR2_TOOLCHAIN_HAS_SSP
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
>  	help
>  	  Toolchain for the ARC cores, from
>  	  https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases
> diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash b/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash
> index 20eac19caa..3ce6bbcb12 100644
> --- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash
> +++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2018.09-release
> -sha256 324b422eec3b9b36ea64c9e13167a4467fc13ab230eff34f2fa785039b460c16  arc_gnu_2018.09_prebuilt_uclibc_le_arc700_linux_install.tar.gz
> -sha256 b0299ad9be0c300237789e5bf8e45d72bf040aab00c3718fbdb4160b75d2ed8f  arc_gnu_2018.09_prebuilt_uclibc_be_arc700_linux_install.tar.gz
> -sha256 d1a4c039416b3da4d94ea066f861cc96ec60afec9c2bab1b2e937555b5e05238  arc_gnu_2018.09_prebuilt_uclibc_le_archs_linux_install.tar.gz
> -sha256 a519ed3686dc8e3c5f86646988d38647aa039f4af3204d9b7e84efa26cd37221  arc_gnu_2018.09_prebuilt_uclibc_be_archs_linux_install.tar.gz
> +# From https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2019.09-release
> +sha256 f7cbf68ef251943db7baf63535e0ec98dafbdf5d925017b4e1d4fc64d9b38a26  arc_gnu_2019.09_prebuilt_uclibc_le_arc700_linux_install.tar.gz
> +sha256 ac09f0a21f9d50146a5e542f4a6abc93e5a1dcb0a1372cb5c3ba86bbefaaec7d  arc_gnu_2019.09_prebuilt_uclibc_be_arc700_linux_install.tar.gz
> +sha256 245ca49fe8ea2456617541b18bb96e52e6c0dc619f00e293fcaad519fc436c35  arc_gnu_2019.09_prebuilt_uclibc_le_archs_linux_install.tar.gz
> +sha256 6f039a0158c03af398ada31fae96009e47f0d7b7f7d52e12eb419492fc3f27e7  arc_gnu_2019.09_prebuilt_uclibc_be_archs_linux_install.tar.gz
> diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk b/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk
> index e3ff17ff7b..c8f141e45d 100644
> --- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk
> +++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_VERSION = 2018.09
> +TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_VERSION = 2019.09
>  TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_SITE = https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/download/arc-$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_VERSION)-release
>  
>  ifeq ($(BR2_arc750d)$(BR2_arc770d),y)
> -- 
> 2.16.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
