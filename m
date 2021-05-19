From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 May 2021 22:34:36 +0200
Subject: [Buildroot] [git commit] configs/rpi: fix defconfigs after
 upstream rebased
In-Reply-To: <20210519222617.47589fd5@gmx.net>
References: <20210518142339.5F82681547@busybox.osuosl.org>
 <20210519222617.47589fd5@gmx.net>
Message-ID: <20210519203436.GL2268078@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-05-19 22:26 +0200, Peter Seiderer spake thusly:
> On Tue, 18 May 2021 16:50:03 +0200, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > commit: https://git.buildroot.net/buildroot/commit/?id=8c3f281626fb3a9e7ca596ca1df2cc1d30252496
> > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> >
> > Branches in the Rappberry Pi linux repository are often rebased, which
> > means that commits that are not reachable from a reference (tag,branch)
> > will eventually get garbage-collected.
> >
> > This is probably what hapenned with the commit we are curently
> > referencing in our defconfig files.
> >
> > Swith to using the current HEAD of the rpi-5.10.y brnch, in lieue of the
> > previous one.
> >
> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> > ---
> >  configs/raspberrypi0_defconfig       | 2 +-
> >  configs/raspberrypi0w_defconfig      | 2 +-
> >  configs/raspberrypi2_defconfig       | 2 +-
> >  configs/raspberrypi3_64_defconfig    | 2 +-
> >  configs/raspberrypi3_defconfig       | 2 +-
> >  configs/raspberrypi3_qt5we_defconfig | 2 +-
> >  configs/raspberrypi4_64_defconfig    | 2 +-
> >  configs/raspberrypi4_defconfig       | 2 +-
> >  configs/raspberrypi_defconfig        | 2 +-
> >  9 files changed, 9 insertions(+), 9 deletions(-)
> >
> > diff --git a/configs/raspberrypi0_defconfig b/configs/raspberrypi0_defconfig
> > index 84de42c631..4cccad83f7 100644
> > --- a/configs/raspberrypi0_defconfig
> > +++ b/configs/raspberrypi0_defconfig
> > @@ -9,7 +9,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
> >
> >  BR2_LINUX_KERNEL=y
> >  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> > -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,96110e96f1a82e236afb9a248258f1ef917766e9)/linux-96110e96f1a82e236afb9a248258f1ef917766e9.tar.gz"
> > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,b657cd2f27d9171b75c846f21e7b4bb581b3ed29)/linux-96110e96f1a82e236afb9a248258f1ef917766e9.tar.gz"
> ^ missing change of download file name to linux-b657cd2f27d9171b75c846f21e7b4bb581b3ed29.tar.gz

Arg, I forgot to use the 'g' address in my sed expression...

Thanks for the heads up! I'll push a fix shortly...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
