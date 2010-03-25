From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Mar 2010 23:34:52 +0100
Subject: [Buildroot] external toolchain and sysroot
In-Reply-To: <hog8rg$sis$1@dough.gmane.org>
References: <1272730299.20100325182803@ya.ru> <hog24r$1nu$1@dough.gmane.org>
	<93399903.20100325201240@ya.ru> <44830928.20100325201616@ya.ru>
	<hog8rg$sis$1@dough.gmane.org>
Message-ID: <20100325233452.3794166b@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 25 Mar 2010 18:08:49 +0000 (UTC)
Grant Edwards <grant.b.edwards@gmail.com> wrote:

> Based on my sample of three packages (two had the problem), I'm
> guessing it's a very common problem.  It looks like the buildroot
> developers use external toolchains that don't require a --sysroot
> option. 

They do. What we do to support external toolchains is :

 * We copy the full sysroot of the toolchain into $(STAGING_DIR)
 * We copy just the C library and related libraries from the sysroot to
   the $(TARGET_DIR)
 * We pass --sysroot $(STAGING_DIR) to every gcc/ld invocation, so that
   gcc/ld find the libraries and header files correctly.

Actually, this mechanism *only* works with toolchain supporting
--sysroot. Toolchains *not* supporting --sysroot are rejected (see
toolchain/external-toolchain/ext-tool.mk).

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
