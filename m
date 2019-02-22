From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 22 Feb 2019 22:15:17 +0100
Subject: [Buildroot] [PATCH] configs/zynq_zybo: remove defconfig
In-Reply-To: <CADvTj4oyc=3ThQ++0CcS+wiYuQrc0sB=67aBamPdPiZjYGMv1w@mail.gmail.com>
References: <20190222204442.4785-1-thomas.petazzoni@bootlin.com>
 <CADvTj4oyc=3ThQ++0CcS+wiYuQrc0sB=67aBamPdPiZjYGMv1w@mail.gmail.com>
Message-ID: <20190222221517.70b6a3b3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 22 Feb 2019 13:54:11 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> On Fri, Feb 22, 2019 at 1:44 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > This defconfig was added in October 2016 and was never updated since
> > then. It currently fails to build because U-Boot is too old and
> > doesn't build with host-openssl in version 1.1.x.  
> You can probably just replace uboot with this version
> https://github.com/Xilinx/u-boot-xlnx/tree/xilinx-v2018.3 for xilinx
> devices like these.

I'm pretty sure mainline U-Boot has support for this board, so it's not
really the problem. The thing is that defconfigs are meant to be tested
on real HW. Since I don't have this HW, and the original submitter
didn't reply, there is not much I can do except suggesting to drop the
defconfig. Either someone with the HW platform steps in, fixes the
build issue and checks that the new U-Boot version runs OK on the HW,
or we simply drop the defconfig.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
