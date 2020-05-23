From: Ed Spiridonov <edo.rus@gmail.com>
Date: Sat, 23 May 2020 21:38:51 +0300
Subject: [Buildroot] [PATCH] package/openvpn: add option to use mbed TLS
 instead of OpenSSL
In-Reply-To: <20200518071508.5c8f134c@windsurf.home>
References: <20200511223108.4184-1-edo.rus@gmail.com>
 <20200515221042.011b8d33@windsurf.home>
 <CACm0Nn2ZFPuHKQoCh5pdakeHh80q-4nzt1umH0A5Rbon_ktgZw@mail.gmail.com>
 <20200518071508.5c8f134c@windsurf.home>
Message-ID: <CACm0Nn3uUdy_G6j+3MC+2U2uHa_GMzS80MEaHK2FX_DxS1QgKQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 18, 2020 at 8:15 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> All what you're saying here is valid for a huge number of packages
> where Buildroot automatically makes use of optional dependencies if
> they are available.
>
> For example:
>
> ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
> LIBGTK3_CONF_OPTS += --enable-xrandr
> LIBGTK3_DEPENDENCIES += xlib_libXrandr
> else
> LIBGTK3_CONF_OPTS += --disable-xrandr
> endif
>
> libgtk3 will automatically have xrandr support when
> BR2_PACKAGE_XLIB_LIBXRANDR is enabled. The user has no way to "know"
> about it, except by reading libgtk3.mk.

I agree, that looks reasonable. If someone wants xrandr support, he
selects BR2_PACKAGE_XLIB_LIBXRANDR.

But in the case of choosing openvpn crypto backend, I would prefer an
explicit choice.
IMO mbed?TLS should be the default option because it is much more compact.
But someone could choose OpenSSL because it is more mature.

BTW, I tried "select BR2_PACKAGE_MBEDTLS if !BR2_PACKAGE_OPENSSL", it
doesn't work.
https://www.spinics.net/lists/linux-kbuild/msg25569.html
So I do not know how to make mbed?TLS the default choice.
