From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Mon, 06 Dec 2010 11:58:33 +0100
Subject: [Buildroot] [PATCH] New package: sdparm
Message-ID: <4CFCC1D9.8070209@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add utility to accesses SCSI device parameters.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Index: b/package/sdparm/Config.in
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ b/package/sdparm/Config.in	2010-12-06 11:14:41.000000000 +0100
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_SDPARM
+	bool "sdparm"
+	help
+	  Utility to accesses SCSI device parameters.
Index: b/package/sdparm/sdparm.mk
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ b/package/sdparm/sdparm.mk	2010-12-06 08:33:16.000000000 +0100
@@ -0,0 +1,7 @@
+SDPARM_VERSION = 1.06
+SDPARM_SOURCE = sdparm-$(SDPARM_VERSION).tgz
+SDPARM_SITE = http://sg.danny.cz/sg/p/
+SDPARM_INSTALL_STAGING = NO
+SDPARM_INSTALL_TARGET = YES
+
+$(eval $(call AUTOTARGETS,package,sdparm))
Index: b/package/Config.in
===================================================================
--- a/package/Config.in	2010-11-08 12:09:05.000000000 +0100
+++ b/package/Config.in	2010-12-03 17:37:41.000000000 +0100
@@ -184,6 +184,7 @@
 source "package/ntfsprogs/Config.in"
 source "package/pciutils/Config.in"
 source "package/rng-tools/Config.in"
+source "package/sdparm/Config.in"
 source "package/setserial/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 # busybox has fdisk
