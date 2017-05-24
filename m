From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 24 May 2017 14:47:50 +0000
Subject: [Buildroot] [PATCH v2 2/3] package/gcc: add support for gcc 7
In-Reply-To: <20170524162612.09a18a25@free-electrons.com>
References: <20170523202440.6949-1-romain.naour@gmail.com>
 <20170523202440.6949-2-romain.naour@gmail.com>
 <20170524162612.09a18a25@free-electrons.com>
Message-ID: <1495637269.2909.25.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

On Wed, 2017-05-24 at 16:26 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> First of all, thanks for doing this work!
> 
> I've added Alexey, Waldemar and Vicente in Cc, since there are some
> ARC, Microblaze, OpenRISC and MIPS questions below.
> 
> On Tue, 23 May 2017 22:24:39 +0200, Romain Naour wrote:
> > 
> > Remove upstream patches:
> 
> [...]
> 
> Nice to see that so many patches are upstream, and that our stack of
> gcc patches for 7.x is now really small!
> 
> Perhaps we should start some effort to upstream the last few remaining
> patches?
> 
> > 
> > +config BR2_GCC_VERSION_7_X
> > +	bool "gcc 7.x"
> > +	# Broken or unsupported architectures
> > +	depends on !BR2_arc
> > +	depends on !BR2_microblaze
> > +	depends on !BR2_or1k
> 
> ARC is indeed still not supported fully in gcc 7.x I believe. Alexey,
> do you confirm?

Well I'd say something completely opposite :)

GCC 7.x has as much of ARC support as it could be now. We submit all our changes
to gcc immediately and it's only a matter of review and approval delay for when it
lands in master branch of GCC. The same applies to GCC releases - whatever got merged
by the time of release is there. So I'd say we barely differ here a lot from other first
class citizens in GCC.

Moreover GCC 7.1 should work for us just fine and very limited amount of patches could
be needed to fix things here and there.

BTW and the same is true for Binutils. And frankly for quite some time now I was planning
to give upstream GCC/Binutils a try in Buildroot for ARC. So while we're on topic I guess
we may start from having 2 options for ARC users:
?* Build toolchain from ARC releases from GitHub forks of GCC and Binutils
?* Build toolchain from upstream releases

-Alexey
