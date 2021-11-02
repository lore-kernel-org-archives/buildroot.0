Return-Path: <SRS0=drHZ=PV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77AFDC433F5
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 20:25:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3623F60462
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 20:25:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3623F60462
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B8B0608A1;
	Tue,  2 Nov 2021 20:25:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ph0ZLhTwlTRw; Tue,  2 Nov 2021 20:25:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F01AF608A0;
	Tue,  2 Nov 2021 20:25:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8DC801BF40F
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 20:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D5AD608A2
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 20:25:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c5qR1TUbLzFy for <buildroot@lists.busybox.net>;
 Tue,  2 Nov 2021 20:25:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A4BD608A0
 for <buildroot@uclibc.org>; Tue,  2 Nov 2021 20:25:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 1374E89182; Tue,  2 Nov 2021 20:21:34 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Tue, 02 Nov 2021 20:25:12 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2021.05.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: thomas.petazzoni@bootlin.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone resolution
Message-ID: <bug-14151-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14151] New: Cannot build for beaglebone black.
 Build fails with errors
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://bugs.busybox.net/show_bug.cgi?id=14151

            Bug ID: 14151
           Summary: Cannot build for beaglebone black. Build fails with
                    errors
           Product: buildroot
           Version: 2021.05.1
          Hardware: All
                OS: Linux
            Status: RESOLVED
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: afuakoff2003@gmail.com
                CC: afuakoff2003@gmail.com, buildroot@uclibc.org
  Target Milestone: ---
                CC: afuakoff2003@gmail.com
        Resolution: DUPLICATE
            Status: RESOLVED

Host PC OS: Ubuntu 21.04

Steps:
Downloaded buildroot 2021.05.1.
cd buildroot.
make beaglebone_defconfig
make


patching file arch/arm/mach-omap2/omap_hwmod_33xx_data.c
Hunk #1 succeeded at 205 (offset -3 lines).
if [ -f
/home/ivanppp/Videos/buildroot-2021.05.1/output/build/linux-custom/tools/perf/Documentation/Makefile
]; then printf "%%:\n\t@:\n"
>/home/ivanppp/Videos/buildroot-2021.05.1/output/build/linux-custom/tools/perf/Documentation/GNUmakefile;
fi
for p in  ; do if test -d $p ; then
PATH=/home/ivanppp/Videos/buildroot-2021.05.1/output/host/bin:$PATH
support/scripts/apply-patches.sh 
/home/ivanppp/Videos/buildroot-2021.05.1/output/build/linux-custom $p \*.patch
|| exit 1 ; else
PATH=/home/ivanppp/Videos/buildroot-2021.05.1/output/host/bin:$PATH
support/scripts/apply-patches.sh 
/home/ivanppp/Videos/buildroot-2021.05.1/output/build/linux-custom `dirname $p`
`basename $p` || exit 1; fi done
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  LEX     scripts/kconfig/zconf.lex.c
  YACC    scripts/kconfig/zconf.tab.c
  HOSTCC  scripts/kconfig/zconf.tab.o
  HOSTLD  scripts/kconfig/conf
