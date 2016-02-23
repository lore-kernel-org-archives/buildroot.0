From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Tue, 23 Feb 2016 22:18:29 +0100
Subject: [Buildroot] [PATCH] configs: atmel: ensure EABIhf is selected
	for sama5d*
In-Reply-To: <87fuwj6tot.fsf@dell.be.48ers.dk>
References: <1456244344-12726-1-git-send-email-alexandre.belloni@free-electrons.com>
 <87fuwj6tot.fsf@dell.be.48ers.dk>
Message-ID: <20160223211829.GA10681@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/02/2016 at 21:46:42 +0100, Peter Korsgaard wrote :
> >>>>> "Alexandre" == Alexandre Belloni <alexandre.belloni@free-electrons.com> writes:
> 
>  > The recent changes in Config.in.arm regarding the VFP selection broke the
>  > atmel_sama5d* defconfigs. Ensure EABIhf is selected as all the sama5 have a
>  > vfp.
> 
> They are not really broken in the sense that they don't build or boot,
> they are just less optimal, right?
> 

Indeed.

>  > Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
>  > ---
>  >  configs/atmel_sama5d3_xplained_defconfig | 3 +--
>  >  configs/atmel_sama5d3xek_defconfig       | 3 +--
>  >  configs/atmel_sama5d4_xplained_defconfig | 3 +--
> 
> We also have a atmel_sama5d3_xplained_mmc_defconfig that you
> forgot. Committed with that fixed, thanks.
> 

I changed it and I forgot to amend my commit, thanks for fixing that.

> It seems like we need to fixup the other defconfigs using EABIHF as well
> :/ In hindsight, maybe BR2_ARM_ENABLE_VFP should have defaulted to 'y'
> instead.
> 

Off list, I was suggesting to Thomas add BR2_ARM_ENABLE_VFP = y to all
defconfigs with a BR2_ARM_FPU_VFP* but it only catches four more
defconfigs. However, there are a lot more, like beaglebone, the
allwiner based boards, most of the freescale ones, etc...

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
