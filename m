From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 22:17:22 +0100
Subject: [Buildroot] Blackfin Buildroot toolchain issue
Message-ID: <20150315221722.3645eb35@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gustavo,

I believe you originally added the support to build a Blackfin
toolchain with the Buildroot internal toolchain backend. Today, I've
added an external Blackfin toolchain built by Buildroot in the
autobuilder, and one build failure occurred with this toolchain, on the
Bellagio package:

  http://autobuild.buildroot.org/results/05f/05fa9cb522514e9e5b9e81893f145aab00abd803/build-end.log

I reproduced the build issue here, and the config.log contains:

configure:3298: checking whether the C++ compiler works
configure:3320: /home/thomas/projets/buildroot/output/host/usr/bin/bfin-linux-g++ -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_O
FFSET_BITS=64   -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.cpp  >&5
/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/bfin-buildroot-linux-uclibc/4.5.4/../../../../bfin-buildr
oot-linux-uclibc/bin/ld: a.out: hidden symbol `___udivdi3' in /home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib
/gcc/bfin-buildroot-linux-uclibc/4.5.4/libgcc.a(_udivdi3.o) is referenced by DSO
/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/bfin-buildroot-linux-uclibc/4.5.4/../../../../bfin-buildroot-linux-uclibc/bin/ld: final link failed: Bad value
collect2: ld returned 1 exit status

If you have an idea on how to fix this, it would be useful.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
