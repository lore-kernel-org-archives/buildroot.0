From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Thu, 08 Mar 2012 15:53:13 +0100
Subject: [Buildroot] Linaro 2012.02 toolchain: pixman build failure
Message-ID: <4F58C7D9.2080205@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I was testing the latest Linaro toolchain and it failed building pixman:

 CC     utils.lo
  CC     a1-trap-test.o
  CC     region-test.o
  CC     pdf-op-test.o
  CC     region-translate-test.o
  CC     fetch-test.o
  CC     trap-crasher.o
  CC     alpha-loop.o
  CC     oob-test.o
  CC     scaling-helpers-test.o
  CC     scaling-crash-test.o
  CC     gradient-crash-test.o
  CC     region-contains-test.o
  CC     alphamap.o
  CC     stress-test.o
  CC     composite-traps-test.o
  CC     blitters-test.o
  CC     scaling-test.o
  CC     affine-test.o
  CC     composite.o
  CC     lowlevel-blt-bench.o
lowlevel-blt-bench.c: In function ?bench_L?:
lowlevel-blt-bench.c:155:18: warning: variable ?qx? set but not used [-Wunused-but-set-variable]
  CCLD   libutils.la
  CCLD   a1-trap-test
  CCLD   pdf-op-test
  CCLD   fetch-test
  CCLD   region-test
  CCLD   region-translate-test
  CCLD   oob-test
  CCLD   trap-crasher
  CCLD   scaling-crash-test
  CCLD   alpha-loop
  CCLD   scaling-helpers-test
  CCLD   gradient-crash-test
  CCLD   region-contains-test
  CCLD   alphamap
  CCLD   stress-test
  CCLD   composite-traps-test
  CCLD   blitters-test
  CCLD   scaling-test
  CCLD   affine-test
  CCLD   lowlevel-blt-bench
  CCLD   composite
../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_wslldi'
../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_wor'
../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_wunpckilb'
../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_wsrldi'
../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_waddbus'
../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_waddhus'
../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_wsrlhi'
../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_wxor'
../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_wpackhus'
../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_wand'
../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_wunpckihb'
../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_wzero'
../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_walign'
../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_wmulul'
../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_wslldi'
../pixman/.libs/libpixman-collect2: 1.so: ld returned 1 exit status

Any idea?

Yegor
