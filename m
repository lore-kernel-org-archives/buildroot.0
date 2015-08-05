From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 5 Aug 2015 06:51:45 +0000
Subject: [Buildroot] [PATCH v2] board: add support for ARC AXS101 and
 AXS103 Software Development Platforms
In-Reply-To: <20150804200617.1bbfb02f@free-electrons.com>
References: <1438698110-3664-1-git-send-email-abrodkin@synopsys.com>
 <20150804200617.1bbfb02f@free-electrons.com>
Message-ID: <1438757504.3504.4.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, 2015-08-04 at 20:06 +0200, Thomas Petazzoni wrote:
> Dear Alexey Brodkin,
> 
> On Tue,  4 Aug 2015 17:21:50 +0300, Alexey Brodkin wrote:
> > The AXS10x Platform consists of a DesignWare AXC001 CPU
> > Card (with ARC 770D core) in case of AXS101 or AXC003 CPU Card
> > (typically with ARC HS38 core) in case of AXS103 mounted on an
> > ARC Software Development Platform Mainboard with DesignWare peripherals:
> >  * SD/MMC contoller
> >  * Gigabit network contoller
> >  * Serial ports (8250-compatible)
> >  * USB 2.0
> >  * SPI
> >  * I2C
> > 
> > It also houses HDMI output for external monitor connection.
> > 
> > For stand-alone usage of the board (with only keyboard, mouse and montor
> > attached) kernel console and getty made available on tty0 as well as on
> > serial port (ttyS3).
> > 
> > Note there're 2 prerequisites:
> >  [1] u-boot: 2015.07 - fix creation of .config
> >      http://patchwork.ozlabs.org/patch/502558/
> > 
> >  [2] binutils: fix buildng of Linux kernel for ARCv2 ISA
> >      http://patchwork.ozlabs.org/patch/503550/
> > 
> > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> > ---
> 
> Applied, thanks. For defconfigs, we generally like to have a readme.txt
> file in board/<something>/ that explains how to flash/use the generated
> system on the HW. But that's of course only if special instructions are
> needed.

Thanks for that.

I will send instructions shortly (probably in few days) because do have some
things to mention on how to use that board with generated files.

Also note I mentioned another prerequisite:
----------->8----------
u-boot: 2015.07 - fix creation of .config
http://patchwork.ozlabs.org/patch/502558/
----------->8----------
without which snps_axs103_defconfig will fail to build U-Boot.

I'm wondering if you saw my recent comments for that patch, probably we may
want to revisit it sometime soon.

-Alexey
