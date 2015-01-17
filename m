From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 17 Jan 2015 18:02:30 +0100
Subject: [Buildroot] [PATCH v6 01/15] mesa3d: Give possibility to
	external backends to enable DRI/Gallium
References: <1421451251-23366-1-git-send-email-jezz@sysmic.org>
 <1421451251-23366-2-git-send-email-jezz@sysmic.org>
Message-ID: <XnsA425B7876372DberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

=?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz-
kPcTzGkeZgAdnm+yROfE0A@public.gmane.org> wrote in news:1421451251-23366-2-
git-send-email-jezz at sysmic.org:

> Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
> ---
>  package/mesa3d/mesa3d.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index f6f6b0f..e96bba6 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -64,7 +64,7 @@ MESA3D_DRI_DRIVERS-$(BR2
_PACKAGE_MESA3D_DRI_DRIVER_I915)   += i915
>  MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_I965)   += i965
>  MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON) += radeon
>  
> -ifeq ($(MESA3D_GALLIUM_DRIVERS-y),)
> +ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER),)
>  MESA3D_CONF_OPTS += \
>       --without-gallium-drivers
>  else
> @@ -73,7 +73,7 @@ MESA3D_CONF_OPTS += \
>       --with-gallium-drivers=$(subst $(space),$(comma),
$(MESA3D_GALLIUM_DRIVERS-y))
>  endif
>  
> -ifeq ($(MESA3D_DRI_DRIVERS-y),)
> +ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
>  MESA3D_CONF_OPTS += \
>       --without-dri-drivers --without-dri --disable-dri3
>  else
> -- 
> 1.9.1
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> Attachment decoded: untitled-1.txt
> 

Hi,

I only looked at this patch alone since I have no freescale hardware to 
test with. Compiling mesa3d with this patch included using this defconfig

BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER=y
BR2_PACKAGE_MESA3D_DRI_DRIVER=y
BR2_PACKAGE_MESA3D_DRIVER=y

does not break despite providing empty values in these configure options

--with-gallium-drivers= 
--with-dri-drivers=

so

Reviewed-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Regards, Bernd
