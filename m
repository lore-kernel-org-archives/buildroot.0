From: Chris Kerios <ckerios@gmail.com>
Date: Wed, 7 Apr 2010 10:43:22 -0400
Subject: [Buildroot] module-init-tools build problem in Buildroot
	buildroot-2010.02
In-Reply-To: <x2i532dd5841004062307z6b769350p63d09e0b90226dea@mail.gmail.com>
References: <w2p47b4a4c91004061809l6fbeffdz4cb71ef7d7a19557@mail.gmail.com>
	<x2i532dd5841004062307z6b769350p63d09e0b90226dea@mail.gmail.com>
Message-ID: <q2u47b4a4c91004070743w5498b7ddu8e3d4ca048202da0@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ravi,
Thanks for your prompt reply.  I have been playing with this all morning and
am at my wits end.  So far I am still unsuccessful.  I understand what you
are saying about the build not finding the "c" library.  I have looked all
over my system (Fedora 12) and the C libs and links to those libs all look
to be in place and with the right permissions.  I have tried all sorts of
tricks including exporting the LD_LIBRARY_PATH variable and editing the
Makefile to force it to look in the system lib directories.  ldconfig -p
shows:

libc.so.6 (libc6, hwcap: 0x0018000000000000, OS ABI: Linux 2.6.18) =>
/lib/i686/nosegneg/libc.so.6
    libc.so.6 (libc6, OS ABI: Linux 2.6.18) => /lib/libc.so.6

Any ideas???  I'm sinking here and exceeded any knowledge I have on this
one.
Regards,
Chris

On Wed, Apr 7, 2010 at 2:07 AM, Ravi Kumar Kulkarni
<ravilinux4u@gmail.com>wrote:

> Hi Chris
>
> On Wed, Apr 7, 2010 at 6:39 AM, Chris Kerios <ckerios@gmail.com> wrote:
> > Hello,
> > I am a relative noob when it comes to using buildroot as I am just
> getting
> > started with embedded on an old AVR32ngw board.  I am running Fedora 12
> as
> > my host and I am trying to build the toolchain, kernel, etc. using
> buildroot
> > from scratch.  Cool work/tool by the way!  Anyway I am getting the
> following
> > error message attached below.  I have scoured the mailing list archive on
> > this and can only find 1 reference in which the person asked the question
> > and then followed up immediately with notice that he fixed the problem.
> He
> > only left a vague reference that it had something to do with glibc not
> being
> > built for his target.  If this is the case, I can't figure it out as the
> > module-init-tools is built after the successful build of gcc, ulibC, gdb,
> > etc.  If it has anything to do with my host I have all the glibc and
> > glibc-devel built on the Fedora side as well.  Dumb question here: Which
> C
> > lib is it looking for?  The ulibC under the buildroot directory I am
> > building the toolchain/cross-compiler in or the Fedora host glibc?
> >
> > Am I missing something here?
> > Thanks in Advance.
> >
> >
> > modinfo.c: In function ?main?:
> > modinfo.c:338: warning: ?infosize? may be used uninitialized in this
> > function
> > /usr/lib/ccache/gcc  -g -O2 -Wunused -Wall   -o modinfo  modinfo.o
> > zlibsupport.o
> > /usr/lib/ccache/gcc  -g -O2 -Wunused -Wall   -o insmod.static -static
> > insmod.o
> > /usr/bin/ld: cannot find -lc
>
> lc means tat GCC does not find link to C library ,which  is something
> strange.
> try to create a symbolink for lc and tat should hopefull work.please
> try n let me know.
>
>
> > collect2: ld returned 1 exit status
> > make[1]: *** [insmod.static] Error 1
> > make[1]: Leaving directory
> >
> `/home/chris/buildroot-avr32-v2.3.0/toolchain_build_avr32/module-init-tools-3.2.2'
> > make: ***
> >
> [/home/chris/buildroot-avr32-v2.3.0/toolchain_build_avr32/module-init-tools-3.2.2/depmod]
> > Error 2
> >
> warm regards,
> Ravi Kulkarni.
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100407/498b4b7f/attachment.htm>
