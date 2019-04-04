From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Apr 2019 23:23:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/freerdp: add h264 support
In-Reply-To: <20190404130854.18876-1-skif@skif-web.ru>
References: <20190404130854.18876-1-skif@skif-web.ru>
Message-ID: <20190404232301.3250a15d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alexey,

Thanks for your contribution!

On Thu,  4 Apr 2019 16:08:54 +0300
Alexey Lukyanchuk <skif@skif-web.ru> wrote:

> +config BR2_PACKAGE_FREERDP_H264
> +        bool "h264 support"
> +        depends on BR2_PACKAGE_X264
> +        default y
> +        help
> +                h264 codec support for freerdp
> +

I think we would prefer to handle it like cups or ffmpeg, i.e as
"automatic dependencies", without an explicit Config.in option.

> +ifeq ($(BR2_PACKAGE_FREERDP_H264),y)
> +       FREERDP_CONF_OPTS += -DWITH_GFX_H264=ON
> +       FREERDP_DEPENDENCIES += x264
> +endif

i.e, make this:

ifeq ($(BR2_PACKAGE_X264),y)
FREERDP_CONF_OPTS += -DWITH_GFX_H264=ON
FREERDP_DEPENDENCIES += x264
else
FREERDP_CONF_OPTS += -DWITH_GFX_H264=OFF
endif

Could you rework your patch accordingly and send an updated version?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
