From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Apr 2019 13:41:46 +0200
Subject: [Buildroot] [V2 0/7] linux and uboot version bumps and cleanup
In-Reply-To: <20190409154503.7598-1-shyam.saini@amarulasolutions.com>
References: <20190409154503.7598-1-shyam.saini@amarulasolutions.com>
Message-ID: <20190410134146.51426682@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Shyam,

On Tue,  9 Apr 2019 21:14:56 +0530
Shyam Saini <shyam.saini@amarulasolutions.com> wrote:

> - Logically reorder all nanopi m1 plus patches  
> - Remove BR2_GLOBAL_PATCH_DIR option from nanopi_m1_plus_defconfig
> 
> Shyam Saini (7):
>   configs: pine64_sopine: Bump to the linux 5.0 and u-boot 2019.01
>   configs: orangepi_prime: Bump to the linux 5.0 and u-boot 2019.01
>   configs: olimex_a64_olinuxino: Bump to the linux 5.0 and u-boot
>     2019.01
>   configs: orangepi_plus: Bump to the linux 5.0 and u-boot 2019.01
>   configs: nanopi_m1: Bump to the linux 5.0 and u-boot 2019.01
>   configs: nanopi_m1_plus: Bump to the linux 5.0 and u-boot 2019.01
>   board: friendlyarm: nanopi-m1-plus: patches: Remove linux patch

This was still wrong: if I apply the first 6 patches but not the last
one, the nanopi_m1_plus defconfig is broken: you try to build Linux 5.0
but apply a patch that was made for Linux 4.13. The last two patches
should have been squashed together to form a single patch.

Also, the commit title prefix should follow the format
"configs/<configname>".

I have fixed those issues and applied. Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
