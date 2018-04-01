From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 08:53:39 +0200
Subject: [Buildroot] [PATCH v2 08/37] check-package: enable for fs/
In-Reply-To: <20180401050850.5701-9-ricardo.martincoski@gmail.com>
References: <20180401050850.5701-1-ricardo.martincoski@gmail.com>
 <20180401050850.5701-9-ricardo.martincoski@gmail.com>
Message-ID: <20180401085339.35a7ddb9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Apr 2018 02:08:21 -0300, Ricardo Martincoski wrote:
> The filesystem types can benefit from this script to prevent common
> mistakes when submitting patches.
> 
> In order to accomplish this:
> Do not ignore anymore files from the fs/ directory.
> Ignore fs/common.mk as it declares a package infra and not a package itself.
> Register the ROOTFS_ as a valid prefix for variables.
> Ignore these symbols:
>  - PACKAGES_PERMISSIONS_TABLE: defined either by packages through
>    pkg-generic or by filesystem types, used by fs/common.mk;
>  - SUMTOOL: defined by package mtd, used by filesystem jffs2;
>  - TARGETS_ROOTFS: defined by filesystem types, used in the main
>    Makefile.
> 
> Keep using loose checks that warn about common mistakes while keep the
> code simple.
> As a consequence the check functions do not differentiate between
> packages and filesystems so the symbol PACKAGE_UBI would not generate a
> warning for the ubi filesystem neither the symbol ROOTFS_MTD would
> generate a warning for the mtd package. But those kind of mistakes are
> not common and are obvious in the code review, unlike typos i.e.
> ROOTFS_UBl or PACKAGE_MID that would be hard to see in the code review.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
> Changes v1 -> v2:
>   - remove spurious info from commit log (I first created the series
>     changing the check-package and then fixing the package files; when I
>     rebased to allow partial apply of the series, the info "do not
>     ignore this symbol" became obsolete since it is fixed in a previous
>     patch);
> ---
>  utils/check-package             | 2 ++
>  utils/checkpackagelib/lib_mk.py | 5 ++++-
>  2 files changed, 6 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
