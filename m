From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Nov 2017 22:58:43 +0100
Subject: [Buildroot] [PATCH/next 0/5] Add support for MacchiatoBin board
In-Reply-To: <20171112201646.15558-1-geomatsi@gmail.com>
References: <20171112201646.15558-1-geomatsi@gmail.com>
Message-ID: <aaad6d28-b49d-9461-e689-94a9826ed0e6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12-11-17 21:16, Sergey Matyukevich wrote:
> Hi all,
> 
> This patchset adds support for SolidRun MacchiatoBin board based on
> Marvell Armada 8040 SoC. For convenience the following two different
> build configurations are added:
> 
> - mainline BSP
>   mainline Linux v4.13.11 and U-Boot v2017.09
> 
> - vendor BSP (enables more hardware)
>   BSP from Marvell based on Linux 4.4.52 and U-Boot v2017.03

 Do we really want to have defconfigs for both upstream and vendor BSP?
Especially because we will also probably have a graphical defconfig later...
This way, we end up with 3-4 defconfigs per board, for dozens of boards...

 That said, I do think it is useful to have both of these for this specific
board. It's just that I'm afraid we're going to be overwhelmed by the number of
defconfigs...

 What do the others think?

 Regards,
 Arnout

> 
> Patches are rebased on top of next branch.
> 
> Regards,
> Sergey
> 
> Sergey Matyukevich (5):
>   armada-firmware: new package
>   armada-ddr: new package
>   atf: add support for Marvell Armada SoCs
>   solidrun/macchiatobin: add new board
>   DEVELOPERS: add myself to MacchiatoBin releated packages
> 
>  DEVELOPERS                                        |    6 +
>  board/solidrun/macchiatobin/genimage.cfg          |   16 +++++
>  board/solidrun/macchiatobin/readme.txt            |   70 ++++++++++++++++++++++
>  boot/Config.in                                    |    2 
>  boot/arm-trusted-firmware/arm-trusted-firmware.mk |   13 ++++
>  boot/armada-ddr/Config.in                         |   16 +++++
>  boot/armada-ddr/armada-ddr.hash                   |    2 
>  boot/armada-ddr/armada-ddr.mk                     |   20 ++++++
>  boot/armada-firmware/Config.in                    |   19 +++++
>  boot/armada-firmware/armada-firmware.hash         |    2 
>  boot/armada-firmware/armada-firmware.mk           |   18 +++++
>  configs/solidrun_macchiatobin_mainline_defconfig  |   46 ++++++++++++++
>  configs/solidrun_macchiatobin_marvell_defconfig   |   48 +++++++++++++++
>  13 files changed, 278 insertions(+)
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
