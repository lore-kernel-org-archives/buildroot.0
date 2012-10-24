From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Wed, 24 Oct 2012 16:43:35 +0300
Subject: [Buildroot] [PATCH 9/9] firefox: GNU gnash flash,
 an open source Adobe Flash player & plugin
In-Reply-To: <5086C8E7.6070209@mind.be>
References: <1346855344-15081-1-git-send-email-stefan.froberg@petroprogram.com>
 <1346855344-15081-10-git-send-email-stefan.froberg@petroprogram.com>
 <5082C97A.4090207@mind.be> <5083E62E.80705@petroprogram.com>
 <5086C8E7.6070209@mind.be>
Message-ID: <5087F087.8010307@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

23.10.2012 19:42, Arnout Vandecappelle kirjoitti:
> [snip]
>> Tell me Arnout, is the ARM-world really this ... complicated ?
>>
>> I mean, there at least two dozens of defconfig files for various arm
>> vendor boards under linux source tree arch/arm/config.
>> And those config-files are just for boards right ??
>>
>> Am I correct to presume that there are at least almost hundred of
>> different vendor board + arm cpu compinations that
>> are more or less incompatible with each other ?
>
>  Yes, there are two reasons for that:
>
> - Unlike for PCs, there is no BIOS in embedded platforms to hide the
> board configuration.  So the BSP has to be part of the kernel.  That is
> partially solved with a device tree, but even so you have to select a
> device tree for your particular board.
>
> - Unlike for PowerPC, the ARM core is used by many SoC vendors who make
> completely different CPUs out of it.  Since an OS is actually about
> managing everything around the CPU core itself, there's a big impact on
> the Linux kernel. That's why you'll often see SoC-specific kernel
> patches.
>
>  However, this complexity shouldn't affect your use of buildroot too
> much - at least if there's a defconfig for your board available in
> U-Boot and in the kernel.
>

I just read the following:
http://www.extremetech.com/mobile/137412-linux-kernel-version-3-7-will-support-multiple-arm-socs

So it seems things are now getting more easier.

Im certainly going to upgrade to that kernel version and try if I have
better luck
this time with exonys board (basically the same stuff that those Samsung
Galaxy S II and III are using ????)
under qemu.

>
>> And in addition to that, I must take into account if the arm-cpu Im
>> cross-compiling stuff for has softfp or hardfp and the type of fp (vpf,
>> neon etc....) ?
>
>  That's in fact the same on x86, only nobody uses things like
> -mfpmath=sse
> and just uses generic 387 code.
>
>

I didn't know about that optimization switch.
Maybe it will give my systems some extra boost  ...  :-)
Thanks!

Best Regards
Stefan

>  Regards,
>  Arnout
>
