From: Vadym Kochan <vadym.kochan@plvision.eu>
Date: Fri, 9 Apr 2021 21:58:44 +0300
Subject: [Buildroot] [PATCH] configs/solidrun_macchiatobin_defconfig:
 include for Singleshot DTS
In-Reply-To: <YHCinVc5pCs57i1N@curiosity>
References: <20210408073349.16629-1-vadym.kochan@plvision.eu>
 <YG68WisliSerKFtr@curiosity> <20210409124556.GA8110@plvision.eu>
 <YHCinVc5pCs57i1N@curiosity>
Message-ID: <20210409185844.GA23498@plvision.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Apr 09, 2021 at 09:53:17PM +0300, Sergey Matyukevich wrote:
> Hello Vadym,
> 
> > > > Single- & Double shot boards have many in common except additional
> > > > RJ45 tranceivers near by each of 10G SFP and a bit different CPU freq.
> > > > 
> > > > Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
> > > > ---
> > > >  configs/solidrun_macchiatobin_defconfig | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/configs/solidrun_macchiatobin_defconfig b/configs/solidrun_macchiatobin_defconfig
> > > > index 7d06313b03db..34094a833b66 100644
> > > > --- a/configs/solidrun_macchiatobin_defconfig
> > > > +++ b/configs/solidrun_macchiatobin_defconfig
> > > > @@ -30,7 +30,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> > > >  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.5"
> > > >  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> > > >  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> > > > -BR2_LINUX_KERNEL_INTREE_DTS_NAME="marvell/armada-8040-mcbin"
> > > > +BR2_LINUX_KERNEL_INTREE_DTS_NAME="marvell/armada-8040-mcbin marvell/armada-8040-mcbin-singleshot"
> > > >  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/solidrun/macchiatobin/linux-extras.config"
> > > >  BR2_LINUX_KERNEL_INSTALL_TARGET=y
> > > >  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> > > 
> > > I do not have access to MacchiatoBin hardware anymore, but I have been using
> > > current defconfig with DoubleShot boards. If this defconfig does not work
> > > well for SingleShot boards, then it makes sense to add a separate defconfig
> > > for such boards rather then remove DoubleShot support completely. Probably
> > > linux-extras.config in board/solidrun/macchiatobin worth another look to
> > > make sure that features for both boards are included.
> > > 
> > > Regards,
> > > Sergey
> > 
> > If comparing Single- and DoubleShot Linux DTS files they have difference
> > only in SFP config and +1 heartbeat LED. Do you think it is worth to duplicate
> > current defconfig for SingleShot board even if SFP will not work by
> > using DualShot DTS instead of just append _INTREE_DTS_NAME with
> > -singleshot version ?
> 
> I think any option will do if it does not break existing use-cases.
> Could you please confirm that DoubleShot image does not work
> properly on SingleShot board ?
> 
> BTW, I thought that support for autodetect of copper vs fiber with
> some prioritization has been already implemented in Linux for
> mcbin hardware. Do you know if this is true or not ?
> 
> Regards,
> Sergey
> 

I will check SFP modules in Monday with DoubleShot DTS.

Thanks,
