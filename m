From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 24 Jan 2015 10:46:01 +0100
Subject: [Buildroot] Build results for 2015-01-23
Message-ID: <trinity-db1473d9-a2cf-4dc7-ab3f-4a0c2cfb2df9-1422092761742@3capp-gmx-bs30>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

>      powerpc |                lightning-2.0.5 | NOK | http://autobuild.buildroot.net/results/711bf35e9e15711efa798f13bc10de52a6009341/

../lib/.libs/liblightning.so: undefined reference to `disassemble_init_powerpc'
collect2: error: ld returned 1 exit status

Could be fixed with (locally tested) binutils update to e.g. binutils-2.25:

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index c3b3c18..6d34750 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -12,7 +12,7 @@ ifeq ($(BR2_avr32),y)
 # avr32 uses a special version
 BINUTILS_VERSION = 2.18-avr32-1.0.1
 else
-BINUTILS_VERSION = 2.22
+BINUTILS_VERSION = 2.25
 endif
 endif

Regards,
Peter
