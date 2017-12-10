From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 10 Dec 2017 10:22:07 +0200
Subject: [Buildroot] [PATCH v4] solidrun/macchiatobin: add new board
In-Reply-To: <20171209121720.14701-1-geomatsi@gmail.com>
References: <20171209121720.14701-1-geomatsi@gmail.com>
Message-ID: <20171210082207.54dh765y5xtiwunh@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sergey,

On Sat, Dec 09, 2017 at 03:17:20PM +0300, Sergey Matyukevich wrote:
> Add MacchiatoBin board by SolidRun. This board is based on Marvell
> Armada 8040 SoC. Board support package includes the following
> two options: mainline and vendor BSPs.
> 
> Mainline BSP:
> - Marvell ATF v1.3-armada-17.10
> - mainline U-Boot v2017.11
> - mainline Linux kernel v4.14.4
> 
> Marvell BSP with more hardware support enabled:
> - Marvell ATF v1.3-armada-17.10
> - Marvell U-Boot based on v2017.03
> - Marvell Linux kernel based v4.4.52
> 
> More details about this board are available on wiki:
> - http://wiki.macchiatobin.net
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---

[...]

> +How to boot the board
> +=====================
> +
> +MacchiatoBin board can be setup to load bootloader from different
> +sources including eMMC, SPI flash, and SD-card. In order to select
> +boot from SD-card DIP switches SW1 and SW2 should be configured
> +as follows:
> +SW2: 01110
> +SW1: 1xxxx

The upcoming revision 1.3 of the Macchiatobin will have a single pins header 
(J1) instead of the SW1/2 DIP switches. The setting of J1 jumpers matches the 
DIP switches of earlier revisions from left to right:

  011101xxxx

This is also marked on the PCB.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
