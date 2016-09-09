From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 9 Sep 2016 20:14:46 -0300
Subject: [Buildroot] Hint on switching between targets
Message-ID: <CAOMZO5BRPzX=cOpPJyH2ZmyxNhB6wu_EBFBm_DpcRz+Hd7MtKw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

My last Buildroot build was for warp7 target . Now I want to build for
wandboard, so I do

make wandboard_defconfig
make

,but I get errors like

/home/fabio/buildroot/output/host/usr/lib
-Wl,-rpath,/home/fabio/buildroot/output/host/usr/lib"
make[2]: /home/fabio/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc:
Command not found
/bin/sh: 1: /home/fabio/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc:
not found
dirname: missing operand
Try 'dirname --help' for more information.
scripts/kconfig/conf --silentoldconfig Kconfig
  CHK     include/config.h
  UPD     include/config.h
  GEN     include/autoconf.mk
/bin/sh: 1:   GEN     include/autoconf.mk.dep
/home/fabio/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc:
not found
/bin/sh: 1: /home/fabio/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc:
not found
  GEN     spl/include/autoconf.mk
/bin/sh: 1: /home/fabio/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc:
not found
scripts/Makefile.autoconf:72: recipe for target 'include/autoconf.mk' failed
make[3]: *** [include/autoconf.mk] Error 1
make[3]: *** Waiting for unfinished jobs....
scripts/Makefile.autoconf:47: recipe for target 'include/autoconf.mk.dep' failed
make[3]: *** [include/autoconf.mk.dep] Error 1
scripts/Makefile.autoconf:75: recipe for target 'spl/include/autoconf.mk' failed
make[3]: *** [spl/include/autoconf.mk] Error 1
make[2]: *** No rule to make target 'include/config/auto.conf', needed
by 'include/config/uboot.release'.  Stop.
package/pkg-generic.mk:201: recipe for target
'/home/fabio/buildroot/output/build/uboot-2015.07/.stamp_built' failed
make[1]: *** [/home/fabio/buildroot/output/build/uboot-2015.07/.stamp_built]
Error 2
Makefile:41: recipe for target '_all' failed
make: *** [_all] Error 2

I know I can do "make clean" and start from scratch, but I would like
to know if there is a minimal folder or something I can erase so that
the new build succeeds.

Any recommendations?

Thanks,

Fabio Estevam
