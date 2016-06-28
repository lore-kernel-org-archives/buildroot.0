From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jun 2016 16:24:17 +0200
Subject: [Buildroot] [v1 1/1] uboot: Add local directory option to
	menuconfig
In-Reply-To: <87por1q1ps.fsf@dell.be.48ers.dk>
References: <1466994356-15411-1-git-send-email-Aduskett@gmail.com>
 <20160627205746.GC3714@free.fr>
 <CAFSsvmq4=Rjj=E8Bbvfj4AThYW7iG0fhSxcyAU4umpqO-4p8GA@mail.gmail.com>
 <87por1q1ps.fsf@dell.be.48ers.dk>
Message-ID: <20160628162417.421cc3cb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Jun 2016 08:14:39 +0200, Peter Korsgaard wrote:

>  >> If your concern is to be able to use a local source during development,
>  >> we have the override-srcdir mechanism just for that. See in the
>  >> menuconfig, in the "Build options" sub-menu:
>  >> 
>  >> ($(CONFIG_DIR)/local.mk) location of a package override file
>  >>   
>  > Interesting!  However I was not aware of this feature and I would suspect
>  > most users won't know about it because it's not in menuconfig.  For local
>  > development why would this be a bad thing?  
> 
> I agree that it isn't an obvious feature and that it is easy to miss. As
> Yann said, systems like Buildroot are really about reproducability, so
> referring to something local on the developers machine doesn't match
> very well.

This is only if you use Buildroot solely as a "final integration" tool.
But lots of people use Buildroot even during active development on a
given software component. In such a situation, people are ready to
trade "reproducibility" against "ease of building/testing a new
change". You certainly don't want to push to your kernel tree a new
commit, change your Buildroot configuration, pay the price of a
completely new kernel clone + build, to test each and every change you
make to your kernel.

The kernel, U-Boot and other bootloaders are somewhat special
components, as you often need HW-specific versions of those. This is
why we have the possibility of specifying custom Git versions, custom
tarballs, etc. From that perspective, having a way to specify a local
directory is also not a bad idea.

To me the _OVERRIDE_SRCDIR / local.mk thing is meant to be _local_ to
the developer machine. It's meant to only be used while hacking on a
given package, and at the end, produce a patch, or commit your changes.
I am not a big fan of suggesting people to version control their
local.mk, but maybe it's just a matter of taste (and improper name for
this local.mk).

So in the end, I am not as clear cut as you and Yann are about
rejecting the U-Boot "local directory" patch and removing the similar
functionality from Linux.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
