From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 17 Dec 2020 15:02:41 +0100
Subject: [Buildroot] Nitrogen8M stuck at boot with master branch
In-Reply-To: <69c3d27e81a21ac582be4104b28485381a51cdb9.camel@collabora.com>
References: <CACvgo51BjX9MzFbqp+5pim_wjv_B_QSdEcpkz23p+4BCS1-R3g@mail.gmail.com>
 <CACvgo53Ucwqsk7HntMR4o9gshbUFdt4R2OXTk2EPQPYkuXCTVw@mail.gmail.com>
 <CACvgo51qebOMi1f8EUOZt2TbQ9EdUB+m6XLz=d-keQPnTH2ODQ@mail.gmail.com>
 <X9sUGn6EigrpqtlA@p1g2>
 <69c3d27e81a21ac582be4104b28485381a51cdb9.camel@collabora.com>
Message-ID: <X9tlAc/YgP1aQuhe@p1g2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ezekiel,

On Thu, Dec 17, 2020 at 10:24:07AM -0300, Ezequiel Garcia wrote:
> Hi Gary,
> 
> Thanks for the reply.
> 
> On Thu, 2020-12-17 at 09:17 +0100, Gary Bisson wrote:
> > Hi,
> > 
> > On Thu, Dec 17, 2020 at 01:03:26AM +0000, Emil Velikov wrote:
> > > On Wed, 16 Dec 2020 at 13:11, Emil Velikov <emil.l.velikov@gmail.com> wrote:
> > > > 
> > > > On Wed, 16 Dec 2020 at 13:10, Emil Velikov <emil.l.velikov@gmail.com> wrote:
> > > > > 
> > > > > Greetings everyone,
> > > > > 
> > > > > Recently I've started thinkering with a Nitrogen8M SBC - the regular
> > > > > one, not the Mini, Nano or SOM ones.
> > > > > 
> > > > > Since this was my first experience with the board, initially I tried
> > > > > the vendor provided Ubuntu image [1], which was working OOTB.
> > > > > 
> > > > > Booting a minimal buildroot (make nitrogen8m_defconfig && make) seems
> > > > > to be getting stuck as below. The full boot log attached.
> > > > > 
> > > > Forgot the boot.log :-)
> > > > 
> > > Upon a closer look, it appears that boot locks up during the first
> > > arm_smccc_smc().
> > > The one in busfreq_probe() for the vendor kernel or imx8m_ddrc_probe()
> > > for the upstream ones.
> > > 
> > > Wild guess is that the built lpddr4_pmu_train firmware has regressed
> > > or we're not using it properly.
> > > 
> > > As always, any hints will be appreciated.
> > 
> > We've seen people having issues with 5.4 kernels when their bootloader
> > was old. Please make sure to upgrade to latest U-Boot [1].
> > 
> > This is due to ATF changes NXP made which seemed to be needed for 5.4.
> > 
> > Regards,
> > Gary
> > 
> > [1] https://boundarydevices.com/how-to-upgrade-u-boot/
> 
> 
> Note that we are using Buildroot's Nitrogen defconfig. Do you think
> we should bump Buildroot's U-Boot?

No if you upgraded to Buildroot's U-Boot it should work. But you have to
explicitely do that upgrade as the image generate by Buildroot goes in
the user partition of the eMMC whereas the bootloader is located into
the boot partition. So when you flash the sdcard image, that doesn't
update the U-Boot binary.

Regards,
Gary
