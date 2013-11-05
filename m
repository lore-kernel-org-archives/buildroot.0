From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Tue, 5 Nov 2013 10:27:38 -0600
Subject: [Buildroot] [PATCH] perf: libelf is required to compile perf
In-Reply-To: <20131105161846.GC20511@tarshish>
References: <1383660387-31193-1-git-send-email-andi@etezian.org>
 <OFB695B6D2.ECE9BEB8-ON86257C1A.004FD92A-86257C1A.005239BF@rockwellcollins.com>
 <20131105161846.GC20511@tarshish>
Message-ID: <OF64ABF457.FAD0C9B3-ON86257C1A.005A407F-86257C1A.005A6AFC@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch Siach,

Baruch Siach <baruch@tkos.co.il> wrote on 11/05/2013 10:18:46 AM:
 
> On Tue, Nov 05, 2013 at 08:58:10AM -0600, rjbarnet at rockwellcollins.com 
wrote:
> > Andi Shyti <andi@etezian.org> wrote on 11/05/2013 08:06:27 AM:
> > > diff --git a/package/perf/Config.in b/package/perf/Config.in
> > > index 88dce93..4b651b3 100644
> > > --- a/package/perf/Config.in
> > > +++ b/package/perf/Config.in
> > > @@ -2,6 +2,7 @@ config BR2_PACKAGE_PERF
> > >     bool "perf"
> > >     depends on BR2_LINUX_KERNEL
> > >     depends on BR2_LARGEFILE
> > > +   depends on BR2_PACKAGE_LIBELF
> > 
> > Wouldn't you want this to be a select since LIBELF is required by this 

> > package? Also in the perf.mk you want to ensure that the libelf 
package is 
> > built before by adding a dependancy to the makefile.
> > 
> > ifeq ($(BR2_PACKAGE_LIBELF),y)
> > PERF_DEPENDENCIES += libelf
> > endif
> 
> When you select BR2_PACKAGE_LIBELF in Config.in there should be no need 
for 
> the 'ifeq' condition. Just add 'libelf' to PERF_DEPENDENCIES 
unconditionally.
 
You are correct. Its just habit that I do things like that.

Thanks,
-Ryan
