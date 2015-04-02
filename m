From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 02 Apr 2015 23:32:20 +0200
Subject: [Buildroot] [PATCH] package/ti-gfx: bump version, add hashes
In-Reply-To: <1427996635-6414-1-git-send-email-yann.morin.1998@free.fr>
References: <1427996635-6414-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <551DB564.3070107@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/04/15 19:43, Yann E. MORIN wrote:
> We don't bump the softfp version, because there's still no newer release
> (probably softfp will never be updated).
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 (downloaded both versions and checked the hash, build test of EABIhf es8.x)


 Note that this version also has support for AM43x (es9.x), so perhaps that
option could be added as well?

> ---
>  package/ti-gfx/ti-gfx.hash | 3 +++
>  package/ti-gfx/ti-gfx.mk   | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>  create mode 100644 package/ti-gfx/ti-gfx.hash
> 
[snip]
> diff --git a/package/ti-gfx/ti-gfx.mk b/package/ti-gfx/ti-gfx.mk
> index c831dae..061e9fe 100644
> --- a/package/ti-gfx/ti-gfx.mk
> +++ b/package/ti-gfx/ti-gfx.mk
> @@ -7,7 +7,7 @@
>  # SDK 5_01_01_01 only support EABIhf so we downgrade to 5_01_00_01 if EABIhf is
>  # not available.
>  ifeq ($(BR2_ARM_EABIHF),y)
> -TI_GFX_VERSION = 5_01_01_01
> +TI_GFX_VERSION = 5_01_01_02
>  TI_GFX_SOURCE = Graphics_SDK_setuplinux_hardfp_$(TI_GFX_VERSION).bin

 Perhaps this could be refactored into

TI_GFX_VERSION = hardfp_5_01_01_02
else
TI_GFX_VERSION = softfp_5_01_00_01
endif
TI_GFX_SOURCE = Graphics_SDK_setuplinux_$(TI_GFX_VERSION).bin


 Regards,
 Arnout

>  else
>  TI_GFX_VERSION = 5_01_00_01
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
