From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 May 2010 13:03:28 +0200
Subject: [Buildroot] [PATCH] atngw100_defconfig: update to fix build
 failure
In-Reply-To: <1274057382-27365-1-git-send-email-bjorn.forsman@gmail.com>
References: <1274057382-27365-1-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <20100519130328.697596b4@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 17 May 2010 02:49:42 +0200
Bj?rn Forsman <bjorn.forsman@gmail.com> wrote:

>   * The AVR32 toolchain fails to build with the new uClibc version
>     0.9.31.x. Use the older uClibc 0.9.30.x branch instead.

Is this going to be fixed upstream ?

>   * Disable linux-fusion as it fails to build
>     (why was this selected anyway, when DirectFB was not selected?).
>   * U-Boot 2010.03 is broken for AVR32. The build fails with:
>       zlib.c:31:27: error: asm/unaligned.h: No such file or directory
>     Select the older U-Boot 2009.08 version that builds instead.

Same thing here ?

>   * Disable rsync as it fails to build.
>   * host-mtd fails when BR2_JLEVEL=3 and not for BR_JLEVEL=1. Use 1.

In that case, changing BR2_JLEVEL is a big hammer because it disables
parallel build for *all* packages and not just for host-mtd. Changing
$(MAKE) to $(MAKE1) in packages/mtd/mtd.mk would have the same effect,
but only for mtd.

Which problem are you seeing exactly.

> 
> Build tested with 'make distclean && make atngw100_defconfig && make'
> on an Ubuntu 10.04 x86_64 host.

I don't have the hardware to test and some of the things above could be
improved, but it's definitely better to have something that builds and
runs but isn't perfect than something that doesn't build at all.

So:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
