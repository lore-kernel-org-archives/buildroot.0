From: Cassiano Martin <cassiano@polaco.pro.br>
Date: Sun, 25 Sep 2016 20:39:01 -0300
Subject: [Buildroot] pppd breaks build without libutils
In-Reply-To: <20160925205851.18f334ec@free-electrons.com>
References: <CAOoxthNVzy2PCz1tsACpxdhaoVO=RZgQR-A1dMB2u0HA3yXPqA@mail.gmail.com>
 <20160925205851.18f334ec@free-electrons.com>
Message-ID: <CAOoxthNdJjSjiLS7PT_SguV7VSWxHrF8UiK0qtPz+D3bDEpnUA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sure, my fault not being version specific.
Im currently running a git cloned version (Buildroot
2016.08-git-01556-ge8c18f2-dirty)
and I'm using a pre-built toolchain from realtek. Target is MIPS32 bit LSB.
So far, I get this when compiling.

ude '-DDESTDIR="/usr"' -DCHAPMS=1 -DMPPE=1 -DHAS_SHADOW -DHAVE_CRYPT_H=1
-DHAVE_LOGWTMP=1 -DUSE_CRYPT=1 -DHAVE_MULTILINK -DUSE_TDB=1 -DPLUGIN
-DINET6=1 -DMAXOCTETS -Wl,-E -o pppd main.o magic.o fsm.o lcp.o ipcp.o
upap.o chap-new.o md5.o ccp.o ecp.o auth.o options.o demand.o utils.o
sys-linux.o ipxcp.o tty.o eap.o chap-md5.o session.o md4.o chap_ms.o sha1.o
pppcrypt.o multilink.o tdb.o spinlock.o ipv6cp.o eui64.o  -lcrypt -lutil
-ldl
/home/cassiano/projects/oiw-2441apgn/realtek/rsdk-4.6.4-4181-EB-3.10-u0.9.33-m32-150324/bin/../lib/gcc/mips-linux-uclibc/4.6.4/../../../../mips-linux-uclibc/bin/ld:
cannot find -lutil
collect2: ld returned 1 exit status
Makefile:217: recipe for target 'pppd' failed
make[2]: *** [pppd] Error 1
make[2]: Leaving directory
'/home/cassiano/projects/oiw-2441apgn/output/build/pppd-2.4.7/pppd'
Makefile:13: recipe for target 'all' failed
make[1]: *** [all] Error 2
make[1]: Leaving directory
'/home/cassiano/projects/oiw-2441apgn/output/build/pppd-2.4.7'
package/pkg-generic.mk:201: recipe for target
'/home/cassiano/projects/oiw-2441apgn/output/build/pppd-2.4.7/.stamp_built'
failed


2016-09-25 15:58 GMT-03:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Hello,
>
> On Sun, 25 Sep 2016 13:53:05 -0300, Cassiano Martin wrote:
>
> > I am generating a small firmware environment, and pppd breaks build
> process
> > if libutils is not included. I looked under its sources and its used to
> > wtmp logging.
>
> Thanks for this report. Could you be more specific in terms of the
> Buildroot version that you're using, and the Buildroot configuration?
> What exact build issue are you facing (i.e can you copy/paste the error
> messages) ?
>
> Indeed, we have autobuilders that test random configurations, and pppd
> is built many times, and we haven't seen such an issue so far I believe.
>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160925/c1b6f38b/attachment.html>
