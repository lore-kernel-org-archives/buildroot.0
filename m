From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Mar 2016 23:10:47 +0100
Subject: [Buildroot] [PATCH 2/2] toolchain: Add support for Cortex-M4
 processor
In-Reply-To: <1442474492-13774-2-git-send-email-cjwfirmware@vxmdesign.com>
References: <1442474492-13774-1-git-send-email-cjwfirmware@vxmdesign.com>
 <1442474492-13774-2-git-send-email-cjwfirmware@vxmdesign.com>
Message-ID: <56DF4DE7.2090709@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/17/15 09:21, Chris Wardman wrote:
> This patch adds support for the Cortex-M4 processor. Cortex-M4 is almost
> completely identical to the Cortex-M3 processor. Cortex-M4 uses the same
> Thumb2/Thumb instruction set. Not sure if the extra M4 DSP instructions are
> currently supported.
>
> Signed-off-by: Chris Wardman <cjwfirmware@vxmdesign.com>
> ---
>   arch/Config.in.arm | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/arch/Config.in.arm b/arch/Config.in.arm
> index 4d10f4c..5055cb5 100644
> --- a/arch/Config.in.arm
> +++ b/arch/Config.in.arm
> @@ -156,6 +156,11 @@ config BR2_cortex_m3
>   	bool "cortex-M3"
>   	select BR2_ARM_CPU_HAS_THUMB
>   	select BR2_ARM_CPU_HAS_THUMB2
> +config BR2_cortex_m4
> +	bool "cortex-M4"
> +	select BR2_ARM_CPU_HAS_THUMB
> +	select BR2_ARM_CPU_HAR_THUMB2
> +	select BR2_ARM_CPU_ARMV7M

  This symbol doesn't exist yet, but it probably should. Can you add a separate 
patch to add that symbol (and select it from cortex_m3)?


  Regards,
  Arnout

>   config BR2_fa526
>   	bool "fa526/626"
>   	select BR2_ARM_CPU_HAS_ARM
> @@ -419,6 +424,7 @@ config BR2_GCC_TARGET_CPU
>   	default "cortex-a12"	if BR2_cortex_a12
>   	default "cortex-a15"	if BR2_cortex_a15
>   	default "cortex-m3"	if BR2_cortex_m3
> +	default "cortex-m4"     if BR2_cortex_m4
>   	default "fa526"		if BR2_fa526
>   	default "marvell-pj4"	if BR2_pj4
>   	default "strongarm"	if BR2_strongarm
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
