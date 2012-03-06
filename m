From: MERCADIER Johann <johann.mercadier@imerir.com>
Date: Tue, 6 Mar 2012 14:49:21 +0000
Subject: [Buildroot] BR 2012.rc1 :: XORG compilation issue
Message-ID: <CAPEB33x3V6aspqT=H96HgoCpB6n-==5NwcRPj0BKcpx8J7PJWQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everybody,

   back with a new problem. I try to add a graphical output to my
pandaboard.
   It seems gcc try to compile 'liblua.so' as a static lib the raison why
it suggest to add the -fPIC option. What I don't understand using a
all-in-one tool like BR it is where I do that? Do I have to modify manually
the Makefile? then if it works how I do report that to the community?
  If someone could help me?

Bye

___[ OUTPUT
]_____________________________________________________________________________________________
/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/workdone/usr/bin/arm-unknown-linux-uclibcgnueabi-ranlib
liblua.a
/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/workdone/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-o liblua.so.5.1.4 -shared -Wl,-soname="liblua.so.5.1.4" lapi.o lcode.o
ldebug.o ldo.o ldump.o lfunc.o lgc.o llex.o lmem.o lobject.o lopcodes.o
lparser.o lstate.o lstring.o ltable.o ltm.o lundump.o lvm.o lzio.o
lauxlib.o lbaselib.o ldblib.o liolib.o lmathlib.o loslib.o ltablib.o
lstrlib.o loadlib.o linit.o -nostdlib -lgcc
/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/workdone/usr/lib/gcc/arm-unknown-linux-uclibcgnueabi/4.5.3/../../../../arm-unknown-linux-uclibcgnueabi/bin/ld:
lapi.o: relocation R_ARM_MOVW_ABS_NC against `a local symbol' can not be
used when making a shared object; recompile with -fPIC
lapi.o: could not read symbols: Bad value
collect2: ld returned 1 exit status
make[1]: *** [liblua.so] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: Leaving directory
`/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/output/build/lua-5.1.4/src'
make: ***
[/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/output/build/lua-5.1.4/.stamp_built]
Error 2


-- 
Cordialement.

___Johann MERCADIER___

:(){ :|:& };:
"I am the Unknown lead by the Unknowing.
I have done so much with so little for so long
that I am now qualified to do anything with nothing."
HOOSEEK (http://www.hooseek.com/) 1?moteur de recherche solidaire!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120306/3581711f/attachment.html>
