From: William Pettersson <enigma@strudel-hound.com>
Date: Wed, 18 Jul 2007 20:15:48 +1000
Subject: [Buildroot] ARCH not being sent by make menuconfig - kernel compile
 fails to start
Message-ID: <469DE854.6090401@strudel-hound.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

First off, sorry for the cross-post.  I posted this to the busybox
mailing list first, instead of the buildroot list.  My bad there, but
since that was completely the wrong mailing list, I'm posting it here.


So, I'm trying to set up a buildroot image for a soekris net4801.  I ran
make menuconfig, Target Architecture is set to "i386", Target
Architecture Variant is set to "geode".

However, when I run "make", I get the following
(cd /home/wpettersson/src/buildroot/build_/linux-2.6.21.5 ; \
         /usr/bin/make -j1 ARCH= CC="/usr/bin/gcc" \

INSTALL_HDR_PATH=/home/wpettersson/src/buildroot/toolchain_build_/linux
headers_install ; \
        )
make[1]: Entering directory
`/home/wpettersson/src/buildroot/build_/linux-2.6.21.5'
Makefile:491:
/home/wpettersson/src/buildroot/build_/linux-2.6.21.5/arch//Makefile: No
such file or directory
make[1]: *** No rule to make target
`/home/wpettersson/src/buildroot/build_/linux-2.6.21.5/arch//Makefile'.
 Stop.
make[1]: Leaving directory
`/home/wpettersson/src/buildroot/build_/linux-2.6.21.5'
make: ***
[/home/wpettersson/src/buildroot/toolchain_build_/linux/.configured] Error 2

- From the looks of it, "ARCH" isn't being set, which stuffs things up.
I've tested by running the make command manually, with ARCH=i386, and
that seemed to work.

I wasn't sure which configuration files would be required, so to save
space I didn't include any.  If any are wanted, I'll gladly post them.

Anyone know where ARCH is meant to be set?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFGnehUNSpXjKoV00kRAqSiAJ4mcWFDijeuhADe1k5JqU1kDKLkVgCfZAEH
0TArkB7oYhaMLmEB90N/M/g=
=ieK8
-----END PGP SIGNATURE-----
