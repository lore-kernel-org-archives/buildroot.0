From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 22:51:13 +0100
Subject: [Buildroot] [PATCH] package/kodi: Use i.MX VPU (video codec)
 when available
In-Reply-To: <1425494242-17354-1-git-send-email-julien.boibessot@free.fr>
References: <1425494242-17354-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <20150304225113.42c362cf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien,

On Wed,  4 Mar 2015 19:37:22 +0100, julien.boibessot at free.fr wrote:

> +	  To have hardware accelerated video decoding on following platforms,
> +	  you will also have to select related package(s):
> +	  * RPi: rpi-firmware
> +	  * i.MX6: libfslvpuwrap

As discussed with Yann, I've dropped this part, since it is quite hard
to maintain for all platforms.

> +ifeq ($(BR2_PACKAGE_LIBFSLVPUWRAP),y)
> +KODI_DEPENDENCIES += libfslvpuwrap
> +KODI_CONF_OPTS += --enable-codec=imxvpu
> +endif

I've applied this part, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
