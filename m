From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 11 Jul 2014 22:20:39 +0200
Subject: [Buildroot] [PATCH 12/20 RFC] package/libcec: needs libudev,
	not a udev daemon
References: <cover.1402699915.git.yann.morin.1998@free.fr>
 <d063b08a5cb278d84fcdd031906cd9f2faf3ac8f.1402699915.git.yann.morin.1998@free.fr>
Message-ID: <XnsA367E34B7DFC4berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in news:d063b08a5cb278d84fcdd031906cd9f2faf3ac8f.1402699915.git.yann.morin.1998 at free.fr:

> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> libcec is happy enough with just a libudev, which it uses to
> enumerate CEC devices, and does not require a udev daemon.
> 
> Propagate the new dependency to XBMC.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---

[...]

> -comment "hdmi cec support needs udev /dev management and a toolchain w/ dynamic library"
> -     depends on BR2_PREFER_STATIC_LIB || !BR2_PACKAGE_HAS_UDEV
> +comment "hdmi cec support needs a toolchain w/ dynamic library"
> +     depends on BR2_PREFER_STATIC_LIB

I would like to keep a comment to inform users that an udev provider is
needed to have cec support in xbmc.

Besides that:
Acked-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Regards, Bernd
