From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Jul 2017 15:46:29 +0200
Subject: [Buildroot] [PATCH] ARC: Add support for ARC HS38 with Hardware
 Floating Point
In-Reply-To: <20170710133650.8692-1-abrodkin@synopsys.com>
References: <20170710133650.8692-1-abrodkin@synopsys.com>
Message-ID: <20170710154629.442a4411@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Jul 2017 16:36:50 +0300, Alexey Brodkin wrote:
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> ---
>  arch/Config.in.arc       | 10 +++++++---
>  package/uclibc/Config.in |  1 +
>  2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/Config.in.arc b/arch/Config.in.arc
> index 7d341f3136..d0e2286557 100644
> --- a/arch/Config.in.arc
> +++ b/arch/Config.in.arc
> @@ -14,12 +14,15 @@ config BR2_arc770d
>  config BR2_archs38
>  	bool "ARC HS38"
>  
> +config BR2_archs38_hf
> +	bool "ARC HS38 with hard floating-point"

Does it need to be a separate CPU type, or an option when HS38 is
selected ?

>  config BR2_ARCH
>  	default "arc"	if BR2_arcle
> @@ -37,6 +40,7 @@ config BR2_GCC_TARGET_CPU
>  	default "arc700" if BR2_arc750d
>  	default "arc700" if BR2_arc770d
>  	default "archs"	 if BR2_archs38
> +	default "hs38_linux"	 if BR2_archs38_hf

gcc really understands -mcpu=hs38_linux ?

It seems odd to have the operating system name encoded in the CPU name.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
