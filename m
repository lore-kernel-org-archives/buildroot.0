From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Jul 2018 21:42:12 +0200
Subject: [Buildroot] [PATCH 1/2] package/gdb: remove gdb 7.10.1 patches
In-Reply-To: <20180704184542.6716-1-romain.naour@gmail.com>
References: <20180704184542.6716-1-romain.naour@gmail.com>
Message-ID: <20180704214212.7e36a75f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  4 Jul 2018 20:45:41 +0200, Romain Naour wrote:
> gdb 7.10.x support was removed since commit 54a2e7a3b72778c9ec26cb184a1dd7a356e514c9
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  .../0001-Add-some-casts-for-building-on-musl.patch |  90 -------
>  ...musl-Move-W_STOPCODE-to-common-gdb_wait-h.patch |  63 -----
>  package/gdb/7.10.1/0003-move-__SIGRTMIN.patch      |  58 -----
>  .../0004-xtensa-implement-NPTL-helpers.patch       | 267 -------------------
>  .../7.10.1/0005-target.h-include-sys-types.h.patch |  30 ---
>  ...6-Sync-proc_service-definition-with-GLIBC.patch | 287 ---------------------
>  ...Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch |  53 ----
>  ...efine-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch |  41 ---
>  .../0009-Fix-gdbserver-build-on-uClibc-noMMU.patch |  32 ---
>  package/gdb/7.10.1/0010-use-asm-sgidefs.h.patch    |  41 ---
>  10 files changed, 962 deletions(-)
>  delete mode 100644 package/gdb/7.10.1/0001-Add-some-casts-for-building-on-musl.patch
>  delete mode 100644 package/gdb/7.10.1/0002-musl-Move-W_STOPCODE-to-common-gdb_wait-h.patch
>  delete mode 100644 package/gdb/7.10.1/0003-move-__SIGRTMIN.patch
>  delete mode 100644 package/gdb/7.10.1/0004-xtensa-implement-NPTL-helpers.patch
>  delete mode 100644 package/gdb/7.10.1/0005-target.h-include-sys-types.h.patch
>  delete mode 100644 package/gdb/7.10.1/0006-Sync-proc_service-definition-with-GLIBC.patch
>  delete mode 100644 package/gdb/7.10.1/0007-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
>  delete mode 100644 package/gdb/7.10.1/0008-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
>  delete mode 100644 package/gdb/7.10.1/0009-Fix-gdbserver-build-on-uClibc-noMMU.patch
>  delete mode 100644 package/gdb/7.10.1/0010-use-asm-sgidefs.h.patch

Indeed, that was missing when removing those gdb versions, thanks for
noticing. Both patches applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
