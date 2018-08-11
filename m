From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Aug 2018 12:25:29 +0200
Subject: [Buildroot] Analysis of build results for 2018-08-09
In-Reply-To: <CANQCQpauBUYBkxNiw7CtHNOO3pOkxF0PGnjrP_HagUJ+N2q=hQ@mail.gmail.com>
References: <20180810060017.0EEFE20719@mail.bootlin.com>
 <20180811001555.0b515e22@windsurf>
 <CANQCQpauBUYBkxNiw7CtHNOO3pOkxF0PGnjrP_HagUJ+N2q=hQ@mail.gmail.com>
Message-ID: <20180811122529.664a5d96@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Adding Hollis, which I forgot in my initial e-mail. Hollis, please have
a look at the thread, there has been some other build errors on your
older build machine.

On Fri, 10 Aug 2018 19:20:47 -0500, Matthew Weber wrote:

> > This we've got only 10 failures on master, let's have a look at them.  
> > >      aarch64 |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/66c03506e10071ec44ca509304595f4f5150e4d9 |
> > >       mipsel |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/2b41afe7841feba626fc29c9474e82d9934e6173 |  
> >
> > Due to the use of atomic built-ins, not available in old compilers. I
> > would suggest to make all packages that depend on host-libselinux to
> > depend on the appropriate host gcc version.  
> 
> Hollis has sent a patch suggestion to keep libselinux compatible with
> older gcc.  Is there a preference on carrying the patch vs using a
> host gcc version detect ?  I didn't realize we had a way to depend on
> host gcc version.  I'll take a look at that but let me know which way
> is preferred.

If the issue can be worked around by a patch, it's nice because we
don't have to propagate the host gcc dependency to gazillions of
packages. However, Hollis patch wasn't that simple/trivial, it would be
nice to have it checked by upstream. Or maybe it's just me who isn't
familiar enough with the semantic of atomic intrinsics.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
