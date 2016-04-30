From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 30 Apr 2016 21:02:42 +0200
Subject: [Buildroot] [PATCH 3/3] toolchain-external: bump version of
 Linaro AArch64 toolchain
In-Reply-To: <1462020184-29735-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1462020184-29735-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1462020184-29735-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <e79cbe68-1f05-45a8-ecc0-22e06fe31d35@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 30/04/2016 ? 14:43, Thomas Petazzoni a ?crit :
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Romain Naour <romain.naour@gmail.com>
[Tested with Qemu qemu_aarch64_virt_defconfig]
Tested-by; Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> ---
>  toolchain/toolchain-external/Config.in               | 2 +-
>  toolchain/toolchain-external/toolchain-external.hash | 2 +-
>  toolchain/toolchain-external/toolchain-external.mk   | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
> index 8ba8583..a769632 100644
> --- a/toolchain/toolchain-external/Config.in
> +++ b/toolchain/toolchain-external/Config.in
> @@ -583,7 +583,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
>  
>  # See note about Linaro ARM/ARMEB toolchains, above.
>  config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
> -	bool "Linaro AArch64 2015.11"
> +	bool "Linaro AArch64 2016.02"
>  	depends on BR2_aarch64
>  	depends on BR2_HOSTARCH = "x86_64"
>  	depends on !BR2_STATIC_LIBS
> diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
> index 89be483..bbcbc39 100644
> --- a/toolchain/toolchain-external/toolchain-external.hash
> +++ b/toolchain/toolchain-external/toolchain-external.hash
> @@ -49,7 +49,7 @@ sha256 bf5d3111dad5aa9aef0e955875fb7fc9e918cb24519af7014dd67a9e581a49b1  gcc-lin
>  sha256 f488caf46680b0c0a16b66b43fbfd157e3d6389df18e957983132e89529a9804  gcc-linaro-5.3-2016.02-x86_64_armeb-linux-gnueabihf.tar.xz
>  sha256 3954f496ab01de67241109e82abfaa9b7625fdab4f05e79e7902e9814a07b832  gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux.tar.xz
>  sha256 3954f496ab01de67241109e82abfaa9b7625fdab4f05e79e7902e9814a07b832  gcc-linaro-aarch64-linux-gnu-4.9-2014.09_src.tar.bz2
> -sha256 b318a1837a54146b0120a13852386576e38355513b4e2cd5e2125f9c26913777  gcc-linaro-5.2-2015.11-2-x86_64_aarch64-linux-gnu.tar.xz
> +sha256 1c85af550bedd378be583317b4abbdc96342b42c19fb19873c13d3093ff694ad  gcc-linaro-5.3-2016.02-x86_64_aarch64-linux-gnu.tar.xz
>  
>  # Codescape toolchains from Imagination Technologies
>  # From: http://codescape-mips-sdk.imgtec.com/components/toolchain/2015.10-04/
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index 7b42582..d3a6d0b 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -377,8 +377,8 @@ TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux.tar.x
>  TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL = gcc-linaro-aarch64-linux-gnu-4.9-2014.09_src.tar.bz2
>  TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SYMLINK
>  else
> -TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/components/toolchain/binaries/5.2-2015.11-2/aarch64-linux-gnu
> -TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.2-2015.11-2-x86_64_aarch64-linux-gnu.tar.xz
> +TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/components/toolchain/binaries/5.3-2016.02/aarch64-linux-gnu
> +TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.3-2016.02-x86_64_aarch64-linux-gnu.tar.xz
>  endif
>  else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64),y)
>  TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/aarch64-linux-gnu
> 
