From: =?utf-8?Q?=C3=89meric?= Vigier <emeric.vigier@savoirfairelinux.com>
Date: Thu, 3 Apr 2014 14:11:45 -0400 (EDT)
Subject: [Buildroot] new package not built, AR prefix not passed to make
In-Reply-To: <CAKAx1ci6nKBQH66UEpBdxDmtSPTpRf3HhPMbgrgCAKt5v3DU1w@mail.gmail.com>
Message-ID: <2059325585.268239.1396548704994.JavaMail.root@mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Lionel,

----- Mail original -----
> Hi Emeric,
> 
> On Thu, Apr 3, 2014 at 5:32 PM, ?meric Vigier
> <emeric.vigier@savoirfairelinux.com> wrote:
> > Hi Builders,
> >
> > I am facing two basic issues after adding a new library to
> > buildroot:
> >
> > 1. "make" does not build it
> > ---------------------------
> > What I did can be summed up in these files:
> >
> >   $ grep company package/Config.in
> >   source "package/company/Config.in"
> >
> >   $ cat package/company/libfpga/Config.in
> >   config BR2_PACKAGE_COMPANY_LIBFPGA
> >         bool "libfpga"
> >         select BR2_TOOLCHAIN_USES_GLIBC
> >         help
> >           library providing access to FPGA functions
> >
> 
> Don't you also need a package/company/Config.in then, with the
> following content :
> 
> menu "Company-specific packages"
> source "package/company/libfpga/Config.in"
> endmenu
> 
> ?

I forgot to dump it in my email, but I wrote it as follows:

  $ cat package/company/Config.in 
  menuconfig BR2_PACKAGE_COMPANY
	bool "Company Library and embedded tools"
	help
	  Company Library and embedded tools

  if BR2_PACKAGE_COMPANY
  source "package/company/libfpga/Config.in"
  endif # BR2_PACKAGE_COMPANY

I also tried with your syntax, no luck.
My Config.in are sane I believe. I can see all the required options in menuconfig
And they end up in .config correctly.

Regards,
Emeric
