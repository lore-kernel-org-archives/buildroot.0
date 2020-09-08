From: Damien Le Moal <Damien.LeMoal@wdc.com>
Date: Tue, 8 Sep 2020 10:47:35 +0000
Subject: [Buildroot] [PATCH 5/5] Add support for Kendryte K210 based
 RISC-V boards
References: <20200908051624.425573-1-damien.lemoal@wdc.com>
 <20200908051624.425573-6-damien.lemoal@wdc.com>
 <20200908091728.6351079d@windsurf.hq.k.grp>
 <CY4PR04MB3751463068ACC779C758B3CDE7290@CY4PR04MB3751.namprd04.prod.outlook.com>
 <20200908110714.6979f5c8@windsurf.hq.k.grp>
Message-ID: <CY4PR04MB3751D91DFA061C4587F51EAFE7290@CY4PR04MB3751.namprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2020/09/08 18:07, Thomas Petazzoni wrote:
> Hello Damien,
> 
> On Tue, 8 Sep 2020 08:02:15 +0000
> Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
> 
>>> configs/qemu_arm_versatile_nommu_defconfig:BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
>>> configs/qemu_m68k_mcf5208_defconfig:BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
>>> configs/stm32f429_disco_defconfig:BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
>>> configs/stm32f469_disco_defconfig:BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
>>>
>>> Could you try to use this one ?  
>>
>> Yes, the minimal config work. but it gives me a rootfs cpio image  of 650KB
>> while the one I added is even smaller and results in a rootf of 350KB. 300KB
>> saved on a board with only 8MB of SRAM, that is not negligible...
> 
> Agreed. Perhaps we should change our busybox-minimal.config ? It would
> be nice to diff yours against busybox-minimal.config and see if we can
> get to a common conclusion.
> 
> As you can imagine, we're trying to avoid the situation where every
> single board would have its own custom Busybox configuration file, with
> a semi-random selection of tools.

I checked the differences. Mostly, they come from me removing all the file
related tools since there is no SD card on the board, so no real file system
beside in-RAM rootfs.

Given the memory savings this k210 busybox config gives, I would like to keep it
as is for now, until I get to add the SD card support in the kernel, at which
point switching back to the default minimal busybox config will make perfect
sense. What do you think ?

Apart from this, I removed the uclibc config (not needed) and use the default.
The init script is fixed and the overall, everything is much simpler. If you do
not have any objection, I will post V2 of the series.


-- 
Damien Le Moal
Western Digital Research
