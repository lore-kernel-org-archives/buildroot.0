From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Dec 2018 21:40:06 +0100
Subject: [Buildroot] [PATCH] package/gdb: bump to version 8.2.1
In-Reply-To: <20181223133328.3548-1-romain.naour@gmail.com>
References: <20181223133328.3548-1-romain.naour@gmail.com>
Message-ID: <20181226214006.4920455f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 23 Dec 2018 14:33:28 +0100, Romain Naour wrote:
> GDB 8.2.1 brings the following fixes and enhancements over GDB 8.2:
> 
>  * PR build/23516 (gdb build error under msys+mingw: strip can't handle gdb-add-index.exe)
>  * PR build/23623 (install-strip fails)
>  * PR rust/23626 (gdb crashes in upstream rust nil-enum test)
>  * PR rust/23650 (rust field name access error mentions "foo")
>  * PR gdb/23663 (gdb 8.1.1: undefined rpl_stat function with musl toolchains)
>  * PR python/23669 (gdb.execute("show commands") doesn't work)
>  * PR python/23714 (Command repetition stops working after gdb.execute)
>  * PR gdb/23838 (8.2 regression for invalid -data-directory)
>  * PR gdb/23974 ("info os" crash when specifying invalid object)
>  * PR gdb/23999 (SYMBOL_LANGUAGE assertion failure on AIX)
>  * PR gdb/24003 (Error when binary searching CUs for a specific DIE when using DWZ)
> 
> Remove upstream patch:
> 
> 0006-Move-is_regular_file-from-common-utils.c-to-filestuf.patch
> https://github.com/bminor/binutils-gdb/commit/5de69bdbd0bbd7941b4cd93d4571f5e22cdb28be
> 
> See:
> https://sourceware.org/ml/gdb-announce/2018/msg00004.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  ...Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch |   0
>  ...efine-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch |   0
>  .../{8.2 => 8.2.1}/0003-use-asm-sgidefs.h.patch    |   0
>  .../0004-gdbserver-fix-build-for-m68k.patch        |   0
>  ...-nat-fork-inferior-include-linux-ptrace.h.patch |   0
>  ...ular_file-from-common-utils.c-to-filestuf.patch | 179 ---------------------
>  package/gdb/Config.in.host                         |   2 +-
>  package/gdb/gdb.hash                               |   2 +-
>  8 files changed, 2 insertions(+), 181 deletions(-)
>  rename package/gdb/{8.2 => 8.2.1}/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch (100%)
>  rename package/gdb/{8.2 => 8.2.1}/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch (100%)
>  rename package/gdb/{8.2 => 8.2.1}/0003-use-asm-sgidefs.h.patch (100%)
>  rename package/gdb/{8.2 => 8.2.1}/0004-gdbserver-fix-build-for-m68k.patch (100%)
>  rename package/gdb/{8.2 => 8.2.1}/0005-nat-fork-inferior-include-linux-ptrace.h.patch (100%)
>  delete mode 100644 package/gdb/8.2/0006-Move-is_regular_file-from-common-utils.c-to-filestuf.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
