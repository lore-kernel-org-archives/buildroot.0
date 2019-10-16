From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Oct 2019 21:01:29 +0200
Subject: [Buildroot] [PATCH 2/4] prepare build infrastructure to pick up
 installed meson tool
In-Reply-To: <CADYdroMp8GzXS+zQ0a+T-eeqDiMggbybn+gu6H4Y2x-d4GTkdA@mail.gmail.com>
References: <20191016111927.14208-1-nolange79@gmail.com>
 <20191016111927.14208-3-nolange79@gmail.com>
 <20191016154850.0d093c4d@windsurf>
 <CADYdroMp8GzXS+zQ0a+T-eeqDiMggbybn+gu6H4Y2x-d4GTkdA@mail.gmail.com>
Message-ID: <20191016210129.4043da12@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 Oct 2019 18:28:02 +0200
Norbert Lange <nolange79@gmail.com> wrote:

> > Thanks for this, however I don't think we will ever merge this until a
> > system-provided meson can effectively be used.  
> 
> Well I do effectively use it, meson and its dependencies multiply my build-time,
> builds systemd and my libfuse3 package fine.
> 
> Patch #1 is a freestanding improvement, I hope there arent issues with merging
> at least that one?

Yes, of course PATCH 1/4 is totally independent from this discussion,
and can/will be considered separately. I looked at it briefly, I
haven't made up my mind yet, but I agree it is completely separate.

> > What about working on merging
> > 0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch to upstream
> > Meson, in this form or another form ? This would definitely pave the
> > way to using the system-provided Meson.  
> 
> I'm in no way involved with meson, AFAIK this was proposed for upstream already?

You don't have to be involved with Meson to work on it. Many of us
regularly contribute patches to upstream projects without being
involved in any way with those projects.

> > Another (more useful ?) thing to look at: is it possible to use the
> > system-provided Python for Meson and Ninja, when python3 is provided by
> > the system ? I think Meson and Ninja by themselves are not long at all
> > to build, and it would be a much more useful direction for this patch
> > series.  
> 
> Define "useful". The patches work correctly for me (tm), and I dont
> use more than 1000 included packages that are useless for me (tm).
> Even if meson is not ready (again: it is for me), then improving
> buildroot ahead of it causes no harm?

Because today meson requires a Buildroot patch, and in fact what really
adds to the build time is not building host-meson or host-ninja, but
really the fact that it requires the build of host-python3. And Python
3.x is now widely available on most build machines. So the idea would
be, instead of relying on system-provided meson/ninja, to still build
our own meson/ninja, but really the system-provided python3.

> If I were cynical, Id say I prefer spending time porting packages to
> CMake rather than trying to fix meson.

I don't think the point of this discussion is to decide whether cmake,
meson or autotools, or whatever is the best build system.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
