Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2BBC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 11:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 193FC60687;
	Sun, 11 Dec 2022 11:28:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 193FC60687
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NmNOUOBUz-Hw; Sun, 11 Dec 2022 11:28:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38A166068D;
	Sun, 11 Dec 2022 11:28:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38A166068D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5983F1BF3C2
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 11:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A89D4048F
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 11:28:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A89D4048F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x32omfsY2pkS for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 11:28:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5906A4046D
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5906A4046D
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 11:28:38 +0000 (UTC)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
 by mailout11.t-online.de (Postfix) with SMTP id 8D90E25FE4;
 Sun, 11 Dec 2022 12:28:34 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd86.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p4KVP-1dBRlx0; Sun, 11 Dec 2022 12:28:28 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:43828)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p4KVP-0002lt-1f;
 Sun, 11 Dec 2022 12:28:27 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 12:28:24 +0100
Message-Id: <20221211112824.319583-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670758108-D924D9D3-A92D0AEA/0/0 CLEAN NORMAL
X-TOI-MSGID: 413e3cee-ba98-4035-a833-24386ba2bf3d
Subject: [Buildroot] [PATCH 1/1] package/hddtemp: new package
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
Cc: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Bernd:
 - switched to actively maintained fork
 - package/Config.in: moved to "Hardware handling" (Peter)
 - added toolchain dependencies (Thomas)
 - added license hash
 - fixed build errors related to iconv and execinfo (Peter)
 - removed hook HDDTEMP_REMOVE_MAN (Thomas)
 - install hddtemp.db to target
 - added build/install _CMDS due to
   https://github.com/vitlav/hddtemp/issues/5]
---
Imho this package is still relevant despite the fact that is was removed
from Debian: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1002484
The drivetemp kernel module is only available since kernel 5.6 and nvme
support was added to the current hddtemp fork:
https://github.com/vitlav/hddtemp/commit/edcb4db5acd806010925ccf7bf58f1968cf54df3

Building this defconfig

BR2_PACKAGE_HDDTEMP=y

finished without errors:

                             arm-aarch64 [ 1/44]: OK
                   bootlin-aarch64-glibc [ 2/44]: OK
               bootlin-arcle-hs38-uclibc [ 3/44]: OK
                    bootlin-armv5-uclibc [ 4/44]: OK
                     bootlin-armv7-glibc [ 5/44]: OK
                   bootlin-armv7m-uclibc [ 6/44]: SKIPPED
                      bootlin-armv7-musl [ 7/44]: OK
                bootlin-m68k-5208-uclibc [ 8/44]: SKIPPED
               bootlin-m68k-68040-uclibc [ 9/44]: OK
             bootlin-microblazeel-uclibc [10/44]: OK
                bootlin-mipsel32r6-glibc [11/44]: OK
                   bootlin-mipsel-uclibc [12/44]: OK
                     bootlin-nios2-glibc [13/44]: OK
                 bootlin-openrisc-uclibc [14/44]: OK
        bootlin-powerpc64le-power8-glibc [15/44]: OK
           bootlin-powerpc-e500mc-uclibc [16/44]: OK
                   bootlin-riscv32-glibc [17/44]: OK
                   bootlin-riscv64-glibc [18/44]: OK
                    bootlin-riscv64-musl [19/44]: OK
                      bootlin-sh4-uclibc [20/44]: OK
                   bootlin-sparc64-glibc [21/44]: OK
                    bootlin-sparc-uclibc [22/44]: OK
                    bootlin-x86-64-glibc [23/44]: OK
                     bootlin-x86-64-musl [24/44]: OK
                   bootlin-x86-64-uclibc [25/44]: OK
                   bootlin-xtensa-uclibc [26/44]: OK
                            br-arm-basic [27/44]: OK
                    br-arm-full-nothread [28/44]: OK
                      br-arm-full-static [29/44]: SKIPPED
                   br-i386-pentium4-full [30/44]: OK
                br-i386-pentium-mmx-musl [31/44]: OK
                      br-mips64-n64-full [32/44]: OK
                 br-mips64r6-el-hf-glibc [33/44]: OK
               br-powerpc-603e-basic-cpp [34/44]: OK
               br-powerpc64-power7-glibc [35/44]: OK
                       linaro-aarch64-be [36/44]: OK
                          linaro-aarch64 [37/44]: OK
                              linaro-arm [38/44]: OK
                     sourcery-arm-armv4t [39/44]: OK
                            sourcery-arm [40/44]: OK
                     sourcery-arm-thumb2 [41/44]: OK
                         sourcery-mips64 [42/44]: OK
                           sourcery-mips [43/44]: OK
                          sourcery-nios2 [44/44]: OK
