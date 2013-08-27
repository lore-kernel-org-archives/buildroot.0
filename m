From: clshotwe at rockwellcollins.com <clshotwe@rockwellcollins.com>
Date: Tue, 27 Aug 2013 12:46:25 -0500
Subject: [Buildroot] SELinux Buildroot Additions
In-Reply-To: <20130827190459.1eb3e4d9@skate>
References: <OFC105562B.76AF62E8-ON86257BD4.005985FE-86257BD4.0059C2DD@rockwellcollins.com>
 <20130827190459.1eb3e4d9@skate>
Message-ID: <OF340CA870.4409C997-ON86257BD4.005E13D7-86257BD4.0061A29C@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 08/27/2013 
12:04:59 PM:

> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> To: clshotwe at rockwellcollins.com
> Cc: buildroot at busybox.net
> Date: 08/27/2013 12:05 PM
> Subject: Re: [Buildroot] SELinux Buildroot Additions
> 
> Hello Clayton,
> 
> On Tue, 27 Aug 2013 11:20:25 -0500, clshotwe at rockwellcollins.com wrote:
> 
> > I would like to get some feedback on adding SELinux support to 
Buildroot. 
> > This would involve adding several packages, modifying the .mk files 
for 
> > several packages to include SELinux support, and adding generic 
defconfigs 
> > to use as examples.  I would like to have defconfigs for QEMU targets 
> > (x86, ARM, PPC) along with a Pandaboard and another couple hardware 
> > targets.  The package selection for a functional SELinux system is a 
> > little complex so the example defconfigs would be nice to use as 
examples.
> > 
> > Would this be a welcomed addition to Buildroot?  I would like to 
submit a 
> > set of patches to first add the new packages, then modify existing 
> > packages, and then add in the example defconfigs one at a time.  Is 
this 
> > the best approach to take?
> 
> Having SELinux support in Buildroot would definitely be interesting,
> especially if you're using it for some projects!
> 
> Adding several packages is obviously fine. I guess you've already find
> the relevant documentation on how to add new packages to Buildroot.
> 
> Modifying existing .mk files of other packages to enable SELinux
> support is also perfectly fine. We'll have to see if we need a global
> knob to enable/disable SELinux, or if a per-package configuration is
> needed, or if the fact that a given package is enabled or disabled is a
> good enough indication of whether the user wants SELinux support. I
> guess we'll have to discuss this once we see your patches.
> 
> The defconfig part is probably the most problematic one. Until now, our
> policy about defconfigs is that they should just build the minimal set
> of things for a particular hardware platform to build: toolchain,
> kernel, bootloader, and minimal rootfs with Busybox. We've refrained
> from including other features in our defconfigs, because the definition
> of what a good configuration is for a particular platform is very
> use-case and user-dependent. Someone will want Qt, someone else will
> want X.org. Someone will want Busybox, someone else will want the
> full-featured Bash and Coreutils. Someone will want udev, someone else
> will want mdev. Someone will want Busybox init, someone else will want
> systemd. How to make a good choice, without having a proliferation of
> highly specific choices, is difficult.
> 
> Regarding SELinux and defconfigs, I see three options moving forward:
> 
>  *) We've been discussing some time ago the need to have some kind of
>     "demos" defconfig, mainly as part of the work done by Spenser
>     Gilliland on ARM OpenGL support in Buildroot. Those would be a
>     separate set of defconfig, clearly identified as "this demonstrates
>     some particular feature, on some particular platform, just for the
>     sake of demonstrating this feature". We however haven't decided
>     where to store those configurations, how to handle them compared to
>     the regular defconfigs, etc.
> 
>  *) Make the SELinux configuration in menuconfig simple enough that a
>     demonstration defconfig is not needed. You're mentioning that the
>     configuration to get a working SELinux system is a little bit
>     complex, and that's why a demo defconfig is needed. Maybe there's
>     something we can do here to make this SELinux configuration so
>     simple that a demo defconfig will no longer be needed?
> 
>  *) Add some details in the Buildroot manual on how to use SELinux.
>     Generally speaking, the manual could contain more details on how to
>     use a particular Buildroot package or feature. SELinux could be one
>     of them.
> 
> Of course, none of those options are mutually exclusive!
> 
> So, I believe we can get started with the first two steps, get an
> understanding of the configuration complexity, and see what is the best
> course of action for the last step.
> 
> What do you think about this?
> 
Thomas,

We have a multiple platforms that we will be validating this on 
including ARM, x86, and PPC. I should be able to start pushing out
patches for the packages within the week.

As for the defconfig issue, being able to pull down a reference config 
and some skeleton changes to implement a specific feature would be very 
nice to have. It may be possible to do QEMU targets for each architecture 
but I will have to look into that further. 

The single SELinux flag will be more problematic.  There are a lot of 
package dependencies that will be hard to configure without making the 
menuconfig very confusing. Also, there is a huge issue with using Busybox 
and the base SELinux Refpolicy put out by Tresys that cause applications 
to not run in the correct SELinux context.

For now, the documentation route, in the Buildroot manual, may be the best 

way to go. I'll just table this for now until I get the patches pushed 
out.

Thanks,
Clayton

Clayton Shotwell
Software Engineer
clshotwe at rockwellcollins.com
www.rockwellcollins.com 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130827/6c388be8/attachment.html>
