From: daggs <daggs@gmx.com>
Date: Thu, 9 Jun 2016 10:35:36 +0200
Subject: [Buildroot] [PATCH] odroid-mali: New Package
In-Reply-To: <20160609101626.6239350e@free-electrons.com>
References: <20160609074119.4288-1-daggs@gmx.com>,
 <20160609101626.6239350e@free-electrons.com>
Message-ID: <trinity-3a2b0e05-6fcc-4c6b-a7aa-5c8648bb6777-1465461336732@3capp-mailcom-bs11>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,
> Hello,
> 
> Thanks for re-submitting with your full name, we can now merge your
> patches! \o/
>
I've found out that patches which I've sent to my distros were merged as is to their repo so oking it there and not here is illogical.
 
> On Thu,  9 Jun 2016 10:41:19 +0300, Dagg Stompler wrote:
> > Signed-off-by: Dagg Stompler <daggs@gmx.com>
> > ---
> >  package/Config.in                        |   1 +
> >  package/odroid-mali/10-odroidc2_fb.rules |   8 ++
> >  package/odroid-mali/Config.in            |  20 +++++
> >  package/odroid-mali/S50odroidc2_fb       |  20 +++++
> >  package/odroid-mali/odroid-mali.hash     |   3 +
> >  package/odroid-mali/odroid-mali.mk       |  56 ++++++++++++++
> >  package/odroid-mali/odroidc2_fb.service  |  14 ++++
> >  package/odroid-mali/odroidc2_init_fb.sh  | 125 +++++++++++++++++++++++++++++++
> >  8 files changed, 247 insertions(+)
> 
> There is one thing I'm not really happy with however: this package is
> mixing installing the OpenGL implementation (for the GPU) with the
> initialization of the display.
> 
I've modeled the code after the sunxi-mali driver.
I assumed that if it was good enough to get into buildroot, I can use it as tamplate.

> Wouldn't it make more sense to have one package for the OpenGL
> implementation, and one package installing all the init scripts and
> udev rules related to the display? (Attention: some udev rules are
> needed for the GPU).
> 
is there such package I can use as tamplate?

> Another thing that bothers me is that it's called "odroid-mali", where
> "odroid" is the name of the board. I really find it weird that an
> OpenGL implementation is board specific. It should be SoC specific for
> sure, but not board-specific. If there are other Amlogic S905 SoC
> boards added in Buildroot, wouldn't they be able to use the same OpenGL
> implementation ?
> 
afaik, the implementation is vendor specific, e.g. we don't have the code, the vendor (hardkernel) provides the lib file and headers.
odroid is the name of the product line, there are odroid c{0,1,1+ and 2}. also there are u and x models I think.
this implementation is specific to the c2 boards I assume it can retrofitted for other boards.
the main change it will need is the files url change as.

> That being said, we already have rpi-userland for RPi, but well, RPi is
> the only board that will ever be made with this funky Broadcom SoC.
> 
> But in the Allwinner land, we have the sunxi-mali package, which works
> with various boards.
> 
> But maybe I'm being too annoying with this aspect: this OpenGL stuff
> is usually a big mess, so it's probably fine if we have a odroid-mali
> package.
> 
> But I would nonetheless like to have the thing split in two packages.
> 
one of my previous patches added all the scripts in the overlay root fs but Eric said it isn't a good idea.

I think that the scripts beside the udev rule configures the fb and aren't directly tied to the opengl

Dagg.
