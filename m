From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jan 2018 22:25:28 +0100
Subject: [Buildroot] [PATCH] support/config-fragments: linaro-arm:
 remove default option
In-Reply-To: <20180109225407.24501-1-romain.naour@gmail.com>
References: <20180109225407.24501-1-romain.naour@gmail.com>
Message-ID: <20180112222528.15c247e9@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  9 Jan 2018 23:54:05 +0100, Romain Naour wrote:
> Remove BR2_ARM_EABIHF and BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM which are
> used by default when a cortex-A8 CPU is used.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  support/config-fragments/autobuild/linaro-arm.config | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/support/config-fragments/autobuild/linaro-arm.config b/support/config-fragments/autobuild/linaro-arm.config
> index d72e19b3ad..0f9b687d7a 100644
> --- a/support/config-fragments/autobuild/linaro-arm.config
> +++ b/support/config-fragments/autobuild/linaro-arm.config
> @@ -1,5 +1,3 @@
>  BR2_arm=y
>  BR2_cortex_a8=y
> -BR2_ARM_EABIHF=y
>  BR2_TOOLCHAIN_EXTERNAL=y
> -BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM=y

I am not convinced about removing BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM.
Indeed, we may very well add another external toolchain in the future
for ARM EABIhf. But since this defconfig is named linaro-arm, it really
should test the Linaro ARM toolchain, so it makes sense to have this
explicit option.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
