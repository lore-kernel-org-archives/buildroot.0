From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 May 2010 15:22:52 +0200
Subject: [Buildroot] [git commit master] webkit: remove user visible
 rendering target selection
In-Reply-To: <20100526122002.1355C1EB@busybox.osuosl.org>
References: <20100526122002.1355C1EB@busybox.osuosl.org>
Message-ID: <20100526152252.484cd6a7@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 26 May 2010 14:14:39 +0200
Peter Korsgaard <jacmet@sunsite.dk> wrote:

> +ifeq ($(BR2_PACKAGE_XORG7),y)
> +	WEBKIT_CONF_OPT += --with-target=x11
> +	WEBKIT_DEPENDENCIES += xserver_xorg-server
>  endif

Technically speaking, I don't think any X11 client applications
requires the server. Instead, it probably requires xlib_libX11 and
maybe some other additional libraries.

But, I admit that this isn't handled properly in all packages, and as
soon as one wants a X11 application, one probably also want the X
server as well, in most situations.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
