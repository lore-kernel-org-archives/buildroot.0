From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 30 May 2010 22:31:17 +0200
Subject: [Buildroot] Buildroot 2010.05 released
Message-ID: <87iq65rv1m.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2010.05 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2010.05.tar.gz

or

http://buildroot.net/downloads/buildroot-2010.05.tar.bz2

After 3 months of development a new stable Buildroot release is
out. Significant changes are:

 - Restructured/simplified 'make menuconfig' menus to make it easier to
   locate the packages you need. Remember you can search in menuconfig
   using '/' if you get lost.
 - Lots of fixes for better external toolchain support, including
   multilib toolchains.
 - Bunch of new packages and toolchain versions. Xorg 7.5. More
   accurate wchar/locale/gettext annotations.
 - Additional system dependencies checks to give clear error messages
   instead of various odd breakage at a later stage.
 - Additional package conversion to gentarget/autotools infrastructure.
   A similar infrastructure has been added for the filesystem
   outputs. Notice that this work changed the output filesystem
   filenames.
 - Added script to display package dependencies graphically
   (see ./scripts/graph-depends)
 - Unmaintained nios2 support removed

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.05

Quite some work has been done during this release (666 commits) -
Many thanks to the people contributing to this release:

git shortlog -s -n 2010.02..
   224  Paulius Zaleckas
   182  Thomas Petazzoni
   148  Peter Korsgaard
    28  Gustavo Zacarias
    26  Will Wagner
    14  Lionel Landwerlin
     6  Yann E. MORIN
     4  H Hartley Sweeten
     3  Darius Augulis
     3  Josh.Wu
     3  Luca Ceresoli
     2  Alexander Clouter
     2  Bj?rn Forsman
     2  Julien Boibessot
     2  Kelvin Cheung
     2  Paul Jones
     2  Richard van Paasen
     1  Baruch Siach
     1  Chris Seawood
     1  Frederik Vannoote
     1  Grant Edwards
     1  Johan Thelin
     1  Laine Walker-Avina
     1  Michael Roth
     1  Mike Crowe
     1  Nick Leverton
     1  Thomas Brandstetter
     1  William Wagner
     1  cmchao
     1  serj.kalichev

The next release is going to be 2010.08. Expect the first release
candidate in late July and the final release at the end of
August. Notice that I'm away on holidays the first 3 weeks of August,
so this schedule might slip slightly.

Stuff in the pipeline for 2010.08 includes:

 - Gentarget/autotools conversion of the remaining packages. See
   http://lists.busybox.net/pipermail/buildroot/2010-May/034868.html
   for current status
 - More external toolchain work and closer cooporation with
   crosstool-ng (http://ymorin.is-a-geek.org/projects/crosstool)
 - Further work on package uninstall / rebuild support
 - More permanent setup for regression tests

Thanks to everyone contributing and testing the release candidates!

-- 
Bye, Peter Korsgaard
