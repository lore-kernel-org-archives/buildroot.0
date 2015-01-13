From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 13 Jan 2015 20:49:35 +0100
Subject: [Buildroot] Fwd: Fwd: Fwd: Fwd: [PATCH v3] linux: add fbtft
 kernel extension
Message-ID: <trinity-65dc17c7-9533-4870-8a7e-11cd22cd200f-1421178575629@3capp-gmx-bs51>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Lou,

On Mon, Jan 12, 2015 at 05:30:22PM -0600, Lou Crittenden wrote:
> I did another make with TOUCHSCREEN_ADS7846 option as m this time, and now
> I have the ads7846_device.ko file. I also applied the patch and we'll see
> how it goes. I hope Thomas P. didn't get you down on that day.

No the linux kernel CONFIG_TOUCHSCREEN_ADS7846=m buills only the
'basic' ads7846.ko kernel module. You need the additional
ads7846_device.ko kernel module which will configure your basic
ads7846.ko module. Therefore the buildroot patch which will
build the ads7846_device.ko module for you (and will do the
right kernel config additions)....

Regards,
Peter

> 
> On Mon, Jan 12, 2015 at 4:56 PM, Peter Seiderer <ps.report@gmx.net> wrote:
> 
> > Hello Lou,
> >
> > On Mon, Jan 12, 2015 at 01:48:02AM -0600, Lou Crittenden wrote:
> > > Oh, I forgot to enable the TOUCHSCREEN_ADS7846 option. Is this [y] or
> > [m]?
> > > I chose [y].
> >
> > I would chose [m]...but use my patch from [1], it will enable all
> > kernel-configs automatically...
> >
> > You need the ads7846_device.ko module in addition, see [2] or take
> > a closer look at the patch...
> >
> > Regards,
> > Peter
> >
> > [1] http://lists.busybox.net/pipermail/buildroot/2015-January/116799.html
> > [2] https://github.com/notro/fbtft_tools/wiki/ads7846_device
> > >
