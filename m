From: Carlos Santos <unixmania@gmail.com>
Date: Sat, 12 Oct 2019 11:42:36 -0300
Subject: [Buildroot] [PATCH] configs/minnowboard_max-graphical: fix
 build due to missing glxproto.h
In-Reply-To: <20191012161658.15f8c0fd@windsurf>
References: <20191012135105.26722-1-unixmania@gmail.com>
 <20191012161658.15f8c0fd@windsurf>
Message-ID: <CAJ4jsafYpF+=_J-rRPjN7VZ32nWZ-mAP=AT_nKhX3u13OyMGMw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Oct 12, 2019 at 11:16 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Carlos,
>
> On Sat, 12 Oct 2019 10:51:05 -0300
> unixmania at gmail.com wrote:
>
> > From: Carlos Santos <unixmania@gmail.com>
> >
> > Commit 5cb821d5635 added a new option to enable GLX support in mesa3d.
> > Update the defconfig accordingly.
> >
> > Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/318105208
> >
> > Signed-off-by: Carlos Santos <unixmania@gmail.com>
> > ---
> > The defconfig was edited by hand to reduce the turmoild that would
> > result from using "make savedefconfig"
>
> Fixing the defconfig is not the way to go: if a given configuration
> causes a build failure, then Buildroot needs to be fixed, as it means
> that the mesa3d package itself is broken: it lets users create
> configurations that fail to build.
>
> For example, it means the random configuration testing from the
> autobuilders could still fall into this build failure.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

The board requires BR2_PACKAGE_MESA3D_OPENGL_GLX to take advantage of
the embedded graphics chip.

The other problem is solved by replacing the test for
BR2_PACKAGE_MESA3D_DRI_DRIVER by a test for
BR2_PACKAGE_MESA3D_OPENGL_GLX in
package/x11r7/xserver_xorg-server/xserver_xorg-server.mk.

-- 
Carlos Santos <unixmania@gmail.com>
