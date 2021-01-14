From: scd rjcom <scdrjcom@gmail.com>
Date: Thu, 14 Jan 2021 09:38:46 -0800
Subject: [Buildroot] Support for BCM953012HR board?
In-Reply-To: <CACna6rwf6riTvyWW1EnSD-AOb=kt1nLE9KfujESeGzohx_WPTA@mail.gmail.com>
References: <1610587332564-0.post@n4.nabble.com>
 <CACna6rzFC7jbmSasCMfRPsCaqjmHgDexBL8VvvCx_Mq7TPjaqQ@mail.gmail.com>
 <CAGF7ZoaOOw11phUqWcn0YsygywLOiFGE_6Oo=zFWBTw9-nrqkA@mail.gmail.com>
 <CACna6rwf6riTvyWW1EnSD-AOb=kt1nLE9KfujESeGzohx_WPTA@mail.gmail.com>
Message-ID: <CAGF7ZoZ+X-FQjH-NGS_+wXgeYiU5EyXmN5W5Y7v9HQZCsaRF9Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 14, 2021 at 9:26 AM Rafa? Mi?ecki <zajec5@gmail.com> wrote:

> On Thu, 14 Jan 2021 at 18:17, scd rjcom <scdrjcom@gmail.com> wrote:
> > On Thu, Jan 14, 2021 at 5:54 AM Rafa? Mi?ecki <zajec5@gmail.com> wrote:
> >> On Thu, 14 Jan 2021 at 02:22, scdrj <scdrjcom@gmail.com> wrote:
> >> > How do I build the images for BCM953012HR (Broadcom Northstar
> Reference
> >> > board)?
> >>
> >> I took care of adding upstream Linux support for a few Northstar hw
> >> components. Current support is quite complete except for:
> >> 1. Hardware NAT acceleration
> >> 2. Broadcom SoftMAC wireless chipsets
> >>
> >> I planned to add buildroot support for Northstar boards but it takes
> >> many months to get my patches reviewed.
> >>
> >> My initial WiFi firmware patch was accepted after 5 months:
> >> [PATCH] package/linux-firmware: add options for Broadcom BCM4366
> >> Currently I'm waiting for lzma-alone decision:
> >> [PATCH] package/lzma-alone: new package
> >>
> >> Once I get lzma-alone somehow merged I'm planning to add Northstar
> >> boards support.
> >>
> >> Until that you can check OpenWrt project. It has target called
> >> "bcm53xx" that handles Northstar devices. There are only few
> >> downstream patches needed to get those devices running:
> >>
> https://git.openwrt.org/?p=openwrt/openwrt.git;a=tree;f=target/linux/bcm53xx/patches-5.4;hb=HEAD
> >>
> >> --
> >> Rafa?
> >
> >
> > Thanks for your valuable suggestion. I have checked the targets
> supported by openwrt for Northstar processors. It provides kernel and
> rootfs builds for Northstar based boards. (tried MR32)
> > I am unable to find the u-boot build for the Northstar based SoCs. How
> do I enable the u-boot build as well for any of these boards?
>
> I've never seen Northstar device using u-boot. I heard about some
> rough plans for porting u-boot to it, but I thought they got abonded.
>
> Can you provide bootloader log from your board?
>
>
> > It would be great to see the support for Northstar boards in the
> buildroot as well.
>
> --
> Rafa?
>

Please find the attached bootlog (This is a custom board, based on
BCM53016).
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210114/830b379e/attachment.html>
-------------- next part --------------
U-Boot 2012.10

DEV ID= 0000cf12
SKU ID = 0
OTP status: eca00018
Setting the PCU_AOPC_CONTROL_OFFSET 
Reading the PCU_AOPC_CONTROL_OFFSET default: 1  
Writing the PCU_AOPC_CONTROL_OFFSET with 31 of 1: 80000001  
Writing the PCU_AOPC_CONTROL_OFFSET with 31 of 0: 80000000  
Writing the PCU_AOPC_CONTROL_OFFSET with 31 of 1: 80000001  
MEMC 0 DDR speed = 800MHz
Log: ddr40_phy_init.c: Configuring DDR Controller PLLs
Log: offset = 0x18010800
Log: VCO_FREQ is 1600 which is greater than 1Ghz.
Log: DDR Phy PLL polling for lock 
Log: DDR Phy PLL locked.
Log: ddr40_phy_init::DDR PHY step size calibration complete.
Log: ddr40_phy_init:: Virtual VttSetup onm CONNECT=0x01CF7FFF, OVERRIDE=0x00077FFF
Log: ddr40_phy_init:: Virtual Vtt Enabled
Log: DDR Controller PLL Configuration Complete
PHY register dump after DDR PHY init
PHY register dump after mode register write

