From: Axel Lin <axel.lin@ingics.com>
Date: Thu, 05 Sep 2013 16:43:12 +0800
Subject: [Buildroot] uclibc build error for arm7tdmi with BR2_BINFMT_FLAT=y
Message-ID: <1378370592.30514.2.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have below settings:

BR2_BINFMT_FLAT=y
BR2_BINFMT_FLAT_ONE=y
BR2_ARM_CPU_HAS_THUMB=y
BR2_arm7tdmi=y
# BR2_USE_MMU is not set
BR2_PACKAGE_HOST_ELF2FLT=y

And below settings for uclibc:

# ARCH_USE_MMU is not set
ARCH_HAS_NO_SHARED=y
ARCH_HAS_NO_LDSO=y
# UCLIBC_FORMAT_ELF is not set
# UCLIBC_FORMAT_FDPIC_ELF is not set
# UCLIBC_FORMAT_DSBT_ELF is not set
UCLIBC_FORMAT_FLAT=y
# UCLIBC_FORMAT_FLAT_SEP_DATA is not set
# UCLIBC_FORMAT_SHARED_FLAT is not set

I got below build error while compiling uclibc for arm7tdmi:

>>> uclibc 0.9.33.2 Configuring
/usr/bin/make -j1 -C /opt/test/buildroot/buildroot/output/build/uclibc-0.9.33.2 ARCH="arm" CROSS_COMPILE="/opt/test/buildroot/buildroot/output/host/usr/bin/arm-buildroot-uclinux-uclibcgnueabi-" UCLIBC_EXTRA_CFLAGS=" " HOSTCC="/usr/bin/gcc" PREFIX=/opt/test/buildroot/buildroot/output/host/usr/arm-buildroot-uclinux-uclibcgnueabi/sysroot DEVEL_PREFIX=/usr/ RUNTIME_PREFIX=/opt/test/buildroot/buildroot/output/host/usr/arm-buildroot-uclinux-uclibcgnueabi/sysroot headers startfiles install_headers install_startfiles
make[1]: Entering directory `/opt/test/buildroot/buildroot/output/build/uclibc-0.9.33.2'
  MKDIR include/bits
  GEN include/bits/uClibc_config.h
  LN include/pthread.h
  LN include/semaphore.h
  LN include/bits/pthreadtypes.h
  LN include/fpu_control.h
  LN include/dl-osinfo.h
  LN include/hp-timing.h
  LN include/bits/byteswap-common.h
  LN include/bits/byteswap.h
  LN include/bits/cmathcalls.h
  LN include/bits/confname.h
  LN include/bits/dirent.h
  LN include/bits/dlfcn.h
  LN include/bits/elfclass.h
  LN include/bits/environments.h
  LN include/bits/epoll.h
  LN include/bits/errno.h
  LN include/bits/fenvinline.h
  LN include/bits/getopt.h
  LN include/bits/huge_valf.h
  LN include/bits/huge_vall.h
  LN include/bits/in.h
  LN include/bits/inf.h
  LN include/bits/initspin.h
  LN include/bits/inotify.h
  LN include/bits/ioctl-types.h
  LN include/bits/ioctls.h
  LN include/bits/ipc.h
  LN include/bits/kernel-features.h
  LN include/bits/kernel_sigaction.h
  LN include/bits/local_lim.h
  LN include/bits/locale.h
  LN include/bits/mathcalls.h
  LN include/bits/mathinline.h
  LN include/bits/mman-common.h
  LN include/bits/mman.h
  LN include/bits/mqueue.h
  LN include/bits/msq.h
  LN include/bits/nan.h
  LN include/bits/netdb.h
  LN include/bits/poll.h
  LN include/bits/posix1_lim.h
  LN include/bits/posix2_lim.h
  LN include/bits/posix_opt.h
  LN include/bits/resource.h
  LN include/bits/sched.h
  LN include/bits/select.h
  LN include/bits/sem.h
  LN include/bits/sigaction.h
  LN include/bits/sigcontext.h
  LN include/bits/siginfo.h
  LN include/bits/signalfd.h
  LN include/bits/signum.h
  LN include/bits/sigset.h
  LN include/bits/sigstack.h
  LN include/bits/sigthread.h
  LN include/bits/sockaddr.h
  LN include/bits/socket.h
  LN include/bits/stat.h
  LN include/bits/statfs.h
  LN include/bits/statvfs.h
  LN include/bits/stdio.h
  LN include/bits/stdio_lim.h
  LN include/bits/syscalls-common.h
  LN include/bits/termios.h
  LN include/bits/time.h
  LN include/bits/timerfd.h
  LN include/bits/types.h
  LN include/bits/typesizes.h
  LN include/bits/uClibc_alloc.h
  LN include/bits/uClibc_charclass.h
  LN include/bits/uClibc_clk_tck.h
  LN include/bits/uClibc_ctype.h
  LN include/bits/uClibc_fpmax.h
  LN include/bits/uClibc_local_lim.h
  LN include/bits/uClibc_locale.h
  LN include/bits/uClibc_mutex.h
  LN include/bits/uClibc_page.h
  LN include/bits/uClibc_pthread.h
  LN include/bits/uClibc_stdio.h
  LN include/bits/uClibc_touplow.h
  LN include/bits/uClibc_uintmaxtostr.h
  LN include/bits/uClibc_uwchar.h
  LN include/bits/uClibc_va_copy.h
  LN include/bits/uio.h
  LN include/bits/ustat.h
  LN include/bits/utmp.h
  LN include/bits/utmpx.h
  LN include/bits/utsname.h
  LN include/bits/waitflags.h
  LN include/bits/waitstatus.h
  LN include/bits/wchar.h
  LN include/bits/xopen_lim.h
  LN include/bits/arm_asm.h
  LN include/bits/arm_bx.h
  LN include/bits/armsigctx.h
  LN include/bits/atomic.h
  LN include/bits/endian.h
  LN include/bits/fcntl.h
  LN include/bits/fenv.h
  LN include/bits/huge_val.h
  LN include/bits/kernel_stat.h
  LN include/bits/kernel_types.h
  LN include/bits/mathdef.h
  LN include/bits/setjmp.h
  LN include/bits/shm.h
  LN include/bits/sigcontextinfo.h
  LN include/bits/stackinfo.h
  LN include/bits/syscalls.h
  LN include/bits/uClibc_arch_features.h
  LN include/bits/wordsize.h
  LN include/sys/acct.h
  LN include/sys/epoll.h
  LN include/sys/eventfd.h
  LN include/sys/inotify.h
  LN include/sys/prctl.h
  LN include/sys/ptrace.h
  LN include/sys/signalfd.h
  LN include/sys/timerfd.h
  LN include/sys/elf.h
  LN include/sys/io.h
  LN include/sys/procfs.h
  LN include/sys/ucontext.h
  LN include/sys/user.h
  MKDIR libm/arm
  MKDIR lib
  AS lib/crt1.o -DSTATIC -DNDEBUG -D__ASSEMBLER__ -DL_crt1
  AS lib/crti.o -DSTATIC -DNDEBUG -D__ASSEMBLER__
  AS lib/crtn.o -DSTATIC -DNDEBUG -D__ASSEMBLER__
  HOSTCC extra/scripts/unifdef
  INSTALL include -> /opt/test/buildroot/buildroot/output/host/usr/arm-buildroot-uclinux-uclibcgnueabi/sysroot/usr/include
install -m 644 ./lib/crt1.o ./lib/crti.o ./lib/crtn.o   /opt/test/buildroot/buildroot/output/host/usr/arm-buildroot-uclinux-uclibcgnueabi/sysroot/usr/lib//
make[1]: Leaving directory `/opt/test/buildroot/buildroot/output/build/uclibc-0.9.33.2'
/opt/test/buildroot/buildroot/output/host/usr/bin/arm-buildroot-uclinux-uclibcgnueabi-gcc -nostdlib -nostartfiles -shared -x c /dev/null -o /opt/test/buildroot/buildroot/output/host/usr/arm-buildroot-uclinux-uclibcgnueabi/sysroot/usr/lib/libc.so
ld (ld-elf2flt): -shared used without passing a shared library ID
collect2: ld returned 1 exit status
make: *** [/opt/test/buildroot/buildroot/output/build/uclibc-0.9.33.2/.stamp_configured] Error 1

