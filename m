From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Jul 2016 14:06:22 +0200
Subject: [Buildroot] [PATCH v4] board: add blackfin gdb simulator support
In-Reply-To: <20160706222853.GA12734@waldemar-brodkorb.de>
References: <20160706222853.GA12734@waldemar-brodkorb.de>
Message-ID: <20160707140622.7aa9b619@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 7 Jul 2016 00:28:53 +0200, Waldemar Brodkorb wrote:
> With this config you can bootup a Linux kernel
> in GDB simulator and test Blackfin kernel and
> userland.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Thanks, but it still doesn't build here:

 $ make gdb_bfin_bf512_defconfig
 $ make

Fails with:

In file included from ./sim-main.h:35,
                 from ./../common/sim-command.c:21:
../common/sim-base.h:76: error: redefinition of typedef 'SIM_CPU'
./sim-main.h:29: note: previous declaration of 'SIM_CPU' was here
In file included from ./sim-main.h:35,
                 from ./../common/sim-config.c:23:
../common/sim-base.h:76: error: redefinition of typedef 'SIM_CPU'
./sim-main.h:29: note: previous declaration of 'SIM_CPU' was here
make[4]: *** [sim-command.o] Error 1
make[4]: *** Waiting for unfinished jobs....
In file included from ./sim-main.h:35,
                 from ./../common/sim-core.c:26:
../common/sim-base.h:76: error: redefinition of typedef 'SIM_CPU'
./sim-main.h:29: note: previous declaration of 'SIM_CPU' was here
make[4]: *** [sim-config.o] Error 1
In file included from ./sim-main.h:35,
                 from ./../common/sim-cpu.c:20:
../common/sim-base.h:76: error: redefinition of typedef 'SIM_CPU'
./sim-main.h:29: note: previous declaration of 'SIM_CPU' was here
make[4]: *** [sim-cpu.o] Error 1
make[4]: *** [sim-core.o] Error 1
In file included from ./sim-main.h:35,
                 from ./../common/sim-engine.c:22:
../common/sim-base.h:76: error: redefinition of typedef 'SIM_CPU'
./sim-main.h:29: note: previous declaration of 'SIM_CPU' was here
make[4]: *** [sim-engine.o] Error 1
make[4]: Leaving directory `/home/test/buildroot/output/build/host-gdb-7.10.1/sim/bfin'
make[3]: *** [all] Error 1
make[3]: Leaving directory `/home/test/buildroot/output/build/host-gdb-7.10.1/sim'
make[2]: *** [all-sim] Error 2
make[2]: Leaving directory `/home/test/buildroot/output/build/host-gdb-7.10.1'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/home/test/buildroot/output/build/host-gdb-7.10.1'
make: *** [/home/test/buildroot/output/build/host-gdb-7.10.1/.stamp_built] Error 2

Full build log at http://code.bulix.org/sh07yj-103579.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
