Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B35C07E9D
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 15:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85C1A40BC2;
	Mon, 26 Sep 2022 15:59:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85C1A40BC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1XHDjQnuaOKg; Mon, 26 Sep 2022 15:59:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72448408A3;
	Mon, 26 Sep 2022 15:59:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72448408A3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D76E1BF25F
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 15:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05897416F1
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 15:59:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05897416F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QdJgZ0GdXU9W for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 15:59:14 +0000 (UTC)
X-Greylist: delayed 00:15:08 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46D3A4097D
Received: from m12-11.163.com (m12-11.163.com [220.181.12.11])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46D3A4097D
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 15:59:12 +0000 (UTC)
Received: from localhost.localdomain (unknown [123.185.16.28])
 by smtp7 (Coremail) with SMTP id C8CowABHxm65yDFjefvIHQ--.19219S2;
 Mon, 26 Sep 2022 23:43:55 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Date: Mon, 26 Sep 2022 08:43:20 -0700
Message-Id: <20220926154320.35494-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: C8CowABHxm65yDFjefvIHQ--.19219S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxKF4Utry3Kw47Gw4kJrykuFg_yoW7uF4kpF
 47Ww15Gw48Kr1fKrWfKF9Fgr4a9rs8u3yUGasrXw18try5JryIqryDta1IkrZrAw4DAw4U
 Xrs5W3yjg3yxt3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUkcTkUUUUU=
X-Originating-IP: [123.185.16.28]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/1tbiGhuIjVaEC8OwfQAAsT
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=QWa2B
 JUExLEF59cn46Y5pLqWGVR84yyg0XNb/CFUkXA=; b=JgcJ6jZk9vU23PMEPVnfP
 1rHCpchr7ejQsD7qqZG0pNTvJrccJLY12iDLpNsEuA0tov3S4++/RZrWgWvl1T61
 NZd8tEAgy1+AvKfdppoajjVPrGXcB2dRvzNzJtMxt7IN50utlX3hMx+bzoAQp786
 pExCRCpI6brDuiBDcdhpD8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=163.com header.i=@163.com
 header.a=rsa-sha256 header.s=s110527 header.b=JgcJ6jZk
Subject: [Buildroot] [PATCH 1/1] package/open-iscsi: new package
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
Cc: TIAN Yuanhao <tianyuanhao3@163.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/open-iscsi/Config.in       | 38 +++++++++++++++++
 package/open-iscsi/open-iscsi.hash |  3 ++
 package/open-iscsi/open-iscsi.mk   | 68 ++++++++++++++++++++++++++++++
 5 files changed, 111 insertions(+)
 create mode 100644 package/open-iscsi/Config.in
 create mode 100644 package/open-iscsi/open-iscsi.hash
 create mode 100644 package/open-iscsi/open-iscsi.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 54216450f4..7a698c31c0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2791,6 +2791,7 @@ N:	Sven Oliver Moll <svolli@svolli.de>
 F:	package/most/
 
 N:	TIAN Yuanhao <tianyuanhao3@163.com>
+F:	package/open-iscsi/
 F:	package/open-isns/
 
 N:	Theo Debrouwere <t.debrouwere@televic.com>
diff --git a/package/Config.in b/package/Config.in
index de51be400b..dacc317132 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2357,6 +2357,7 @@ endif
 	source "package/odhcp6c/Config.in"
 	source "package/odhcploc/Config.in"
 	source "package/olsr/Config.in"
+	source "package/open-iscsi/Config.in"
 	source "package/open-lldp/Config.in"
 	source "package/open-plc-utils/Config.in"
 	source "package/openntpd/Config.in"
