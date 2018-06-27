From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 27 Jun 2018 16:34:02 +0200
Subject: [Buildroot] [PATCH 1/1] toolchain-external-linaro-aarch64-be:
 new package
In-Reply-To: <1530108458-25676-1-git-send-email-oferh@marvell.com>
References: <1530108458-25676-1-git-send-email-oferh@marvell.com>
Message-ID: <20180627163402.1fa76584@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this contribution.

On Wed, 27 Jun 2018 17:07:38 +0300, oferh at marvell.com wrote:
> From: Ofer Heifetz <oferh@marvell.com>
> 
> This commit adds a new package for the Linaro external toolchain for
> the AArch64 Big Endian architecture.
> 
> https://releases.linaro.org/components/toolchain/binaries/7.3-2018.05
> 
> Signed-off-by: Ofer Heifetz <oferh@marvell.com>
> ---
>  .../config-fragments/autobuild/linaro-aarch64-be.config  |  3 +++
>  support/config-fragments/autobuild/toolchain-configs.csv |  1 +
>  toolchain/toolchain-external/Config.in                   |  2 ++
>  .../toolchain-external-linaro-aarch64-be/Config.in       | 15 +++++++++++++++
>  .../Config.in.options                                    |  9 +++++++++
>  .../toolchain-external-linaro-aarch64-be.hash            |  3 +++
>  .../toolchain-external-linaro-aarch64-be.mk              | 16 ++++++++++++++++
>  utils/genrandconfig                                      |  1 +

Generally looks good, but I'd like to see two patches, one adding the
toolchain (changes in toolchain/toolchain-external/) and a separate
patch for adding this toolchain to the autobuilder testing.


> diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in
> new file mode 100644
> index 0000000..44faeb3
> --- /dev/null
> +++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE
> +	bool "Linaro AArch64_be 2018.05"

Perhaps "Linaro AArch64 BE 2018.05" or something like that ?

> +	depends on BR2_aarch64_be
> +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> +	depends on !BR2_STATIC_LIBS
> +	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> +	select BR2_TOOLCHAIN_HAS_SSP
> +	select BR2_INSTALL_LIBSTDCPP
> +	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
> +	select BR2_TOOLCHAIN_HAS_FORTRAN
> +	help
> +	  Toolchain for the AArch64 architecture, from

AArch64 Big Endian architecture

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
