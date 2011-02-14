From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 14 Feb 2011 22:51:48 +0100
Subject: [Buildroot] Buildroot 2011.02-rc1 released
Message-ID: <87oc6eb7yj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2011.02-rc1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2011.02-rc1.tar.gz

or

http://buildroot.net/downloads/buildroot-2011.02-rc1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or bug
tracker. Many thanks to the people contributing to this release:

git shortlog -s -n 2010.11..
   127	Peter Korsgaard
   111	Gustavo Zacarias
   103	Thomas Petazzoni
    22	Mike Frysinger
    21	Lionel Landwerlin
    17	Martin Banky
    10	Bj?rn Forsman
     6	Felipe Contreras
     5	Daniel Nystr?m
     4	Maxime Ripard
     4	Yann E. MORIN
     3	H Hartley Sweeten
     3	Heiko Zuerker
     3	Martin Hicks
     3	Yegor Yefremov
     1	Andy Kennedy
     1	Fabien Marteau
     1	Frederik Pasch
     1	Guillaume Gardet
     1	Julien Boibessot
     1	Kim Jae-hui
     1	Mark Wickham
     1	Matt Fleming
     1	Nate Ford
     1	Paulius Zaleckas
     1	Phil Edworthy
     1	Philippe Reynes
     1	Sagaert Johan
     1	Will Newton

This has been quite an active development cycle, with contributions
from approximately double the number of people than we usually do,
which is very nice - Thanks to the newcomers, as well as the "oldies".

Of noteworthy new features we have:

 - Proper splitup of host versus target binaries. The staging
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

For more details, see the CHANGES file:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.02_rc1

Enjoy!

-- 
Bye, Peter Korsgaard
