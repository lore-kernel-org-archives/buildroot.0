From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Dec 2015 14:00:21 +0100
Subject: [Buildroot] [PATCH] pandaboard_defconfig: bump u-boot to
 2015.10 and kernel to 4.3
In-Reply-To: <CANu7NGsP5K4268wtVMAcvUD+OaTxdEUvnV8aaoVqFhY1X-oOfg@mail.gmail.com>
References: <1450978394-822-1-git-send-email-sergio.prado@e-labworks.com>
 <20151227120631.78043b59@free-electrons.com>
 <CANu7NGsP5K4268wtVMAcvUD+OaTxdEUvnV8aaoVqFhY1X-oOfg@mail.gmail.com>
Message-ID: <20151229140021.054e6740@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sergio,

On Tue, 29 Dec 2015 10:21:52 -0200, Sergio Prado wrote:

> > Could you instead replace this with a genimage configuration file ? You
> > can look at the support for the following boards for examples:
> >
> > ./board/via/imx6_vab820/genimage.cfg
> > ./board/intel/galileo/genimage.cfg
> > ./board/wandboard/genimage.cfg
> 
> That was my first attempt, but it didn't work. The ROM code from OMAP
> processors (and I think also Sitara processors) need the SD card to be
> formatted with a special geometry in the partition table. That's the reason
> of the script above. I did not find any option in the genimage tool to
> configure thinks like sectors and cylinders. So I do not see an easy way to
> generate a sdcard image in this case. What do you think?

Ah ok. I don't know if genimage can handle such scenarios. I am Cc'ing
Vivien Didelot, who did quite a bit of work on genimage in Buildroot. I
think I remember he telling me that he had a working genimage
configuration for the BeagleBone, which has, AFAIK, the same
requirements as the PandaBoard in terms of geometry and all.

> Yes, the old bootloader's default kernel arguments had a "rootfstype=ext3"
> option, and the new one doesn't, so the kernel is able to find out and
> mount any supported filesystem. I kept the ext2 format because most of the
> boards use it. Is this the right approach, or should I change to ext4?

No, it's alright to keep ext2.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
