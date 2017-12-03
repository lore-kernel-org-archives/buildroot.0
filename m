From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Dec 2017 23:25:28 +0100
Subject: [Buildroot] [PATCH 1/3] board/orangepi: add support for
 orangepi-pc-plus board
In-Reply-To: <20171108194334.10031-2-geomatsi@gmail.com>
References: <20171108194334.10031-1-geomatsi@gmail.com>
 <20171108194334.10031-2-geomatsi@gmail.com>
Message-ID: <20171203232528.237e3ec3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  8 Nov 2017 22:43:32 +0300, Sergey Matyukevich wrote:
> This board is a variant of orangepi-pc board. It adds 8GB eMMC and Realtek
> RTL8189FTV SDIO WiFi chip. This variant has a separate support in U-Boot
> and kernel. So it makes sense to create a separate entry
> for this board in buildroot.
> 
> Board support package includes the following components:
>  - mainline u-boot 2017.09
>  - mainline kernel 4.13.11
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>

I've applied, after adding an entry to the DEVELOPERS file. One
comment, though.

>  board/orangepi/orangepi-pc-plus/boot.cmd           |  8 +++++
>  board/orangepi/orangepi-pc-plus/genimage.cfg       | 36 ++++++++++++++++++++
>  .../orangepi/orangepi-pc-plus/linux-extras.config  |  8 +++++
>  board/orangepi/orangepi-pc-plus/post-build.sh      |  1 +

This common post-build script only generates the U-Boot script. Could
you move the boards that use this post-build script to instead use
BR2_TARGET_UBOOT_BOOT_SCRIPT ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
