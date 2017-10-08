From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Oct 2017 16:23:36 +0200
Subject: [Buildroot] [PATCH] toolchain: Bump ARC tools to arc-2017.09-rc1
In-Reply-To: <20170921182828.26985-1-didin@synopsys.com>
References: <20170921182828.26985-1-didin@synopsys.com>
Message-ID: <20171008162336.5e0f49ac@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 21 Sep 2017 21:28:28 +0300, Evgeniy Didin wrote:
> This commit bumps ARC toolchain to arc-2017.09-rc1.
> 
> Now speaking about arc-2017.09 series it is built on top
> of upstream GCC 7.1.1 and Binutils 2.29 so please expect
> all kinds of breakages related to GCC 7.x as we saw earlier
> with move from 4.8 to 6.x :)
> 
> Note patches for both GCC and Binutils were updated with
> copies from corresponding mainline versions, i.e.
> "package/gcc/7.2.0" and "package/binutils/2.29".
> 
> Please note that it is a release candidate and it might contain
> some breakages, please don't use it for production builds.
> 
> !!This super commit rewrites older commit which bumped
> !!arc toolchain to 2017.09-eng008 vesrion
> 
> Signed-off-by: Evgeniy Didin <didin@synopsys.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: arc-buildroot at synopsys.com
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/binutils/Config.in.host                    |   2 +-
>  .../0002-ld-makefile.patch}                        |  10 +-
>  .../0003-check-ldrunpath-length.patch}             |  12 +--
>  .../0004-add-sysroot-fix-from-bug-3049.patch}      |  17 ++--
>  .../0005-poison-system-directories.patch}          |  54 +++++-----
>  ...LINKER-BUG-.rofixup-section-size-mismatch.patch |  31 ++++++
>  package/binutils/binutils.hash                     |   2 +-
>  package/binutils/binutils.mk                       |   2 +-
>  package/gcc/Config.in.host                         |   6 +-
>  .../0001-ARC-Fix-tst_movb-pattern.patch            |  55 ----------
>  .../gcc/arc-2017.03/301-missing-execinfo_h.patch   |  13 ---
>  .../arc-2017.03/940-uclinux-enable-threads.patch   |  19 ----
>  package/gcc/arc-2017.09-rc1/0100-uclibc-conf.patch |  29 ++++++
>  .../0860-cilk-fix-build-without-wchar.patch}       |  24 +++--
>  .../arc-2017.09-rc1/0900-remove-selftests.patch    | 111 +++++++++++++++++++++
>  .../0910-Update-uses-for-hw-loop-labels.patch      |  63 ++++++++++++
>  package/gcc/gcc.hash                               |   2 +-
>  package/gdb/Config.in.host                         |   2 +-
>  package/gdb/gdb.hash                               |   2 +-
>  19 files changed, 307 insertions(+), 149 deletions(-)
>  rename package/binutils/{arc-2017.03/0300-PATCH-ld-makefile.patch => arc-2017.09-rc1/0002-ld-makefile.patch} (87%)
>  rename package/binutils/{arc-2017.03/0301-PATCH-check-ldrunpath-length.patch => arc-2017.09-rc1/0003-check-ldrunpath-length.patch} (79%)
>  rename package/binutils/{arc-2017.03/0500-add-sysroot-fix-from-bug-3049.patch => arc-2017.09-rc1/0004-add-sysroot-fix-from-bug-3049.patch} (80%)
>  rename package/binutils/{arc-2017.03/0600-poison-system-directories.patch => arc-2017.09-rc1/0005-poison-system-directories.patch} (89%)
>  create mode 100644 package/binutils/arc-2017.09-rc1/0006-Fixes-LINKER-BUG-.rofixup-section-size-mismatch.patch
>  delete mode 100644 package/gcc/arc-2017.03/0001-ARC-Fix-tst_movb-pattern.patch
>  delete mode 100644 package/gcc/arc-2017.03/301-missing-execinfo_h.patch
>  delete mode 100644 package/gcc/arc-2017.03/940-uclinux-enable-threads.patch
>  create mode 100644 package/gcc/arc-2017.09-rc1/0100-uclibc-conf.patch
>  rename package/gcc/{arc-2017.03/860-cilk-wchar.patch => arc-2017.09-rc1/0860-cilk-fix-build-without-wchar.patch} (79%)
>  create mode 100644 package/gcc/arc-2017.09-rc1/0900-remove-selftests.patch
>  create mode 100644 package/gcc/arc-2017.09-rc1/0910-Update-uses-for-hw-loop-labels.patch

Applied to master, after dropping the useless Blackfin-related binutils
patch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
