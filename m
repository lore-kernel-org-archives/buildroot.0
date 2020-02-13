From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Thu, 13 Feb 2020 10:23:50 +0300
Subject: [Buildroot] [PATCH 1/4] boot/arm-trusted-firmware: Disable bin
 copy for rk3399
In-Reply-To: <1581573151-18943-2-git-send-email-sunil@amarulasolutions.com>
References: <1581573151-18943-1-git-send-email-sunil@amarulasolutions.com>
 <1581573151-18943-2-git-send-email-sunil@amarulasolutions.com>
Message-ID: <20200213072350.vwly4eganmeq57mu@bars>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, 

> Unlike other SoC platforms, rockchip platforms doesn't require a binary
> generation on TF-A project.
> 
> This is due to rockchip platforms have non-continuous memory areas in
> the linker script with a huge gap between them, so generating the binary
> would require addition padding which indeed increases the size of the binary.
> 
> Interestingly this binary generation is disabled in v2.2 of TF-A on below
> commit:
>  commit <33218d2a8143> "rockchip: Disable binary generation for all SoCs."
> 
> So, select default binary boot images as *.bin only if it's not rk3399.
> 
> This fixes the atf build on rk3399 with v2.2.
> 
> Note: the same can be applied to rest of rockchip platforms if
> they use v2.2 TF-A.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> Tested-by: Suniel Mahesh <sunil@amarulasolutions.com>
> ---
>  boot/arm-trusted-firmware/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

...

>  config BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES
>  	string "Binary boot images"
> -	default "*.bin"
> +	default "*.bin" if BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM!=rk3399
>  	help
>  	  Names of generated image files that are installed in the
>  	  output images/ directory.

IIUC, it should be customized in your board defconfig.

Regards,
Sergey
