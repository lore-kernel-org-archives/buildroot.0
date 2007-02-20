From: Thomas Lundquist <lists@zelow.no>
Date: Tue, 20 Feb 2007 14:42:53 +0100
Subject: [Buildroot] Xorg.
Message-ID: <20070220134253.GA24769@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Is it just me or won't Xorg (the full one, not tiny X) compile?

This is what it ends up with:

cc -I../../.. -I../../../exports/include -I..  -I../../../include/extensions      -c -o utils.o utils.c

rm -f xkbcomp

cc -I../../../exports/include -o xkbcomp  xkbcomp.o xkbscan.o expr.o vmod.o indicators.o misc.o alias.o                keymap.o keycodes.o keytypes.o compat.o action.o                symbols.o geometry.o xkbpath.o listing.o              xkbparse.o parseutils.o utils.o -L/usr/X11R6/lib -lxkbfile -lX11

/usr/bin/ld: cannot find -lxkbfile

collect2: ld returned 1 exit status

make[6]: *** [xkbcomp] Error 1
make[6]: Leaving directory
`/local/export/home/thomasez/Buildroot/buildroot.rolls/build_i686/xc/programs/xkbcomp/cross'
make[5]: *** [all] Error 2

Is this known? (I presume that -L../../../exports/lib is missing but
haven't found any simple method to add it)

This is on x86, most of buildroot options are default but gcc is 4.2


Thomas.
