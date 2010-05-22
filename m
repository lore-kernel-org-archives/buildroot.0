From: =?utf-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Date: Sat, 22 May 2010 22:11:19 +0200
Subject: [Buildroot] [git commit master] atngw100_defconfig: update to fix
	build failure
Message-ID: <20100522201357.B1BF47FDB6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=38ec41bc53cd660c92c6af5f911bd3e96fa2d8f0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

atngw100_defconfig: update to fix build failure:

  * The AVR32 toolchain fails to build with the new uClibc version
    0.9.31.x. Use the older uClibc 0.9.30.x branch instead.
  * Disable linux-fusion as it fails to build
    (why was this selected anyway, when DirectFB was not selected?).
  * U-Boot 2010.03 is broken for AVR32. The build fails with:
      zlib.c:31:27: error: asm/unaligned.h: No such file or directory
    Select the older U-Boot 2009.08 version that builds instead.
  * Disable rsync as it fails to build.

Build tested with 'make distclean && make atngw100_defconfig && make'
on an Ubuntu 10.04 x86_64 host.

Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

Patch is too large, so refusing to show it
