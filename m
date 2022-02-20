Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC6F9C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 14:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 727BC40509;
	Sun, 20 Feb 2022 14:21:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l0W-87YAmlgQ; Sun, 20 Feb 2022 14:21:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95D40404CF;
	Sun, 20 Feb 2022 14:20:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 853241BF403
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 14:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 732FE404CF
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 14:20:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VrrgWiTCitpQ for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 14:20:55 +0000 (UTC)
X-Greylist: delayed 00:12:34 by SQLgrey-1.8.0
Received: from mxd2.seznam.cz (mxd2.seznam.cz [IPv6:2a02:598:2::210])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 05B92404CA
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 14:20:54 +0000 (UTC)
Received: from email.seznam.cz
 by email-smtpc12a.ng.seznam.cz (email-smtpc12a.ng.seznam.cz [10.23.11.105])
 id 44d97b38c43e11a546ad4556; Sun, 20 Feb 2022 15:20:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz; s=beta;
 t=1645366853; bh=yPiAyGbeaxs8Zqs1mL2hyB3+rES1x1uDF+xrGEM8Zc0=;
 h=Received:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
 Content-Type:Content-Disposition:X-szn-frgn:X-szn-frgc;
 b=M46wpblVylwAYMuIiGB9ZMBrGLJJCtY7w1at1vPogEbvKIECfwE1U6G5WaHLALueG
 ZLOZEdjBUk2tAJntyjl25AbbeHxMxu4wUP3dwb7cLZHmtB/HYndrjKdMniLSFGIcUU
 TroX9qdioQyZ1CHhso6RnJij986stbLI/+SZ63n4=
Received: from arch-zen.localdomain (havhav.seb.rev-fortech.cz [213.250.223.2])
 by email-relay15.ng.seznam.cz (Seznam SMTPD 1.3.136) with ESMTP;
 Sun, 20 Feb 2022 15:08:15 +0100 (CET)  
Date: Sun, 20 Feb 2022 15:08:11 +0100
From: Jan Havran <havran.jan@email.cz>
To: buildroot@buildroot.org
Message-ID: <YhJLS73VW3szIXR+@arch-zen.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
X-szn-frgn: <98d503db-e841-4d92-8591-48cefb6f51db>
X-szn-frgc: <0>
Subject: [Buildroot] [PATCH 1/1] package/rtklib: new package
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
Cc: Jan Havran <havran.jan@email.cz>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RTKLIB is an open source program package for standard and precise
positioning with GNSS.

Version used here is from rtkexplorer, which is better optimized
and more frequently updated than original version by Tomoji Takasu.

Signed-off-by: Jan Havran <havran.jan@email.cz>
---
 DEVELOPERS                 |  3 +++
 package/Config.in          |  1 +
 package/rtklib/Config.in   | 38 ++++++++++++++++++++++++++++++++++++++
 package/rtklib/rtklib.hash |  3 +++
 package/rtklib/rtklib.mk   | 31 +++++++++++++++++++++++++++++++
 5 files changed, 76 insertions(+)
 create mode 100644 package/rtklib/Config.in
 create mode 100644 package/rtklib/rtklib.hash
 create mode 100644 package/rtklib/rtklib.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 91e9060ac5..8d7eb2c268 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1356,6 +1356,9 @@ F:	package/pangomm/
 F:	package/rpm/
 F:	package/yad/
 
+N:	Jan Havran <havran.jan@email.cz>
+F:	package/rtklib/
+
 N:	Jan Heylen <jan.heylen@nokia.com>
 F:	package/opentracing-cpp/
 
diff --git a/package/Config.in b/package/Config.in
index 9a8196efe2..b38c33d543 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -561,6 +561,7 @@ endmenu
 	source "package/rpi-userland/Config.in"
 	source "package/rs485conf/Config.in"
 	source "package/rtc-tools/Config.in"
