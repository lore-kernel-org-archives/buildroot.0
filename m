Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E882DC433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 20:36:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEA9860FE8
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 20:36:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AEA9860FE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BB6083A74;
	Thu, 21 Oct 2021 20:36:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id poLXNim-RnR5; Thu, 21 Oct 2021 20:36:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 033EE83BCA;
	Thu, 21 Oct 2021 20:36:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 58BD71BF9CB
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 20:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4219982BBA
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 20:35:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k9BmGcK_2moe for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 20:35:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E18F82D75
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 20:35:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 50A7A88343; Thu, 21 Oct 2021 20:32:02 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 21 Oct 2021 22:32:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 90cbd3edab6db11fb52b8ca4704028617750eb36
X-Git-Newrev: b7e8da22a314f0b7e2f15e3d1f1bef22ece17514
X-Patchwork-Hint: ignore
Message-Id: <20211021203202.50A7A88343@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/canfestival: remove package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b7e8da22a314f0b7e2f15e3d1f1bef22ece17514
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Canfestival hasn't seen a patch since November of 2017, and it requires python2
to build. Remove the package.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy                                   |   7 +
 DEVELOPERS                                         |   1 -
 package/Config.in                                  |   1 -
 ...-install-pkgconfig-module-for-canfestival.patch |  74 ---------
 .../0002-allow-to-set-python-interpreter.patch     | 176 ---------------------
 package/canfestival/Config.in                      |  90 -----------
 package/canfestival/canfestival.hash               |   3 -
 package/canfestival/canfestival.mk                 |  59 -------
 8 files changed, 7 insertions(+), 404 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 464021fec5..e443b7685e 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -158,6 +158,13 @@ config BR2_GCC_VERSION_CSKY
 	help
 	  Support for gcc csky version has been removed.
 
+config BR2_PACKAGE_CANFESTIVAL
+	bool "canfestival package removed"
+	select BR2_LEGACY
+	help
+	  This package has been removed as it is unmaintained since
+	  November 2017.
+
 config BR2_GDB_VERSION_8_3
 	bool "gdb version 8.3.x removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 0899146576..f864f7ef47 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2403,7 +2403,6 @@ F:	package/lrzip/
 
 N:	Samuel Martin <s.martin49@gmail.com>
 F:	package/armadillo/
-F:	package/canfestival/
 F:	package/cwiid/
 F:	package/flite/
 F:	package/nginx/
diff --git a/package/Config.in b/package/Config.in
index 92026e85c2..08062cdcf1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1746,7 +1746,6 @@ menu "Networking"
 	source "package/belle-sip/Config.in"
 	source "package/bluez5_utils-headers/Config.in"
 	source "package/c-ares/Config.in"
-	source "package/canfestival/Config.in"
 	source "package/cgic/Config.in"
 	source "package/cppzmq/Config.in"
 	source "package/curlpp/Config.in"
