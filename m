From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Fri, 23 Apr 2021 11:04:20 +0300
Subject: [Buildroot] [PATCH] configs/solidrun_macchiatobin_defconfig:
 include for Singleshot DTS
In-Reply-To: <20210420231650.0d34ce07@windsurf.home>
References: <20210408073349.16629-1-vadym.kochan@plvision.eu>
 <YG68WisliSerKFtr@curiosity>
 <20210420231650.0d34ce07@windsurf.home>
Message-ID: <YIJ/hCCHwdpMG1DN@curiosity>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Vadym, Thomas,

> > >  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.5"
> > >  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> > >  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> > > -BR2_LINUX_KERNEL_INTREE_DTS_NAME="marvell/armada-8040-mcbin"
> > > +BR2_LINUX_KERNEL_INTREE_DTS_NAME="marvell/armada-8040-mcbin marvell/armada-8040-mcbin-singleshot"
> > >  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/solidrun/macchiatobin/linux-extras.config"
> > >  BR2_LINUX_KERNEL_INSTALL_TARGET=y
> > >  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y  
> > 
> > I do not have access to MacchiatoBin hardware anymore, but I have been using
> > current defconfig with DoubleShot boards. If this defconfig does not work
> > well for SingleShot boards, then it makes sense to add a separate defconfig
> > for such boards rather then remove DoubleShot support completely. Probably
> > linux-extras.config in board/solidrun/macchiatobin worth another look to
> > make sure that features for both boards are included.
> 
> I am confused: the only change proposed here is to build two DTBs
> instead of one, leaving up to the user to use one or the other
> depending on the board variant. Why would two defconfigs be needed here?
> 
> However, one thing is needed: an update to
> board/solidrun/macchiatobin/readme.txt to indicate when to use which
> DTB.

My apologies - I totally misread this patch. Indeed, it does not replace
DoubleShot by SingleShot board, but adds yet another dts option. In this
case readme.txt needs an update. Besides, another extlinux menu entry
can be added, probably with some notes in readme.txt on how to select
default boot option.

Regards,
Sergey
