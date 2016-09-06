From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Sep 2016 21:27:36 +0200
Subject: [Buildroot] [PATCH] btrfs-progs: bump to version 4.7.2
In-Reply-To: <1473170340-9594-1-git-send-email-gustavo@zacarias.com.ar>
References: <1473170340-9594-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160906212736.520d86e9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  6 Sep 2016 10:59:00 -0300, Gustavo Zacarias wrote:
> Drop all of the upstreamed patches (not precisely in the same form) and
> rebase the only required patch for proper static builds with staging
> libs required by other packages.
> Build-tested for arm-glibc, arm-uclibc, arm-musl and arm-uclibc-static.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...install-static-library-and-headers-in-in.patch} |  14 ++-
>  ...01-configure-refactor-backtrace-detection.patch | 132 ---------------------
>  ...onfigure-refactor-always_inline-detection.patch |  42 -------
>  ...compile-fix-undefined-PATH_MAX-under-musl.patch |  67 -----------
>  package/btrfs-progs/btrfs-progs.hash               |   2 +-
>  package/btrfs-progs/btrfs-progs.mk                 |   2 +-
>  6 files changed, 10 insertions(+), 249 deletions(-)
>  rename package/btrfs-progs/{0004-Makefile.in-install-static-library-and-headers-in-in.patch => 0001-Makefile.in-install-static-library-and-headers-in-in.patch} (76%)
>  delete mode 100644 package/btrfs-progs/0001-configure-refactor-backtrace-detection.patch
>  delete mode 100644 package/btrfs-progs/0002-configure-refactor-always_inline-detection.patch
>  delete mode 100644 package/btrfs-progs/0003-compile-fix-undefined-PATH_MAX-under-musl.patch

Applied to master, thanks. I was surprised you did not remove
AUTORECONF = YES since we were patching configure.ac. But in fact,
AUTORECONF = YES was not passed. Not sure how btrfs-progs was
building... most likely one of its dependency has AUTORECONF = YES, so
autoconf was guaranteed to be around.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
