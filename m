From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 16 Oct 2019 18:28:02 +0200
Subject: [Buildroot] [PATCH 2/4] prepare build infrastructure to pick up
 installed meson tool
In-Reply-To: <20191016154850.0d093c4d@windsurf>
References: <20191016111927.14208-1-nolange79@gmail.com>
 <20191016111927.14208-3-nolange79@gmail.com>
 <20191016154850.0d093c4d@windsurf>
Message-ID: <CADYdroMp8GzXS+zQ0a+T-eeqDiMggbybn+gu6H4Y2x-d4GTkdA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mi., 16. Okt. 2019 um 15:48 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> Hello Norbert
>
> On Wed, 16 Oct 2019 13:19:25 +0200
> Norbert Lange <nolange79@gmail.com> wrote:
>
> > Automatically check for an available meson tool,
> > and use it as long as the version is fitting.
> >
> > Using a system provided meson is not an official supported
> > option, hence this is currently disabled.
> > use of the system provided meson can be enforced with:
> >
> >    make ... BR2_MESON_VERSION_MIN=0
> >
> > Signed-off-by: Norbert Lange <nolange79@gmail.com>
>
> Thanks for this, however I don't think we will ever merge this until a
> system-provided meson can effectively be used.

Well I do effectively use it, meson and its dependencies multiply my build-time,
builds systemd and my libfuse3 package fine.

Patch #1 is a freestanding improvement, I hope there arent issues with merging
at least that one?

> What about working on merging
> 0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch to upstream
> Meson, in this form or another form ? This would definitely pave the
> way to using the system-provided Meson.

I'm in no way involved with meson, AFAIK this was proposed for upstream already?

> Another (more useful ?) thing to look at: is it possible to use the
> system-provided Python for Meson and Ninja, when python3 is provided by
> the system ? I think Meson and Ninja by themselves are not long at all
> to build, and it would be a much more useful direction for this patch
> series.

Define "useful". The patches work correctly for me (tm), and I dont
use more than
1000 included packages that are useless for me (tm).
Even if meson is not ready (again: it is for me), then improving
buildroot ahead of it
causes no harm?

If I were cynical, Id say I prefer spending time porting packages to
CMake rather than trying to fix meson.

regards Norbert.
