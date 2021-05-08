From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 8 May 2021 09:01:44 -0700
Subject: [Buildroot] [PATCH v3 5/7] boot/beaglev-ddrinit: new package
In-Reply-To: <CAPgEAj4C5tjW_Wne18cWqcL2ub7wAZ61UFBr=non5U23sXS97A@mail.gmail.com>
References: <20210504205139.1055360-1-thomas.petazzoni@bootlin.com>
 <20210504205139.1055360-6-thomas.petazzoni@bootlin.com>
 <20210507220401.GE2137340@scaer>
 <CAPgEAj6=TkK79B32P-JRL+T1KPYQd1djsVbYc2ah3zx7xno6cg@mail.gmail.com>
 <20210508073718.GI2137340@scaer>
 <CAPgEAj4C5tjW_Wne18cWqcL2ub7wAZ61UFBr=non5U23sXS97A@mail.gmail.com>
Message-ID: <CAMKF1srq7i5qzkOhEcEPsc7n-t4sKaT2m961xMH68kvLzeUUKA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, May 8, 2021 at 12:48 AM Drew Fustini <drew@beagleboard.org> wrote:
>
> On Sat, May 8, 2021 at 12:37 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >
> > Drew, All,
> >
> > On 2021-05-07 16:30 -0700, Drew Fustini spake thusly:
> > > On Fri, May 7, 2021, 15:04 Yann E. MORIN < [1]yann.morin.1998@free.fr> wrote:
> > >   On 2021-05-04 22:51 +0200, Thomas Petazzoni spake thusly:
> > >   > This commit adds a package for the DDR initialization code used on the
> > >   > BeagleV platform.
> > >
> > >   The upstream package name is beaglev-ddrlnit, yes, with an 'l' instead
> > >   of an 'i'. I've renamed the package to match upstream name, so that
> > >   users that look for it can actually find it.
> > > Would it be helpful if I get StarFive to fix the typo and rename it to ddrinit?
> > > I am thinking that would probably be good to have happen before other projects
> > > start pointing to it. Thomas was so fast with the buildroot patches I think it
> > > is the first to notice this.
> >
> > It is not so important that the upstream name gets fixed; in fact quite
> > the opposite: we are now already referencing it. Granted, it's brand
> > new, and we can fix it quick before the release. But note that our
> > 2021.05-rc1 is due this WE, for example; we can still fix this kind of
> > thing post rc1, of course, but we can't fix a release...
> >
> > But as you mention, once other projects start referencing it, it will be
> > too late. For example, Khem Raj already has started such support:
> >
> >     https://github.com/riscv/meta-riscv/blob/master/beaglev.yml
> >     https://github.com/YoeDistro/yoe-distro/blob/master/beaglev-starlight-jh7100-envsetup.sh
> >
> > So even if it is still very early, I think it is already too late to
> > rename the repository...

Is there general consensus on what it should be called ?
I am happy to remove references to SOC name, if we have clear naming
convention and strategy to also name future iterations of beagleV based on RISCV

>
> Ok, thank you for the insights.  I agree more important to have the
> release go forward and not risk breaking references.   My goal is that
> ddrinit will eventually be replaced with u-boot SPL anyways.  Bin Meng
> is actively looking into this right now.
>
> Thank you,
> Drew
