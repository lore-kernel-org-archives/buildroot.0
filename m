From: Charles Krinke <charles.krinke@gmail.com>
Date: Thu, 1 Aug 2013 20:46:04 -0700
Subject: [Buildroot] Problem with an MPC8272 build
In-Reply-To: <51FAF401.60702@rftechnology.com.au>
References: <51FAF401.60702@rftechnology.com.au>
Message-ID: <CALo-6+gLmHgKc_nPQcqS4C36GYV77N_oyA03_ymLnx51MhRVnw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

One thing to check is that you have defined a compatible root console. Your
printout indicates ttyCPM0 and in buildroot config, one can set this to
ttyCPM0 as it normally defaults to ttyS0

Charles
On Aug 1, 2013 4:49 PM, "Jason Rennie" <jason.rennie@rftechnology.com.au>
wrote:

> Hi,
>
> I'm trying to get buildroot to work with an MPC8272 based device that we
> have. I've been trying for a while and using google to see if it can help
> but i'm getting nowhere so I thought I would try going to the source.
>
> I think i've set up buildroot correctly and have it configured to be an
> mpc8272ads as the kernel defconfig. I know the kernel can be built (so it
> seems) because the device does have an old 2.6.18 kernel running on it at
> the moment that boots successfully, using U-Boot and an older version of
> buildroot to make the file system.
>
> But now I can't get the kernel to boot at all. Or at least nothing shows
> when it comes to booting the kernel.
>
> Buildroot does run successfully, and I have put the rootfs that is made on
> the device and it does boot successfully with the older kernel (well
> mostly, some networking stuff appears to be missing). But when I put the
> new kernel on the device I get nothing. I've tried enabling early kernel
> debugging but with no success (setting the CPM to the addresses suggested
> by the old kernels output). I also don't seem to be able to get U-Boot to
> work and I need to end up breaking out the BDI2000 anytime I try to update
> U-Boot with the newer version as I brick the device.
>
> I have tried with the most basic possible build, not tweaking anything and
> basically just doing the stock buildroot build for the MPC8272 through to
> poking and tweaking all sorts of thing.
>
> Any tips? I've attached the old dmesg output if tht helps. I'm hopelessly
> confused and been beating my head against this for a month so any help
> would be greatly appreciated. I'm pretty much out of ideas.
>
> Jason
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130801/d70eb412/attachment.html>
