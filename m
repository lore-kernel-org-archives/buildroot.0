From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 18:04:31 +0200
Subject: [Buildroot] [PATCH v2 1/3] toolchain/toolchain-buildroot:
 enable uclibc for riscv64
In-Reply-To: <20200510154347.5711-1-mark@dibsco.co.uk>
References: <20200510154347.5711-1-mark@dibsco.co.uk>
Message-ID: <20200727180431.32097732@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 10 May 2020 16:43:45 +0100
Mark Corbin <mark@dibsco.co.uk> wrote:

> We can enable uclibc for RISC-V 64 bit now that it has been
> bumped from v1.0.32 to v1.0.34.
> 
> Uclibc has had basic support for RISC-V 64 bit since v1.0.31, but
> shared library and TLS/NPTL support has only been available since
> v1.0.33.
> 
> This update has been tested using qemu_riscv64_virt_defconfig and
> the Buildroot host QEMU.
> 
> Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
> ---
> Changes v1 -> v2:
>   - use BR2_RISCV_64 instead of (BR2_riscv && BR2_ARCH_IS_64)
>     (Thomas P)
> ---
>  package/uclibc/Config.in                |  1 +
>  toolchain/toolchain-buildroot/Config.in | 13 +++++++------
>  2 files changed, 8 insertions(+), 6 deletions(-)

Applied to master, thanks.

Romain: in the end, I didn't change the existing defconfigs. We usually
don't change/check them when we update gcc, glibc or binutils for
example. The compiler/C library is pretty much independent from the
specific board, so I didn't think it was worth changing the HiFive
Unleashed board to use glibc.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
