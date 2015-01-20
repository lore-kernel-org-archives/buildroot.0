From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 20 Jan 2015 22:42:50 +0200
Subject: [Buildroot] [PATCH 1/1] configs/udoo_quad_defconfig: new
 defconfig
In-Reply-To: <54BE0BC4.4030707@gmail.com>
References: <1421533112-5265-1-git-send-email-ivo.slanina@gmail.com>
 <20150117223246.GH2827@tarshish> <54BBA8CB.9060302@gmail.com>
 <20150118131032.GH2555@sapphire.tkos.co.il>
 <54BE0BC4.4030707@gmail.com>
Message-ID: <20150120204250.GG2146@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ivo,

On Tue, Jan 20, 2015 at 09:03:16AM +0100, Ivo Slanina wrote:
> Thanks for help, I didn't notice device tree source file for UDOO in Linux 
> sources.
> But after copying .dtb file into SD card, board still doesn't boot up.
> 
> Here is output, what I get:
> 
> U-Boot 2013.10-rc3 (Jan 18 2015 - 17:53:27)
> 
> CPU:   Freescale i.MX6Q rev1.2 at 792 MHz
> Reset cause: POR
> Board: UDOO
> DRAM:  1 GiB
> MMC:   FSL_SDHC: 0
> *** Warning - bad CRC, using default environment
> 
> No panel detected: default to LDB-WVGA
> Display: LDB-WVGA (800x480)
> In:    serial
> Out:   serial
> Err:   serial
> Net:   using phy at 6
> FEC [PRIME]
> Hit any key to stop autoboot:  0 
> mmc0 is current device
> ** File not found boot.scr **
> 5489632 bytes read in 361 ms (14.5 MiB/s)
> Booting from mmc ...
> 27547 bytes read in 129 ms (208 KiB/s)
> ## Booting kernel from Legacy Image at 12000000 ...
>    Image Name:   Linux-3.18.3
>    Image Type:   ARM Linux Kernel Image (uncompressed)
>    Data Size:    5489568 Bytes = 5.2 MiB
>    Load Address: 10008000
>    Entry Point:  10008000
>    Verifying Checksum ... OK
> ## Flattened Device Tree blob at 11000000
>    Booting using the fdt blob at 0x11000000
>    Loading Kernel Image ... OK
>    Using Device Tree in place at 11000000, end 11009b9a
> 
> Starting kernel ... 
> 
> It seems to be some trivial problem to me, but I can't fix this by myself.
> I not really understand uImage load address. I know that at 0x1000000 address
> starts MMC zone, but I'm not sure what is 0x8000 offset from that address.
> I took the value from freescale_imx6qsabresd_defconfig.
> 
> Please, can you give me some other clue?

This is really quite off topic for this list. I agree with Thomas that if 
mainline kernel does not work for you for whatever reason, then you should 
stick with a kernel that works. Yet I think that the reason for choosing 
something other then mainline kernel should at least appear in the commit log. 
That is the reason I asked you about it.

I will only say that your next debugging step is called "earlyprintk". See the 
links below for some more details.

http://nishanthmenon.blogspot.co.il/2010/09/my-kernel-doesnt-boot-magic-of.html 
http://nothingtechnicalaboutit.blogspot.co.il/2012/02/linux-early-boot-debug.html 

If you have any further questions on kernel bring-up, please direct them to 
the linux-arm-kernel mailing list 
(http://lists.infradead.org/mailman/listinfo/linux-arm-kernel).

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
