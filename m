From: Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Sat, 10 Jul 2021 20:41:17 +0200
Subject: [Buildroot] [PATCH] configs/imx7dpico: bump Kernel and U-Boot
 version
In-Reply-To: <CAOMZO5CdGhGW3AHHPakLrT04sMyxEioJhaSEoXL6zDiCeuuu0g@mail.gmail.com>
References: <20210710182137.3720-1-texier.pj2@gmail.com>
 <CAOMZO5CcUz8YQT6qtDc4BUy3zZE_h1+GRNK45CYinnZ-DqGfxg@mail.gmail.com>
 <CAOMZO5CdGhGW3AHHPakLrT04sMyxEioJhaSEoXL6zDiCeuuu0g@mail.gmail.com>
Message-ID: <031dd078-d64c-56b6-418d-443d18feb9c7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio,

Le 10/07/2021 ? 20:30, Fabio Estevam a ?crit?:
> Hi Pierre-Jean,
> 
> On Sat, Jul 10, 2021 at 3:27 PM Fabio Estevam <festevam@gmail.com> wrote:
>>
>> On Sat, Jul 10, 2021 at 3:21 PM Pierre-Jean Texier <texier.pj2@gmail.com> wrote:
>>>
>>> Bump U-Boot to 2021.07 and kernel to version 5.13
>>>
>>> Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
>>
>> Thanks for the patch:
>>
>> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> 
> I forgot to ask: shouldn't we pass a extlinux.conf file so that it can
> boot by default now
> as it uses distro boot in U-Boot?

In fact, extlinux file is already used for this board, introduced by
Joris in commit 40c5aa ("configs/imx7dpico: Bump Linux and U-Boot") [1]

See boot sequence after:

U-Boot 2021.07 (Jul 10 2021 - 20:04:17 +0200)

CPU:   Freescale i.MX7D rev1.2 1000 MHz (running at 792 MHz)
CPU:   Commercial temperature grade (0C to 95C) at 40C
Reset cause: POR
Model: TechNexion PICO-IMX7D Board and PI baseboard
Board: i.MX7D PICOSOM
<...>
mmc0(part 0) is current device
Scanning mmc 0:1...
Found /boot/extlinux/extlinux.conf
Retrieving file: /boot/extlinux/extlinux.conf
159 bytes read in 1 ms (155.3 KiB/s)
1:	imx7d-pico-buildroot
Retrieving file: /boot/zImage
9701104 bytes read in 219 ms (42.2 MiB/s)
append: root=PARTUUID=00000000-01 rootwait rw console=ttymxc4,115200
Retrieving file: /boot/imx7d-pico-pi.dtb


Thanks for the review !

[1] - 
https://git.buildroot.net/buildroot/commit/board/technexion/imx7dpico/rootfs_overlay/boot/extlinux?id=40c5aa50cf6a26b4697bb0c9bd671d89a53edf5f
-- 
Pierre-Jean Texier
