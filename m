From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 20 Dec 2019 17:33:23 +0100
Subject: [Buildroot] [PATCH 1/1]
 toolchain/toolchain-external/toolchain-external-codesourcery-arm: disable
 SSP
In-Reply-To: <20191028130838.23254-1-fontaine.fabrice@gmail.com>
References: <20191028130838.23254-1-fontaine.fabrice@gmail.com>
Message-ID: <4d7dcf0f-322d-5421-cb54-e2c9aaf9f364@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

On 10/28/19 2:08 PM, Fabrice Fontaine wrote:
> This toolchain does not support -fstack-protector-strong:
> SSP option -fstack-protector-strong not available in this toolchain, please select another SSP level
> 
> As there is no way to add a !BR2_SSP_STRONG dependency without creating a
> Kconfig recursive dependency, just remove BR2_TOOLCHAIN_HAS_SSP
> 
> Fixes:
>   - http://autobuild.buildroot.net/results/78dc6428ffaa529fdad8e9c8aaec49ded5f0209a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I've tried applying this patch against autobuilder's buildroot but 
Buildroot recognizes that this toolchain is still capable of SSP and 
gives this error:
"SSP support available in this toolchain, please enable 
BR2_TOOLCHAIN_EXTERNAL_HAS_SSP"

The same is with your patch on top of master branch.

Can you please verify and dig into this problem?

Thank you very much
Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> ---
>   .../toolchain-external-codesourcery-arm/Config.in                | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
> index bdbe2acaea..f80e54ff06 100644
> --- a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
> +++ b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
> @@ -8,7 +8,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
>   	depends on !BR2_cortex_a12 && !BR2_cortex_a17 && !BR2_ARM_CPU_ARMV8A
>   	depends on !BR2_STATIC_LIBS
>   	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_SSP
>   	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>   	select BR2_INSTALL_LIBSTDCPP
>   	select BR2_HOSTARCH_NEEDS_IA32_LIBS
> 
