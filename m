From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jun 2017 23:11:41 +0200
Subject: [Buildroot] [PATCH 01/01] mtd: bump to version 2.0.0
In-Reply-To: <20170523130714.25586-1-aduskett@codeblue.com>
References: <20170523130714.25586-1-aduskett@codeblue.com>
Message-ID: <20170608231141.667394ff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 May 2017 09:07:14 -0400, Adam Duskett wrote:
> MTD Tools was bumped to version 2.0 after over a decade of being at 1.5.2.
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
> Tested with toolchains compiled with MUSL, uclib, and glibc.
> 
> Signed-off-by: Adam Duskett <aduskett@codeblue.com>

Thanks for doing this. However, there were still a number of problems
in your submission. Since I wanted this topic to move forward, I did a
new submission with my fixes:

  https://patchwork.ozlabs.org/patch/773504/
  https://patchwork.ozlabs.org/patch/773503/

Here is the list of changes I made:

    [Thomas: additional improvements
     - introduce hidden options BR2_PACKAGE_MTD_JFFS_UTILS,
       BR2_PACKAGE_MTD_UBIFS_UTILS and BR2_PACKAGE_MTD_TESTS that match the
       ./configure options of mtd. Those hidden options select the
       appropriate dependencies checked by the configure script, and are
       selected by the existing per-tool Config.in options.
     - .mk file is changed to handle properly the new hidden options
       BR2_PACKAGE_MTD_JFFS_UTILS, BR2_PACKAGE_MTD_UBIFS_UTILS and
       BR2_PACKAGE_MTD_TESTS.
     - .mk file is changed to properly handle BR2_PACKAGE_ACL, by passing
       --with-xattr/--without-xattr.
     - remove HOST_MTD_BUILD_CMDS and HOST_MTD_INSTALL_CMDS, those are no
       longer needed since we have an autotools-package now.
     - MTD_STAGING_y and MTD_INSTALL_STAGING_CMDS are removed, we use the
       default staging installation commands, that install everything that
       is needed.
     - the MTD_TARGETS_UBI_y variable is merged into MTD_TARGETS_y, as we no
       longer need to distinguish both.
     - integck installation logic is moved into MTD_TARGETS_y.]

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
