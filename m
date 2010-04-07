From: Chris Kerios <ckerios@gmail.com>
Date: Tue, 6 Apr 2010 21:09:50 -0400
Subject: [Buildroot] module-init-tools build problem in Buildroot
	buildroot-2010.02
Message-ID: <w2p47b4a4c91004061809l6fbeffdz4cb71ef7d7a19557@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
I am a relative noob when it comes to using buildroot as I am just getting
started with embedded on an old AVR32ngw board.  I am running Fedora 12 as
my host and I am trying to build the toolchain, kernel, etc. using buildroot
from scratch.  Cool work/tool by the way!  Anyway I am getting the following
error message attached below.  I have scoured the mailing list archive on
this and can only find 1 reference in which the person asked the question
and then followed up immediately with notice that he fixed the problem.  He
only left a vague reference that it had something to do with glibc not being
built for his target.  If this is the case, I can't figure it out as the
module-init-tools is built after the successful build of gcc, ulibC, gdb,
etc.  If it has anything to do with my host I have all the glibc and
glibc-devel built on the Fedora side as well.  Dumb question here: Which C
lib is it looking for?  The ulibC under the buildroot directory I am
building the toolchain/cross-compiler in or the Fedora host glibc?

Am I missing something here?
Thanks in Advance.


modinfo.c: In function ?main?:
modinfo.c:338: warning: ?infosize? may be used uninitialized in this
function
/usr/lib/ccache/gcc  -g -O2 -Wunused -Wall   -o modinfo  modinfo.o
zlibsupport.o
/usr/lib/ccache/gcc  -g -O2 -Wunused -Wall   -o insmod.static -static
insmod.o
/usr/bin/ld: cannot find -lc
collect2: ld returned 1 exit status
make[1]: *** [insmod.static] Error 1
make[1]: Leaving directory
`/home/chris/buildroot-avr32-v2.3.0/toolchain_build_avr32/module-init-tools-3.2.2'
make: ***
[/home/chris/buildroot-avr32-v2.3.0/toolchain_build_avr32/module-init-tools-3.2.2/depmod]
Error 2
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100406/f6ffc3e4/attachment-0001.htm>
