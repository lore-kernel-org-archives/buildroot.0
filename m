From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 May 2016 15:49:33 +0200
Subject: [Buildroot] [PATCH v2 3/4] gdb: enable simulator support for
 host build
In-Reply-To: <20160513121651.GA30939@waldemar-brodkorb.de>
References: <20160513121651.GA30939@waldemar-brodkorb.de>
Message-ID: <20160528154933.575c86c3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 13 May 2016 14:16:51 +0200, Waldemar Brodkorb wrote:
> Add an option to enable simulator support, so
> it can be used to test some no-MMU systems.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

It doesn't seem to build on Blackfin for me. I'm not using the internal
toolchain support that you've added in PATCH 2/4, I'm using the
defconfig from your PATCH 4/4 with the Blackfin external toolchain. But
host-gdb is a host package, so the cross-compilation toolchain used
doesn't matter. And what I get is:

./../common/sim-model.c: In function ?model_set?:
./../common/sim-model.c:108:3: warning: implicit declaration of function ?CPU_MACH? [-Wimplicit-function-declaration]
   CPU_MACH (cpu) = MODEL_MACH (model);
   ^
./../common/sim-model.c:108:18: error: lvalue required as left operand of assignment
   CPU_MACH (cpu) = MODEL_MACH (model);
                  ^
./../common/sim-model.c:109:3: warning: implicit declaration of function ?CPU_MODEL? [-Wimplicit-function-declaration]
   CPU_MODEL (cpu) = model;
   ^
./../common/sim-model.c:109:19: error: lvalue required as left operand of assignment
   CPU_MODEL (cpu) = model;
                   ^
In file included from /usr/include/string.h:630:0,
                 from ../common/sim-arange.c:32,
                 from ../common/sim-arange.h:82,
                 from ../common/sim-basics.h:141,
                 from ./sim-main.h:24,
                 from ./../common/sim-model.c:20:
./../common/sim-model.c: In function ?sim_model_init?:
./../common/sim-model.h:80:30: error: invalid type argument of ?->? (have ?int?)
 #define MACH_BFD_NAME(m) ((m)->bfd_name)
                              ^
./../common/sim-model.c:215:5: note: in expansion of macro ?MACH_BFD_NAME?
     MACH_BFD_NAME (CPU_MACH (cpu))) != 0)
     ^
./../common/sim-model.h:80:30: error: invalid type argument of ?->? (have ?int?)
 #define MACH_BFD_NAME(m) ((m)->bfd_name)
                              ^
./../common/sim-model.c:215:5: note: in expansion of macro ?MACH_BFD_NAME?
     MACH_BFD_NAME (CPU_MACH (cpu))) != 0)
     ^
./../common/sim-model.h:80:30: error: invalid type argument of ?->? (have ?int?)
 #define MACH_BFD_NAME(m) ((m)->bfd_name)
                              ^
./../common/sim-model.c:215:5: note: in expansion of macro ?MACH_BFD_NAME?
     MACH_BFD_NAME (CPU_MACH (cpu))) != 0)
     ^
./../common/sim-model.h:80:30: error: invalid type argument of ?->? (have ?int?)
 #define MACH_BFD_NAME(m) ((m)->bfd_name)
                              ^
./../common/sim-model.c:215:5: note: in expansion of macro ?MACH_BFD_NAME?
     MACH_BFD_NAME (CPU_MACH (cpu))) != 0)
     ^
./../common/sim-model.h:80:30: error: invalid type argument of ?->? (have ?int?)
 #define MACH_BFD_NAME(m) ((m)->bfd_name)
                              ^
./../common/sim-model.c:215:5: note: in expansion of macro ?MACH_BFD_NAME?
     MACH_BFD_NAME (CPU_MACH (cpu))) != 0)
     ^
./../common/sim-model.h:80:30: error: invalid type argument of ?->? (have ?int?)
 #define MACH_BFD_NAME(m) ((m)->bfd_name)
                              ^
./../common/sim-model.c:215:5: note: in expansion of macro ?MACH_BFD_NAME?
     MACH_BFD_NAME (CPU_MACH (cpu))) != 0)
     ^
./../common/sim-model.h:80:30: error: invalid type argument of ?->? (have ?int?)
 #define MACH_BFD_NAME(m) ((m)->bfd_name)
                              ^
./../common/sim-model.c:215:5: note: in expansion of macro ?MACH_BFD_NAME?
     MACH_BFD_NAME (CPU_MACH (cpu))) != 0)
     ^
./../common/sim-model.h:80:30: error: invalid type argument of ?->? (have ?int?)
 #define MACH_BFD_NAME(m) ((m)->bfd_name)
                              ^
./../common/sim-model.c:215:5: note: in expansion of macro ?MACH_BFD_NAME?
     MACH_BFD_NAME (CPU_MACH (cpu))) != 0)
     ^
./../common/sim-model.h:80:30: error: invalid type argument of ?->? (have ?int?)
 #define MACH_BFD_NAME(m) ((m)->bfd_name)
                              ^
./../common/sim-model.c:215:5: note: in expansion of macro ?MACH_BFD_NAME?
     MACH_BFD_NAME (CPU_MACH (cpu))) != 0)
     ^
./../common/sim-model.h:80:30: error: invalid type argument of ?->? (have ?int?)
 #define MACH_BFD_NAME(m) ((m)->bfd_name)
                              ^
