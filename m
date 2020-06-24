From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Jun 2020 23:05:04 +0200
Subject: [Buildroot] [PATCH] board/qemu/sh4-r2d: fix sh4 kernel bug with
 Binutils 2.33
In-Reply-To: <20191230133640.9702-1-romain.naour@gmail.com>
References: <20191230133640.9702-1-romain.naour@gmail.com>
Message-ID: <20200624230504.22ab4d2d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 30 Dec 2019 14:36:40 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> Remove the Binutils patch reverting [1] that trigger a sh4 kernel bug
> with Binutils >= 2.33.
> Add two kernel patch provided by Alan Modra [2] that fix alignment of rodata.
> 
> [1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=ebd2263ba9a9124d93bbc0ece63d7e0fae89b40e
> [2] https://www.sourceware.org/ml/binutils/2019-12/msg00112.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  .../linux/0002-arch-sh-vmlinux.scr.patch      |  32 ++++
>  ...03-include-asm-generic-vmlinux.lds.h.patch |  32 ++++
>  .../linux/0002-arch-sh-vmlinux.scr.patch      |  32 ++++
>  ...03-include-asm-generic-vmlinux.lds.h.patch |  27 ++++
>  ...311-FAIL-S-records-with-constructors.patch | 148 ------------------
>  5 files changed, 123 insertions(+), 148 deletions(-)
>  create mode 100644 board/qemu/sh4-r2d/patches/linux/0002-arch-sh-vmlinux.scr.patch
>  create mode 100644 board/qemu/sh4-r2d/patches/linux/0003-include-asm-generic-vmlinux.lds.h.patch
>  create mode 100644 board/qemu/sh4eb-r2d/patches/linux/0002-arch-sh-vmlinux.scr.patch
>  create mode 100644 board/qemu/sh4eb-r2d/patches/linux/0003-include-asm-generic-vmlinux.lds.h.patch
>  delete mode 100644 package/binutils/2.33.1/0003-Revert-PR24311-FAIL-S-records-with-constructors.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
