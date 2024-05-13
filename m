Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ACAFC25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 21:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1087F4159D;
	Mon, 13 May 2024 21:48:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ujyKRcOMd8E; Mon, 13 May 2024 21:48:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8507E41555
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8507E41555;
	Mon, 13 May 2024 21:48:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E94E81BF2A4
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 21:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D414482284
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 21:48:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q1sHdAfs_xs5 for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 21:48:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D42E682262
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D42E682262
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D42E682262
 for <buildroot@busybox.net>; Mon, 13 May 2024 21:48:35 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.197]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N0G1d-1sTPZm03aJ-00yPsW
 for <buildroot@busybox.net>; Mon, 13 May 2024 23:48:33 +0200
To: buildroot@busybox.net
Date: Mon, 13 May 2024 23:48:32 +0200
Message-ID: <20240513214832.18094-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:Ib3gQS9w23s19OYwlX2SKHN5ynpnnSxAhitPdl894GX1NwrBLft
 e6DdUu3w1nR+BEAplKOO9JdCmv65Ec6HO2h/xkHlkxiBpIOWRChb4y2RjpFvusYPMr9hybQ
 S7i7R22XOFtCNBgWuHBQmlUAW05EJeKJN5jWah+n8N7XC5JtCkz8p+YoSVemozr2KhNOVsP
 pGPX+rQS/XaI5q526H7ug==
UI-OutboundReport: notjunk:1;M01:P0:yxdn+JAbd4k=;IUbqDgvYx9vzARFNnRPhM92qPNx
 PWYgr4Tm7WDKcClZf1s36JZYU7iyWRSDmELUqo5hMZy1H2ltAbFouk0Wmclk5CWNQZvbY7KN8
 9suWe4RBim3FBeQKFDsev2UNxnySA5CMjtjWMRLj3bqx4ArwH8GGMETqKsoQbmIHyGhjlF7Q0
 LK1xxlw+NLNvjFmWJBVA7GJBrtje/sD2uZ+ZOSvHhrkqKnoNk7SCYC+2/d1BoPhWZW6/9m3Mw
 LUwLVU9FBF7Ng5QFGVQ9Uaoi6QtaPEjT0ML4ZjCw4LTjCNlAxhnuxGgrTyxwBUu5Jo7iJEzCI
 gdqP88g3iZIy3mEymntZmCs5DwVP6tyvbbG6MtKjlBsfXkR4SVN9Kbf/ww1JdFDuD5KqF5mfr
 mAixJ4CHxprpBfDg2DB5WqCPa4gCpAF64Hv5V/9F8eA3lMDsRTYwRN3KSvDnLSMQ5TdRFfduP
 iyBEX+2+1gCcQnnVOJSGjtVtzz47YVc6g4WafQEB/v7Z3MwBBwD9wTJU5+eEbEZCzN2WPO0cU
 f61M3yv0TVSNwYjztBhMFODmZ9A+39T0fItH4ML1VB21pmc3aKEd9Pj7w8YGIJ+oyXmQywCB4
 gbsfG0ItUuwHKsMDdNhXJlucU9QAfCStyiUlWH9Pb3LbtinOjQRMBgodiuOiUDXkEEfiuwykg
 JetlItMPX4YdZXAnnWA6RjVhZfvrhpJB8LmsiovdyMZ8MYUDYueR4Lsv6qMc/EbNCq3MHSRQZ
 MjctixC4Im7ZgvWHPNE4OxzVuv3W1QINIQ1pHWd/irmwXeu3rmC/qODDq7z3nNr56253U9prb
 WspJC1FA8dwrEi9kZ5BUzrkao6tX+0jx/Z4fxosPUXiEo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1715636913; x=1716241713; i=ps.report@gmx.net;
 bh=Hb7AypnHE5pu98SAEXpD1Yc6iLiFTl322QNA+R3zcyc=;
 h=X-UI-Sender-Class:From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=lxSrIaEf93WD+G6jgOyhea+RNFX3CqDsdm4wAauRRUYltVVHBfi2Mws/x/Z6jrlm
 STG5PyBBDipnwzYrwl/qh6QCrAG98JCjKzsgb57zwM+3eBrTI+qj0agUtbtiw7UAl
 rq5Tk+w0qSblgH+IZUS7fk6RkYf6wN9t5y4Mcz8FaC7xWU2R1N8V5IamC+IPjS2qo
 TbJ+Kq2viRXW+UT1OtEuvx/8WFHieLIOxCxID8ljQMpepVCt3WtxhLYKf3yfXMTWv
 ZSMcz1TKjCU98C8jV7a51Ew4+7o9m1N3tkreNZaNnxwXtn22CfgHiPNR5YclFfuvA
 LjPdNqcyvlkefLMp0Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=lxSrIaEf
