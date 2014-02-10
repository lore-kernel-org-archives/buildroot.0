From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Feb 2014 13:17:34 +0100
Subject: [Buildroot] [PATCH] libtorrent: disable on ARC arch
In-Reply-To: <CAAXf6LWF4yj4E26ynNoP2EMhCkD3fin7Z9Coqoj9M26ZD3LxaQ@mail.gmail.com>
References: <1392031674-30031-1-git-send-email-anton.kolesov@synopsys.com>
 <CAAXf6LWF4yj4E26ynNoP2EMhCkD3fin7Z9Coqoj9M26ZD3LxaQ@mail.gmail.com>
Message-ID: <20140210131734.15cad107@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Anton,

On Mon, 10 Feb 2014 12:33:06 +0100, Thomas De Schampheleire wrote:

> > +        # ARC GCC doesn't support atomic instructions required by this lib
> > +        depends on !BR2_arc

Wrong indentation: one tab should be used.

> >         select BR2_PACKAGE_LIBSIGC
> >         help
> >           BitTorrent library written in C++ for *nix
> 
> This extra 'depends on' should be repeated on the comment about
> toolchain options below, so that this comment is only visible when the
> actual package is visible.
> Have a look at http://buildroot.uclibc.org/downloads/manual/manual.html#dependencies-target-toolchain-options
> 
> (Note: you don't have to repeat the "# ARG GCC doesn't support ..." on
> the comment)

And this additional dependency should be propagated to the reverse
dependencies of libtorrent, i.e the rtorrent package.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
