From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 17 May 2016 20:58:36 +0100
Subject: [Buildroot] [PATCH] Add openmpi package
Message-ID: <1463515117-26333-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds openmpi package, but it has one problem that I don't
know how to fix.

When building it for uClibc it fails to compile showing this error
message:

/bin/sh ../libtool  --tag=CC   --mode=compile
/home/ldap/vriera/git-clones/buildroot-1/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gcc
-DHAVE_CONFIG_H -I. -I..   -DINSIDE_OPENMPI
-I/home/ldap/vriera/git-clones/buildroot-1/output/build/openmpi-1.10.2/ompi/include
-I/home/ldap/vriera/git-clones/buildroot-1/output/build/openmpi-1.10.2/ompi/contrib/vt/vt/../../../include
-I/home/ldap/vriera/git-clones/buildroot-1/output/build/openmpi-1.10.2/ompi/contrib/vt/vt/../../../include
-I../include -I../include -I../rfg -DVT_GETCPU   -I../extlib/otf/otflib
-I../extlib/otf/otflib -DVT_PLUGIN_CNTR -DVT_RUSAGE -DVT_MT
-DVT_EXECWRAP  -DVT_IOWRAP -DVT_LIBWRAP  -DVT_PTHREAD -DVT_THRD_PTHREAD
-pthread -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -Os  -c -o libvt_mt_la-vt_execwrap.lo `test -f
'vt_execwrap.c' || echo './'`vt_execwrap.c
/tmp/ccY2VE00.s: Assembler messages:
/tmp/ccY2VE00.s:3670: Error: symbol `open64' is already defined
/tmp/ccY2VE00.s:4170: Error: symbol `creat64' is already defined
/tmp/ccY2VE00.s:5275: Error: symbol `lseek64' is already defined
/tmp/ccY2VE00.s:6859: Error: symbol `pread64' is already defined
/tmp/ccY2VE00.s:7100: Error: symbol `pwrite64' is already defined
/tmp/ccY2VE00.s:7605: Error: symbol `fopen64' is already defined
/tmp/ccY2VE00.s:8809: Error: symbol `fseeko64' is already defined
/tmp/ccY2VE00.s:9498: Error: symbol `fsetpos64' is already defined
Makefile:3204: recipe for target 'libvt_la-vt_iowrap.lo' failed

According to this thread [1] it will never compile in 32-bit mode with
LARGEFILE-support, but for glibc I haven't had any problem.

1: http://www.linuxquestions.org/questions/programming-9/openmpi-1-8-1-compilation-error-4175504854/#post5170760

Vicente Olivert Riera (1):
  openmpi: new package

 package/Config.in            |  1 +
 package/openmpi/Config.in    | 27 +++++++++++++++++++++++++++
 package/openmpi/openmpi.hash |  3 +++
 package/openmpi/openmpi.mk   | 27 +++++++++++++++++++++++++++
 4 files changed, 58 insertions(+)
 create mode 100644 package/openmpi/Config.in
 create mode 100644 package/openmpi/openmpi.hash
 create mode 100644 package/openmpi/openmpi.mk

-- 
2.7.3
