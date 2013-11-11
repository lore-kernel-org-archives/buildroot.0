From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Nov 2013 11:15:46 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20131111101053.GO4581@tarshish>
References: <20131109073028.B3C2E52C614@lolut.humanoidz.org>
 <20131109191543.414f5694@skate> <52806C1C.7010206@zankel.net>
 <20131111105830.67b0a602@skate> <20131111101053.GO4581@tarshish>
Message-ID: <20131111111546.2d9d7544@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Mon, 11 Nov 2013 12:10:53 +0200, Baruch Siach wrote:

> On Mon, Nov 11, 2013 at 10:58:30AM +0100, Thomas Petazzoni wrote:
> > On Sun, 10 Nov 2013 21:33:16 -0800, Chris Zankel wrote:
> > > (I'm a bit surprised to get all those errors as binutils currently doesn't 
> > > build. Are you using an older toolchain, or are these packages not 
> > > dependent on the final binutils build?)
> > 
> > The binutils issues you're seeing are while building native binutils
> > for the target, not when building cross-binutils for the cross
> > compilation toolchain. Building the cross-binutils works ok, because
> > they are built against the build machine C library, which is glibc and
> > therefore has obstack stuff.
> 
> Why do we need binutils on target?

$ git grep "select BR2_PACKAGE_BINUTILS"
package/dropwatch/Config.in:	select BR2_PACKAGE_BINUTILS
package/oprofile/Config.in:	select BR2_PACKAGE_BINUTILS

So we need it for dropwatch and oprofile. In fact, what is needed is
not the full binutils (i.e the binutils programs), but the libbfd
library which is part of the binutils tarball.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
