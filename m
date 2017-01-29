From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jan 2017 14:30:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/sngrep: needs ncurses
 form/menu/panel libraries
In-Reply-To: <20170128165745.5149-1-bernd.kuhls@t-online.de>
References: <20170128165745.5149-1-bernd.kuhls@t-online.de>
Message-ID: <20170129143037.130cb2e3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 28 Jan 2017 17:57:45 +0100, Bernd Kuhls wrote:
> Please see configure checks for the various ncurses libraries:
> 
> form
> https://github.com/irontec/sngrep/blob/master/configure.ac#L90
> 
> menu
> https://github.com/irontec/sngrep/blob/master/configure.ac#L94
> 
> panel
> https://github.com/irontec/sngrep/blob/master/configure.ac#L86
> 
> Fixes
> http://autobuild.buildroot.net/results/3a4/3a4751fcc6184d562df80d1cd6bf53e788e21392/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

I don't yet understand those build failures. Indeed, locally, I'm able
to build the following defconfig, which has form/menu/panel disabled,
but sngrep builds fine:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-basic-2016.11-236-ge309abf.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_8=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_SNGREP=y
# BR2_TARGET_ROOTFS_TAR is not set

The options are only about installing the libraries to the target, they
are always installed to staging it seems. So while I agree they are
needed, I still don't understand the build failures reported by the
autobuilders.

Am I missing something?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
