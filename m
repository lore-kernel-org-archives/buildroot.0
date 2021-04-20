From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Apr 2021 23:16:50 +0200
Subject: [Buildroot] [PATCH] configs/solidrun_macchiatobin_defconfig:
 include for Singleshot DTS
In-Reply-To: <YG68WisliSerKFtr@curiosity>
References: <20210408073349.16629-1-vadym.kochan@plvision.eu>
 <YG68WisliSerKFtr@curiosity>
Message-ID: <20210420231650.0d34ce07@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 8 Apr 2021 11:18:34 +0300
Sergey Matyukevich <geomatsi@gmail.com> wrote:

> >  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.5"
> >  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> >  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> > -BR2_LINUX_KERNEL_INTREE_DTS_NAME="marvell/armada-8040-mcbin"
> > +BR2_LINUX_KERNEL_INTREE_DTS_NAME="marvell/armada-8040-mcbin marvell/armada-8040-mcbin-singleshot"
> >  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/solidrun/macchiatobin/linux-extras.config"
> >  BR2_LINUX_KERNEL_INSTALL_TARGET=y
> >  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y  
> 
> I do not have access to MacchiatoBin hardware anymore, but I have been using
> current defconfig with DoubleShot boards. If this defconfig does not work
> well for SingleShot boards, then it makes sense to add a separate defconfig
> for such boards rather then remove DoubleShot support completely. Probably
> linux-extras.config in board/solidrun/macchiatobin worth another look to
> make sure that features for both boards are included.

I am confused: the only change proposed here is to build two DTBs
instead of one, leaving up to the user to use one or the other
depending on the board variant. Why would two defconfigs be needed here?

However, one thing is needed: an update to
board/solidrun/macchiatobin/readme.txt to indicate when to use which
DTB.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
