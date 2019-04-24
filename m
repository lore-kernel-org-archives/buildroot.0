From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 17:30:34 +0200
Subject: [Buildroot] [PATCH v2] linux-tools/perf: Add dependency on
 32-bit atomics
In-Reply-To: <20190418173845.14495-1-abrodkin@synopsys.com> (Alexey Brodkin's
 message of "Thu, 18 Apr 2019 20:38:45 +0300")
References: <20190418173845.14495-1-abrodkin@synopsys.com>
Message-ID: <87d0lbctet.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

 > Atomic ops are strictly required by perf utility as it uses
 > atomic_xxx() functions.

 > Otherwise building fails like that:
 > |.../output/host/opt/ext-toolchain/bin/../lib/gcc/arc-snps-linux-uclibc/8.2.1/../../../../arc-snps-linux-uclibc/bin/ld:
 > |.../output/build/linux-5.0.7/tools/perf/libperf.a(libperf-in.o): in function `atomic_cmpxchg':
 > |.../output/build/linux-5.0.7/tools/include/asm-generic/atomic-gcc.h:69: undefined reference to `__sync_val_compare_and_swap_4'

 > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---

 > Changes v1 -> v2:
 >  * Depend on generic BR2_TOOLCHAIN_HAS_SYNC_4

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
