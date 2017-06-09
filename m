From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 9 Jun 2017 06:00:51 +0300
Subject: [Buildroot] [PATCH v2 1/2] mtd: bump to version 2.0.0
In-Reply-To: <1496955910-32315-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1496955910-32315-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170609030051.uwqwdl5hajatd2wv@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Adam,

On Thu, Jun 08, 2017 at 11:05:08PM +0200, Thomas Petazzoni wrote:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> MTD Tools was bumped to version 2.0 after over a decade of being at
> 1.5.2.

A little correction, mtd-utils 1.5.2 is not that old:

commit aea36417067dade75192bafa03af70b6eb2677b1
Author: Brian Norris <computersforpeace@gmail.com>
Date:   Fri Jul 24 18:18:53 2015 -0700

    Release mtd-utils-1.5.2

baruch

> This revision includes:
>   - Moving from a handwritten makefile to autotools.
>   - Restructuring and cleaning up the source tree.
>   - Fixing the problems that the patches in the package/mtd directory fixed.
> 
> Changes:
>   - Move from generic-package to autotools-package in mtd.mk.
>   - Remove no longer necessary patches.
>   - Update binary locations in mtd.mk
>   - Update library/header locations in mtd.mk
>   - Remove MTD_ADD_MISSING_LINTL definition from mtd.mk, as it's no longer
>     needed.
> 
> Tested with toolchains compiled with musl, uclibc, and glibc.
> 
> Signed-off-by: Adam Duskett <aduskett@codeblue.com>
> [Thomas: additional improvements
>  - introduce hidden options BR2_PACKAGE_MTD_JFFS_UTILS,
>    BR2_PACKAGE_MTD_UBIFS_UTILS and BR2_PACKAGE_MTD_TESTS that match the
>    ./configure options of mtd. Those hidden options select the
>    appropriate dependencies checked by the configure script, and are
>    selected by the existing per-tool Config.in options.
>  - .mk file is changed to handle properly the new hidden options
>    BR2_PACKAGE_MTD_JFFS_UTILS, BR2_PACKAGE_MTD_UBIFS_UTILS and
>    BR2_PACKAGE_MTD_TESTS.
>  - .mk file is changed to properly handle BR2_PACKAGE_ACL, by passing
>    --with-xattr/--without-xattr.
>  - remove HOST_MTD_BUILD_CMDS and HOST_MTD_INSTALL_CMDS, those are no
>    longer needed since we have an autotools-package now.
>  - MTD_STAGING_y and MTD_INSTALL_STAGING_CMDS are removed, we use the
>    default staging installation commands, that install everything that
>    is needed.
>  - the MTD_TARGETS_UBI_y variable is merged into MTD_TARGETS_y, as we no
>    longer need to distinguish both.
>  - integck installation logic is moved into MTD_TARGETS_y.]
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
