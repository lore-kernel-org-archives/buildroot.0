From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Oct 2011 10:19:28 +0200
Subject: [Buildroot] [PATCH 4/4] Add the libplayer package
In-Reply-To: <871uurnqhp.fsf@macbook.be.48ers.dk>
References: <cover.1317636624.git.maxime.ripard@free-electrons.com>
 <cover.1317636624.git.maxime.ripard@free-electrons.com>
 <d0ce7b4624a0a4fc886c8fcbc9c6730e7a931981.1317636624.git.maxime.ripard@free-electrons.com>
 <871uurnqhp.fsf@macbook.be.48ers.dk>
Message-ID: <20111006101928.294b6580@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 05 Oct 2011 22:16:34 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> >>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:
> 
> Hi,
> 
>  Maxime> From: Maxime Ripard <maxime@free-electrons.com>
>  Maxime> +config BR2_PACKAGE_LIBPLAYER
>  Maxime> +	depends on BR2_LARGEFILE
>  Maxime> +	bool "libplayer"
>  Maxime> +	help
>  Maxime> +	  libplayer provides a generic A/V API that relies on various multimedia
>  Maxime> +	  player for Linux systems. It currently supports MPlayer, xine VLC and
>  Maxime> +	  GStreamer only
>  Maxime> +
>  Maxime> +	  http://libplayer.geexbox.org/
>  Maxime> +
>  Maxime> +comment "Libplayer requires a toolchain with LARGEFILE support"
>  Maxime> +	depends on !BR2_LARGEFILE
>  Maxime> +
> 
> This should go under the 'if BR2_PACKAGE_LIBPLAYER' conditional.

Hu ? We want this comment to be shown when libplayer is *not* enabled,
to let the user know that if (s)he doesn't see libplayer, it's because
largefile is not enabled. So definitely, we don't want this comment to
depend on BR2_PACKAGE_LIBPLAYER. Or am I missing something here ?

>  Maxime> +if BR2_PACKAGE_LIBPLAYER
>  Maxime> +config BR2_PACKAGE_LIBPLAYER_MPLAYER
>  Maxime> +	depends on BR2_PACKAGE_MPLAYER
>  Maxime> +	bool "Libplayer mplayer backend"
>  Maxime> +
>  Maxime> +config BR2_PACKAGE_LIBPLAYER_GSTREAMER
>  Maxime> +	depends on BR2_PACKAGE_GSTREAMER
>  Maxime> +	bool "Libplayer GStreamer backend"
>  Maxime> +
>  Maxime> +config BR2_PACKAGE_LIBPLAYER_PYTHON
>  Maxime> +	depends on BR2_PACKAGE_PYTHON
>  Maxime> +	bool "Libplayer python bindings"
>  Maxime> +endif
>  Maxime> +
> 
> Empty line.
> 
> Does libplayer do anything sensible with both backends disabled or do we
> need to depend on BR2_PACKAGE_MPLAYER || BR2_PACKAGE_GSTREAMER?

I did ask the same question to Maxime, and libplayer builds fine with
neither backends enabled. It probably doesn't do anything useful, but I
would say that it's the user responsibility here.

> So it seems you need to depend on BR2_LARGEFILE.

Which it does:

>  Maxime> +config BR2_PACKAGE_LIBPLAYER
>  Maxime> +	depends on BR2_LARGEFILE

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
