From: Chris Kerios <ckerios@gmail.com>
Date: Wed, 12 May 2010 14:05:37 -0400
Subject: [Buildroot] Buildroot 2010 rc2 fails to build
In-Reply-To: <58B9D5B09E114795948B69CA62CAB0CE@AP366>
References: <AANLkTim8u-blOgAiVpxjWfe1VuQ06EUIsgJ0zz_jWYxw@mail.gmail.com>
	<58B9D5B09E114795948B69CA62CAB0CE@AP366>
Message-ID: <AANLkTil4b1zC3nN148fwJSmxsdeg3Mm5hAFO-2Uvo8nJ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Will.

Sorry, my bad everyone, I didn't look far enough down in the mail archive to
see your thread where this is resolved with a config file change.  I blew
away my .config file and rebuilt a new one and all the problems with usleep
and the uClibc build went away.  However, what did blow up was the MTD
utilities build.  I am researching that right now.  I thought I saw
something in the mail archive but it looked like it was just saying to turn
it off for the time being.  If this is the case I am not sure if that is
going to work for me as I am developing on a compact flash card and using
JFFS2 for a file system.  Still learning.  Thanks.

Chris

On Wed, May 12, 2010 at 4:24 AM, Will Moore <will.moore@beraninstruments.com
> wrote:

>
> > -----Original Message-----
> > From: buildroot-bounces at busybox.net [mailto:
> buildroot-bounces at busybox.net]
> > On Behalf Of Chris Kerios
> > Sent: 11 May 2010 23:30
> > To: buildroot at busybox.net
> > Subject: [Buildroot] Buildroot 2010 rc2 fails to build
> >
> > Hi,
> > I am building for a Geode LX using the latest release candidate - rc2.  I
> > am getting a failure when buildroot is building the gdb 6.8 packages.  It
> > is trying to resolve an undefined reference to "usleep".  The output is
> > attached below.  I redid my .config to not build the gdb packages and it
> > then goes on a ways and fails when building busybox with the same
> > unresolved reference to usleep.  I get successful builds with the 2010.02
> > release with no changes in my config file.  Any ideas???
>
> As reported previously, I had this issue when I used my 2010.02 buildroot,
> kernel and busybox .config files with 2010.rc1 and just accepted the
> default
> options for missing configuration items.  However if I regenerated my
> .config from scratch using 2010.05 rc1 menuconfig (selecting all the
> same/equivalent options) then this build issue went away
>
> >
> > Also, I noticed with the rc2 release the uClibc is prompting me for
> > answers to questions.  Is this expected to be expected as I don't have to
> > do this for the 2010.02 release?
>
> I think it is this update of uclibc options that is the problem.  I have
> not
> examined the differences and dug deeper to resolve but you might like to ;)
>
> I also asked the list if carrying forward .configs like this was an
> acceptable way to move to newer versions of buildroot - it would seem at
> least you and I are doing it!
>
> >
> > Chris
> >
> > /home/chris/buildroot-2010.05-rc2/output/staging/usr/bin/i586-unknown-
> > linux-uclibc-gcc -Os -pipe -Os  -mtune=geode -march=geode -
> > D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -
> > I/home/chris/buildroot-2010.05-rc2/output/staging/usr/include -
> > I/home/chris/buildroot-2010.05-rc2/output/staging/include --
> > sysroot=/home/chris/buildroot-2010.05-rc2/output/staging/ -isysroot
> > /home/chris/buildroot-2010.05-rc2/output/staging -Os -pipe -Os  -
> > mtune=geode -march=geode -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -
> > D_FILE_OFFSET_BITS=64 -I/home/chris/buildroot-2010.05-
> > rc2/output/staging/usr/include -I/home/chris/buildroot-2010.05-
> > rc2/output/staging/include --sysroot=/home/chris/buildroot-2010.05-
> > rc2/output/staging/ -isysroot /home/chris/buildroot-2010.05-
> > rc2/output/staging -L/home/chris/buildroot-2010.05-rc2/output/staging/lib
> > -L/home/chris/buildroot-2010.05-rc2/output/staging/usr/lib --
> > sysroot=/home/chris/buildroot-2010.05-rc2/output/staging/ -Wno-error
> > \
> >         -o gdb gdb.o libgdb.a \
> >            ../readline/libreadline.a ../opcodes/libopcodes.a
> > ../bfd/libbfd.a  ../libiberty/libiberty.a ../libdecnumber/libdecnumber.a
> > -lncurses -lm   ../libiberty/libiberty.a  -ldl -rdynamic
> > libgdb.a(ser-tcp.o): In function `net_open':
> > ser-tcp.c:(.text+0x1ee): warning: gethostbyname is obsolescent, use
> > getnameinfo() instead.
> > libgdb.a(linux-nat.o): In function `linux_child_follow_fork':
> > linux-nat.c:(.text+0x4da3): undefined reference to `usleep'
> > collect2: ld returned 1 exit status
> > make[3]: *** [gdb] Error 1
> > make[3]: Leaving directory `/home/chris/buildroot-2010.05-
> > rc2/output/build/gdb-6.8-target/gdb'
> > make[2]: *** [all-gdb] Error 2
> > make[2]: Leaving directory `/home/chris/buildroot-2010.05-
> > rc2/output/build/gdb-6.8-target'
> > make[1]: *** [all] Error 2
> > make[1]: Leaving directory `/home/chris/buildroot-2010.05-
> > rc2/output/build/gdb-6.8-target'
> > make: *** [/home/chris/buildroot-2010.05-rc2/output/build/gdb-6.8-
> > target/gdb/gdb] Error 2
> >
>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100512/304af660/attachment.htm>