#
# configuration written to .config
#
Using
/home/ivanppp/Videos/buildroot-2021.05.1/output/build/linux-custom/.config as
base
#
# merged configuration written to
/home/ivanppp/Videos/buildroot-2021.05.1/output/build/linux-custom/.config
(needs make)
#
scripts/kconfig/conf  --olddefconfig Kconfig
#
# configuration written to .config
#
/usr/bin/sed -i -e "/\\<CONFIG_KERNEL_GZIP\\>/d"
/home/ivanppp/Videos/buildroot-2021.05.1/output/build/linux-custom//.config
echo 'CONFIG_KERNEL_GZIP=y' >>
/home/ivanppp/Videos/buildroot-2021.05.1/output/build/linux-custom//.config
/usr/bin/sed -i -e "/\\<CONFIG_KERNEL_LZ4\\>/d"
/home/ivanppp/Videos/buildroot-2021.05.1/output/build/linux-custom//.config
echo '# CONFIG_KERNEL_LZ4 is not set' >>
/home/ivanppp/Videos/buildroot-2021.05.1/output/build/linux-custom//.config
/usr/bin/sed -i -e "/\\<CONFIG_KERNEL_LZMA\\>/d"
/home/ivanppp/Videos/buildroot-2021.05.1/output/build/linux-custom//.config
echo '# CONFIG_KERNEL_LZMA is not set' >>
/home/ivanppp/Videos/buildroot-2021.05.1/output/build/linux-custom//.config
/usr/bin/sed -i -e "/\\<CONFIG_KERNEL_LZO\\>/d"
/home/ivanppp/Videos/buildroot-2021.05.1/output/build/linux-custom//.config
echo '# CONFIG_KERNEL_LZO is not set' >>
/home/ivanppp/Videos/buildroot-2021.05.1/output/build/linux-custom//.config
/usr/bin/sed -i -e "/\\<CONFIG_KERNEL_XZ\\>/d"
/home/ivanppp/Videos/buildroot-2021.05.1/output/build/linux-custom//.config
echo '# CONFIG_KERNEL_XZ is not set' >>
/home/ivanppp/Videos/buildroot-2021.05.1/output/build/linux-custom//.config
/usr/bin/sed -i -e "/\\<CONFIG_KERNEL_ZSTD\\>/d"
/home/ivanppp/Videos/buildroot-2021.05.1/output/build/linux-custom//.config
echo '# CONFIG_KERNEL_ZSTD is not set' >>
/home/ivanppp/Videos/buildroot-2021.05.1/output/build/linux-custom//.config
/usr/bin/sed -i -e "/\\<CONFIG_KERNEL_UNCOMPRESSED\\>/d"
/home/ivanppp/Videos/buildroot-2021.05.1/output/build/linux-custom//.config
echo '# CONFIG_KERNEL_UNCOMPRESSED is not set' >>
/home/ivanppp/Videos/buildroot-2021.05.1/output/build/linux-custom//.config
/usr/bin/sed -i -e "/\\<CONFIG_CPU_LITTLE_ENDIAN\\>/d"
/home/ivanppp/Videos/buildroot-2021.05.1/output/build/linux-custom//.config
echo 'CONFIG_CPU_LITTLE_ENDIAN=y' >>
/home/ivanppp/Videos/buildroot-2021.05.1/output/build/linux-custom//.config
/usr/bin/sed -i -e "/\\<CONFIG_AEABI\\>/d"
/home/ivanppp/Videos/buildroot-2021.05.1/output/build/linux-custom//.config
echo 'CONFIG_AEABI=y' >>
/home/ivanppp/Videos/buildroot-2021.05.1/output/build/linux-custom//.config
# As the kernel gets compiled before root filesystems are
# built, we create a fake cpio file. It'll be
# replaced later by the real cpio archive, and the kernel will be
# rebuilt using the linux-rebuild-with-initramfs target.
/usr/bin/sed -i -e "/\\<CONFIG_DEVTMPFS\\>/d"
/home/ivanppp/Videos/buildroot-2021.05.1/output/build/linux-custom//.config
echo 'CONFIG_DEVTMPFS=y' >>
/home/ivanppp/Videos/buildroot-2021.05.1/output/build/linux-custom//.config
/usr/bin/sed -i -e "/\\<CONFIG_DEVTMPFS_MOUNT\\>/d"
/home/ivanppp/Videos/buildroot-2021.05.1/output/build/linux-custom//.config
echo 'CONFIG_DEVTMPFS_MOUNT=y' >>
/home/ivanppp/Videos/buildroot-2021.05.1/output/build/linux-custom//.config
/usr/bin/sed -i -e "/\\<CONFIG_GCC_PLUGINS\\>/d"
/home/ivanppp/Videos/buildroot-2021.05.1/output/build/linux-custom//.config
echo '# CONFIG_GCC_PLUGINS is not set' >>
/home/ivanppp/Videos/buildroot-2021.05.1/output/build/linux-custom//.config
scripts/kconfig/conf  --olddefconfig Kconfig
#
# configuration written to .config
#
>>> linux custom Configuring
>>> linux custom Building
/usr/bin/sed -i -e "/\\<CONFIG_GCC_PLUGINS\\>/d"
/home/ivanppp/Videos/buildroot-2021.05.1/output/build/linux-custom//.config
echo '# CONFIG_GCC_PLUGINS is not set' >>
/home/ivanppp/Videos/buildroot-2021.05.1/output/build/linux-custom//.config
PATH="/home/ivanppp/Videos/buildroot-2021.05.1/output/host/bin:/home/ivanppp/Videos/buildroot-2021.05.1/output/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin"
PKG_CONFIG="/home/ivanppp/Videos/buildroot-2021.05.1/output/host/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
PKG_CONFIG_LIBDIR="/home/ivanppp/Videos/buildroot-2021.05.1/output/host/lib/pkgconfig:/home/ivanppp/Videos/buildroot-2021.05.1/output/host/share/pkgconfig"
BR_BINARIES_DIR=/home/ivanppp/Videos/buildroot-2021.05.1/output/images
KCFLAGS=-Wno-attribute-alias /usr/bin/make -j9 HOSTCC="/usr/bin/gcc -O2
-I/home/ivanppp/Videos/buildroot-2021.05.1/output/host/include
-L/home/ivanppp/Videos/buildroot-2021.05.1/output/host/lib
-Wl,-rpath,/home/ivanppp/Videos/buildroot-2021.05.1/output/host/lib" ARCH=arm
INSTALL_MOD_PATH=/home/ivanppp/Videos/buildroot-2021.05.1/output/target
CROSS_COMPILE="/home/ivanppp/Videos/buildroot-2021.05.1/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-"
DEPMOD=/home/ivanppp/Videos/buildroot-2021.05.1/output/host/sbin/depmod
INSTALL_MOD_STRIP=1 -C
/home/ivanppp/Videos/buildroot-2021.05.1/output/build/linux-custom all
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/zconf.tab.o
  HOSTLD  scripts/kconfig/conf
