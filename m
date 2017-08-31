From: Aseem Sharma <aseem.sharma19@gmail.com>
Date: Thu, 31 Aug 2017 17:18:04 +0530
Subject: [Buildroot] Need help with cross-compiler configuration
In-Reply-To: <4c4a4466-f6d0-6594-1933-d612ee5e060c@mind.be>
References: <CANK3ZEf0_A2aexR9mDJK3pi_CZhbBcujAnmsStvoJ6+DRZSVnA@mail.gmail.com>
 <20170830184823.i43svfizch3f3m75@tarshish>
 <CANK3ZEd3CKYjuDZd-6gOe1qPPURboKvSL5rYG+wsjHP3ee+4xA@mail.gmail.com>
 <20170831071631.2irz2a4dxpw74h3c@tarshish>
 <4c4a4466-f6d0-6594-1933-d612ee5e060c@mind.be>
Message-ID: <CANK3ZEc32KpRBBKF2ebAMZ8tk2feZQ9di_H282F71=_-NX8FXQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Arnout & Baruch for your inputs and time.
I will see what I can find on internet and old kernel configuration.

Best Regards,
Aseem

On Thu, Aug 31, 2017 at 1:26 PM, Arnout Vandecappelle <arnout@mind.be>
wrote:

>
>
> On 31-08-17 09:16, Baruch Siach wrote:
> > Hi Aseem,
> >
> > On Thu, Aug 31, 2017 at 12:30:05PM +0530, Aseem Sharma wrote:
> >> On Thu, Aug 31, 2017 at 12:18 AM, Baruch Siach <baruch@tkos.co.il>
> wrote:
> >>> On Wed, Aug 30, 2017 at 08:19:33PM +0530, Aseem Sharma wrote:
> >>>> I am naive to buildroot & processor world trying to compile
> >>>> "buildroot-2017.02.5" for "Marvell ARM Armada 166E processor
> (compatible
> >>> to
> >>>> ARMv5TE instruction-set)" based old system.
> >>>>
> >>>> I compiled the buildroot (kernel, rootfs & cross-compiler) by setting
> >>> arm926t
> >>>> (little-endian) as target arch/variant as suggested by Arnout/Baruch
> in
> >>>> response to my old query. However, now I am having trouble booting the
> >>>> system with the new buildroot created zImage. I do not seem to get any
> >>>> output/log on the system screen after flashing this new image onto the
> >>>> system.
> >>>
> >>> Which kernel did you use?
> >>
> >> [Aseem] I am using the zImage built by default kernel version with
> >> "buildroot-2017.02.5"  ie. "4.9.13"
> >
> > Do you have any reason to believe that this kernel supports your target?
> You
> > will most likely need to write a device-tree file for your target. This
> is
> > purely kernel related, so out of scope for Buildroot and for this list.
>
>  Indeed, you'll have to find a kernel and a kernel configuration that
> supports
> your device. You can take a look at arch/arm/configs and arch/arm/boot/dts
> in
> the kernel to see if there is anything that matches your device. Or do a
> websearch for the combination of your device name and 'linux kernel'.
>
> [snip]
> >>>> *Screen Output on Target:*
> >>>>
> >>>> *# *./test
> >>>> *./test: line 1: syntax error: unexpected ")"*
>
>  This is indeed indicative of a kernel that doesn't support EABI, or maybe
> it
> doesn't even support ELF. So if you keep using that older kernel, you will
> also
> need to use a toolchain that supports OABI. I know of no easy way to
> determine
> the ABI supported by the kernel. Maybe /proc/cpuinfo gives some insight,
> or else
> you can look at /proc/config.gz (if available) but that's a bit
> complicated to
> analyze.
>
> [snip]
> >>> Did you build your test program statically? If not, which libc variant
> do
> >>> you
> >>> use?
>
>  That's not going to help. If it's a dynamic library issue, you'll get a
> "No
> such file or directory" error (because it can't find the dynamic linker).
>
> [snip]
> >> [Aseem] Do you mean that I have to pick up an older version of
> buildroot to
> >> make this work on my device? If yes, coould you please point me to the
> >> correct build to be used.
> >
> > The Config.in.legacy file lists the BR2_ARM_OABI config symbol under
> "Legacy
> > options removed in 2013.08". So you might have luck with an earlier
> release.
>
>  I think it is still possible to use an OABI external toolchain, I don't
> think
> there's an explicit check for that. So you just have to find an old
> toolchain.
>
>  Regards,
>  Arnout
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170831/4f563fab/attachment.html>
