From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 28 Jul 2016 12:10:03 -0500
Subject: [Buildroot] [PATCH 1/2] toolchain-external: update ARMeb musl
	dependency
In-Reply-To: <1469713154-10898-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1469713154-10898-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CANQCQpYZgEsPir0+-ubPuD3+kz1mDfDLDO9-7-Akf-2O9hxMGg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 28, 2016 at 8:39 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> ARM big-endian is different from ARMv4/5/6 and ARMv7. Big-endian on
> ARMv4/5/6 is BE-32 while big-endian on ARMv7 is BE-8, which are not
> compatible.
>
> Therefore, the musl big endian toolchain that is built for ARMv4
> cannot work for ARMv7, it can only work for ARMv4/5/6.
>
> This commit updates the musl toolchain dependency accordingly.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  toolchain/toolchain-external/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
> index 5edde24..ee07ddb 100644
> --- a/toolchain/toolchain-external/Config.in
> +++ b/toolchain/toolchain-external/Config.in
> @@ -588,7 +588,7 @@ config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
>         bool "Musl 1.1.12 toolchain"
>         depends on (BR2_arm && BR2_ARM_EABI) || \
>                 (BR2_arm && BR2_ARM_EABIHF && !BR2_ARM_CPU_ARMV4) || \
> -               (BR2_armeb && BR2_ARM_EABI) || BR2_i386 || \
> +               (BR2_armeb && BR2_ARM_EABI && !BR2_ARM_CPU_ARMV7A) || BR2_i386 || \

Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>

>                 (BR2_mips && !BR2_SOFT_FLOAT) || \
>                 BR2_mipsel || (BR2_powerpc && BR2_powerpc_CLASSIC) || \
>                 BR2_sh4 || BR2_sh4eb || \
> --
> 2.7.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