./../common/sim-model.c:215:5: note: in expansion of macro ?MACH_BFD_NAME?
     MACH_BFD_NAME (CPU_MACH (cpu))) != 0)
     ^
./../common/sim-model.h:80:30: error: invalid type argument of ?->? (have ?int?)
 #define MACH_BFD_NAME(m) ((m)->bfd_name)
                              ^
./../common/sim-model.c:215:5: note: in expansion of macro ?MACH_BFD_NAME?
     MACH_BFD_NAME (CPU_MACH (cpu))) != 0)
     ^
./../common/sim-model.h:80:30: error: invalid type argument of ?->? (have ?int?)
 #define MACH_BFD_NAME(m) ((m)->bfd_name)
                              ^
./../common/sim-model.c:215:5: note: in expansion of macro ?MACH_BFD_NAME?
     MACH_BFD_NAME (CPU_MACH (cpu))) != 0)
     ^
./../common/sim-model.h:80:30: error: invalid type argument of ?->? (have ?int?)
 #define MACH_BFD_NAME(m) ((m)->bfd_name)
                              ^
./../common/sim-model.c:215:5: note: in expansion of macro ?MACH_BFD_NAME?
     MACH_BFD_NAME (CPU_MACH (cpu))) != 0)
     ^
./../common/sim-model.h:80:30: error: invalid type argument of ?->? (have ?int?)
 #define MACH_BFD_NAME(m) ((m)->bfd_name)
                              ^
./../common/sim-model.c:215:5: note: in expansion of macro ?MACH_BFD_NAME?
     MACH_BFD_NAME (CPU_MACH (cpu))) != 0)
     ^
./../common/sim-model.h:80:30: error: invalid type argument of ?->? (have ?int?)
 #define MACH_BFD_NAME(m) ((m)->bfd_name)
                              ^
./../common/sim-model.c:215:5: note: in expansion of macro ?MACH_BFD_NAME?
     MACH_BFD_NAME (CPU_MACH (cpu))) != 0)
     ^
./../common/sim-model.h:80:30: error: invalid type argument of ?->? (have ?int?)
 #define MACH_BFD_NAME(m) ((m)->bfd_name)
                              ^
./../common/sim-model.c:215:5: note: in expansion of macro ?MACH_BFD_NAME?
     MACH_BFD_NAME (CPU_MACH (cpu))) != 0)
     ^
./../common/sim-model.h:80:30: error: invalid type argument of ?->? (have ?int?)
 #define MACH_BFD_NAME(m) ((m)->bfd_name)
                              ^
./../common/sim-model.c:215:5: note: in expansion of macro ?MACH_BFD_NAME?
     MACH_BFD_NAME (CPU_MACH (cpu))) != 0)
     ^
./../common/sim-model.h:80:30: error: invalid type argument of ?->? (have ?int?)
 #define MACH_BFD_NAME(m) ((m)->bfd_name)
                              ^
./../common/sim-model.c:215:5: note: in expansion of macro ?MACH_BFD_NAME?
     MACH_BFD_NAME (CPU_MACH (cpu))) != 0)
     ^
./../common/sim-model.h:80:30: error: invalid type argument of ?->? (have ?int?)
 #define MACH_BFD_NAME(m) ((m)->bfd_name)
                              ^
./../common/sim-model.c:215:5: note: in expansion of macro ?MACH_BFD_NAME?
     MACH_BFD_NAME (CPU_MACH (cpu))) != 0)
     ^
./../common/sim-model.h:80:30: error: invalid type argument of ?->? (have ?int?)
 #define MACH_BFD_NAME(m) ((m)->bfd_name)
                              ^
./../common/sim-model.c:215:5: note: in expansion of macro ?MACH_BFD_NAME?
     MACH_BFD_NAME (CPU_MACH (cpu))) != 0)
     ^
In file included from ./../common/sim-model.c:21:0:
./../common/sim-model.h:112:27: error: invalid type argument of ?->? (have ?int?)
 #define MODEL_NAME(m) ((m)->name)
                           ^
./../common/sim-model.c:218:6: note: in expansion of macro ?MODEL_NAME?
      MODEL_NAME (CPU_MODEL (cpu)),
      ^
./../common/sim-model.h:80:30: error: invalid type argument of ?->? (have ?int?)
 #define MACH_BFD_NAME(m) ((m)->bfd_name)
                              ^
./../common/sim-model.c:239:48: note: in expansion of macro ?MACH_BFD_NAME?
       STATE_ARCHITECTURE (sd) = bfd_scan_arch (MACH_BFD_NAME (CPU_MACH (cpu)));
                                                ^
Makefile:542: recipe for target 'sim-model.o' failed
make[5]: *** [sim-model.o] Error 1
make[5]: *** Waiting for unfinished jobs....
Makefile:129: recipe for target 'all' failed
make[4]: *** [all] Error 1
Makefile:8201: recipe for target 'all-sim' failed
make[3]: *** [all-sim] Error 2
Makefile:845: recipe for target 'all' failed
make[2]: *** [all] Error 2
package/pkg-generic.mk:195: recipe for target '/home/thomas/projets/buildroot/output/build/host-gdb-7.10.1/.stamp_built' failed
make[1]: *** [/home/thomas/projets/buildroot/output/build/host-gdb-7.10.1/.stamp_built] Error 2
Makefile:36: recipe for target '_all' failed
make: *** [_all] Error 2

Could you have a look?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
