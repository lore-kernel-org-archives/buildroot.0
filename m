From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Apr 2018 23:30:49 +0200
Subject: [Buildroot] [PATCH] toolchain: Bump ARC tools to arc-2018.03-rc1
In-Reply-To: <20180410160604.34435-1-Evgeniy.Didin@synopsys.com>
References: <20180410160604.34435-1-Evgeniy.Didin@synopsys.com>
Message-ID: <20180412233049.69e96e71@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 10 Apr 2018 19:06:04 +0300, Evgeniy Didin wrote:
> This commit bumps ARC toolchain to arc-2018.03-rc1.
> We want to test how new toolchain-rc1 builds packages,
> so we can make fixes before release of toolcain.
> 
> ARC GNU tools of version arc-2018.03-rc1 bring some quite significant changes like:
>  * Binutils v2.29.51 with additional ARC patches
>  * GCC 7.3.1 with additional ARC patches
> 
> Please note that it is a release candidate
> and it might contain some breakages,
> please don't use it for production builds.
> 
> Signed-off-by: Evgeniy Didin <didin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: arc-buildroot at synopsys.com
> ---
>  package/binutils/Config.in.host                    |  2 +-
>  .../0002-ld-makefile.patch                         |  0
>  .../0003-check-ldrunpath-length.patch              |  0
>  .../0004-add-sysroot-fix-from-bug-3049.patch       |  0
>  .../0005-poison-system-directories.patch           |  0
>  package/binutils/binutils.hash                     |  2 +-
>  package/binutils/binutils.mk                       |  4 +-
>  package/gcc/Config.in.host                         |  2 +-
>  .../0001-fix-checking-for-jumps.patch              | 49 ----------------------
>  .../0100-uclibc-conf.patch                         |  0
>  .../0860-cilk-fix-build-without-wchar.patch        |  0
>  .../0900-remove-selftests.patch                    |  0
>  package/gcc/gcc.hash                               |  2 +-
>  package/gdb/Config.in.host                         |  2 +-
>  package/gdb/gdb.hash                               |  2 +-
>  package/glibc/glibc.hash                           |  2 +-
>  package/glibc/glibc.mk                             |  2 +-
>  17 files changed, 10 insertions(+), 59 deletions(-)
>  rename package/binutils/{arc-2017.09-release => arc-2018.03-rc1}/0002-ld-makefile.patch (100%)
>  rename package/binutils/{arc-2017.09-release => arc-2018.03-rc1}/0003-check-ldrunpath-length.patch (100%)
>  rename package/binutils/{arc-2017.09-release => arc-2018.03-rc1}/0004-add-sysroot-fix-from-bug-3049.patch (100%)
>  rename package/binutils/{arc-2017.09-release => arc-2018.03-rc1}/0005-poison-system-directories.patch (100%)
>  delete mode 100644 package/gcc/arc-2017.09-release/0001-fix-checking-for-jumps.patch
>  rename package/gcc/{arc-2017.09-release => arc-2018.03-rc1}/0100-uclibc-conf.patch (100%)
>  rename package/gcc/{arc-2017.09-release => arc-2018.03-rc1}/0860-cilk-fix-build-without-wchar.patch (100%)
>  rename package/gcc/{arc-2017.09-release => arc-2018.03-rc1}/0900-remove-selftests.patch (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
