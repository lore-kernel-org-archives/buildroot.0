From: Robert Schwebel <r.schwebel@pengutronix.de>
Date: Thu, 1 Nov 2012 10:26:30 +0100
Subject: [Buildroot] Topics for the Buildroot Developers meeting
In-Reply-To: <20121029233815.62dad9b3@skate>
References: <20121029194314.7545a446@skate>
 <CABYt4-a-3ozfyg-6dRg35vSAv-u8czNyi4cZ=QngtAND0jhcyA@mail.gmail.com>
 <20121029233815.62dad9b3@skate>
Message-ID: <20121101092630.GG23204@pengutronix.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 29, 2012 at 11:38:15PM +0100, Thomas Petazzoni wrote:
> Except that it doesn't work properly, even in PTXdist (as far as I
> know, of course). We had a discussion about this last year at ELCE with
> PTXdist developers. Basically, do the following:
>
>  * Build program foo with OpenSSL support (the OpenSSL support in foo
>    is optional, foo can work without OpenSSL). Both foo and openssl are
>    installed in the target.
>
>  * Enjoy foo with OpenSSL on your target, you're happy.
>
>  * Now, remove OpenSSL from your target.
>
> Beng, "foo" no longer works, because a library it is linked against no
> longer exists, and "foo" has not been rebuilt without OpenSSL support.
> As far as I know, PTXdist doesn't keep track of reverse dependencies
> when removing a package, and that can lead to invalid root filesystems.

You are basically right, but ptxdist's intention is to make reproducable
systems, which means that a system stays consistent to itself when you

a) check out the BSP from your repository
b) build it from scratch

That's the only guarantee it gives you. There is no promise that
anything stays consistent if you configure around while a half-built
system is already there.

Because we have dependencies derived from the "select" statements in
Kconfig, it most times works pretty well if you switch things on, which
is what people most often do while developing.

If you switch things off, packages might become inconsistent, but again,
there is no promise that this works.

Any idea for a better mechanism is welcome :-)

rsc
-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
