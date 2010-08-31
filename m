From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 01 Sep 2010 00:14:50 +0200
Subject: [Buildroot] Buildroot 2010.08 released
Message-ID: <87hbiawht1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2010.08 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2010.08.tar.gz

or

http://buildroot.net/downloads/buildroot-2010.08.tar.bz2

After 3 months of development a new stable Buildroot release is
out. Significant changes are:

 - Significant work done on making BR more robust and testing of
   different package combinations. Many thanks to the GCC compile farm
   for CPU cycles for 'randpackageconfig' build tests. Related to this
   we have also disabled (and marked as experimental) the shared
   configure cache as that is known to break for certain package
   combinations.
 - Support for NPTL threading in uClibc (notice: only for git
   snapshots, no uClibc release with NPTL exists)
 - New GTK-based configurator, accessible using 'make gconfig'.
 - .config is now located in the output directory when using
   out-of-tree builds (make O=<dir>), allowing multiple builds in
   parallel.
 - Cleanup of bootloaders handling, Barebox added
 - New packages: cgilua, copas, coxpcall, ffmpeg, libsvgtiny,
   libgail, luafilesystem, luasocket, rings, wsapi, xavante and xterm
 - Old toolchain versions removed.

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.08

A number of things got deprecated:

 - Alpha, Cris, IA64 and Sparc architectures
 - GTK+ on Directfb (no upstream support)
 - Dillo, libglib12, libgtk12, microwin and pcmcia packages

Unless someone steps up to support them, these will be removed
during the 2010.11 development cycle.

Many thanks to the people contributing to this release:

git shortlog -s -n 2010.05..

   175  Peter Korsgaard
   168  Thomas Petazzoni
    38  Gustavo Zacarias
    18  cmchao
     8  Luca Ceresoli
     7  Paul Jones
     6  Lionel Landwerlin
     6  Malte Starostik
     5  Yann E. MORIN
     3  Julien Boibessot
     3  Khem Raj
     2  Dmytro Milinevskyy
     2  Francois Perrad
     2  Nick Leverton
     2  Peter Huewe
     2  Stanislav Bogatyrev
     1  Baruch Siach
     1  Bj?rn Forsman
     1  Daniel Hobi
     1  Darcy Watkins
     1  Darius Augulis
     1  H Hartley Sweeten
     1  Karl Krach
     1  Kelvin Cheung
     1  Ossy
     1  Sagaert Johan
     1  Simon Pasch
     1  Slava Zanko
     1  Thiago A. Correa
     1  Will Wagner
     1  Yegor Yefremov

The next release is going to be 2010.11. Expect the first release
candidate in late October and the final release at the end of
November.

Stuff in the pipeline for 2010.11 includes:

 - Gentarget/autotools conversion of the remaining packages. Since the
   last status we're now down to 43 autotools / 51 gentarget
   (from 77 / 56):
   http://lists.busybox.net/pipermail/buildroot/2010-May/034868.html
 - Cleanup of target/device and defconfigs. Move to minimal defconfigs
   like in the kernel (savedefconfig).
 - More external toolchain work and closer cooporation with
   crosstool-ng (http://ymorin.is-a-geek.org/projects/crosstool)
 - Further work on package uninstall / rebuild support
 - Public access to regression tests results

Thanks to everyone contributing and testing the release candidates!

-- 
Bye, Peter Korsgaard
