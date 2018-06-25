From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jun 2018 21:57:19 +0200
Subject: [Buildroot] [PATCH] toolchain: Bump ARC tools to arc-2018.03
 release
In-Reply-To: <20180625154535.21098-1-didin@synopsys.com>
References: <20180625154535.21098-1-didin@synopsys.com>
Message-ID: <20180625215719.4a04bde3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Jun 2018 18:45:35 +0300, Evgeniy Didin wrote:
> This commit finally bumps ARC tools to the most recent arc-2018.03 release version.
> 
> ARC GNU tools of version arc-2018.03 bring some quite significant changes like:
> * Binutils v2.29.51 with additional ARC patches
> * GCC 7.3.1 with additional ARC patches
> * GDB 8.0.50 with ARC patches
> 
> More information on this release could be found here:
> https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2018.03-release
> 
> Signed-off-by: Evgeniy Didin <didin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: arc-buildroot at synopsys.com
> ---
> Please also apply this patch on top of 2018.05.x branch, so we will have
> final release version of toolchain instead of release candidate version. 
>  
>  package/binutils/Config.in.host                               | 2 +-
>  .../{arc-2018.03-rc2 => arc-2018.03}/0002-ld-makefile.patch   | 0
>  .../0003-check-ldrunpath-length.patch                         | 0
>  .../0004-add-sysroot-fix-from-bug-3049.patch                  | 0
>  .../0005-poison-system-directories.patch                      | 0
>  package/binutils/binutils.hash                                | 2 +-
>  package/binutils/binutils.mk                                  | 4 ++--
>  package/gcc/Config.in.host                                    | 2 +-
>  .../{arc-2018.03-rc2 => arc-2018.03}/0100-uclibc-conf.patch   | 0
>  .../0860-cilk-fix-build-without-wchar.patch                   | 0
>  .../0900-remove-selftests.patch                               | 0
>  package/gcc/gcc.hash                                          | 2 +-
>  package/gdb/Config.in.host                                    | 2 +-
>  package/gdb/gdb.hash                                          | 2 +-
>  package/glibc/glibc.hash                                      | 2 +-
>  package/glibc/glibc.mk                                        | 2 +-
>  16 files changed, 10 insertions(+), 10 deletions(-)
>  rename package/binutils/{arc-2018.03-rc2 => arc-2018.03}/0002-ld-makefile.patch (100%)
>  rename package/binutils/{arc-2018.03-rc2 => arc-2018.03}/0003-check-ldrunpath-length.patch (100%)
>  rename package/binutils/{arc-2018.03-rc2 => arc-2018.03}/0004-add-sysroot-fix-from-bug-3049.patch (100%)
>  rename package/binutils/{arc-2018.03-rc2 => arc-2018.03}/0005-poison-system-directories.patch (100%)
>  rename package/gcc/{arc-2018.03-rc2 => arc-2018.03}/0100-uclibc-conf.patch (100%)
>  rename package/gcc/{arc-2018.03-rc2 => arc-2018.03}/0860-cilk-fix-build-without-wchar.patch (100%)
>  rename package/gcc/{arc-2018.03-rc2 => arc-2018.03}/0900-remove-selftests.patch (100%)

This patch did not apply to master as-is, due to the changes on gdb
that Peter merged yesterday. I fixed up the conflict and applied to
master.

I also did a follow-up commit, to make sure BR2_PACKAGE_GDB_NEEDS_CXX11
is enabled when the ARC version of gdb is used: it's based on GDB 8.0,
so it needs C++11 support.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
