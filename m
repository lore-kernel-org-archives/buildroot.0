From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 30 Oct 2018 10:21:49 -0500
Subject: [Buildroot] [PATCH 2/2] qemu: switch to sdl2
In-Reply-To: <CAPi7W83a9HNqiCiV4CzA3ZCY6rQ07z9_+qWNErksv2nCXDT-UQ@mail.gmail.com>
References: <20181030082755.13043-1-fontaine.fabrice@gmail.com>
 <20181030082755.13043-2-fontaine.fabrice@gmail.com>
 <CANQCQpaqUjBfpnwDaFbYS62XPeKZuXL3TrRPp9Tf8S9BfZAf7Q@mail.gmail.com>
 <CAPi7W83a9HNqiCiV4CzA3ZCY6rQ07z9_+qWNErksv2nCXDT-UQ@mail.gmail.com>
Message-ID: <CANQCQpbyEcf_Od06DmNdbTgPRx-71aM1_WZx8_6wGpVkeaZ7MQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice,

On Tue, Oct 30, 2018 at 9:55 AM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> Dear Matthew,
> Le mar. 30 oct. 2018 ? 14:05, Matthew Weber
> <matthew.weber@rockwellcollins.com> a ?crit :
> >
> > Fabrice,
> >
> > On Tue, Oct 30, 2018 at 3:28 AM Fabrice Fontaine
> > <fontaine.fabrice@gmail.com> wrote:
> > >
> > > Since version 2.12.0 and
> > > https://github.com/qemu/qemu/commit/e52c6ba34149b4f39c3fd60e59ee32b809db2bfa,
> > > SDL 1.2 is deprecated so switch to SDL 2.0 as SDL 1.2 will be removed in
> > > the last release of 2018
> > >
> > > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > > ---
> > >  package/qemu/Config.in | 8 +++++---
> > >  package/qemu/qemu.mk   | 4 ++--
> > >  2 files changed, 7 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/package/qemu/Config.in b/package/qemu/Config.in
> > > index d7390141f9..33d4cccd7b 100644
> > > --- a/package/qemu/Config.in
> > > +++ b/package/qemu/Config.in
> > > @@ -118,13 +118,15 @@ comment "Frontends"
> > >
> > >  config BR2_PACKAGE_QEMU_SDL
> > >         bool "Enable SDL frontend"
> > > -       depends on BR2_PACKAGE_XORG7
> > > -       select BR2_PACKAGE_SDL
> > > -       select BR2_PACKAGE_SDL_X11
> >
> > SDL2 has a X11 option (BR2_PACKAGE_SDL2_X11), any reason to drop that
> > select from your original first patch? If you do add it back, make
> > sure to keep the "depends on BR2_PACKAGE_XORG7" and add a "depends on
> > BR2_USE_MMU # fork()" from the "config BR2_PACKAGE_SDL2_X11".
> Yes, I droped the X11 dependency intentionally. As explained in the
> link (https://github.com/qemu/qemu/commit/2ec78706d188df7d3dab43d07b19b05ef7800a44)
> in the first patch of this serie, the x11 dependency was added for the
> SDL1 frontend.
> The SDL2 frontend does not need x11.
> However, I made two patches as I think that first patch should be
> backported in buildroot bugfix releases.
> >

If you do respin this one, I'd suggest adding set of comments to the
commit description.

Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