diff --git a/package/canfestival/0001-install-pkgconfig-module-for-canfestival.patch b/package/canfestival/0001-install-pkgconfig-module-for-canfestival.patch
deleted file mode 100644
index 23f3d899f1..0000000000
--- a/package/canfestival/0001-install-pkgconfig-module-for-canfestival.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From s.martin49@gmail.com Sun Sep 28 14:59:53 2014
-Content-Type: text/plain; charset="us-ascii"
-MIME-Version: 1.0
-Content-Transfer-Encoding: 7bit
-Subject: [PATCH] Install pkgconfig module for canfestival
-X-Mercurial-Node: c408fdc77aa18fcda81db4f0d038e8a69ba84bb2
-X-Mercurial-Series-Index: 1
-X-Mercurial-Series-Total: 1
-Message-Id: <c408fdc77aa18fcda81d.1411909193@bobook>
-X-Mercurial-Series-Id: <c408fdc77aa18fcda81d.1411909193@bobook>
-User-Agent: Mercurial-patchbomb/3.1.1
-Date: Sun, 28 Sep 2014 14:59:53 +0200
-From: Samuel Martin <s.martin49@gmail.com>
-To: canfestival-devel@lists.sourceforge.net
-Cc: Samuel Martin <s.martin49@gmail.com>
-
-# HG changeset patch
-# User "Samuel Martin" <s.martin49@gmail.com>
-# Date 1411906817 -7200
-#      Sun Sep 28 14:20:17 2014 +0200
-# Node ID c408fdc77aa18fcda81db4f0d038e8a69ba84bb2
-# Parent  7740ac6fdedc23e1ed6908d3d7db54833c88572b
-Install pkgconfig module for canfestival.
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-Cc: Cluadio Laurita <claudio.laurita@integrazionetotale.it>
-
-diff -r 7740ac6fdedc -r c408fdc77aa1 canfestival.pc.in
---- /dev/null	Thu Jan 01 00:00:00 1970 +0000
-+++ b/canfestival.pc.in	Sun Sep 28 14:20:17 2014 +0200
-@@ -0,0 +1,12 @@
-+PREFIX = SUB_PREFIX
-+TARGET = SUB_TARGET
-+
-+prefix=${PREFIX}
-+libdir=${prefix}/lib
-+includedir=${prefix}/include/canfestival
-+
-+Name: Canfestival
-+Description: Canfestival CANOpen library
-+Version: 1
-+Libs: -L${libdir} -lcanfestival -lcanfestival_${TARGET} -lrt -ldl -lpthread
-+Cflags: -I${includedir}
-diff -r 7740ac6fdedc -r c408fdc77aa1 configure
---- a/configure	Thu Jun 12 14:07:16 2014 +0200
-+++ b/configure	Sun Sep 28 14:20:17 2014 +0200
-@@ -813,6 +813,10 @@
-     MAKEFILES=$MAKEFILES\ drivers/$SUB_TARGET/Makefile.in
- fi
- 
-+if [ "$SUB_TARGET" = "unix" ]; then
-+    MAKEFILES=$MAKEFILES\ canfestival.pc.in
-+fi
-+
- if [ "$SUB_TARGET" = "unix" -a "$SUB_TIMERS_DRIVER" = "kernel" ]; then
- 	MAKEFILES=$MAKEFILES\
- \	examples/kerneltest/Makefile.in\
-diff -r 7740ac6fdedc -r c408fdc77aa1 src/Makefile.in
---- a/src/Makefile.in	Thu Jun 12 14:07:16 2014 +0200
-+++ b/src/Makefile.in	Sun Sep 28 14:20:17 2014 +0200
-@@ -132,9 +132,10 @@
- 	$(CC) $(CFLAGS) $(PROG_CFLAGS) ${PROGDEFINES} $(INCLUDES) -o $@ -c $<
- 
- install: libcanfestival.a
--	mkdir -p $(DESTDIR)$(PREFIX)/lib/
-+	mkdir -p $(DESTDIR)$(PREFIX)/lib/pkgconfig
- 	mkdir -p $(DESTDIR)$(PREFIX)/include/canfestival
- 	cp libcanfestival.a $(DESTDIR)$(PREFIX)/lib/
-+	cp ../canfestival.pc $(DESTDIR)$(PREFIX)/lib/pkgconfig/
- 	cp ../include/*.h $(DESTDIR)$(PREFIX)/include/canfestival
- 
- uninstall:
-
-
diff --git a/package/canfestival/0002-allow-to-set-python-interpreter.patch b/package/canfestival/0002-allow-to-set-python-interpreter.patch
deleted file mode 100644
index bb6031658c..0000000000
--- a/package/canfestival/0002-allow-to-set-python-interpreter.patch
+++ /dev/null
@@ -1,176 +0,0 @@
-From s.martin49@gmail.com Fri Oct 10 23:43:32 2014
-Content-Type: text/plain; charset="us-ascii"
-MIME-Version: 1.0
-Content-Transfer-Encoding: 7bit
-Subject: [PATCH] allow to set python interpreter
-X-Mercurial-Node: 4805f636c2317d989a5f704ba691369f41be6595
-X-Mercurial-Series-Index: 1
-X-Mercurial-Series-Total: 1
-Message-Id: <4805f636c2317d989a5f.1412977412@bobook>
-X-Mercurial-Series-Id: <4805f636c2317d989a5f.1412977412@bobook>
-User-Agent: Mercurial-patchbomb/3.1.2
-Date: Fri, 10 Oct 2014 23:43:32 +0200
-From: Samuel Martin <s.martin49@gmail.com>
-To: canfestival-devel@lists.sourceforge.net
-Cc: Samuel Martin <s.martin49@gmail.com>
-
-# HG changeset patch
-# User "Samuel Martin" <s.martin49@gmail.com>
-# Date 1412977082 -7200
-#      Fri Oct 10 23:38:02 2014 +0200
-# Node ID 4805f636c2317d989a5f704ba691369f41be6595
-# Parent  c408fdc77aa18fcda81db4f0d038e8a69ba84bb2
-allow to set python interpreter
-
-Canfestival python modules and scripts are not python3 compliant.
-
-Allow to pass the python interperter to be used to make.
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-
-diff --git a/Makefile.in b/Makefile.in
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -21,6 +21,9 @@
- # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
- # 
- 
-+PYTHON ?= python
-+export PYTHON
-+
- all: objdictedit canfestival examples
- 
- examples: canfestival driver
-diff --git a/doc/manual/en/manual.tex b/doc/manual/en/manual.tex
---- a/doc/manual/en/manual.tex
-+++ b/doc/manual/en/manual.tex
-@@ -1134,6 +1134,7 @@
- 	python objdictedit.py [od files...]
- \end{verbatim}
- 
-+Note that Gnosis modules only run with python2 as interpreter.
- 
- \subsubsection{Installation and usage on Windows}
- 
-diff --git a/examples/CANOpenShell/Makefile.in b/examples/CANOpenShell/Makefile.in
---- a/examples/CANOpenShell/Makefile.in
-+++ b/examples/CANOpenShell/Makefile.in
-@@ -69,11 +69,11 @@
- 	
- CANOpenShellMasterOD.c: CANOpenShellMasterOD.od
- 	$(MAKE) -C ../../objdictgen gnosis
--	python ../../objdictgen/objdictgen.py CANOpenShellMasterOD.od CANOpenShellMasterOD.c
-+	$(PYTHON) ../../objdictgen/objdictgen.py CANOpenShellMasterOD.od CANOpenShellMasterOD.c
- 
- CANOpenShellSlaveOD.c: CANOpenShellSlaveOD.od
- 	$(MAKE) -C ../../objdictgen gnosis
--	python ../../objdictgen/objdictgen.py CANOpenShellSlaveOD.od CANOpenShellSlaveOD.c
-+	$(PYTHON) ../../objdictgen/objdictgen.py CANOpenShellSlaveOD.od CANOpenShellSlaveOD.c
- 
- %.o: %.c
- 	$(CC) $(CFLAGS) $(PROG_CFLAGS) ${PROGDEFINES} $(INCLUDES) -o $@ -c $<
-diff --git a/examples/DS401_Master/Makefile.in b/examples/DS401_Master/Makefile.in
---- a/examples/DS401_Master/Makefile.in
-+++ b/examples/DS401_Master/Makefile.in
-@@ -53,7 +53,7 @@
- 	
- TestMaster.c: TestMaster.od
- 	$(MAKE) -C ../../objdictgen gnosis
--	python ../../objdictgen/objdictgen.py TestMaster.od TestMaster.c
-+	$(PYTHON) ../../objdictgen/objdictgen.py TestMaster.od TestMaster.c
- 
- %.o: %.c
- 	$(CC) $(CFLAGS) $(PROG_CFLAGS) ${PROGDEFINES} $(INCLUDES) -o $@ -c $<
-diff --git a/examples/DS401_Slave_Gui/Makefile.in b/examples/DS401_Slave_Gui/Makefile.in
---- a/examples/DS401_Slave_Gui/Makefile.in
-+++ b/examples/DS401_Slave_Gui/Makefile.in
-@@ -59,7 +59,7 @@
- 
- ObjDict.c: ObjDict.od
- 	$(MAKE) -C ../../objdictgen gnosis
--	python ../../objdictgen/objdictgen.py ObjDict.od ObjDict.c
-+	$(PYTHON) ../../objdictgen/objdictgen.py ObjDict.od ObjDict.c
- 
- .cpp.o:
- 	$(CXX) -c $(CFLAGS) $(PROG_CFLAGS) ${PROGDEFINES} $(INCLUDES) `wx-config --cxxflags` $< -o $@
-diff --git a/examples/SillySlave/Makefile.in b/examples/SillySlave/Makefile.in
---- a/examples/SillySlave/Makefile.in
-+++ b/examples/SillySlave/Makefile.in
-@@ -53,7 +53,7 @@
- 	
- SillySlave.c: SillySlave.od
- 	$(MAKE) -C ../../objdictgen gnosis
--	python ../../objdictgen/objdictgen.py SillySlave.od SillySlave.c
-+	$(PYTHON) ../../objdictgen/objdictgen.py SillySlave.od SillySlave.c
- 
- %.o: %.c
- 	$(CC) $(CFLAGS) $(PROG_CFLAGS) ${PROGDEFINES} $(INCLUDES) -o $@ -c $<
-diff --git a/examples/TestMasterMicroMod/Makefile.in b/examples/TestMasterMicroMod/Makefile.in
---- a/examples/TestMasterMicroMod/Makefile.in
-+++ b/examples/TestMasterMicroMod/Makefile.in
-@@ -61,7 +61,7 @@
- 	
- TestMaster.c: TestMaster.od
- 	$(MAKE) -C ../../objdictgen gnosis
--	python ../../objdictgen/objdictgen.py TestMaster.od TestMaster.c
-+	$(PYTHON) ../../objdictgen/objdictgen.py TestMaster.od TestMaster.c
- 
- %.o: %.c
- 	$(CC) $(CFLAGS) $(PROG_CFLAGS) ${PROGDEFINES} $(INCLUDES) -o $@ -c $<
-diff --git a/examples/TestMasterSlave/Makefile.in b/examples/TestMasterSlave/Makefile.in
---- a/examples/TestMasterSlave/Makefile.in
-+++ b/examples/TestMasterSlave/Makefile.in
-@@ -69,11 +69,11 @@
- 	
- TestSlave.c: TestSlave.od
- 	$(MAKE) -C ../../objdictgen gnosis
--	python ../../objdictgen/objdictgen.py TestSlave.od TestSlave.c
-+	$(PYTHON) ../../objdictgen/objdictgen.py TestSlave.od TestSlave.c
- 	
- TestMaster.c: TestMaster.od
- 	$(MAKE) -C ../../objdictgen gnosis
--	python ../../objdictgen/objdictgen.py TestMaster.od TestMaster.c
-+	$(PYTHON) ../../objdictgen/objdictgen.py TestMaster.od TestMaster.c
- 
- %.o: %.c
- 	$(CC) $(CFLAGS) $(PROG_CFLAGS) ${PROGDEFINES} $(INCLUDES) -o $@ -c $<
-diff --git a/examples/TestMasterSlaveLSS/Makefile.in b/examples/TestMasterSlaveLSS/Makefile.in
---- a/examples/TestMasterSlaveLSS/Makefile.in
-+++ b/examples/TestMasterSlaveLSS/Makefile.in
-@@ -64,15 +64,15 @@
- 	
- TestSlaveA.c: TestSlaveA.od
- 	$(MAKE) -C ../../objdictgen gnosis
--	python ../../objdictgen/objdictgen.py TestSlaveA.od TestSlaveA.c
-+	$(PYTHON) ../../objdictgen/objdictgen.py TestSlaveA.od TestSlaveA.c
- 
- TestSlaveB.c: TestSlaveB.od
- 	$(MAKE) -C ../../objdictgen gnosis
--	python ../../objdictgen/objdictgen.py TestSlaveB.od TestSlaveB.c
-+	$(PYTHON) ../../objdictgen/objdictgen.py TestSlaveB.od TestSlaveB.c
- 	
- TestMaster.c: TestMaster.od
- 	$(MAKE) -C ../../objdictgen gnosis
--	python ../../objdictgen/objdictgen.py TestMaster.od TestMaster.c
-+	$(PYTHON) ../../objdictgen/objdictgen.py TestMaster.od TestMaster.c
- 
- %.o: %.c
- 	$(CC) $(CFLAGS) $(PROG_CFLAGS) ${PROGDEFINES} $(INCLUDES) -o $@ -c $<
-diff --git a/examples/kerneltest/Makefile.in b/examples/kerneltest/Makefile.in
---- a/examples/kerneltest/Makefile.in
-+++ b/examples/kerneltest/Makefile.in
-@@ -79,10 +79,10 @@
- 
- TestSlave.c: TestSlave.od
- 	$(MAKE) -C ../../objdictgen gnosis
--	python ../../objdictgen/objdictgen.py TestSlave.od TestSlave.c
-+	$(PYTHON) ../../objdictgen/objdictgen.py TestSlave.od TestSlave.c
- 
- TestMaster.c: TestMaster.od
- 	$(MAKE) -C ../../objdictgen gnosis
--	python ../../objdictgen/objdictgen.py TestMaster.od TestMaster.c
-+	$(PYTHON) ../../objdictgen/objdictgen.py TestMaster.od TestMaster.c
- 	
- #endif
-
-
diff --git a/package/canfestival/Config.in b/package/canfestival/Config.in
deleted file mode 100644
index 8300e26582..0000000000
--- a/package/canfestival/Config.in
+++ /dev/null
@@ -1,90 +0,0 @@
-config BR2_PACKAGE_CANFESTIVAL_ARCH_SUPPORTS
-	bool
-	default y if BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_arm
-
-comment "canfestival needs a glibc or uClibc toolchain w/ threads and dynamic library"
-	depends on BR2_PACKAGE_CANFESTIVAL_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_USES_MUSL || \
-		!BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS
-
-config BR2_PACKAGE_CANFESTIVAL
-	bool "canfestival"
-	depends on BR2_PACKAGE_CANFESTIVAL_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_USES_MUSL # sigval_t
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_STATIC_LIBS
-	help
-	  CanFestival is an OpenSource CANOpen framework, licensed under
-	  LGPLv2.1 and GPLv2 for some drivers (virtual_kernel, lincan
-	  and copcican_comedi).
-
-	  http://www.canfestival.org
-
-if BR2_PACKAGE_CANFESTIVAL
-
-choice
-	prompt "driver"
-	default BR2_PACKAGE_CANFESTIVAL_SOCKET
-
-# - The AnaGate CAN(duo) [1], PeakSystem CAN [2] and CO-PCICAN [3]
-#   drivers are not available (not packaged in Buildroot), so their
-#   support are disabled.
-# - The virtual_kernel driver is disabled because it uses very old
-#   kernel APIs, that have been renamed, or marked as deprecated or
-#   removed for a long while. The question has been raised on the
-#   canfestival mailing list [4].
-#
-# [1] http://www.anagate.de/en/index.html
-# [2] http://www.peak-system.com/linux/
-# [3] http://www.cosateq.com/
-# [4] http://sourceforge.net/p/canfestival/mailman/message/32519648/
-
-config BR2_PACKAGE_CANFESTIVAL_VIRTUAL
-	bool "virtual"
-	help
-	  Unix pipe based virtual CAN driver.
-
-config BR2_PACKAGE_CANFESTIVAL_SOCKET
-	bool "socket"
-	help
-	  SocketCAN (the standard mainline CAN bus interface).
-
-	  http://developer.berlios.de/projects/socketcan/
-
-config BR2_PACKAGE_CANFESTIVAL_LINCAN
-	bool "lincan"
-	help
-	  Lincan driver.
-
-	  http://www.ocera.org/download/components/WP7/lincan-0.3.3.html
-
-config BR2_PACKAGE_CANFESTIVAL_CAN4LINUX
-	bool "can4linux"
-	help
-	  Can4linux driver.
-
-	  http://www.port.de/engl/canprod/hw_can4linux.html
-
-endchoice
-
-config BR2_PACKAGE_CANFESTIVAL_DRIVER
-	string
-	default "virtual"	  if BR2_PACKAGE_CANFESTIVAL_VIRTUAL
-	default "socket"	  if BR2_PACKAGE_CANFESTIVAL_SOCKET
-	default "lincan"	  if BR2_PACKAGE_CANFESTIVAL_LINCAN
-	default "can4linux"	  if BR2_PACKAGE_CANFESTIVAL_CAN4LINUX
-
-config BR2_PACKAGE_CANFESTIVAL_ADDITIONAL_OPTIONS
-	string "additional configure options"
-	help
-	  Additional options can be passed directly to the configure
-	  script (e.g.: --MAX_CAN_BUS_ID=...,
-	  --SDO_MAX_LENGTH_TRANSFER=..., --SDO_BLOCK_SIZE=...).
-
-config BR2_PACKAGE_CANFESTIVAL_INSTALL_EXAMPLES
-	bool "install examples"
-	help
-	  Install binary application examples.
-
-endif
diff --git a/package/canfestival/canfestival.hash b/package/canfestival/canfestival.hash
deleted file mode 100644
index dc32bd9a2e..0000000000
--- a/package/canfestival/canfestival.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# License files, locally calculated
-sha256	b5c45f160093a6c2fb7bd0078f50c62f4b4089b6206b0e90b0f122b40a2fe110  COPYING
-sha256	d4594b82f4d50840df6a7e9d14132a8c0a3cc05d0ac46d15310a264a1f75447e  LICENCE
diff --git a/package/canfestival/canfestival.mk b/package/canfestival/canfestival.mk
deleted file mode 100644
index 760f14aecd..0000000000
--- a/package/canfestival/canfestival.mk
+++ /dev/null
@@ -1,59 +0,0 @@
-################################################################################
-#
-# canfestival
-#
-################################################################################
-
-CANFESTIVAL_VERSION = 7740ac6fdedc23e1ed6908d3d7db54833c88572b
-CANFESTIVAL_SITE = http://dev.automforge.net/CanFestival-3
-CANFESTIVAL_SITE_METHOD = hg
-CANFESTIVAL_LICENSE = LGPL-2.1+
-CANFESTIVAL_LICENSE_FILES = COPYING LICENCE
-CANFESTIVAL_INSTALL_STAGING = YES
-CANFESTIVAL_INSTALLED-y = src drivers
-CANFESTIVAL_INSTALLED-$(BR2_PACKAGE_CANFESTIVAL_INSTALL_EXAMPLES) += examples
-
-# Canfestival provides and used some python modules and scripts only compliant
-# with python2.
-CANFESTIVAL_DEPENDENCIES = host-python
-
-# canfestival uses its own hand-written build-system. Though there is
-# a configure script, it does not use the autotools, so, we use the
-# generic-package infrastructure.
-define CANFESTIVAL_CONFIGURE_CMDS
-	cd $(@D) && \
-		$(TARGET_CONFIGURE_OPTS) ./configure \
-		--target=unix \
-		--arch=$(BR2_ARCH) \
-		--timers=unix \
-		--binutils=$(TARGET_CROSS) \
-		--cc="$(TARGET_CC)" \
-		--cxx="$(TARGET_CC)" \
-		--ld="$(TARGET_CC)" \
-		--prefix=/usr \
-		--can=$(BR2_PACKAGE_CANFESTIVAL_DRIVER) \
-		$(call qstrip,$(BR2_PACKAGE_CANFESTIVAL_ADDITIONAL_OPTIONS))
-endef
-
-define CANFESTIVAL_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) all \
-		PYTHON=$(HOST_DIR)/bin/python2
-endef
-
-define CANFESTIVAL_INSTALL_TARGET_CMDS
-	for d in $(CANFESTIVAL_INSTALLED-y) ; do \
-		$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)/$$d install \
-			PYTHON=$(HOST_DIR)/bin/python2 \
-			DESTDIR=$(TARGET_DIR) || exit 1 ; \
-	done
-endef
-
-define CANFESTIVAL_INSTALL_STAGING_CMDS
-	for d in $(CANFESTIVAL_INSTALLED-y) ; do \
-		$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)/$$d install \
-			PYTHON=$(HOST_DIR)/bin/python2 \
-			DESTDIR=$(STAGING_DIR) || exit 1 ; \
-	done
-endef
-
-$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
