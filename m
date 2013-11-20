From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Nov 2013 12:09:00 +0100
Subject: [Buildroot] [PATCH] Mark MIPS I, II, III and IV as deprecated
In-Reply-To: <1384944173-15749-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1384944173-15749-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20131120120900.6a66d750@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Wed, 20 Nov 2013 10:42:53 +0000, Vicente Olivert Riera wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  arch/Config.in.mips |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/Config.in.mips b/arch/Config.in.mips
> index d70fd63..43af33c 100644
> --- a/arch/Config.in.mips
> +++ b/arch/Config.in.mips
> @@ -12,14 +12,16 @@ choice
>  
>  config BR2_mips_1
>  	bool "mips I (generic)"
> -	depends on !BR2_ARCH_IS_64
> +	depends on !BR2_ARCH_IS_64 && BR2_DEPRECATED
>  config BR2_mips_2
>  	bool "mips II"
> -	depends on !BR2_ARCH_IS_64
> +	depends on !BR2_ARCH_IS_64 && BR2_DEPRECATED
>  config BR2_mips_3
>  	bool "mips III"
> +	depends on BR2_DEPRECATED
>  config BR2_mips_4
>  	bool "mips IV"
> +	depends on BR2_DEPRECATED
>  config BR2_mips_32
>  	bool "mips 32"
>  	depends on !BR2_ARCH_IS_64

The commit log should explain *why* we're deprecating these CPU
variants.

Moreover, if we deprecate mips_1 and mips_3, then there should be some
change in:

choice
        prompt "Target Architecture Variant"
        depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
        default BR2_mips_3 if BR2_mips
        default BR2_mips_1 if BR2_mipsel
        default BR2_mips_64 if BR2_mips64 || BR2_mips64el
        help

at the beginning of Config.in.mips

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
