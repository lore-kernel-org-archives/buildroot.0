From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 30 Nov 2010 19:48:19 +0100
Subject: [Buildroot] Buildroot 2010.11 released
Message-ID: <8762vey7f0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2010.11 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2010.11.tar.gz

or

http://buildroot.net/downloads/buildroot-2010.11.tar.bz2

After 3 months of development a new stable Buildroot release is
out. Significant changes are:

 - Experimental crosstool-NG backend for the toolchain handling. Long
   term, this is expected to replace our internal toolchain handling.
 - Updated Kconfig infrastructure (from 2.6.36) with savedefconfig and
   nconfig support. We now also create a convenience Makefile wrapper
   in the output directory for out-of-tree builds (make O=<dir>).
 - Old-style package hooks (*_HOOK_POST_*) removed. Use the more
   generic new-style ones instead.
 - Download handling reworked and support for git/svn downloads added.
 - Support for ARM Cortex A9 and Sparc LEON variants added. Support
   for Alpha, Cris, IA64 and Sparc64 (deprecated in 2010.08) removed.
 - New packages: argp-standalone, gdk-pixbuf, gpsd, gst-ffmpeg,
   libmpeg2, kbd, librsvg, nuttcp, rng-tools, rrdtool and xz
 - Removed packages: dillo, libglib12, libgtk12, microwin and pcmcia

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.11

Hotplug, lzma, ng-spice-rework and sfdisk packages got deprecated. Speak
up if you need them, otherwise they will be removed during the 2011.02
development cycle.

Many thanks to the people contributing to this release:

git shortlog -s -n 2010.08..
   168  Peter Korsgaard
   115  Thomas Petazzoni
    55  Gustavo Zacarias
    37  Martin Banky
    26  Yann E. MORIN
    15  Lionel Landwerlin
    13  Mike Frysinger
    10  Paulius Zaleckas
     8  Maxime Petazzoni
     4  Konrad Eisele
     3  Chih-Min Chao
     2  Yegor Yefremov
     1  Andy Gibbs
     1  Felipe Contreras
     1  Frederik Pasch
     1  Heiko Zuerker
     1  Javier Viguera
     1  Luca Ceresoli
     1  Marcelo Roberto Jimenez
     1  Marcus Osdoba
     1  Matt Johnson
     1  Paul Burton
     1  Paul Jones
     1  Stanislav Bogatyrev
     1  Thomas Rudin
     1  Will Newton

Next to the usual suspects, a special thanks to Martin Banky for all
his work on converting packages to the gentargets/autotargets
infrastructure. Martin still has some conversion patches pending, so
hopefully we'll be able to finish the conversion work by the next
release.

The next release is going to be 2011.02. Expect the first release
candidate in late January and the final release at the end of
February. There will also be another developer day the Monday after
FOSDEM 2011.

Stuff in the pipeline for 2011.02 includes:

 - Gentarget/autotools conversion of the remaining packages.
 - Cleanup of target/device and defconfigs. Move to minimal defconfigs
   like in the kernel (savedefconfig).
 - More crosstool-ng and toolchain cleanup work. See the report from
   the developers day in Cambridge for more information:
   http://lists.busybox.net/pipermail/buildroot/2010-November/038913.html
 - Package management support using .ipk packages
 - Public access to regression tests results

Thanks to everyone contributing and testing the release candidates!

-- 
Bye, Peter Korsgaard
