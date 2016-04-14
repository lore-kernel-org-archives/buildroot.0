From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 14 Apr 2016 08:44:28 +0300
Subject: [Buildroot] [PATCH] gutenprint: fix host installation
In-Reply-To: <20160414024506.GJ7454@waldemar-brodkorb.de>
References: <a465019a350db47bb0f8527a628f5df0ef74eecd.1460480190.git.baruch@tkos.co.il>
 <87egaaldld.fsf@dell.be.48ers.dk>
 <20160414024506.GJ7454@waldemar-brodkorb.de>
Message-ID: <20160414054428.GI2269@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

On Thu, Apr 14, 2016 at 04:45:06AM +0200, Waldemar Brodkorb wrote:
> > >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
> > 
> >  > Set DESTDIR to avoid installation attempt into build host directories.
> >  > Fixes:
> >  > http://autobuild.buildroot.net/results/bca/bca299631949c7699682af41e3f1373dd10866ed/
> >  > http://autobuild.buildroot.net/results/294/294dfc02ee95caaac4be9fd632c399bb2c7d3f83/
> >  > http://autobuild.buildroot.net/results/8ce/8ce0c14d92f34245a87758db60c618916be48586/
> > 
> >  > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > 
> > Hmm, this sounds fishy. DESTDIR is normally only needed when the
> > installation directory is different from where the files will be used at
> > runtime (E.G. like for our target installation). Host-gutenprint should
> > be configured to install and run in HOST_DIR, so if you pass
> > DESTDIR=$(HOST_DIR) the files ends up in $(HOST_DIR)/$(HOST_DIR)/usr/..
> > 
> > The error sounds more like it misdetects the location of (host-)cups. We
> > do pass --without-cups to the configure script though, so I wonder why
> > it still wants to install cups files.
> > 
> > Care to take a 2nd look?
> 
> Have you seen this try to fix it?
> https://patchwork.ozlabs.org/patch/605452/

That looks like a better fix to me.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