Subject: [Buildroot] [PATCH v1] package/wiringpi: re-add and bump version to
 3.4
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- revert commit 90dd780391 ("package/wiringpi: remove")
- bump version to 3.4
- change download URL to github
- change home page URL to github
- rebased 0001-Adjust-for-buildroot-build.patch
- add optional libxcrypt dependency, fix build failure since bump of glibc
  to version 2.39
- needs kernel headers >= 5.5 for GPIOLINE_FLAG_BIAS_PULL_UP,
  GPIOLINE_FLAG_BIAS_PULL_DOWN and GPIOLINE_FLAG_BIAS_DISABLE usage

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 Config.in.legacy                              |   9 --
 DEVELOPERS                                    |   1 +
 package/Config.in                             |   1 +
 package/squeezelite/squeezelite.mk            |   5 +
 .../0001-Adjust-for-buildroot-build.patch     | 126 ++++++++++++++++++
 ...erial-fix-compile-for-missing-baud-d.patch |  47 +++++++
 package/wiringpi/Config.in                    |  16 +++
 package/wiringpi/wiringpi.hash                |   3 +
 package/wiringpi/wiringpi.mk                  |  36 +++++
 9 files changed, 235 insertions(+), 9 deletions(-)
 create mode 100644 package/wiringpi/0001-Adjust-for-buildroot-build.patch
 create mode 100644 package/wiringpi/0002-wiringPi-wiringSerial-fix-compile-for-missing-baud-d.patch
 create mode 100644 package/wiringpi/Config.in
 create mode 100644 package/wiringpi/wiringpi.hash
 create mode 100644 package/wiringpi/wiringpi.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 46f7a304cb..8d4f488dbd 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -1938,15 +1938,6 @@ config BR2_PACKAGE_KODI_PERIPHERAL_STEAMCONTROLLER
 
 comment "Legacy options removed in 2020.05"
 
-config BR2_PACKAGE_WIRINGPI
-	bool "wiringpi package removed"
-	select BR2_LEGACY
-	help
-	  The author of wiringpi has deprecated the package, and
-	  completely removed the git tree that was serving the
-	  sources, with this message:
-	  Please look for alternatives for wiringPi
-
 config BR2_PACKAGE_PYTHON_PYCRYPTO
 	bool "python-pycrypto package removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index d653648718..9f7bade097 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2546,6 +2546,7 @@ F:	package/fft-eval/
 F:	package/python-blinker/
 F:	package/qt5/qt5speech/
 F:	package/speechd/
+F:	package/wiringpi/
 
 N:	Peter Thompson <peter.macleod.thompson@gmail.com>
 F:	package/sdl2_gfx/
diff --git a/package/Config.in b/package/Config.in
index c29b4a5101..ffb6c69562 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1805,6 +1805,7 @@ menu "Hardware handling"
 	source "package/tslib/Config.in"
 	source "package/uhd/Config.in"
 	source "package/urg/Config.in"
+	source "package/wiringpi/Config.in"
 endmenu
 
 menu "Javascript"
diff --git a/package/squeezelite/squeezelite.mk b/package/squeezelite/squeezelite.mk
index b0347c4df9..2ed3d8b769 100644
--- a/package/squeezelite/squeezelite.mk
+++ b/package/squeezelite/squeezelite.mk
@@ -40,6 +40,11 @@ ifeq ($(BR2_PACKAGE_SQUEEZELITE_VISEXPORT),y)
 SQUEEZELITE_MAKE_OPTS += -DVISEXPORT
 endif
 
+ifeq ($(BR2_PACKAGE_WIRINGPI),y)
+SQUEEZELITE_DEPENDENCIES += wiringpi
+SQUEEZELITE_MAKE_OPTS += -DRPI
+endif
+
 define SQUEEZELITE_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
 		OPTS="$(SQUEEZELITE_MAKE_OPTS)" -C $(@D) all
