From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 16 Oct 2019 19:22:31 +0200
Subject: [Buildroot] [PATCH 2/4] prepare build infrastructure to pick up
 installed meson tool
In-Reply-To: <20191016164717.GF14656@scaer>
References: <20191016111927.14208-1-nolange79@gmail.com>
 <20191016111927.14208-3-nolange79@gmail.com>
 <20191016154850.0d093c4d@windsurf> <20191016164717.GF14656@scaer>
Message-ID: <CADYdroPz_xpc9=T+du1f0Jj5+rESduUoQw4E-3p_=hxm0xfHqw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mi., 16. Okt. 2019 um 18:47 Uhr schrieb Yann E. MORIN
<yann.morin.1998@free.fr>:
>
> Thomas, Norbert, All,
>
> On 2019-10-16 15:48 +0200, Thomas Petazzoni spake thusly:
> > On Wed, 16 Oct 2019 13:19:25 +0200
> > Norbert Lange <nolange79@gmail.com> wrote:
> > > Automatically check for an available meson tool,
> > > and use it as long as the version is fitting.
> >
> > Thanks for this, however I don't think we will ever merge this until a
> > system-provided meson can effectively be used.
>
> I do agreee with that.
>
> However, I guess that what Norbert is trying to do, is to build their
> own meson that they patched with our patch, thus achieving the
> "system-provided meson is capable" status.

Actually I use meson from debian testing.

> But if we're going that way for meson, why not do the same for all the
> other host tools we do build? That would be totally unfeasible.

For those complicated or long to build its useful. You already do that for
CMake, several compressors and a few others.

> So, I am still not convinced by this feature, until we can at least
> detect that a system-provided meson is capable, and that we can decide
> by actually asking that meson (e.g. by checking the version, or dumping
> its help for options, or whatevs...).

Again, patch #1 is a freestanding cleanup, hope atleast that is clear
for merging?
And the patches never automatically use meson/ninja, but are helpful
if a user would decide to cut buildtime (in a scenario where the
system tools suffice).

What about if you just want to build a toolchain? I can use this
painless from CMake,
as the toolchain.cmake gets installed even if I dont build CMake or
have CMake installed.
I would want the same for meson.

> > What about working on merging
> > 0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch to upstream
> > Meson, in this form or another form ? This would definitely pave the
> > way to using the system-provided Meson.
> >
> > Another (more useful ?) thing to look at: is it possible to use the
> > system-provided Python for Meson and Ninja, when python3 is provided by
> > the system ? I think Meson and Ninja by themselves are not long at all
> > to build, and it would be a much more useful direction for this patch
> > series.
>
> But then, it should be done very carefully: if the hot-python3 must
> otherwise be built (because something else forcibly depends on it), then
> our host-meson must also be using that host-python3 too, otherwise, we
> could end up with a host-meson built with the system-provided python3
> but run with our host-python3.

Hmm, dont get why using system python is anything better than using cmake,
ninja or (a fixed/usable) meson from the system.

regards, Norbert
