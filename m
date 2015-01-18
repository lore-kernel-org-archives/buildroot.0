From: Ivo Slanina <ivo.slanina@gmail.com>
Date: Sun, 18 Jan 2015 13:36:27 +0100
Subject: [Buildroot] [PATCH 1/1] configs/udoo_quad_defconfig: new
	defconfig
In-Reply-To: <20150117223246.GH2827@tarshish>
References: <1421533112-5265-1-git-send-email-ivo.slanina@gmail.com>
 <20150117223246.GH2827@tarshish>
Message-ID: <54BBA8CB.9060302@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi baruch,

On 01/17/2015 11:32 PM, Baruch Siach wrote:
> Hi Ivo,
>
> On Sat, Jan 17, 2015 at 11:18:32PM +0100, Ivo Slanina wrote:
>> Added defconfig for UDOO Quad board. Used official kernel 3.0.35.
>> Kernel is patched in order to use gcc version 4.8 and above,
>> according to mailing list at
>> https://lists.yoctoproject.org/pipermail/meta-freescale/2013-July/003531.html
>
> Why can't you use mainline kernel for this board?
>
> baruch
>

I tried to used mainline kernel, but board doesn't boot up. I get only
following output:

U-Boot 2013.10-rc3 (Jan 18 2015 - 12:03:56)

CPU:   Freescale i.MX6Q rev1.2 at 792 MHz
Reset cause: POR
Board: UDOO
DRAM:  1 GiB
MMC:   FSL_SDHC: 0
*** Warning - bad CRC, using default environment

No panel detected: default to LDB-WVGA
Display: LDB-WVGA (800x480)
In:    serial
Out:   serial
Err:   serial
Net:   using phy at 6
FEC [PRIME]
Hit any key to stop autoboot:  0
mmc0 is current device
** File not found boot.scr **
5489632 bytes read in 391 ms (13.4 MiB/s)
Booting from mmc ...
** File not found imx6q-udoo.dtb **
## Booting kernel from Legacy Image at 12000000 ...
    Image Name:   Linux-3.18.3
    Image Type:   ARM Linux Kernel Image (uncompressed)
    Data Size:    5489568 Bytes = 5.2 MiB
    Load Address: 10008000
    Entry Point:  10008000
    Verifying Checksum ... OK
    Loading Kernel Image ... OK

Starting kernel ...

After this, board stuck. I also encountered this issue with another
i.MX6 based board but I didn't fix that yet. Kernel from UDOO
repository works fine.

I'm new in embedded Linux development. I still have a lot to learn,
so I would be grateful if someone points me to how to use mainline kernel.

Regards,
Ivo Slanina