diff --git a/package/wiringpi/0001-Adjust-for-buildroot-build.patch b/package/wiringpi/0001-Adjust-for-buildroot-build.patch
new file mode 100644
index 0000000000..2720c502c1
--- /dev/null
+++ b/package/wiringpi/0001-Adjust-for-buildroot-build.patch
@@ -0,0 +1,126 @@
+From ebfa5527467ba175cca84afeae244c06e265a508 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Wed, 2 Dec 2015 00:22:26 +0100
+Subject: [PATCH] Adjust for buildroot build.
+
+ - enable CC override
+ - fix devLib/gpio include path for local build (without installing first)
+ - change CFLAGS from '=' to '+=' to honour buildroot given flags
+ - add linker name link for libwiringPiDev and libwiringPi for local linking
+   (without installing first)
+ - fix install linker name link (do not link with absolute path)
+ - add gpio-static linking target
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+
+ - Rebased for wiringpi-8d188fa0e00bb8c6ff6eddd07bf92857e9bd533a
+
+Signed-off-by: Atanas Palavrov <palavrov@gmail.com>
+
+ - Rebased for wiringpi-3.4
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ devLib/Makefile   |  7 ++++---
+ gpio/Makefile     | 12 ++++++++----
+ wiringPi/Makefile |  5 +++--
+ 3 files changed, 15 insertions(+), 9 deletions(-)
+
+diff --git a/devLib/Makefile b/devLib/Makefile
+index 611e423..d0c70d0 100644
+--- a/devLib/Makefile
++++ b/devLib/Makefile
+@@ -37,9 +37,9 @@ DYNAMIC=libwiringPiDev.so.$(VERSION)
+ #DEBUG	= -g -O0
+ DEBUG	= -O2
+ CC	?= gcc
+-INCLUDE	= -I.
++INCLUDE	= -I../wiringPi
+ DEFS	= -D_GNU_SOURCE
+-CFLAGS	= $(DEBUG) $(DEFS) -Wformat=2 -Wall -Winline $(INCLUDE) -pipe -fPIC $(EXTRA_CFLAGS)
++CFLAGS	+= $(DEBUG) $(DEFS) -Wformat=2 -Wall -Winline $(INCLUDE) -pipe -fPIC $(EXTRA_CFLAGS)
+ 
+ LIBS    =
+ 
+@@ -69,6 +69,7 @@ $(STATIC):	$(OBJ)
+ $(DYNAMIC):	$(OBJ)
+ 	$Q echo "[Link (Dynamic)]"
+ 	$Q $(CC) -shared -Wl,-soname,libwiringPiDev.so$(WIRINGPI_SONAME_SUFFIX) -o libwiringPiDev.so.$(VERSION) -lpthread $(OBJ)
++	$Q ln -sf libwiringPiDev.so.$(VERSION) libwiringPiDev.so
+ 
+ .c.o:
+ 	$Q echo [Compile] $<
+@@ -93,7 +94,7 @@ install:	$(DYNAMIC)
+ 	$Q echo "[Install Dynamic Lib]"
+ 	$Q install -m 0755 -d						$(DESTDIR)$(PREFIX)/lib
+ 	$Q install -m 0755 libwiringPiDev.so.$(VERSION)			$(DESTDIR)$(PREFIX)/lib/libwiringPiDev.so.$(VERSION)
+-	$Q ln -sf $(DESTDIR)$(PREFIX)/lib/libwiringPiDev.so.$(VERSION)	$(DESTDIR)/lib/libwiringPiDev.so
++	$Q ln -sf libwiringPiDev.so.$(VERSION)				$(DESTDIR)$(PREFIX)/lib/libwiringPiDev.so
+ 	$Q $(LDCONFIG)
+ 
+ .PHONY:	install-static
+diff --git a/gpio/Makefile b/gpio/Makefile
+index 249bb24..3aa24b7 100644
+--- a/gpio/Makefile
++++ b/gpio/Makefile
+@@ -33,10 +33,10 @@ endif
+ #DEBUG	= -g -O0
+ DEBUG	= -O2
+ CC	?= gcc
+-INCLUDE	= -I$(DESTDIR)$(PREFIX)/include
+-CFLAGS	= $(DEBUG) -Wall -Wextra $(INCLUDE) -Winline -pipe $(EXTRA_CFLAGS)
++INCLUDE	= -I../wiringPi -I../devLib
++CFLAGS	+= $(DEBUG) -Wall -Wextra $(INCLUDE) -Winline -pipe $(EXTRA_CFLAGS)
+ 
+-LDFLAGS	= -L$(DESTDIR)$(PREFIX)/lib
++LDFLAGS	= -L../wiringPi -L../devLib
+ LIBS    = -lwiringPi -lwiringPiDev -lpthread -lrt -lm -lcrypt
+ 
+ # May not need to  alter anything below this line
+@@ -52,9 +52,13 @@ version.h:	../VERSION
+ 	$Q echo Need to run newVersion above.
+ 
+ gpio:	$(OBJ)
+-	$Q echo [Link]
++	$Q echo "[Link (Dynamic)]"
+ 	$Q $(CC) -o $@ $(OBJ) $(LDFLAGS) $(LIBS)
+ 
++gpio-static: $(OBJ)
++	$Q echo "[Link (Static)]"
++	$Q $(CC) -static -o gpio $(OBJ) ../wiringPi/libwiringPi.a ../devLib/libwiringPiDev.a -lpthread
++
+ .c.o:
+ 	$Q echo [Compile] $<
+ 	$Q $(CC) -c $(CFLAGS) $< -o $@
+diff --git a/wiringPi/Makefile b/wiringPi/Makefile
+index 88fc48e..082bfaf 100644
+--- a/wiringPi/Makefile
++++ b/wiringPi/Makefile
+@@ -39,7 +39,7 @@ DEBUG	= -O2
+ CC	?= gcc
+ INCLUDE	= -I.
+ DEFS	= -D_GNU_SOURCE
+-CFLAGS	= $(DEBUG) $(DEFS) -Wformat=2 -Wall -Wextra -Winline $(INCLUDE) -pipe -fPIC $(EXTRA_CFLAGS)
++CFLAGS	+= $(DEBUG) $(DEFS) -Wformat=2 -Wall -Wextra -Winline $(INCLUDE) -pipe -fPIC $(EXTRA_CFLAGS)
+ #CFLAGS	= $(DEBUG) $(DEFS) -Wformat=2 -Wall -Wextra -Wconversion -Winline $(INCLUDE) -pipe -fPIC
+ 
+ LIBS    = -lm -lpthread -lrt -lcrypt
+@@ -77,6 +77,7 @@ static:
+ $(DYNAMIC):	$(OBJ)
+ 	$Q echo "[Link (Dynamic)]"
+ 	$Q $(CC) -shared -Wl,-soname,libwiringPi.so$(WIRINGPI_SONAME_SUFFIX) -o libwiringPi.so.$(VERSION) $(OBJ) $(LIBS)
++	$Q ln -sf libwiringPi.so.$(VERSION) libwiringPi.so
+ 
+ .c.o:
+ 	$Q echo [Compile] $<
+@@ -102,7 +103,7 @@ install:	$(DYNAMIC)
+ 	$Q echo "[Install Dynamic Lib]"
+ 	$Q install -m 0755 -d						$(DESTDIR)$(PREFIX)/lib
+ 	$Q install -m 0755 libwiringPi.so.$(VERSION)			$(DESTDIR)$(PREFIX)/lib/libwiringPi.so.$(VERSION)
+-	$Q ln -sf $(DESTDIR)$(PREFIX)/lib/libwiringPi.so.$(VERSION)	$(DESTDIR)/lib/libwiringPi.so
++	$Q ln -sf libwiringPi.so.$(VERSION)				$(DESTDIR)$(PREFIX)/lib/libwiringPi.so
+ 	$Q $(LDCONFIG)
+ 
+ .PHONY: check-deb-destdir
+-- 
+2.45.0
+
diff --git a/package/wiringpi/0002-wiringPi-wiringSerial-fix-compile-for-missing-baud-d.patch b/package/wiringpi/0002-wiringPi-wiringSerial-fix-compile-for-missing-baud-d.patch
new file mode 100644
index 0000000000..c9c4385d48
--- /dev/null
+++ b/package/wiringpi/0002-wiringPi-wiringSerial-fix-compile-for-missing-baud-d.patch
@@ -0,0 +1,47 @@
+From 1e7a7a625ca20633062406ce525b19d168c356af Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Mon, 20 Mar 2017 20:51:20 +0100
+Subject: [PATCH] wiringPi/wiringSerial: fix compile for missing baud defines
+
+For sparc-buildroot-linux-uclibc/sysroot/usr/include/asm/termbits.h
+containing:
+
+  /* These have totally bogus values and nobody uses them
+     so far. Later on we'd have to use say 0x10000x and
+     adjust CBAUD constant and drivers accordingly.
+  #define B2500000  0x00001010
+  #define B3000000  0x00001011
+  #define B3500000  0x00001012
+  #define B4000000  0x00001013  */
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ wiringPi/wiringSerial.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/wiringPi/wiringSerial.c b/wiringPi/wiringSerial.c
+index e1587ad..4ac8d1e 100644
+--- a/wiringPi/wiringSerial.c
++++ b/wiringPi/wiringSerial.c
+@@ -75,10 +75,18 @@ int serialOpen (const char *device, const int baud)
+     case 1152000:	myBaud = B1152000 ; break ;
+     case 1500000:	myBaud = B1500000 ; break ;
+     case 2000000:	myBaud = B2000000 ; break ;
++#if defined(B2500000)
+     case 2500000:	myBaud = B2500000 ; break ;
++#endif
++#if defined(B3000000)
+     case 3000000:	myBaud = B3000000 ; break ;
++#endif
++#if defined(B3500000)
+     case 3500000:	myBaud = B3500000 ; break ;
++#endif
++#if defined(B4000000)
+     case 4000000:	myBaud = B4000000 ; break ;
++#endif
+ 
+     default:
+       return -2 ;
+-- 
+2.11.0
+
diff --git a/package/wiringpi/Config.in b/package/wiringpi/Config.in
new file mode 100644
index 0000000000..11ef9825a1
--- /dev/null
+++ b/package/wiringpi/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_WIRINGPI
+	bool "wiringpi"
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
+	help
+	  wiringPi libraries (and gpio command)
+
+	  https://github.com/WiringPi/WiringPi
+
+comment "wiringpi needs a toolchain w/ threads, dynamic library, kernel headers >= 5.5"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
diff --git a/package/wiringpi/wiringpi.hash b/package/wiringpi/wiringpi.hash
new file mode 100644
index 0000000000..590d03946c
--- /dev/null
+++ b/package/wiringpi/wiringpi.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  a81219e9ea0ce08295d2fc0457c69c4df0c6d2e846cb5817ba3247f673480d55  wiringpi-3.4.tar.gz
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING.LESSER
diff --git a/package/wiringpi/wiringpi.mk b/package/wiringpi/wiringpi.mk
new file mode 100644
index 0000000000..3515634d6d
--- /dev/null
+++ b/package/wiringpi/wiringpi.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# wiringpi
+#
+################################################################################
+
+WIRINGPI_VERSION = 3.4
+WIRINGPI_SITE = $(call github,WiringPi,WiringPi,$(WIRINGPI_VERSION))
+
+WIRINGPI_LICENSE = LGPL-3.0+
+WIRINGPI_LICENSE_FILES = COPYING.LESSER
+WIRINGPI_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+WIRINGPI_DEPENDENCIES += libxcrypt
+endif
+
+define WIRINGPI_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/wiringPi all
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/devLib all
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/gpio all
+endef
+
+define WIRINGPI_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/wiringPi install DESTDIR=$(STAGING_DIR) PREFIX=/usr LDCONFIG=true
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/devLib install DESTDIR=$(STAGING_DIR) PREFIX=/usr LDCONFIG=true
+endef
+
+define WIRINGPI_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/wiringPi install DESTDIR=$(TARGET_DIR) PREFIX=/usr LDCONFIG=true
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/devLib install DESTDIR=$(TARGET_DIR) PREFIX=/usr LDCONFIG=true
+	$(INSTALL) -D -m 0755 $(@D)/gpio/gpio $(TARGET_DIR)/usr/bin/gpio
+	$(INSTALL) -D -m 0755 $(@D)/gpio/pintest $(TARGET_DIR)/usr/bin/pintest
+endef
+
+$(eval $(generic-package))
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