SHMOO VER 1.13

PKID07DC06011801080000000000001A103F01000000

S300001A3
00001070


RDLYW0 00000005

RDENW0 00000044

RDQSW0 

    0000000000111111111122222222223333333333444444444455555555556666
    0123456789012345678901234567890123456789012345678901234567890123
 00 -------++++++++++++++++++++X++++++++++++++++++++----------------
 01 -----------+++++++++++++++++++++X++++++++++++++++++++-----------
 02 ------------+++++++++++++++++++X++++++++++++++++++--------------
 03 ------+++++++++++++++++++++X++++++++++++++++++++----------------
 04 ---------+++++++++++++++++X+++++++++++++++++--------------------
 05 ---------+++++++++++++++++++++X++++++++++++++++++++-------------
 06 ----------+++++++++++++++++++X++++++++++++++++++----------------
 07 ------------+++++++++++++++++++X+++++++++++++++++++-------------
 08 -----------++++++++++++++++++++X+++++++++++++++++++-------------
 09 ---------------++++++++++++++++++++++X+++++++++++++++++++++-----
 10 ----------++++++++++++++++++++X++++++++++++++++++++-------------
 11 -----------++++++++++++++++++++X++++++++++++++++++++------------
 12 -----------++++++++++++++++++++X+++++++++++++++++++-------------
 13 -----------+++++++++++++++++++++X++++++++++++++++++++-----------
 14 ---------+-++++++++++++++++++++X+++++++++++++++++++-------------
 15 --------------++++++++++++++++++++X+++++++++++++++++++----------


PW0 

    0000000000111111111122222222223333333333444444444455555555556666
    0123456789012345678901234567890123456789012345678901234567890123
 00 ------+++++++++++++++++++++X++++++++++++++++++++----------------
 01 ----------+++++++++++++++++++++X+++++++++++++++++++++-----------
 02 ----------++++++++++++++++++++X+++++++++++++++++++--------------
 03 -------++++++++++++++++++++X++++++++++++++++++++----------------
 04 ------++++++++++++++++++X++++++++++++++++++---------------------
 05 --------+++++++++++++++++++++X+++++++++++++++++++++-------------
 06 --------++++++++++++++++++++X+++++++++++++++++++----------------
 07 ----------++++++++++++++++++++X++++++++++++++++++++-------------
 08 -----------+++++++++++++++++++X+++++++++++++++++++--------------
 09 ---------------++++++++++++++++++++++X+++++++++++++++++++++-----
 10 ----------++++++++++++++++++++X++++++++++++++++++++-------------
 11 -----------+++++++++++++++++++++X++++++++++++++++++++-----------
 12 -----------++++++++++++++++++++X+++++++++++++++++++-------------
 13 -----------+++++++++++++++++++++X++++++++++++++++++++-----------
 14 ----------++++++++++++++++++++X++++++++++++++++++++-------------
 15 ---------------+++++++++++++++++++X+++++++++++++++++++----------


NW0 

    0000000000111111111122222222223333333333444444444455555555556666
    0123456789012345678901234567890123456789012345678901234567890123
 00 -------++++++++++++++++++++++X+++++++++++++++++++++-------------
 01 -----------+++++++++++++++++++++++X++++++++++++++++++++++-------
 02 -------------+++++++++++++++++++++X++++++++++++++++++++---------
 03 ------+++++++++++++++++++++X+++++++++++++++++++++---------------
 04 ---------++++++++++++++++++++X++++++++++++++++++++--------------
 05 ---------++++++++++++++++++++++X++++++++++++++++++++++----------
 06 ----------+++++++++++++++++++++X++++++++++++++++++++------------
 07 -----------+++++++++++++++++++++X+++++++++++++++++++++----------
 08 --------++++++++++++++++++++++X+++++++++++++++++++++------------
 09 -----------++++++++++++++++++++++++X++++++++++++++++++++++++----
 10 ----------++++++++++++++++++++X++++++++++++++++++++-------------
 11 ---------++++++++++++++++++++++X+++++++++++++++++++++-----------
 12 --------+++++++++++++++++++++X+++++++++++++++++++++-------------
 13 --------++++++++++++++++++++++X++++++++++++++++++++++-----------
 14 --------++++++++++++++++++++++X++++++++++++++++++++++-----------
 15 -----------++++++++++++++++++++++X++++++++++++++++++++++--------


