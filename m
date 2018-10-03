From: Trent Piepho <tpiepho@impinj.com>
Date: Wed, 3 Oct 2018 00:25:19 +0000
Subject: [Buildroot] [PATCH] gnupg: Package only needs ncurses with
 readline
In-Reply-To: <20181002053850.uguwwwry2wx37hp6@sapphire.tkos.co.il>
References: <20180928231709.13395-1-tpiepho@impinj.com>
 <20181002053850.uguwwwry2wx37hp6@sapphire.tkos.co.il>
Message-ID: <1538526319.6709.28.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2018-10-02 at 08:38 +0300, Baruch Siach wrote:
> @@ -2,7 +2,7 @@ config BR2_PACKAGE_GNUPG
> >  	bool "gnupg"
> >  	depends on !BR2_PACKAGE_GNUPG2
> >  	select BR2_PACKAGE_ZLIB
> > -	select BR2_PACKAGE_NCURSES
> > +	select BR2_PACKAGE_NCURSES if BR2_PACKAGE_READLINE
> 
> BR2_PACKAGE_READLINE selects BR2_PACKAGE_NCURSES already, so this is not 
> needed.

Ok, I can take it out.  I thought since the gnupg configure script
directly references ncurses (when looking for readline), there should
be a direct dependency from gnupg to ncurses, rather than depending on
that dependency being there indirectly.  I.e., what if someone changes
readline's dependencies, would they consider the effect on gnupg?

But perhaps since it's part of readline support that is not necessary.
