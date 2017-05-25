From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 May 2017 15:27:39 +0200
Subject: [Buildroot] [PATCH] toolchain: Bump ARC tools to arc-2017.03
 release
In-Reply-To: <20170523184137.48708-1-abrodkin@synopsys.com>
References: <20170523184137.48708-1-abrodkin@synopsys.com>
Message-ID: <20170525152739.364680be@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 May 2017 21:41:37 +0300, Alexey Brodkin wrote:
> This commit finally bumps ARC toolchain to arc-2017.03 release.
> More info on this release could be found here:
> https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2017.03
> 
> Note mentioned above web-page is not yet populated but should be very soon.
> As a safe fall-back interested could refer to RC2 page here:
> https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2017.03-rc2
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/binutils/Config.in.host                    |  2 +-
>  .../0300-PATCH-ld-makefile.patch                   |  0
>  .../0301-PATCH-check-ldrunpath-length.patch        |  0
>  .../0500-add-sysroot-fix-from-bug-3049.patch       |  0
>  .../0600-poison-system-directories.patch           |  0
>  package/binutils/binutils.hash                     |  2 +-
>  package/binutils/binutils.mk                       |  2 +-
>  package/gcc/Config.in.host                         |  2 +-
>  ...-return-false-for-any-PIC-related-unspecs.patch | 58 ----------------------
>  .../301-missing-execinfo_h.patch                   |  0
>  .../860-cilk-wchar.patch                           |  0
>  .../940-uclinux-enable-threads.patch               |  0
>  package/gcc/gcc.hash                               |  2 +-
>  package/gdb/Config.in.host                         |  2 +-
>  package/gdb/gdb.hash                               |  2 +-
>  15 files changed, 7 insertions(+), 65 deletions(-)
>  rename package/binutils/{arc-2017.03-rc2 => arc-2017.03}/0300-PATCH-ld-makefile.patch (100%)
>  rename package/binutils/{arc-2017.03-rc2 => arc-2017.03}/0301-PATCH-check-ldrunpath-length.patch (100%)
>  rename package/binutils/{arc-2017.03-rc2 => arc-2017.03}/0500-add-sysroot-fix-from-bug-3049.patch (100%)
>  rename package/binutils/{arc-2017.03-rc2 => arc-2017.03}/0600-poison-system-directories.patch (100%)
>  delete mode 100644 package/gcc/arc-2017.03-rc2/0001-FIX-PIC-return-false-for-any-PIC-related-unspecs.patch
>  rename package/gcc/{arc-2017.03-rc2 => arc-2017.03}/301-missing-execinfo_h.patch (100%)
>  rename package/gcc/{arc-2017.03-rc2 => arc-2017.03}/860-cilk-wchar.patch (100%)
>  rename package/gcc/{arc-2017.03-rc2 => arc-2017.03}/940-uclinux-enable-threads.patch (100%)

It's normally way too late for version bumps, but since this is a bump
from a -rc2 version to the final version, and limited to ARC stuff,
I've applied it to master. I really hope it won't cause new build
failures!

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
