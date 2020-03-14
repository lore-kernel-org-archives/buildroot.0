From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Mar 2020 15:16:52 +0100
Subject: [Buildroot] [PATCH] package/gcc: disable gcc 9.x for csky
In-Reply-To: <20200312234127.449204-2-romain.naour@smile.fr>
References: <20200312234127.449204-1-romain.naour@smile.fr>
 <20200312234127.449204-2-romain.naour@smile.fr>
Message-ID: <20200314151652.3f3c6afa@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 13 Mar 2020 00:41:27 +0100
Romain Naour <romain.naour@smile.fr> wrote:

> When building a toolchain with upstream gcc 9.x the build
> fail due to several issues.
> 
> Note: The upstream Binutils support csky target since
> release 2.32 but the support was never enabled in the
> Buildroot packaging. So the latest version (2.33.1) was
> tested here.
> 
> [upstream gcc 9.x w/ glibc csky fork with binutils csky for or binutils 2.33.1]
> In file included from <command-line>:
> ./../include/libc-symbols.h:534:26: error: '__EI___errno_location' specifies less restrictive attributes than its target '__errno_location': 'const', 'nothrow' [-Werror=missing-attributes]
>   534 |   extern __typeof (name) __EI_##name \
> 
> [upstream gcc 9.x w/ glibc 2.30 w/ binutils csky fork]
> /tmp/ccThLRhb.s: Assembler messages:
> /tmp/ccThLRhb.s:10: Error: invalid or unsupported encoding in .cfi_personality
> /tmp/ccThLRhb.s:11: Error: invalid or unsupported encoding in .cfi_lsda
> 
> [upstream gcc 9.x w/ glibc 2.30 w/ binutils 2.33.1]
> build/elf/librtld.os: in function `__sync_fetch_and_add_2':
> libgcc/config/csky/linux-atomic.c:116: undefined reference to `__kernel_cmpxchg'
> 
> Currenlty, only the toolchain using binutils, gcc, glibc
> fork produce a working toolchain. So disable gcc 9.x for
> csky.
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Guo Ren <guoren@kernel.org>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/gcc/Config.in.host | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
