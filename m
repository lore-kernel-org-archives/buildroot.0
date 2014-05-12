From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 May 2014 21:21:31 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/gdb: add gdb 7.7.1
In-Reply-To: <53711C15.5010909@linux.vnet.ibm.com>
References: <1399842673-21261-1-git-send-email-cody@linux.vnet.ibm.com>
 <1399842673-21261-2-git-send-email-cody@linux.vnet.ibm.com>
 <20140511235400.67d6ac5f@free-electrons.com>
 <53711C15.5010909@linux.vnet.ibm.com>
Message-ID: <20140512212131.4f83a517@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Cody P Schafer,

On Mon, 12 May 2014 12:08:05 -0700, Cody P Schafer wrote:

> > I'm not sure we want to jump straight to 7.7 for all architectures.
> > We're usually a bit conservative with regard to the version of toolchain
> > components. So I'd suggest instead to add 7.6 and 7.7. Make 7.6 the new
> > default for all architectures except PPC64, and make 7.6 unavailable
> > for PPC64, and therefore select 7.7 for PPC64. Of course, all older gdb
> > versions should be unavailable for PPC64.
> 
> So long as s/PPC64/PPC64le/, sure.

Right. I guess PPC64 (big endian) has been supported since a long time,
is this correct?

> > Another question is: are there some existing, publicly available,
> > pre-built toolchain for PPC64 ?
> 
> https://www.kernel.org/pub/tools/crosstool/ has a ppc64 one (without a 
> libc). I'm not aware of one shipping with a libc.

Toolchains without a libc are not very useful in the context of
Buildroot.

> I don't know of any ppc64le prebuilt toolchains.

Ok, no problem :)

> > My last question is: how far goes your interest for PPC64 ? When we
> > start supporting a new architecture in Buildroot, we generally add it
> > in the autobuilders, which means that a significant portion of the
> > Buildroot packages get built against this new architecture. This often
> > raises a number of build failures. Would you be willing to help fixing
> > those? To help doing this, we generally offer to people in charge of a
> > given architecture to receive a daily e-mail listing the build failures
> > that occurred on that architecture. A good thing is that this helps the
> > persons maintaining this infrastructure notice which userspace packages
> > need to be taken care of.
> 
> I'm really only doing this because I end up using buildroot to build 
> netboot images to test kernel changes I make on real hardware.
> It's entirely a yak shaving project to me.
> 
> That said, I'm fine with getting emails, but can't promise anything 
> about actually helping fix things.

No problem, that's fine: it's a best effort thing. It's just that when
we support an architecture in Buildroot, we would like to have a fairly
decent support. It really isn't nice if we pretend to support a given
architecture, and in fact things quickly fall apart when a new user
comes in and tries to build a given configuration of packages for this
architecture.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
