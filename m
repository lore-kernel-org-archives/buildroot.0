From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 06 Oct 2011 11:08:59 +0200
Subject: [Buildroot] [PATCH 4/4] Add the libplayer package
In-Reply-To: <d0ce7b4624a0a4fc886c8fcbc9c6730e7a931981.1317636624.git.maxime.ripard@free-electrons.com>
 (Maxime Ripard's message of "Mon, 3 Oct 2011 12:10:34 +0200")
References: <cover.1317636624.git.maxime.ripard@free-electrons.com>
 <cover.1317636624.git.maxime.ripard@free-electrons.com>
 <d0ce7b4624a0a4fc886c8fcbc9c6730e7a931981.1317636624.git.maxime.ripard@free-electrons.com>
Message-ID: <87mxde4hck.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

 Maxime> From: Maxime Ripard <maxime@free-electrons.com>
 Maxime> Signed-off-by: Maxime Ripard <maxime@free-electrons.com>

Committed with minor changes, thanks.

 Maxime> diff --git a/package/multimedia/libplayer/Config.in b/package/multimedia/libplayer/Config.in
 Maxime> new file mode 100644
 Maxime> index 0000000..38315ec
 Maxime> --- /dev/null
 Maxime> +++ b/package/multimedia/libplayer/Config.in
 Maxime> @@ -0,0 +1,27 @@
 Maxime> +config BR2_PACKAGE_LIBPLAYER
 Maxime> +	depends on BR2_LARGEFILE
 Maxime> +	bool "libplayer"
 Maxime> +	help
 Maxime> +	  libplayer provides a generic A/V API that relies on various multimedia
 Maxime> +	  player for Linux systems. It currently supports MPlayer, xine VLC and
 Maxime> +	  GStreamer only
 Maxime> +
 Maxime> +	  http://libplayer.geexbox.org/
 Maxime> +
 Maxime> +comment "Libplayer requires a toolchain with LARGEFILE support"
 Maxime> +	depends on !BR2_LARGEFILE
 Maxime> +

This should be at the bottom of the file (after the sub options),
otherwise those don't get indented under BR2_PACKAGE_LIBPLAYER

 Maxime> +if BR2_PACKAGE_LIBPLAYER
 Maxime> +config BR2_PACKAGE_LIBPLAYER_MPLAYER
 Maxime> +	depends on BR2_PACKAGE_MPLAYER
 Maxime> +	bool "Libplayer mplayer backend"

It's not really clear for people who don't know the libplayer
implementation that they need to go and enable mplayer/gstreamer to get
libplayer to do anything useful, so I've changed these 'depends on' to
select like we normally do for libraries (yes, mplayer isn't really a
library, but here it is used as one).

At the same time I tweaked the option names a bit.

-- 
Bye, Peter Korsgaard
