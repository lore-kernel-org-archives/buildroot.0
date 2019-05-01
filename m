From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 1 May 2019 21:38:25 +0200
Subject: [Buildroot] [PATCH] board/qemu/ppc*: disable Werror while
 building ppc kernel with gcc >= 9.1
In-Reply-To: <4a872624-ceb5-23cb-9005-3284ffbce131@gmail.com>
References: <20190501125236.16786-1-romain.naour@gmail.com>
 <27b861d5-8ead-229b-61ac-95806515d90a@mind.be>
 <4a872624-ceb5-23cb-9005-3284ffbce131@gmail.com>
Message-ID: <20190501213825.4cac162d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Romain,

On Wed, 1 May 2019 15:57:47 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> >  Maybe it would be better to have a single fragment file
> > board/linux-ppc-disable-werror.fragment
> > and include that in all the relevant defconfigs, rather than updating each linux
> > config?  
> 
> I'm not sure how to handle such fragments in Buildroot.
> Storing fragments in board directory seems not great.

Why ? We already have plenty of these:

$ find board/ | grep frag
board/beaglebone/linux-4.1-sgx.fragment
board/technologic/ts4800/linux.fragment
board/engicam/icorem6/linux_qt5.fragment
board/orangepi/orangepi-pc/linux.fragment
board/amarula/vyasa/linux_gmac.fragment
board/udoo/mx6qdl/linux.fragment
board/lego/ev3/linux.fragment
board/lego/ev3/busybox.fragment
board/stmicroelectronics/stm32mp157-dk/uboot-fragment.config
board/freescale/imx6-sabresd/linux_qt5.fragment
board/freescale/warpboard/linux.fragment
board/solidrun/macchiatobin/uboot-fragment.config
board/solidrun/clearfog/linux.fragment
board/synopsys/hsdk/linux.fragment
board/qemu/nios2-10m50/linux.fragment
board/qemu/ppc64-e5500/linux.fragment
board/lemaker/bananapro/linux-wifi.fragment
board/chromebook/snow/linux-4.15.fragment
board/olimex/imx233_olinuxino/linux-wifi.fragment

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
