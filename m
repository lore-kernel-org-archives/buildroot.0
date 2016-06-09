From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 9 Jun 2016 19:25:39 +0200
Subject: [Buildroot] [PATCH] odroid-mali: New Package
In-Reply-To: <trinity-3a2b0e05-6fcc-4c6b-a7aa-5c8648bb6777-1465461336732@3capp-mailcom-bs11>
References: <20160609074119.4288-1-daggs@gmx.com>
 <20160609101626.6239350e@free-electrons.com>
 <trinity-3a2b0e05-6fcc-4c6b-a7aa-5c8648bb6777-1465461336732@3capp-mailcom-bs11>
Message-ID: <20160609192539.01cf0a0e@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all!

Le Thu, 9 Jun 2016 10:35:36 +0200,
daggs <daggs@gmx.com> a ?crit :

> > Another thing that bothers me is that it's called "odroid-mali",
> > where "odroid" is the name of the board. I really find it weird
> > that an OpenGL implementation is board specific. It should be SoC
> > specific for sure, but not board-specific. If there are other
> > Amlogic S905 SoC boards added in Buildroot, wouldn't they be able
> > to use the same OpenGL implementation ?
> >   
> afaik, the implementation is vendor specific, e.g. we don't have the
> code, the vendor (hardkernel) provides the lib file and headers.
> odroid is the name of the product line, there are odroid c{0,1,1+ and
> 2}. also there are u and x models I think. this implementation is
> specific to the c2 boards I assume it can retrofitted for other
> boards. the main change it will need is the files url change as.

From the vendor website, we can see that odroid-c1+ and odroid-c2 have
the same GPU (MALI 450). So maybe the "odroidc2_fb*" files could be
renamed to "odroid_fb*" (if needed, tweaking according to the
machine could be performed in the helper script).

> > That being said, we already have rpi-userland for RPi, but well,
> > RPi is the only board that will ever be made with this funky
> > Broadcom SoC.
> > 
> > But in the Allwinner land, we have the sunxi-mali package, which
> > works with various boards.
> > 
> > But maybe I'm being too annoying with this aspect: this OpenGL stuff
> > is usually a big mess, so it's probably fine if we have a
> > odroid-mali package.
> > 
> > But I would nonetheless like to have the thing split in two
> > packages. 
> one of my previous patches added all the scripts in the overlay root
> fs but Eric said it isn't a good idea.

As the display is to be set up via a service managed by the init system,
it seemed logical to me to provide the script and the service files in
a package to benefit from the helper for service installation (when
using an overlay, a plain copy is performed, so you will end up with a
systemd service file on a SysV-based system and vice-versa).

The sunxi-mali package does provide a service file for SysV: S80mali.

But maybe it will be better to provide the script, services
files and rules in a package named "odroid-board" or
"odroid-userspace" (as there is "sunix-board" and "rpi-userland").

Regards,

-- 
ELB
