From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 24 Aug 2007 16:01:45 +0200
Subject: [Buildroot] configure is never called from	Makefile.autotools.in
In-Reply-To: <f90898420708240638w6f3ed01bld3aee41bacf00374@mail.gmail.com>
References: <f90898420708240638w6f3ed01bld3aee41bacf00374@mail.gmail.com>
Message-ID: <20070824140145.GA13635@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 24, 2007 at 03:38:01PM +0200, Simon Pasch wrote:
>x11r7-building fails with current snapshot because of commit 19657
>(Makefile.autotools.in)
>
>"if $(PKG)_SKIP_CONFIGURE is non-empty then ./configure is skipped"
>doesn't seem to work.
>
>Instead ./configure is never called...Although I tried playing around
>with the variable LIBXCB_SKIP_CONFIGURE, etc.

Could be. I'll back it out since autotools packages always have a
configure (as opposed to the package i tried to build with the
autotools.in file).

Sorry for the inconvenience..

I'm not 100% happy with Makefile.autotools.in, btw:
rp-pppoe, for example, has it's configure not in the toplevel dir but in
src/. From the looks, the autotools.in can't cope with such a layout,
currently.

Furthermore, for all autotools packages, it is easily possible to build
outside of the sourcetree, so stepping into an empty build_dir and
calling $(PKG)_CONFIGURE_DIR/configure ... (where this would default to
just the $(PKG)_DIR) would be nice, mid-term (think project_build
stuff).

>
>Just by the way...You do a great job here...Fast and reliable. It is a
>pleasure to work with buildroot, uclibc, busybox!

nice to hear. Thanks for your kind words :)

cheers,
