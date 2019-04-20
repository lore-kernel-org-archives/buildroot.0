From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Apr 2019 15:50:05 +0200
Subject: [Buildroot] [PATCH v2] linux-tools/perf: Add dependency on
 32-bit atomics
In-Reply-To: <20190418173845.14495-1-abrodkin@synopsys.com>
References: <20190418173845.14495-1-abrodkin@synopsys.com>
Message-ID: <20190420155005.3763b1ab@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 18 Apr 2019 20:38:45 +0300
Alexey Brodkin <Alexey.Brodkin@synopsys.com> wrote:

> Atomic ops are strictly required by perf utility as it uses
> atomic_xxx() functions.
> 
> Otherwise building fails like that:
> |.../output/host/opt/ext-toolchain/bin/../lib/gcc/arc-snps-linux-uclibc/8.2.1/../../../../arc-snps-linux-uclibc/bin/ld:
> |.../output/build/linux-5.0.7/tools/perf/libperf.a(libperf-in.o): in function `atomic_cmpxchg':
> |.../output/build/linux-5.0.7/tools/include/asm-generic/atomic-gcc.h:69: undefined reference to `__sync_val_compare_and_swap_4'
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

I have applied to master, after doing one change, see below.

> +comment "perf needs 32-bit atomic ops"
> +	depends on !BR2_TOOLCHAIN_HAS_SYNC_4
> +

We typically don't add such comments, because it's an architecture
dependency. There is nothing the user can do about it, so there's no
point in having a comment.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
