From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Sep 2016 16:13:44 +0200
Subject: [Buildroot] [PATCH] configs: nitrogen*: enable NEON support
In-Reply-To: <20160916130902.23091-1-gary.bisson@boundarydevices.com>
References: <20160916130902.23091-1-gary.bisson@boundarydevices.com>
Message-ID: <20160916161344.54fed11e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 16 Sep 2016 15:09:02 +0200, Gary Bisson wrote:
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>  configs/nitrogen6sx_defconfig | 3 +++
>  configs/nitrogen6x_defconfig  | 3 +++
>  configs/nitrogen7_defconfig   | 1 +
>  3 files changed, 7 insertions(+)
> 
> diff --git a/configs/nitrogen6sx_defconfig b/configs/nitrogen6sx_defconfig
> index bd92f55..1df658b 100644
> --- a/configs/nitrogen6sx_defconfig
> +++ b/configs/nitrogen6sx_defconfig
> @@ -1,6 +1,9 @@
>  # architecture
>  BR2_arm=y
>  BR2_cortex_a9=y
> +BR2_ARM_ENABLE_NEON=y
> +BR2_ARM_ENABLE_VFP=y
> +BR2_ARM_FPU_NEON=y

So, -mfpu=neon here

> +BR2_ARM_ENABLE_NEON=y
> +BR2_ARM_ENABLE_VFP=y
> +BR2_ARM_FPU_NEON=y

And here.

>  # system
>  BR2_TARGET_GENERIC_GETTY=y
> diff --git a/configs/nitrogen7_defconfig b/configs/nitrogen7_defconfig
> index a8f3b45..adce0fb 100644
> --- a/configs/nitrogen7_defconfig
> +++ b/configs/nitrogen7_defconfig
> @@ -1,6 +1,7 @@
>  # architecture
>  BR2_arm=y
>  BR2_cortex_a7=y
> +BR2_ARM_FPU_NEON_VFPV4=y

But here, -mfpu=neon-vfpv4

Why this difference?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