scripts/kconfig/conf  --syncconfig Kconfig
  SYSHDR  arch/arm/include/generated/uapi/asm/unistd-common.h
  SYSHDR  arch/arm/include/generated/uapi/asm/unistd-oabi.h
  SYSHDR  arch/arm/include/generated/uapi/asm/unistd-eabi.h
  WRAP    arch/arm/include/generated/uapi/asm/bitsperlong.h
  WRAP    arch/arm/include/generated/uapi/asm/bpf_perf_event.h
  WRAP    arch/arm/include/generated/uapi/asm/errno.h
  WRAP    arch/arm/include/generated/uapi/asm/ioctl.h
  WRAP    arch/arm/include/generated/uapi/asm/msgbuf.h
  WRAP    arch/arm/include/generated/uapi/asm/param.h
  WRAP    arch/arm/include/generated/uapi/asm/ipcbuf.h
  WRAP    arch/arm/include/generated/uapi/asm/resource.h
  WRAP    arch/arm/include/generated/uapi/asm/poll.h
  WRAP    arch/arm/include/generated/uapi/asm/sembuf.h
  WRAP    arch/arm/include/generated/uapi/asm/shmbuf.h
  WRAP    arch/arm/include/generated/uapi/asm/siginfo.h
  WRAP    arch/arm/include/generated/uapi/asm/socket.h
  WRAP    arch/arm/include/generated/uapi/asm/sockios.h
  WRAP    arch/arm/include/generated/uapi/asm/termbits.h
  WRAP    arch/arm/include/generated/uapi/asm/termios.h
  UPD     include/generated/uapi/linux/version.h
  UPD     include/config/kernel.release
  WRAP    arch/arm/include/generated/asm/compat.h
  WRAP    arch/arm/include/generated/asm/current.h
  WRAP    arch/arm/include/generated/asm/early_ioremap.h
  WRAP    arch/arm/include/generated/asm/emergency-restart.h
  WRAP    arch/arm/include/generated/asm/exec.h
  WRAP    arch/arm/include/generated/asm/extable.h
  WRAP    arch/arm/include/generated/asm/irq_regs.h
  WRAP    arch/arm/include/generated/asm/kdebug.h
  WRAP    arch/arm/include/generated/asm/local.h
  WRAP    arch/arm/include/generated/asm/local64.h
  WRAP    arch/arm/include/generated/asm/mm-arch-hooks.h
  WRAP    arch/arm/include/generated/asm/msi.h
  WRAP    arch/arm/include/generated/asm/parport.h
  WRAP    arch/arm/include/generated/asm/preempt.h
  WRAP    arch/arm/include/generated/asm/rwsem.h
  UPD     include/generated/utsrelease.h
  WRAP    arch/arm/include/generated/asm/seccomp.h
  WRAP    arch/arm/include/generated/asm/segment.h
  WRAP    arch/arm/include/generated/asm/serial.h
  WRAP    arch/arm/include/generated/asm/simd.h
  WRAP    arch/arm/include/generated/asm/sizes.h
  WRAP    arch/arm/include/generated/asm/timex.h
  WRAP    arch/arm/include/generated/asm/trace_clock.h
  HOSTCC  scripts/dtc/dtc.o
  HOSTCC  scripts/genksyms/genksyms.o
  HOSTCC  scripts/dtc/flattree.o
  YACC    scripts/genksyms/parse.tab.c
  CC      scripts/mod/empty.o
  HOSTCC  scripts/dtc/fstree.o
  HOSTCC  scripts/dtc/data.o
  HOSTCC  scripts/dtc/livetree.o
  HOSTCC  scripts/mod/mk_elfconfig
  CC      scripts/mod/devicetable-offsets.s
  HOSTCC  scripts/dtc/treesource.o
  LEX     scripts/genksyms/lex.lex.c
  YACC    scripts/genksyms/parse.tab.h
  UPD     scripts/mod/devicetable-offsets.h
  MKELF   scripts/mod/elfconfig.h
  HOSTCC  scripts/mod/modpost.o
  HOSTCC  scripts/dtc/srcpos.o
  HOSTCC  scripts/bin2c
  HOSTCC  scripts/genksyms/parse.tab.o
  HOSTCC  scripts/dtc/checks.o
  HOSTCC  scripts/kallsyms
  HOSTCC  scripts/genksyms/lex.lex.o
  HOSTCC  scripts/dtc/util.o
  LEX     scripts/dtc/dtc-lexer.lex.c
  YACC    scripts/dtc/dtc-parser.tab.h
  HOSTCC  scripts/pnmtologo
  HOSTCC  scripts/conmakehash
  YACC    scripts/dtc/dtc-parser.tab.c
  HOSTCC  scripts/mod/file2alias.o
  HOSTCC  scripts/mod/sumversion.o
  HOSTCC  scripts/sortextable
  HOSTCC  scripts/dtc/fdtoverlay.o
  HOSTCC  scripts/asn1_compiler
  HOSTCC  scripts/extract-cert
  HOSTCC  scripts/dtc/libfdt/fdt.o
  HOSTCC  scripts/dtc/libfdt/fdt_addresses.o
  HOSTCC  scripts/dtc/libfdt/fdt_empty_tree.o
  HOSTCC  scripts/dtc/libfdt/fdt_overlay.o
  HOSTCC  scripts/dtc/libfdt/fdt_ro.o
  HOSTCC  scripts/dtc/libfdt/fdt_rw.o
  HOSTCC  scripts/dtc/libfdt/fdt_strerror.o
  HOSTLD  scripts/genksyms/genksyms
  SYSNR   arch/arm/include/generated/asm/unistd-nr.h
  GEN     arch/arm/include/generated/asm/mach-types.h
  SYSTBL  arch/arm/include/generated/calls-oabi.S
  HOSTCC  scripts/dtc/libfdt/fdt_sw.o
  HOSTCC  scripts/dtc/libfdt/fdt_wip.o
  SYSTBL  arch/arm/include/generated/calls-eabi.S
  HOSTCC  scripts/dtc/dtc-lexer.lex.o
  HOSTCC  scripts/dtc/dtc-parser.tab.o
  CC      kernel/bounds.s
  UPD     include/generated/timeconst.h
  UPD     include/generated/bounds.h
  HOSTLD  scripts/dtc/fdtoverlay
  CC      arch/arm/kernel/asm-offsets.s
  HOSTLD  scripts/mod/modpost
  HOSTLD  scripts/dtc/dtc
/usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x10): multiple definition of
`yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here
collect2: error: ld returned 1 exit status
make[4]: *** [scripts/Makefile.host:99: scripts/dtc/dtc] Error 1
make[3]: *** [scripts/Makefile.build:544: scripts/dtc] Error 2
make[2]: *** [Makefile:1061: scripts] Error 2
make[2]: *** Waiting for unfinished jobs....
  UPD     include/generated/asm-offsets.h
  CALL    scripts/checksyscalls.sh
make[1]: *** [package/pkg-generic.mk:250:
/home/ivanppp/Videos/buildroot-2021.05.1/output/build/linux-custom/.stamp_built]
Error 2
make: *** [Makefile:84: _all] Error 2






Not sure why am getting this error. Any pointers is much appreciated.
Thanks
Afua

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@bootlin.com> ---


*** This bug has been marked as a duplicate of bug 14146 ***

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
