From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 7 Nov 2016 23:35:56 +0100
Subject: [Buildroot] [PATCH v4 09/22]
 toolchain-external-codesourcery-arm: Cortex-A12 and Cortex-A17 not
 supported
In-Reply-To: <20161107012017.22505-10-arnout@mind.be>
References: <20161107012017.22505-1-arnout@mind.be>
 <20161107012017.22505-10-arnout@mind.be>
Message-ID: <1a10e956-fa2e-9b97-f5bd-a4170aff8972@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Le 07/11/2016 ? 02:20, Arnout Vandecappelle (Essensium/Mind) a ?crit :
> It's gcc 4.8.3 which doesn't support those cores yet.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Good catch :)

cortex-A17 was added with gcc5 and cortex-A12 with gcc4.9
https://gcc.gnu.org/gcc-5/changes.html
https://gcc.gnu.org/gcc-4.9/changes.html

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> ---
> v4: new patch
> ---
>  .../toolchain-external/toolchain-external-codesourcery-arm/Config.in    | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
> index 037985b..3cdfc86 100644
> --- a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
> +++ b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
> @@ -3,6 +3,8 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
>  	depends on BR2_arm
>  	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
>  	depends on BR2_ARM_EABI
> +	# Unsupported ARM cores
> +	depends on !BR2_cortex_a12 && !BR2_cortex_a17
>  	depends on !BR2_STATIC_LIBS
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
>  	select BR2_TOOLCHAIN_HAS_SSP
> 
