From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Feb 2014 20:31:16 +0100
Subject: [Buildroot] [PATCH 1/1] ti-gfx: bump to version 5_01_00_01
In-Reply-To: <52fd38fd.870eec0a.7f7f.13a5@mx.google.com>
References: <52fd38fd.870eec0a.7f7f.13a5@mx.google.com>
Message-ID: <20140223193116.GI32759@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marcelo, All,

On 2014-02-13 18:38 +0000, kuyurix at gmail.com spake thusly:
> From: Marcelo Gutierrez <kuyurix@gmail.com>
> 
> Signed-off-by: Marcelo Gutierrez <kuyurix@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Notes:

  - The version pointed to by Spencer was 5.00.x, and was a beta
    version, and only contained the hardfp variant. The version in
    this patch is 5.01.x, is not marked as beta, and contains both
    the hardfp and softfp variants.

  - With 4.10.x and before, the *_$(TI_GFX_VERSION).bin archive would
    contain a huge load of stuff we did not need, and was roughly
    1.7GiB big. But with 5.01.x, this file is now back to a more
    acceptable size, roughly 140MiB (although it still contains way
    much more than we need).

Regards,
Yann E. MORIN.

> ---
>  package/ti-gfx/ti-gfx.mk |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/ti-gfx/ti-gfx.mk b/package/ti-gfx/ti-gfx.mk
> index a94f00d..5ea6b92 100644
> --- a/package/ti-gfx/ti-gfx.mk
> +++ b/package/ti-gfx/ti-gfx.mk
> @@ -4,13 +4,13 @@
>  #
>  ################################################################################
>  
> -TI_GFX_VERSION = 4_09_00_01
> -TI_GFX_SO_VERSION = 1.9.2188537
> +TI_GFX_VERSION = 5_01_00_01
> +TI_GFX_SO_VERSION = 1.10.2359475
>  
>  ifeq ($(BR2_ARM_EABIHF),y)
> -TI_GFX_SOURCE = Graphics_SDK_setuplinux_$(TI_GFX_VERSION)_hardfp_minimal_demos.bin
> +TI_GFX_SOURCE = Graphics_SDK_setuplinux_hardfp_$(TI_GFX_VERSION).bin
>  else
> -TI_GFX_SOURCE = Graphics_SDK_setuplinux_$(TI_GFX_VERSION)_minimal_demos.bin
> +TI_GFX_SOURCE = Graphics_SDK_setuplinux_softfp_$(TI_GFX_VERSION).bin
>  endif
>  
>  TI_GFX_SITE = http://downloads.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/$(TI_GFX_VERSION)/exports/
> -- 
> 1.7.9.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
