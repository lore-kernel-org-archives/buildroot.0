From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 30 Apr 2015 10:16:18 +0200
Subject: [Buildroot] [v6,
 01/15] mesa3d: Give possibility to external backends to enable
 DRI/Gallium
In-Reply-To: <1421451251-23366-2-git-send-email-jezz@sysmic.org>
References: <1421451251-23366-2-git-send-email-jezz@sysmic.org>
Message-ID: <20150430081618.GA24549@t450s.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Sat, Jan 17, 2015 at 12:33:57AM +0100, J?r?me Pouiller wrote:
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> Reviewed-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d/mesa3d.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index f6f6b0f..e96bba6 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -64,7 +64,7 @@ MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_I915)   += i915
>  MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_I965)   += i965
>  MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON) += radeon
>  
> -ifeq ($(MESA3D_GALLIUM_DRIVERS-y),)
> +ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER),)
>  MESA3D_CONF_OPTS += \
>  	--without-gallium-drivers
>  else
> @@ -73,7 +73,7 @@ MESA3D_CONF_OPTS += \
>  	--with-gallium-drivers=$(subst $(space),$(comma),$(MESA3D_GALLIUM_DRIVERS-y))
>  endif
>  
> -ifeq ($(MESA3D_DRI_DRIVERS-y),)
> +ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
>  MESA3D_CONF_OPTS += \
>  	--without-dri-drivers --without-dri --disable-dri3
>  else

As explained in my answer to the cover letter, this series of patch has
been successfully tested on a Nitrogen6x board.
http://lists.busybox.net/pipermail/buildroot/2015-April/124739.html

Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>

Regards,
Gary
