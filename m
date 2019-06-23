From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Jun 2019 21:20:44 +0200
Subject: [Buildroot] [PATCH v3,
 2/2] package/mpd: fix static build with tremor and vorbis
In-Reply-To: <20190601143456.23326-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 1 Jun 2019 16:34:56 +0200")
References: <20190601143456.23326-1-fontaine.fabrice@gmail.com>
 <20190601143456.23326-2-fontaine.fabrice@gmail.com>
Message-ID: <874l4gds6r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > mpd can't be built statically with tremor and vorbis, build fails on:
 > block.c:(.text+0x11c): multiple definition of `vorbis_block_init'
 > /usr/lfs/v0/rc-buildroot-test/scripts/instance-2/output/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib/libvorbisidec.a(block.o):block.c:(.text+0x0): first defined here
 > /usr/lfs/v0/rc-buildroot-test/scripts/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/7.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: Disabling relaxation: it will not work with multiple definitions
 > /usr/lfs/v0/rc-buildroot-test/scripts/instance-2/output/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib/libvorbis.a(block.o): In function `_vorbis_block_alloc':

 > Fix this by making both options mutually exclusive

 > It should be noted that upstream removed the possibility to enable
 > tremor and vorbis at the same time since version 0.21.6 and
 > https://github.com/MusicPlayerDaemon/MPD/commit/c18cd941aaa4c16ac713bc4f1e16ada5281d689e

 > Fixes:
 >  - http://autobuild.buildroot.org/results/60c721a82ffd668bebf02d80bca83780d6cdb2f2

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
