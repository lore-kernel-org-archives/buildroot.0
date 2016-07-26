From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jul 2016 09:18:34 +0200
Subject: [Buildroot] [PATCH v2] package/pdbg: new package
In-Reply-To: <CACPK8XcN=fCduHVVkALoRhr5t_=Y=gqPdjkpJvX2-uKE87O2Dw@mail.gmail.com>
References: <1469427392-25228-1-git-send-email-joel@jms.id.au>
 <1469429593-28546-1-git-send-email-joel@jms.id.au>
 <20160726000944.3fd80fc1@free-electrons.com>
 <CACPK8XcN=fCduHVVkALoRhr5t_=Y=gqPdjkpJvX2-uKE87O2Dw@mail.gmail.com>
Message-ID: <20160726091834.65fae763@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Jul 2016 11:43:53 +0930, Joel Stanley wrote:

> > Anything that makes it ARM-specific?  
> 
> Upstream has only ever tested the code on ARM. It does build for x86
> (and power, and anything else I guess), but as you point out below it
> is only useful when run from a processor that is attached to a p8
> host.
> 
> What's the general rule in this circumstance?

I believe in such cases we tend to make the package available on all
architectures anyway. There is no inherent limitation in having it
build and run on other architectures.

The only cases where we add architecture dependencies are:

 - The package contains architecture-specific code.

 - The package contains pre-built binaries for a given architecture
   (e.g. OpenGL blobs).

 - The package is really relevant only for an architecture, like some
   GPU or VPU related stuff, where the GPU/VPU only exists for this
   architecture. We could say that pdbg falls into this category though.

> >> +PDBG_VERSION = 90a7370a11e727f1482dea6ff2bd6aec20c64805
> >> +PDBG_SITE = $(call github,open-power,pdbg,$(PDBG_VERSION))
> >> +PDBG_LICENSE = Apache 2.0
> >> +PDBG_LICENSE_FILES = COPYING
> >> +PDBG_AUTORECONF = YES  
> >
> > Side note (unrelated to Buildroot packaging): had a look at the code,
> > and this mapping of /dev/mem to then bing-bang some protocol on GPIOs
> > from userspace is really, really nasty :-/  
> 
> Yep! You and I are the same page here. To date the tool has been used
> on a BIOS vendor's BMC firmware, running a very old kernel that lacks
> the proper linux APIs for access to hardware. It's not ideal.
> 
> I've been slowly upstreaming a from-scratch kernel port. Once we have
> that in place pdbg can add support for doing GPIO through the kernel.
> 
> In the future near future we will add FSI support in the kernel, and
> from there perhaps use the Coldfire processor inside the Aspeed SoC to
> offload the bitbanging. Lots of work to do, but we're getting there.

OK, sounds good.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