diff --git a/package/open-iscsi/Config.in b/package/open-iscsi/Config.in
new file mode 100644
index 0000000000..b13c518439
--- /dev/null
+++ b/package/open-iscsi/Config.in
@@ -0,0 +1,38 @@
+config BR2_PACKAGE_OPEN_ISCSI
+	bool "open-iscsi"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pthread
+	depends on !BR2_STATIC_LIBS # kmod
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPEN_ISCSI_ISCSISTART \
+		if !BR2_PACKAGE_OPEN_ISCSI_ISCSID
+	select BR2_PACKAGE_KMOD
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
+	help
+	  iSCSI tools for Linux.
+
+	  https://www.open-iscsi.com
+
+if BR2_PACKAGE_OPEN_ISCSI
+
+config BR2_PACKAGE_OPEN_ISCSI_ISCSID
+	bool "iscsid"
+	default y
+	select BR2_PACKAGE_OPEN_ISNS
+	help
+	  iscsid implements the control path of iSCSI protocol, plus
+	  some management facilities.
+
+config BR2_PACKAGE_OPEN_ISCSI_ISCSISTART
+	bool "iscsistart"
+	help
+	  iscsistart is used for attaching to iSCSI targets during
+	  bootup.
+
+endif
+
+comment "open-iscsi needs a toolchain w/ threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/open-iscsi/open-iscsi.hash b/package/open-iscsi/open-iscsi.hash
new file mode 100644
index 0000000000..ee6b0d41ce
--- /dev/null
+++ b/package/open-iscsi/open-iscsi.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  f5d038583657030345711d50b6d8095a0f2da5076bfe7035d64a2beba53405e8  open-iscsi-f633c09a7a2976069b1dfd98d9979349e92c38b5.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/open-iscsi/open-iscsi.mk b/package/open-iscsi/open-iscsi.mk
new file mode 100644
index 0000000000..d777101824
--- /dev/null
+++ b/package/open-iscsi/open-iscsi.mk
@@ -0,0 +1,68 @@
+################################################################################
+#
+# open-iscsi
+#
+################################################################################
+
+OPEN_ISCSI_VERSION = f633c09a7a2976069b1dfd98d9979349e92c38b5
+OPEN_ISCSI_SITE = $(call github,open-iscsi,open-iscsi,$(OPEN_ISCSI_VERSION))
+OPEN_ISCSI_LICENSE = GPL-2.0+
+OPEN_ISCSI_LICENSE_FILES = COPYING
+OPEN_ISCSI_DEPENDENCIES = kmod openssl util-linux-libs
+
+OPEN_ISCSI_CONF_OPTS = -Ddbroot=/var/lib/iscsi
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+OPEN_ISCSI_DEPENDENCIES += systemd
+OPEN_ISCSI_CONF_OPTS += -Dno_systemd=false
+else
+OPEN_ISCSI_CONF_OPTS += -Dno_systemd=true
+endif
+
+ifeq ($(BR2_PACKAGE_OPEN_ISNS),)
+define OPEN_ISCSI_DISABLE_ISNS
+	$(SED) "/'isns'/s/^/#/" $(@D)/meson.build
+	$(SED) "/'iscsid'/s/^/#/" $(@D)/usr/meson.build
+	$(SED) "/'iscsiadm'/s/^/#/" $(@D)/usr/meson.build
+endef
+OPEN_ISCSI_PRE_CONFIGURE_HOOKS += OPEN_ISCSI_DISABLE_ISNS
+else
+OPEN_ISCSI_DEPENDENCIES += open-isns
+endif
+
+define OPEN_ISCSI_INSTALL_TARGET_CMDS
+	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/lib
+	cp -dpf $(@D)/build/libopeniscsiusr.so{,.0,.0.2.0} \
+		$(TARGET_DIR)/usr/lib/
+	$(OPEN_ISCSI_INSTALL_ISCSID)
+	$(OPEN_ISCSI_INSTALL_ISCSISTART)
+endef
+
+ifeq ($(BR2_PACKAGE_OPEN_ISCSI_ISCSID),y)
+define OPEN_ISCSI_INSTALL_ISCSID
+	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/sbin
+	$(INSTALL) -m 755 -t $(TARGET_DIR)/usr/sbin \
+		$(@D)/build/{iscsi-iname,iscsiadm,iscsid}
+	$(INSTALL) -D -m 644 {$(@D)/etc,$(TARGET_DIR)/etc/iscsi}/iscsid.conf
+endef
+
+define OPEN_ISCSI_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/lib/systemd/system
+	$(INSTALL) -m 644 -t $(TARGET_DIR)/usr/lib/systemd/system \
+		$(@D)/build/{iscsi,iscsi-init,iscsid}.service \
+		$(@D)/etc/systemd/iscsid.socket
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_OPEN_ISCSI_ISCSISTART),y)
+define OPEN_ISCSI_INSTALL_ISCSISTART
+	$(INSTALL) -D -m 755 {$(@D)/build,$(TARGET_DIR)/usr/sbin}/iscsistart
+endef
+endif
+
+define OPEN_ISCSI_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_SCSI_LOWLEVEL)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_ISCSI_TCP)
+endef
+
+$(eval $(meson-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
