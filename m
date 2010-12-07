From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Tue, 07 Dec 2010 10:05:32 +0100
Subject: [Buildroot] [PATCH v2] New package: sdparm
Message-ID: <4CFDF8DC.9040604@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add utility to accesses SCSI device parameters.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Index: b/package/sdparm/Config.in
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ b/package/sdparm/Config.in	2010-12-07 09:36:58.000000000 +0100
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_SDPARM
+	bool "sdparm"
+	help
+	  Utility to accesses SCSI device parameters.
+
+	  http://sg.danny.cz/sg/sdparm.html
Index: b/package/sdparm/sdparm.mk
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ b/package/sdparm/sdparm.mk	2010-12-07 09:37:26.000000000 +0100
@@ -0,0 +1,5 @@
+SDPARM_VERSION = 1.06
+SDPARM_SOURCE = sdparm-$(SDPARM_VERSION).tgz
+SDPARM_SITE = http://sg.danny.cz/sg/p/
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
