From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Nov 2015 19:43:01 +0100
Subject: [Buildroot] [PATCH 2/2] libtirpc: bump to version 1.0.1
In-Reply-To: <1446712210-14129-3-git-send-email-peda@lysator.liu.se>
References: <1446712210-14129-1-git-send-email-peda@lysator.liu.se>
 <1446712210-14129-3-git-send-email-peda@lysator.liu.se>
Message-ID: <20151124194301.5dd9ece4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Rosin,

On Thu,  5 Nov 2015 09:30:10 +0100, Peter Rosin wrote:
> From: Peter Rosin <peda@axentia.se>
> 
> Adjust patch 0001 to trivial changes.
> Adjust patch 0007 to remove new DES things.
> Add patch 0008 directly from upstream to fix a late problem in the
> 1.0.1 release.
> 
> Signed-off-by: Peter Rosin <peda@axentia.se>

This patch breaks the build of libtirpc, with the following error:

rpc_soc.c:64:24: fatal error: rpcsvc/nis.h: No such file or directory
compilation terminated.
Makefile:749: recipe for target 'libtirpc_la-rpc_soc.lo' failed
make[4]: *** [libtirpc_la-rpc_soc.lo] Error 1
make[4]: *** Waiting for unfinished jobs....
Makefile:552: recipe for target 'all-recursive' failed
make[3]: *** [all-recursive] Error 1
Makefile:413: recipe for target 'all' failed
make[2]: *** [all] Error 2
package/pkg-generic.mk:188: recipe for target '/home/thomas/projets/buildroot/output/build/libtirpc-1.0.1/.stamp_built' failed
make[1]: *** [/home/thomas/projets/buildroot/output/build/libtirpc-1.0.1/.stamp_built] Error 2
Makefile:36: recipe for target '_all' failed
make: *** [_all] Error 2

Without this patch applied, it builds fine. The failing configuration
is:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2015.11-rc1-71-g90d1299.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_7=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_RPCBIND=y
# BR2_TARGET_ROOTFS_TAR is not set

Can you look into this? Once fixed, maybe you can resend the series,
and fix the permission problem in PATCH 1/2 at the same time?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