WRDQW0 

    0000000000111111111122222222223333333333444444444455555555556666
    0123456789012345678901234567890123456789012345678901234567890123
 00 ++++++++++++++++++++X+++++++++++++++++++--------+++++++++++++++-
 01 ++++++++++++++++++++X++++++++++++++++++++------++++++++++++++++-
 02 +++++++++++++++++++++X+++++++++++++++++++++-----+++++++++++++++-
 03 +++++++++++++++++++X+++++++++++++++++++---------+++++++++++++++-
 04 ++++++++++++++++++X++++++++++++++++++----------++++++++++++++++-
 05 ++++++++++++++++++++X+++++++++++++++++++--------+++++++++++++++-
 06 +++++++++++++++++++X++++++++++++++++++---------++++++++++++++++-
 07 +++++++++++++++++++++X++++++++++++++++++++------+++++++++++++++-
 08 +++++++++++++++++++X+++++++++++++++++++--------++++++++++++++++-
 09 +++++++++++++++++++++X+++++++++++++++++++++------++++++++++++++-
 10 ++++++++++++++++++++X+++++++++++++++++++---------++++++++++++++-
 11 +++++++++++++++++++++X+++++++++++++++++++++------++++++++++++++-
 12 +++++++++++++++++++X+++++++++++++++++++--------++++++++++++++++-
 13 +++++++++++++++++++++X++++++++++++++++++++------+++++++++++++++-
 14 ++++++++++++++++++++X+++++++++++++++++++--------+++++++++++++++-
 15 +++++++++++++++++++++X++++++++++++++++++++-------++++++++++++++-


WRDMW0 00000019
WRDMW0 00000020


ADDR

    0000000000111111111122222222223333333333444444444455555555556666
    0123456789012345678901234567890123456789012345678901234567890123
 00 ++++++++++++++++S++++++++++++++X++++++++++++++++++++++++++++++++

Detected ddr size 1024 MiB
DRAM:  16 MiB
WARNING: Caches not enabled
NAND:  cs 0 dev_id word 0 2ca39026
(ONFI), MT29F8G08ABBCAH4    , 
ONFI info: device 1024MB, page 4096B, oobsize 224B, block 256KB, 
           col-addr 2, row-addr 3, 8-bit
Found strap type 0x2 strap page 0x0

*ERROR* Invalid strap options for this NAND: page=0 type=2
Overriding invalid strap options: strap_type=6
REG_ACC_CONTROL c10c009b spare_area_bytes 1b ecc_level c eccbytes 2a steps 4
REG_CONFIG 38252300
256 KiB blocks, 4 KiB pages, 27B OOB, 8-bit
NAND:   chipsize 1024 MiB
MMC:   iproc_mmc: 0
SF: Detected S25FL128S_64K with page size 64 KiB, total 16 MiB
In:    serial
Out:   serial
Err:   serial
Unlocking L2 Cache ...Done
arm_clk=1000MHz, axi_clk=500MHz, apb_clk=250MHz, arm_periph_clk=500MHz
Net:   Registering eth
Broadcom BCM IPROC Ethernet driver 0.1
Using GMAC1 (0x18025000)
et0: ethHw_chipAttach: Chip ID: 0xcf12; phyaddr: 0x1e
bcm_robo_attach: devid: 0x53012
bcmiproc_eth-0
SF: Detected S25FL128S_64K with page size 64 KiB, total 16 MiB
Erasing SPI flash...Writing to SPI flash...done
Valid environment: 2
autobooting...
