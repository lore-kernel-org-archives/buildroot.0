From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 17 Dec 2020 15:05:47 +0000
Subject: [Buildroot] Nitrogen8M stuck at boot with master branch
In-Reply-To: <X9sUGn6EigrpqtlA@p1g2>
References: <CACvgo51BjX9MzFbqp+5pim_wjv_B_QSdEcpkz23p+4BCS1-R3g@mail.gmail.com>
 <CACvgo53Ucwqsk7HntMR4o9gshbUFdt4R2OXTk2EPQPYkuXCTVw@mail.gmail.com>
 <CACvgo51qebOMi1f8EUOZt2TbQ9EdUB+m6XLz=d-keQPnTH2ODQ@mail.gmail.com>
 <X9sUGn6EigrpqtlA@p1g2>
Message-ID: <CACvgo52V1J8aubvSWpwLeciQFrBhGVZVJ08UmfwQx3MGaSXgWQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 17 Dec 2020 at 08:17, Gary Bisson
<gary.bisson@boundarydevices.com> wrote:
>
> Hi,
>
> On Thu, Dec 17, 2020 at 01:03:26AM +0000, Emil Velikov wrote:
> > On Wed, 16 Dec 2020 at 13:11, Emil Velikov <emil.l.velikov@gmail.com> wrote:
> > >
> > > On Wed, 16 Dec 2020 at 13:10, Emil Velikov <emil.l.velikov@gmail.com> wrote:
> > > >
> > > > Greetings everyone,
> > > >
> > > > Recently I've started thinkering with a Nitrogen8M SBC - the regular
> > > > one, not the Mini, Nano or SOM ones.
> > > >
> > > > Since this was my first experience with the board, initially I tried
> > > > the vendor provided Ubuntu image [1], which was working OOTB.
> > > >
> > > > Booting a minimal buildroot (make nitrogen8m_defconfig && make) seems
> > > > to be getting stuck as below. The full boot log attached.
> > > >
> > > Forgot the boot.log :-)
> > >
> > Upon a closer look, it appears that boot locks up during the first
> > arm_smccc_smc().
> > The one in busfreq_probe() for the vendor kernel or imx8m_ddrc_probe()
> > for the upstream ones.
> >
> > Wild guess is that the built lpddr4_pmu_train firmware has regressed
> > or we're not using it properly.
> >
> > As always, any hints will be appreciated.
>
> We've seen people having issues with 5.4 kernels when their bootloader
> was old. Please make sure to upgrade to latest U-Boot [1].
>
> This is due to ATF changes NXP made which seemed to be needed for 5.4.
>
Thank you Gary, that did the trick. You are a star o/

-Emil
