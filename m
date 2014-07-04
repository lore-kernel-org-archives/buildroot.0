From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Jul 2014 09:21:01 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-07-03
In-Reply-To: <20140704063009.1FF2F101282@stock.ovh.net>
References: <20140704063009.1FF2F101282@stock.ovh.net>
Message-ID: <20140704092101.4ab1732f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  4 Jul 2014 08:30:09 +0200 (CEST), Thomas Petazzoni wrote:

>        arc |                 busybox-1.22.1 | NOK | http://autobuild.buildroot.net/results/6bb90d3f2b840a1faacf152a1d93a909a2dc98d3/

Hum, we recently updated libtirpc, and apparently it now uses compiler
intrinsics that are not available on ARC. Alexey, what is the status of
implementing those intrinsics on ARC ?

>        sh4 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/9786ab41117fbe760e4e8ae40ccf37af55813728/
>        arm |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/378ec9b387bb65b0893f8f7a0a6563ca62425fac/
>    powerpc |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/e73903bb72cd663d94cf5d982db2e7727e9da67a/

I guess those are fixed by
http://git.buildroot.net/buildroot/commit/?id=d13402248bd8f19b4fc5a2f6c8be0097dbd30b6d.

>    powerpc |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/cad8669f4338ab07f6a66aaebc9bd6c9e94620cf/

In a static linking scenario, redefined symbols behind libc and the
program itself:

/home/test/autobuild/instance-3/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(getopt.os):(.sdata+0x4): multiple definition of `opterr'
getopt.o:(.sdata+0x0): first defined here
/home/test/autobuild/instance-3/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(getopt.os):(.sdata+0x8): multiple definition of `optind'
getopt.o:(.sdata+0x4): first defined here
/home/test/autobuild/instance-3/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(getopt.os): In function `__GI_getopt':
getopt.c:(.text+0x888): multiple definition of `getopt'

>        arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/ed8b917778cafcd4eb061cf17b0d1b8e255f0de7/

Maxime, this is about XBMC requiring Java. What surprises me is that
before the requirement of Java for XBMC was added in Buildroot, I'm
pretty sure we had some successful builds of XBMC. So are you sure we
need Java to build XBMC ?

>        arm |           perl-net-ssleay-1.64 | NOK | http://autobuild.buildroot.net/results/fc5a9c18a850c2947e6806d0479ee52ae067a76b/
>        arm |           perl-net-ssleay-1.64 | NOK | http://autobuild.buildroot.net/results/52c3f2c1cc4d26236b8a948f2e0432caeac3ff54/

I believe those should be fixed by the new series from Fran?ois, but
this series is still under review and there are some pending comments.

>     x86_64 |                 pinentry-0.8.3 | NOK | http://autobuild.buildroot.net/results/064b2b69664e6c2b720800dffbbd3d12c695eae4/

I believe this one should be fixed by
http://patchwork.ozlabs.org/patch/360437/.

>    powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/dd34cc023d91d56360cc70aedbd3311c813f8020/

Exception in the autobuilder script needed.

>       bfin | snappy-1ff9be9b8fafc8528ca9... | NOK | http://autobuild.buildroot.net/results/e1ce0c1cdd0139208dddaa8f2441ab0e3ab2385e/

Blackfin toolchain issue.

>        arm |                        unknown | TIM | http://autobuild.buildroot.net/results/36979b5702d3c8a2f807d3ec7431ec4cb88753e5/

Ignore.

>       bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/74e29cf0d3c9d3e67a9e361e4b8e11fa50452475/

Blackfin toolchain issue.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
