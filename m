From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 22:51:22 +0200
Subject: [Buildroot] [PATCH 2/3] ffmpeg: enable or disable debug based
 on BR2_ENABLE_DEBUG
In-Reply-To: <1410228406-2140-2-git-send-email-danomimanchego123@gmail.com>
References: <1410228406-2140-1-git-send-email-danomimanchego123@gmail.com>
 <1410228406-2140-2-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20140921225122.4a2c477a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Mon,  8 Sep 2014 22:06:45 -0400, Danomi Manchego wrote:

>  FFMPEG_CONF_OPT = \
> -	--prefix=/usr		\
> +	--prefix=/usr \

Unrelated change, so I removed this change from the patch.

>  	--enable-avfilter \
> -	--disable-debug \
>  	--disable-version3 \
>  	--enable-logging \
>  	--enable-optimizations \
> @@ -68,6 +67,12 @@ FFMPEG_CONF_OPT = \
>  
>  FFMPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
>  
> +ifeq ($(BR2_ENABLE_DEBUG),y)
> +FFMPEG_CONF_OPT += --enable-debug
> +else
> +FFMPEG_CONF_OPT += --disable-debug
> +endif
> +
>  ifeq ($(BR2_PACKAGE_FFMPEG_GPL),y)
>  FFMPEG_CONF_OPT += --enable-gpl
>  else

Other than that, applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