44 builds, 3 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/hddtemp/Config.in    | 17 ++++++++++++++
 package/hddtemp/hddtemp.hash |  3 +++
 package/hddtemp/hddtemp.mk   | 44 ++++++++++++++++++++++++++++++++++++
 5 files changed, 66 insertions(+)
 create mode 100644 package/hddtemp/Config.in
 create mode 100644 package/hddtemp/hddtemp.hash
 create mode 100644 package/hddtemp/hddtemp.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 6e30f50472..03ff139128 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -345,6 +345,7 @@ F:	package/glmark2/
 F:	package/gpsd/
 F:	package/gptfdisk/
 F:	package/hdparm/
+F:	package/hddtemp/
 F:	package/inih/
 F:	package/intel-gmmlib/
 F:	package/intel-mediadriver/
diff --git a/package/Config.in b/package/Config.in
index bf3ee3cc7c..cc240bf7cd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -508,6 +508,7 @@ endmenu
 	source "package/gpsd/Config.in"
 	source "package/gptfdisk/Config.in"
 	source "package/gvfs/Config.in"
+	source "package/hddtemp/Config.in"
 	source "package/hdparm/Config.in"
 	source "package/hwdata/Config.in"
 	source "package/hwloc/Config.in"
diff --git a/package/hddtemp/Config.in b/package/hddtemp/Config.in
new file mode 100644
index 0000000000..0e02252461
--- /dev/null
+++ b/package/hddtemp/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_HDDTEMP
+	bool "hddtemp"
+	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBEXECINFO if !BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	help
+	  hddtemp is a small utility that gives you the temperature of
+	  your hard drive by reading S.M.A.R.T. informations, for drives
+	  that support this feature.
+
+	  https://github.com/vitlav/hddtemp
+	  http://www.guzu.net/linux/hddtemp.php
+
+comment "hddtemp needs dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS
diff --git a/package/hddtemp/hddtemp.hash b/package/hddtemp/hddtemp.hash
new file mode 100644
index 0000000000..cd82d7f89b
--- /dev/null
+++ b/package/hddtemp/hddtemp.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  592322c64f0d5f035132249e3d051b752f5d24867514522a17285d5e72d21075  hddtemp-0.4.3.tar.gz
+sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  GPL-2
diff --git a/package/hddtemp/hddtemp.mk b/package/hddtemp/hddtemp.mk
new file mode 100644
index 0000000000..ac93a4ed25
--- /dev/null
+++ b/package/hddtemp/hddtemp.mk
@@ -0,0 +1,44 @@
+################################################################################
+#
+# hddtemp
+#
+################################################################################
+
+HDDTEMP_VERSION = 0.4.3
+HDDTEMP_SITE = $(call github,vitlav,hddtemp,v$(HDDTEMP_VERSION))
+HDDTEMP_LICENSE = GPLv2
+HDDTEMP_LICENSE_FILES = GPL-2
+# Fetched from Github with no configure script
+HDDTEMP_AUTORECONF = YES
+# needed for autoreconf
+HDDTEMP_DEPENDENCIES = host-gettext
+HDDTEMP_CONF_ENV = LIBS="$(HDDTEMP_LIBS)"
+
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+HDDTEMP_DEPENDENCIES += libexecinfo
+HDDTEMP_LIBS += -lexecinfo
+endif
+
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+HDDTEMP_DEPENDENCIES += libiconv
+HDDTEMP_LIBS += -liconv
+endif
+
+# prevent loop in po/ while building
+define HDDTEMP_BUILD_CMDS
+	cd $(@D)/src; \
+		$(TARGET_MAKE_ENV) $(MAKE)
+endef
+
+# prevent loop in po/ while building
+define HDDTEMP_INSTALL_TARGET_CMDS
+	cd $(@D)/src; \
+		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) install
+endef
+
+define HDDTEMP_INSTALL_HDDTEMP_DB
+	$(INSTALL) -D $(@D)/data/hddtemp.db $(TARGET_DIR)/usr/share/misc/hddtemp.db
+endef
+HDDTEMP_POST_INSTALL_TARGET_HOOKS += HDDTEMP_INSTALL_HDDTEMP_DB
+
+$(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
