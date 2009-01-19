From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Mon, 19 Jan 2009 20:59:47 +0100
Subject: [Buildroot] Status of "mplayer" in buildroot
Message-ID: <1232395188.4539.20.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Anyone beeing able to build "mplayer" at all?

I have been trying to get that to build for some time now.

There are several problems:

1: Current mplayer relies on an older version of alsa-lib
   The current version of alsa-lib make some routines "local"
   by statements like:

   #define snd_XXXX snd1_XXXX

   mplayer uses some of these routines and the build will not complete.

2) mplayer do not have any recent "versions".
   Instead you are encouraged to checkout the latest svn.

   The build of this will fail using the current Buildroot mplayer.mk,
   since you have to prepare the mplayer source tree by:

   ./configure
   make codec.conf.h	# This is created using native gcc.

   And once this is complete, then the buildroot mplayer.mk
   can be applied on top.

   The AVR32 patches do not apply clean on the current svn, but
   since I believe mplayer do not build anyway, for any architecture
   that means that there should be no problem upgrading mplayer 
   to the latest version.

   I *have* created a new version of the AVR patches that applies
   clean on top of the current svn. Not fully tested yet.
   HCE you want to test?

----------------

I am not particlary fond of downloading the latest svn,
since that is a recipy for breakage.
I think we should have a recommended version of mplayer
(which we have tested on many architectures) 
as well as the capability to checkout the latest.

BR
Ulf Samuelsson
