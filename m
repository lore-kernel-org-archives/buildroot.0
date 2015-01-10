From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 18:41:31 +0100
Subject: [Buildroot] Patchwork review and cleanup
Message-ID: <20150110184131.028aa273@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is an e-mail to hopefully trigger some review/help to make
progress towards cleaning up the patchwork. Contrary to Thomas DS who
was looking at the oldest patches, I'll start from the most recent
ones and will not go all the way to the end of the list.

 * Wine package

   I'm not entirely happy to have this package depend on
   BR2_TOOLCHAIN_BUILDROOT simply because it has a limited build
   system that assumes that the --host value and the toolchain prefix
   *must* match. Do others have opinions about this?

 * The SELinux stuff

   I've started reviewing this, and even applied a few of the patches
   from the previous iterations. But I find that several packages,
   especially the audit package, have very scary patches, that I'd
   prefer to see upstreamed before we merged this in Buildroot.

   Also, I'm a bit concerned by the amount of interest in SELinux. For
   sure, our friends at Rockwell are interested in this. But who else
   is interested by that?

 * Allow a single DHCP configuration via the system configuration
   submenu

   I think the principle is OK and matches what we have
   discussed. Could someone review and test this? Any volunteer?

 * squid: fix automake breakage

   I am not entirely happy with this one. Why would we have to passs
   ACLOCALE and AUTOMAKE specifically for squid, and not globally for
   all autoreconf'ed packages? Gustavo?

 * The Erlang stuff

   Review is on-going, I still have some comments on the
   infrastructure. But this is getting better and better.

 * package/swupdate: new package

   Someone needs to review and test this. Any volunteer?

 * graph-depends improvements from Fran?ois

   I'm fine with the first patch (display virtual packages with italic
   style), but I don't really like the second patch (stopping the
   dependency tree on virtual packages), as it doesn't seem to be very
   useful to me. Thoughts? Opinions?

 * ffmpeg: enable freetype support

   I don't really like our handling of the "fenv" problem. Should we
   introduce an hidden BR2_PACKAGE_TOOLCHAIN_HAS_FENV, which would be
   true for glibc, true for uClibc on i386 and x86-64 and false
   otherwise (musl case remain to be checked). Thoughts?

 * [1/2] dhcpcd: fix build on old toolchains (sa_family_t)
   [2/2] Revert "dhcpcd: blacklist Sourcery PowerPC toolchains"

   My understand was that the problem was more a toolchain problem
   than a dhcpcd problem. Gustavo, can we patch the toolchain headers
   instead?

 * [RFC,1/4] legal-info: remove FOO_MANIFEST_TARBALL and
   FOO_MANIFEST_SITE defaults [RFC,2/4] legal-info: allow to declare
   the actual sources for binary packages [RFC,3/4] toolchain-externel:
   mass-define actual source tarball for known patterns [RFC,4/4]
   toolchain-external: define actual sources for arago toolchains

   Could someone review this?

 * ssp stuff from Yann

   Not very nice to have all this stuff just for some minor corner
   cases, but I don't really have good alternatives to
   offer. Opinions?

 * [3/4] qt5: bump to version 5.4.0
   [4/4] qt5: update URLs to use Qt's new domain

   Could someone help to review the licensing changes? That's the main
   blocking point on this series.

 * qt5multimedia: enable gstreamer-1.x support

   This is incompatible with the Qt 5.4.0 bump, and I'd prefer to
   merge the Qt 5.4.0 bump first. Should I mark this as Changes
   Requested?

 * [1/1] binutils, gcc: add support for GCC flag -flto

   Someone needs to test/review this. Any volunteer?

 * [v2] ncurses: add support for 256 colors
   [1/1] xterm: add support for 256 colors
   [1/1] screen: add support for 256 colors

   Do we really want to have Config.in options in xterm and screen for
   a simple feature such as 256 colors support?

   I must say I really don't know what to do with those patches, but
   we need to take a decision. Opinions?

 * The autobuild-run patches

   Many good features, I still need to look at them.

 * [v2] gnupg2: fix linking with intl

   Can someone test and review that the proposed solution is the
   correct one?

 * The i.MX6 patch series

   I would like to have a review of Bernd on "[v5,01/15] mesa3d: Give
   possibility to external backends to enable DRI/Gallium".

   Also, what do people think about "[v5,03/15] gpu-viv-bin-mx6q: fix
   compiling issues with EGL_API_FB", which consist in hard-coding in
   the OpenGL headers which graphic backend (fb or x11) is used,
   instead of having the clients of the OpenGL headers specify that at
   build time. I'm not too happy with this, but it's true that it
   simplifies things a bit.

 * The size-stats stuff

   Could someone review/test this stuff? It's my stuff so I can hardly
   do it for myself :-)

 * [v2] libgpg-error: bump version to 1.17

   I'm not happy with the new architecture dependent stuff, but it
   seems to be there for real. Could someone review/test this patch?

[... skipping a bunch of patches ...]

 * The umask stuff

   Could someone knowledgeable with this stuff have a look, and
   comment/review?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
