From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 28 Feb 2011 22:27:10 +0100
Subject: [Buildroot] Buildroot 2011.02 released
Message-ID: <87tyfnono1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2011.02 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2011.02.tar.gz

or

http://buildroot.net/downloads/buildroot-2011.02.tar.bz2

After 3 months of development a new stable Buildroot release is
out. Significant changes are:

 - Proper split up of host versus target binaries. The staging
   directory is now located in $(O)/host/usr/<tuple>/sysroot, and
   cross compiler + other host tools in $(O)/host/usr/bin.
   The cross pkg-config now also automatically returns correct values
   for cross compilation, without needing any environment variables to
   be set.

 - External toolchain and crosstool-ng backend improvements and
   out-of-the-box support for downloading/using CodeSourcery
   toolchains.

 - Rework of how hardware boards are supported, and support for a
   number of qemu configs added.

 - Ccache support reworked. Now used for both host and target
   compilation, and cache is stored in ~/.buildroot-ccache.

 - Generic cmake infrastructure, similar to the existing
   GENTARGETS/AUTOTARGETS. Support for bzr downloads, next to the
   existing git/svn/ftp/http support.

 - Minimalistic no-MMU support for a subset of the packages.

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.02

Devmem2 and webif packages got deprecated. Speak up if you need them,
otherwise they will be removed during the 2011.05 development cycle.

Many thanks to the people contributing to this release:

git shortlog -s -n 2010.11..

   171  Peter Korsgaard
   119  Gustavo Zacarias
   103  Thomas Petazzoni
    22  Mike Frysinger
    21  Lionel Landwerlin
    17  Martin Banky
    11  Bj?rn Forsman
     6  Daniel Nystr?m
     6  Felipe Contreras
     5  Yann E. MORIN
     4  Maxime Ripard
     3  H Hartley Sweeten
     3  Heiko Zuerker
     3  Martin Hicks
     3  Yegor Yefremov
     2  Will Newton
     1  ANDY KENNEDY
     1  Andy Kennedy
     1  Fabien Marteau
     1  Frederik Pasch
     1  Guillaume Gardet
     1  Julien Boibessot
     1  Kim Jae-hui
     1  Mark Wickham
     1  Matt Fleming
     1  Nate Ford
     1  Paulius Zaleckas
     1  Phil Edworthy
     1  Philippe Reynes
     1  Sagaert Johan
     1  Thomas De Schampheleire

This has been quite an active development cycle, with contributions
from approximately double the number of people than we usually do,
which is very nice - Thanks to the newcomers, as well as the "oldies".
Of those, especially Gustavo Zacarias has been very active with
version bumps and fixes.

We also had another developer day after FOSDEM, with good discussions
about sysroot handling, toolchain SDKs and package / uninstall
support.

Public access to regression test results still didn't make it, but it
did help us sort out a large number of build issues. Thanks to the GCC
compile farm for CPU cycles.

The next release is going to be 2011.05. Expect the first release
candidate in late April and the final release at the end of May.

Stuff in the pipeline for 2011.05 includes:

 - Gentarget/autotools conversion of the remaining packages.
 - Better external toolchain and Buildroot SDK support, possibly with
   a sysroot wrapper for ease of use.
 - Package management support using .ipk packages
 - Public access to regression tests results

Thanks to everyone contributing and testing the release candidates!

Oh, and we have cool Buildroot merchandise now, courtesy of cafepress ;)
Full disclosure: These are sold with a 5% markup which goes to cover
practical expenses for dev days, DNS registration and so on:

http://www.cafepress.co.uk/buildroot

Enjoy!

-- 
Bye, Peter Korsgaard
