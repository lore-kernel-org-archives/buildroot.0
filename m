From: Nigel Sollars <nsollars@gmail.com>
Date: Fri, 25 May 2012 08:01:32 -0400
Subject: [Buildroot] GNUTLS
In-Reply-To: <1337867696.2404.2.camel@sven>
References: <CAG6aBkWMBN9uP-pTWo-MoyH7iUBG0mtNgEXdvKff1tDnVf0+VA@mail.gmail.com>
 <1337867696.2404.2.camel@sven>
Message-ID: <CAG6aBkUTfAGo0cOk=0mL+TzV0hD7WAJQ0P8D+50=nT5VpVsm9w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Seems that little change fixed this one,

Nige

On Thu, May 24, 2012 at 9:54 AM, Sven Neumann <s.neumann@raumfeld.com>wrote:

> On Wed, 2012-05-23 at 20:59 -0400, Nigel Sollars wrote:
> > Hello,
> >
> > I checked out the latest git as of yesterday,  gnutls fails the build
> > with
> >
> > checking
> > for
> /usr/local/panda-stuff/buildroot-src/git/buildroot-22052012/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
> option to accept ISO C99... -std=gnu99
> > checking
> > for
> /usr/local/panda-stuff/buildroot-src/git/buildroot-22052012/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
> -std=gnu99 option to accept ISO Standard C... (cached) -std=gnu99
> > configure: autobuild project... GnuTLS
> > configure: autobuild revision... 2.12.18
> > configure: autobuild hostname... slacktab
> > configure: autobuild timestamp... 20120524T004953Z
> > checking for inline... inline
> > checking whether we are using the GNU C++ compiler... yes
> > checking
> > whether
> /usr/local/panda-stuff/buildroot-src/git/buildroot-22052012/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-g++
> accepts -g... yes
> > checking dependency style
> > of
> /usr/local/panda-stuff/buildroot-src/git/buildroot-22052012/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-g++...
> gcc3
> > checking for ld used by
> > GCC...
> /usr/local/panda-stuff/buildroot-src/git/buildroot-22052012/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ld
> > checking if the linker
> >
> (/usr/local/panda-stuff/buildroot-src/git/buildroot-22052012/output/host/usr/--with-libgcrypt-prefix=bin/arm-unknown-linux-uclibcgnueabi-ld)
> is GNU ld... yes
> > checking for shared library run path origin... done
> > checking for libgcrypt... no
> > configure: error:
> > ***
> > *** Libgcrypt v1.4.0 or later was not found. You may want to get it
> > from
> > *** ftp://ftp.gnupg.org/gcrypt/libgcrypt/
> > ***
>
> Try changing the --with-libgcrypt-prefix=<path> option in gnutls.mk into
> --without-libgcrypt-prefix:
>
> diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
> index ce570d5..5fc69fd 100644
> --- a/package/gnutls/gnutls.mk
> +++ b/package/gnutls/gnutls.mk
> @@ -8,7 +8,7 @@ GNUTLS_VERSION = 2.12.18
>  GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.bz2
>  GNUTLS_SITE = $(BR2_GNU_MIRROR)/gnutls
>  GNUTLS_DEPENDENCIES = host-pkg-config libgcrypt
> -GNUTLS_CONF_OPT = --with-libgcrypt
> --with-libgcrypt-prefix=$(STAGING_DIR)/usr \
> +GNUTLS_CONF_OPT = --with-libgcrypt --without-libgcrypt-prefix \
>                --without-p11-kit
>  GNUTLS_INSTALL_STAGING = YES
>
>
> Regards,
> Sven
>
>
>


-- 
?Science is a differential equation. Religion is a boundary condition.?

Alan Turing
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120525/97523b13/attachment.html>
