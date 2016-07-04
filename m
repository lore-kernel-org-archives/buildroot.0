From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 11:06:56 +0200
Subject: [Buildroot] [PATCH v3 3/3] board: add blackfin gdb simulator
 support
In-Reply-To: <20160603040750.GA31665@waldemar-brodkorb.de>
References: <20160603040750.GA31665@waldemar-brodkorb.de>
Message-ID: <20160704110656.7112a59a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 3 Jun 2016 06:07:50 +0200, Waldemar Brodkorb wrote:
> With this config you can bootup a Linux kernel
> in GDB simulator and test Blackfin kernel and
> userland.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

The simulator support doesn't build here. Weird because I'm pretty sure
it used to build when you submitted it, but now it fails with:

In file included from ./sim-main.h:35,
                 from ./../common/sim-command.c:21:
../common/sim-base.h:76: error: redefinition of typedef 'SIM_CPU'
./sim-main.h:29: note: previous declaration of 'SIM_CPU' was here
make[5]: *** [sim-command.o] Error 1
make[5]: *** Waiting for unfinished jobs....
In file included from ./sim-main.h:35,
                 from ./../common/sim-close.c:21:
../common/sim-base.h:76: error: redefinition of typedef 'SIM_CPU'
./sim-main.h:29: note: previous declaration of 'SIM_CPU' was here
In file included from ./sim-main.h:35,
                 from ./../common/sim-config.c:23:
../common/sim-base.h:76: error: redefinition of typedef 'SIM_CPU'
./sim-main.h:29: note: previous declaration of 'SIM_CPU' was here
make[5]: *** [sim-close.o] Error 1
make[5]: *** [sim-config.o] Error 1
In file included from ./sim-main.h:35,
                 from ./../common/sim-core.c:26:
../common/sim-base.h:76: error: redefinition of typedef 'SIM_CPU'
./sim-main.h:29: note: previous declaration of 'SIM_CPU' was here
make[5]: *** [sim-core.o] Error 1
make[4]: *** [all] Error 1
make[3]: *** [all-sim] Error 2
make[2]: *** [all] Error 2
make[1]: *** [/home/test/outputs/bfin/build/host-gdb-7.11.1/.stamp_built] Error 2
make: *** [_all] Error 2

I remember about the hack that we do in a pre-configure hook, and this
hack is still done. But it fails to build. I've tried both gdb 7.10
(default) and 7.11 (above) and they both fail in the same way.

Could you have a look?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
