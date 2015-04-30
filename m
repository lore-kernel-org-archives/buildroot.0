From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 30 Apr 2015 10:37:21 +0200
Subject: [Buildroot] [v6,
	05/15] gpu-viv-bin-mx6q: add version in libraries symlinks
In-Reply-To: <1421451251-23366-6-git-send-email-jezz@sysmic.org>
References: <1421451251-23366-6-git-send-email-jezz@sysmic.org>
Message-ID: <20150430083721.GE24549@t450s.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Sat, Jan 17, 2015 at 12:34:01AM +0100, J?r?me Pouiller wrote:
> Create libraries symbolic links with version numbers.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
> index 35ba1c6..7845a25 100644
> --- a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
> +++ b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
> @@ -36,13 +36,17 @@ endef
>  # Make sure these commands are idempotent.
>  define GPU_VIV_BIN_MX6Q_BUILD_CMDS
>  	$(SED) 's/defined(LINUX)/defined(__linux__)/g' $(@D)/usr/include/*/*.h
> -	for lib in EGL GAL VIVANTE GLESv2; do \
> -		ln -sf lib$${lib}-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so \
> -			$(@D)/usr/lib/lib$${lib}.so; \
> -	done
>  	ln -sf libGL.so.1.2 $(@D)/usr/lib/libGL.so
>  	ln -sf libGL.so.1.2 $(@D)/usr/lib/libGL.so.1
>  	ln -sf libGL.so.1.2 $(@D)/usr/lib/libGL.so.1.2.0
> +	ln -sf libEGL-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/usr/lib/libEGL.so
> +	ln -sf libEGL-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/usr/lib/libEGL.so.1
> +	ln -sf libEGL-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/usr/lib/libEGL.so.1.0
> +	ln -sf libGLESv2-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/usr/lib/libGLESv2.so
> +	ln -sf libGLESv2-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/usr/lib/libGLESv2.so.2
> +	ln -sf libGLESv2-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/usr/lib/libGLESv2.so.2.0.0
> +	ln -sf libVIVANTE-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/usr/lib/libVIVANTE.so
> +	ln -sf libGAL-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/usr/lib/libGAL.so
>  endef
>  
>  define GPU_VIV_BIN_MX6Q_INSTALL_STAGING_CMDS

As explained in my answer to the cover letter, this series of patch has
been successfully tested on a Nitrogen6x board.
http://lists.busybox.net/pipermail/buildroot/2015-April/124739.html

Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>

This now matches what is done in Yocto:
https://github.com/Freescale/meta-fsl-arm/blob/dizzy/recipes-graphics/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.inc#L165

Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>

Regards,
Gary