+	source "package/rtklib/Config.in"
 	source "package/rtl8188eu/Config.in"
 	source "package/rtl8189es/Config.in"
 	source "package/rtl8189fs/Config.in"
diff --git a/package/rtklib/Config.in b/package/rtklib/Config.in
new file mode 100644
index 0000000000..dc694d6b7d
--- /dev/null
+++ b/package/rtklib/Config.in
@@ -0,0 +1,38 @@
+comment "rtklib needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_RTKLIB
+	bool "rtklib"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  RTKLIB is an open source program package for standard and
+	  precise positioning with GNSS (global navigation satellite
+	  system).
+
+	  This is a version of RTKLIB optimized for single and dual
+	  frequency low cost GPS receivers, especially u-blox receivers.
+
+	  https://rtkexplorer.com/
+
+if BR2_PACKAGE_RTKLIB
+
+config BR2_PACKAGE_RTKLIB_CONVBIN
+	bool "convbin"
+
+config BR2_PACKAGE_RTKLIB_POS2KML
+	bool "pos2kml"
+
+comment "rnx2rtkp needs Fortran"
+	depends on !BR2_TOOLCHAIN_HAS_FORTRAN
+
+config BR2_PACKAGE_RTKLIB_RNX2RTKP
+	bool "rnx2rtkp"
+	depends on BR2_TOOLCHAIN_HAS_FORTRAN
+
+config BR2_PACKAGE_RTKLIB_RTKRCV
+	bool "rtkrcv"
+
+config BR2_PACKAGE_RTKLIB_STR2STR
+	bool "str2str"
+
+endif
diff --git a/package/rtklib/rtklib.hash b/package/rtklib/rtklib.hash
new file mode 100644
index 0000000000..faed92243b
--- /dev/null
+++ b/package/rtklib/rtklib.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  735d43939ae08b0da64d75afe5750bc983032144c5622e620eee987508946fc5  rtklib-b34e.tar.gz
+sha256  219747832d49ee958457b2934080ab8d94bd9d8e45fcb1c36f89776fd2c5ed8a  license.txt
diff --git a/package/rtklib/rtklib.mk b/package/rtklib/rtklib.mk
new file mode 100644
index 0000000000..421cdddfcd
--- /dev/null
+++ b/package/rtklib/rtklib.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# rtklib
+#
+################################################################################
+
+RTKLIB_VERSION = b34e
+RTKLIB_SITE = $(call github,rtklibexplorer,RTKLIB,$(RTKLIB_VERSION))
+RTKLIB_LICENSE = BSD-2-Clause
+RTKLIB_LICENSE_FILES = license.txt
+
+RTKLIB_APPS += $(if $(BR2_PACKAGE_RTKLIB_CONVBIN),convbin,)
+RTKLIB_APPS += $(if $(BR2_PACKAGE_RTKLIB_POS2KML),pos2kml,)
+RTKLIB_APPS += $(if $(BR2_PACKAGE_RTKLIB_RNX2RTKP),rnx2rtkp,)
+RTKLIB_APPS += $(if $(BR2_PACKAGE_RTKLIB_RTKRCV),rtkrcv,)
+RTKLIB_APPS += $(if $(BR2_PACKAGE_RTKLIB_STR2STR),str2str,)
+
+define RTKLIB_BUILD_CMDS
+	for APP in $(RTKLIB_APPS); do \
+		cd $(@D)/app/consapp/$$APP/gcc ; \
+		$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CCFLAGS="$(TARGET_CFLAGS) $(TARGET_LDFLAGS)" ; \
+	done
+endef
+
+define RTKLIB_INSTALL_TARGET_CMDS
+	for APP in $(RTKLIB_APPS); do \
+		$(INSTALL) -m 0755 $(@D)/app/consapp/$$APP/gcc/$$APP $(TARGET_DIR)/usr/bin/$$APP ; \
+	done
+endef
+
+$(eval $(generic-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
