From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Sep 2015 09:53:26 +0200
Subject: [Buildroot] Building system for the Marvell's ARMADA A385 borad
 to resolve the VLAN trunk issue
In-Reply-To: <87oagrlzcx.fsf@dell.be.48ers.dk>
References: <944894A3EB1D044A9003B2F944389BB20474C34B0F@svr-wa-exch1.atg.lc>
 <5600612C.5060300@mind.be>
 <20150923170613.75f5e7e4@free-electrons.com>
 <871tdno5er.fsf@dell.be.48ers.dk>
 <20150925093431.4a39623e@free-electrons.com>
 <87oagrlzcx.fsf@dell.be.48ers.dk>
Message-ID: <20150925095326.5621c35d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 25 Sep 2015 09:41:50 +0200, Peter Korsgaard wrote:

> >> Couldn't we just do a single defconfig that builds all the dtb files and
>  >> then add a README describing what dtb / how to boot on the various
>  >> boards?
> 
>  > Right, we could do that. But it's really as simple as taking some
>  > random mainline kernel version and build mvebu_v7_defconfig. It's not a
>  > defconfig that has a lot of added-value.
> 
> Ok, and the Marvell u-boot supports zImage / separate dtb or do you need
> to play tricks with appended dtb?

Depends on the version of the bootloader. On modern ones (375, 38x)
there's no problem (except you need to set some magic fdt_skip_update
U-Boot variable to prevent the vendor U-Boot from doing nasty FDT
updates). On Armada 370/XP, the situation is a bit more complicated:
very old vendor bootloaders map registers at a different address than
recent bootloaders, and they don't all support FDT booting, so you have
to use appended DTB.

> Anything related to the bootloader that is worthwhile documenting?

Lots :)

Actually, I've been thinking for some time doing some kind of
eLinux.org portal/page about the Marvell EBU boards, because there's
quite a few tricks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
