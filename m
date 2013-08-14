From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Tue, 13 Aug 2013 20:44:56 -0400
Subject: [Buildroot] BeagleBoneBlack Status
In-Reply-To: <CAEBucnD__n6ebXT6_vNLoUwV4tiKKteQNM9njeAjbh-Ld6+mKg@mail.gmail.com>
References: <CAEBucnD__n6ebXT6_vNLoUwV4tiKKteQNM9njeAjbh-Ld6+mKg@mail.gmail.com>
Message-ID: <CA+-urNRh=T8VuSmOwCr7RmxtYWJiUp=FyC8r-eO6sjvN8LnfyQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Spenser,

On Tue, Aug 13, 2013 at 7:11 PM, Spenser Gilliland
<spenser@gillilanding.com> wrote:
>
> Hi Everyone,
>
> I'm here with an update on the status of BBB. I have developed a
> defconfig for the BBB.  It is the beagleblack_defconfig in my
> github.com/Spenser309/buildroot (branch beagleblack) repo.  This takes
> in the mega patch from RobertCNelson, adds the dtc kernel patch, my
> linux_defconfig and builds a kernel/rfs that works on the BBB.

FWIW, RobertCNelson has a newer patch (bone25). I haven't tried it out
since everything has been working well for me with an older version.

Also, just so there's proper attribution for the dtc kernel patch, I
later found out that someone figured it out with Angstrom before me.
Here's a link to their patch:

https://github.com/beagleboard/kernel/blob/3.8/patches/build/0004-Make-single-.dtb-targets-also-with-DTC_FLAGS.patch

That particular patch directory has other patches that RCN doesn't
apply to his Debian builds (i.e. not in the mega patch), but it
doesn't seem like the others are necessary.

>
> The Beagle Bone Black faces two main issues in order to be completely
> supported in Buildroot.
>
> 1. The firmware (for BBB capes) must be builtin to the kernel as the
> kernels firmware loading mechanism does not wait for the RFS to be
> mounted.  This greatly increases the kernel size.

There's only about a 20 KB difference when CONFIG_FIRMWARE_IN_KERNEL
is defined. That doesn't seem that bad?

> 2. The SGX core has no support (or at least no documentation) for
> integrating with the TI DRM Framebuffer (supposedly will be
> implemented in next ti-gfx release.)

I also hope that this isn't a showstopper for bbb support in
buildroot, since the bbb is quite useful without the SGX core. (and
who knows when the next ti-gfx release will be)

As I get a chance, I'll start trying out some of your changes. Thanks
for sharing.

Frank

>
> Thanks,
> Spenser
>
> --
> Spenser Gilliland
> Computer Engineer
> Doctoral Candidate
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
