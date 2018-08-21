From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Aug 2018 11:48:40 +0200
Subject: [Buildroot] [PATCH] libaio: bump to 0.3.111
In-Reply-To: <20180814213755.15093-1-thomas.petazzoni@bootlin.com>
References: <20180814213755.15093-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180821114840.3dff621f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Aug 2018 23:37:55 +0200, Thomas Petazzoni wrote:
> Until now, libaio contained some architecture specific code to do the
> syscalls. In fact, it contained a generic variant of the code called
> syscall-generic.h, but it was showing a warning when it was used, as
> if it was "not safe". Consequently, in Buildroot, we had chosen to
> support libaio only on a the subset of architectures that were
> explicitly handled by libaio.
> 
> However, between 0.3.110 and 0.3.111, libaio upstream entirely dropped
> the architecture-specific code:
> 
>   https://pagure.io/libaio/c/97fd3fc0195500e616e34047cba4846164c411d9?branch=master
> 
> Consequently, in this patch, we:
> 
>  - Bump libaio to 0.3.111.
> 
>  - Switch to the new upstream at https://pagure.io/libaio/.
> 
>  - Drop the 0001-arches.patch patch, which was adding support for
>    MIPS, since we no longer need architecture-specific code.
> 
>  - Update the remaining patches, and Git-format one of them which
>    wasn't Git-formatted.
> 
>  - Drop the BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS option and all its uses.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/blktrace/Config.in                         |   2 -
>  package/cryptsetup/Config.in                       |   2 -
>  package/dmraid/Config.in                           |   2 -
>  package/docker-engine/Config.in                    |   1 -
>  package/gadgetfs-test/Config.in                    |   1 -
>  package/libaio/0001-arches.patch                   | 249 ---------------------
>  ...-add-ENABLE_SHARED-boolean-to-allow-stat.patch} |   4 +-
>  ...akefile-add-missing-DESTDIR-variable-use.patch} |  22 +-
>  package/libaio/Config.in                           |  10 +-
>  package/libaio/libaio.hash                         |   4 +-
>  package/libaio/libaio.mk                           |   5 +-
>  package/libiio/Config.in                           |   1 -
>  package/luksmeta/Config.in                         |   2 -
>  package/mysql/Config.in                            |   2 -
>  package/udisks/Config.in                           |   3 -
>  package/xen/Config.in                              |   2 -
>  16 files changed, 23 insertions(+), 289 deletions(-)
>  delete mode 100644 package/libaio/0001-arches.patch
>  rename package/libaio/{0002-src-Makefile-add-ENABLE_SHARED-boolean-to-allow-stat.patch => 0001-src-Makefile-add-ENABLE_SHARED-boolean-to-allow-stat.patch} (95%)
>  rename package/libaio/{0003-destdir.patch => 0002-Makefile-add-missing-DESTDIR-variable-use.patch} (56%)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
