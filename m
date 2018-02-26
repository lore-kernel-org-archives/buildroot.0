From: daggs <daggs@gmx.com>
Date: Mon, 26 Feb 2018 20:14:03 +0100
Subject: [Buildroot] [PATCH 1/2] mpv: disable mali-fbdev support
In-Reply-To: <20180226154112.12857-1-mahyar.koshkouei@gmail.com>
References: <20180226154112.12857-1-mahyar.koshkouei@gmail.com>
Message-ID: <trinity-3bb9e648-463e-4288-a645-80758d979719-1519672443490@3c-app-mailcom-bs03>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Mahyar ,

>
> A compile error occurs when attempting to compile mpv with mali support
> (eg. when odroid-mali package is selected).
> 
> Signed-off-by: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
> ---
>  package/mpv/mpv.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
> index 8d10aa7c47..d577674bd9 100644
> --- a/package/mpv/mpv.mk
> +++ b/package/mpv/mpv.mk
> @@ -31,7 +31,8 @@ MPV_CONF_OPTS = \
>  	--disable-uchardet \
>  	--disable-vapoursynth \
>  	--disable-vapoursynth-lazy \
> -	--disable-vdpau
> +	--disable-vdpau \
> +	--disable-mali-fbdev
>  
>  # ALSA support requires pcm+mixer
>  ifeq ($(BR2_PACKAGE_ALSA_LIB_MIXER)$(BR2_PACKAGE_ALSA_LIB_PCM),yy)
> -- 
> 2.16.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

I wonder, did it ever compiled when odroid mali is selected?

Dagg.
