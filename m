From: Paul Cercueil <paul@crapouillou.net>
Date: Mon, 07 Oct 2019 11:47:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/lightning: bump version to 2.1.3
In-Reply-To: <20191006153115.15542-1-bernd.kuhls@t-online.de>
References: <20191006153115.15542-1-bernd.kuhls@t-online.de>
Message-ID: <1570441667.3.0@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Le dim., oct. 6, 2019 at 17:31, Bernd Kuhls <bernd.kuhls@t-online.de> a 
?crit :
> https://lists.gnu.org/archive/html/lightning/2019-09/msg00033.html
> "2.1.3 main features are the new RISC-V port, currently supporting
>  only Linux 64 bit"
> 
> Build-tested using this defconfig:
> 
> BR2_riscv=y
> BR2_TOOLCHAIN_BUILDROOT_MUSL=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_LIGHTNING=y
> BR2_PACKAGE_LIGHTNING_DISASSEMBLER=y
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Ah, thank you for that.

Acked-by: Paul Cercueil <paul@crapouillou.net>


> ---
>  package/lightning/Config.in      | 4 ++--
>  package/lightning/lightning.hash | 2 +-
>  package/lightning/lightning.mk   | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/lightning/Config.in b/package/lightning/Config.in
> index 79f7f86fb0..a0542edce9 100644
> --- a/package/lightning/Config.in
> +++ b/package/lightning/Config.in
> @@ -1,12 +1,12 @@
>  comment "lightning needs a toolchain w/ dynamic library"
>  	depends on BR2_sparc || BR2_i386 || BR2_x86_64 || BR2_mips || \
> -		BR2_mipsel || BR2_arm || BR2_powerpc
> +		BR2_mipsel || BR2_arm || BR2_powerpc || BR2_RISCV_64
>  	depends on BR2_STATIC_LIBS
> 
>  config BR2_PACKAGE_LIGHTNING
>  	bool "lightning"
>  	depends on BR2_sparc || BR2_i386 || BR2_x86_64 || BR2_mips || \
> -		BR2_mipsel || BR2_arm || BR2_powerpc
> +		BR2_mipsel || BR2_arm || BR2_powerpc || BR2_RISCV_64
>  	depends on !BR2_STATIC_LIBS
>  	help
>  	  GNU lightning is a library that generates
> diff --git a/package/lightning/lightning.hash 
> b/package/lightning/lightning.hash
> index 8e78ef4f81..bd20c85cbb 100644
> --- a/package/lightning/lightning.hash
> +++ b/package/lightning/lightning.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256	9b289ed1c977602f9282da507db2e980dcfb5207ee8bd2501536a6852a157a69	lightning-2.1.2.tar.gz
> +sha256	ed856b866dc6f68678dc1151579118fab1c65fad687cf847fc2d94ca045efdc9	lightning-2.1.3.tar.gz
>  
> sha256	a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c	COPYING.LESSER
> diff --git a/package/lightning/lightning.mk 
> b/package/lightning/lightning.mk
> index b93946146d..fd6bbcac89 100644
> --- a/package/lightning/lightning.mk
> +++ b/package/lightning/lightning.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -LIGHTNING_VERSION = 2.1.2
> +LIGHTNING_VERSION = 2.1.3
>  LIGHTNING_SITE = $(BR2_GNU_MIRROR)/lightning
>  LIGHTNING_LICENSE = LGPL-3.0+
>  LIGHTNING_LICENSE_FILES = COPYING.LESSER
> --
> 2.20.1
> 