Compare the build log with blackfin build (as below):

  MKDIR libm/bfin
  MKDIR libubacktrace/bfin
  MKDIR lib
  AS lib/crt1.o -DSTATIC -DNDEBUG -D__UCLIBC_UNDERSCORES__ -D__ASSEMBLER__ -DL_crt1
  AS lib/crti.o -DSTATIC -DNDEBUG -D__UCLIBC_UNDERSCORES__ -D__ASSEMBLER__
  AS lib/crtn.o -DSTATIC -DNDEBUG -D__UCLIBC_UNDERSCORES__ -D__ASSEMBLER__
  HOSTCC extra/scripts/unifdef
  INSTALL include -> /opt/test/buildroot/buildroot/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/include
install -m 644 ./lib/crt1.o ./lib/crti.o ./lib/crtn.o   /opt/test/buildroot/buildroot/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib//
make[1]: Leaving directory `/opt/test/buildroot/buildroot/output/build/uclibc-0.9.33.2'
/opt/test/buildroot/buildroot/output/host/usr/bin/bfin-buildroot-uclinux-uclibc-gcc -nostdlib -nostartfiles -shared -x c /dev/null -o /opt/test/buildroot/buildroot/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/libc.so
/opt/test/buildroot/buildroot/output/host/usr/bin/bfin-buildroot-uclinux-uclibc-gcc -nostdlib -nostartfiles -shared -x c /dev/null -o /opt/test/buildroot/buildroot/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/libm.so
touch /opt/test/buildroot/buildroot/output/build/uclibc-0.9.33.2/.stamp_configured

I have no idea why blackfin build can pass the compilation but arm build fails.
I'm still trying to figure out this problem.
I'd appreciate if someone can give me some advice/comments on this issue.

Thanks,
Axel
