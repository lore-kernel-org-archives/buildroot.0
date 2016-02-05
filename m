From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Feb 2016 21:55:35 +0100
Subject: [Buildroot] [PATCH v4] toolchain: bump ARC toolchain components
 to arc-2015.12
In-Reply-To: <1454676400-12797-1-git-send-email-ltrimas@synopsys.com>
References: <1454676400-12797-1-git-send-email-ltrimas@synopsys.com>
Message-ID: <20160205215535.791970eb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Lada Trimasova,

On Fri,  5 Feb 2016 15:46:40 +0300, Lada Trimasova wrote:
> This change introduces newer ARC toolchain in Buildroot.
> 
> That new arc-2015.12 release doesn't bring any significant changes
> but mostly is focused on fixes and minor improvements here and there.
> Most noticeable changes are:
>  * GCC: Source update to v4.8.5
>  * GDB: Updated to upstream 7.10 release.
> 
> You may find more info on fixes and improvements in that release at:
> https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2015.12
> 
> Signed-off-by: Lada Trimasova <ltrimas@synopsys.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> 
> ---
> change v1->v3:
> - binutils and gdb version bump
> change v2->v3:
> - use diff.renames copy
> change v3->v4:
> - arc-2015.12-rc1 patches to gcc (UPDATE: Fix handling complex PIC moves,
> UPDATE1: Fix handling complex PIC moves, Don't allow mcompact-casesi for ARCv2)
> should be applied to arc-2015.12, because of our local decision not to include
> these patches to arc-2015.12 release.
> ---
>  package/binutils/Config.in.host                                         | 2 +-
>  .../binutils/{arc-2015.12-rc1 => arc-2015.12}/0001-PR-other-56780.patch | 0
>  .../600-poison-system-directories.patch                                 | 0
>  package/binutils/binutils.hash                                          | 2 +-
>  package/binutils/binutils.mk                                            | 2 +-
>  package/gcc/Config.in.host                                              | 2 +-
>  .../gcc/{arc-2015.12-rc1 => arc-2015.12}/100-libstdcxx-uclibc-c99.patch | 0
>  package/gcc/{arc-2015.12-rc1 => arc-2015.12}/851-PR-other-56780.patch   | 0
>  .../900-UPDATE-Fix-handling-complex-PIC-moves.patch                     | 0
>  .../901-UPDATE1-Fix-handling-complex-PIC-moves.patch                    | 0
>  .../950-Don-t-allow-mcompact-casesi-for-ARCv2.patch                     | 0
>  package/gcc/gcc.hash                                                    | 2 +-
>  package/gdb/Config.in.host                                              | 2 +-
>  package/gdb/gdb.hash                                                    | 2 +-
>  14 files changed, 7 insertions(+), 7 deletions(-)
>  rename package/binutils/{arc-2015.12-rc1 => arc-2015.12}/0001-PR-other-56780.patch (100%)
>  rename package/binutils/{arc-2015.12-rc1 => arc-2015.12}/600-poison-system-directories.patch (100%)
>  rename package/gcc/{arc-2015.12-rc1 => arc-2015.12}/100-libstdcxx-uclibc-c99.patch (100%)
>  rename package/gcc/{arc-2015.12-rc1 => arc-2015.12}/851-PR-other-56780.patch (100%)
>  rename package/gcc/{arc-2015.12-rc1 => arc-2015.12}/900-UPDATE-Fix-handling-complex-PIC-moves.patch (100%)
>  rename package/gcc/{arc-2015.12-rc1 => arc-2015.12}/901-UPDATE1-Fix-handling-complex-PIC-moves.patch (100%)
>  rename package/gcc/{arc-2015.12-rc1 => arc-2015.12}/950-Don-t-allow-mcompact-casesi-for-ARCv2.patch (100%)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
