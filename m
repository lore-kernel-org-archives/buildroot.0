From: Mark Corbin <mark.corbin@embecosm.com>
Date: Tue, 30 Jul 2019 15:28:00 +0100
Subject: [Buildroot] [PATCH 2/2] toolchain: enable musl for riscv
In-Reply-To: <20190730102331.25609-2-joerg.krause@embedded.rocks>
References: <20190730102331.25609-1-joerg.krause@embedded.rocks>
 <20190730102331.25609-2-joerg.krause@embedded.rocks>
Message-ID: <f230122d-5286-cece-d092-7df76ec71aaa@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/07/2019 11:23, J?rg Krause wrote:
> Since version 1.1.23 musl supports the RISC-V architecture.
>
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  toolchain/toolchain-buildroot/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> index d9f16e2a3a..b4168bd40c 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -84,7 +84,7 @@ config BR2_TOOLCHAIN_BUILDROOT_MUSL
>  	depends on BR2_aarch64	   || BR2_arm   || BR2_armeb   || BR2_i386 || \
>  		   BR2_microblaze  || BR2_mips  || BR2_mipsel  || BR2_mips64 || \
>  		   BR2_mips64el    || BR2_or1k  || BR2_powerpc || BR2_powerpc64 || \
> -		   BR2_powerpc64le || BR2_sh    || BR2_x86_64
> +		   BR2_powerpc64le || BR2_riscv || BR2_sh      || BR2_x86_64
>  	depends on !BR2_powerpc_SPE # not supported, build breaks
>  	# sh2 nommu is supported by musl, but we don't have support
>  	# for it in Buildroot.

Successfully builds 'qemu_riscv64_virt_defconfig' and boots under qemu
3.1.0 to a working system.

Tested-by: Mark Corbin <mark.corbin@embecosm.com>

-- 
Mark Corbin
Embecosm Ltd.
https://www.embecosm.com
