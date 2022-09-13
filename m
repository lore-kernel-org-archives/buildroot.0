Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99AE6C54EE9
	for <buildroot@archiver.kernel.org>; Tue, 13 Sep 2022 07:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0946A4020B;
	Tue, 13 Sep 2022 07:01:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0946A4020B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 053coRdLSdWq; Tue, 13 Sep 2022 07:01:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D65A40443;
	Tue, 13 Sep 2022 07:01:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D65A40443
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9FAFE1BF2A3
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 07:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 792E840337
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 07:00:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 792E840337
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P9bi0C2OGBC4 for <buildroot@lists.busybox.net>;
 Tue, 13 Sep 2022 07:00:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C0974032C
Received: from m12-12.163.com (m12-12.163.com [220.181.12.12])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C0974032C
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 07:00:53 +0000 (UTC)
Received: from localhost.localdomain (unknown [123.185.180.101])
 by smtp8 (Coremail) with SMTP id DMCowADHUqSYKiBjIT7Pag--.51876S2;
 Tue, 13 Sep 2022 15:00:42 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Date: Tue, 13 Sep 2022 00:00:08 -0700
Message-Id: <20220913070008.1036079-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: DMCowADHUqSYKiBjIT7Pag--.51876S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGFWfWryUtr4ruF43uF1Dtrb_yoW7Jr17pa
 13W3Z8Gw4kKFnakrWfKrnF9r43Cr4kur4DJ3srG3yjqrW5AFy8Xr1Dta17Cr47XrW7Aw4U
 Zr4ruFyUWrWUtaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUh0ePUUUUU=
X-Originating-IP: [123.185.180.101]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/1tbiXBp7jVXl4KasSAAAsi
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=+nqYM
 6xgODGLCMyPTsQCWrRf8wkCQkgeb5O7u+QG5Ag=; b=AolbJHf1DGCcMwQrCzcf2
 PjjxhFqLn4aB7dmR+o/vD+rtL8SIgLbMljDaRh+P6Qs8vRDviHNuq3mGMfT7YLAZ
 et+G2T/A4T95Ty7SBXWTn8t64EVvesgsKBUfQI0GugiQgk1GTLHEAJtYM+n+4n0B
 rbVfNwX7RS9iwj3BDXASh0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=163.com header.i=@163.com
 header.a=rsa-sha256 header.s=s110527 header.b=AolbJHf1
Subject: [Buildroot] [PATCH v2 1/1] package/open-isns: new package
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
Cc: TIAN Yuanhao <tianyuanhao3@163.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>

---

Changes in v2:
- LGPL-2.1+
- Shorter install commands
---
 DEVELOPERS                       |  3 ++
 package/Config.in                |  1 +
 package/open-isns/Config.in      | 20 +++++++++++
 package/open-isns/open-isns.hash |  3 ++
 package/open-isns/open-isns.mk   | 59 ++++++++++++++++++++++++++++++++
 5 files changed, 86 insertions(+)
 create mode 100644 package/open-isns/Config.in
 create mode 100644 package/open-isns/open-isns.hash
 create mode 100644 package/open-isns/open-isns.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d2bd0d809a..54216450f4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2790,6 +2790,9 @@ F:	package/python-influxdb/
 N:	Sven Oliver Moll <svolli@svolli.de>
 F:	package/most/
 
+N:	TIAN Yuanhao <tianyuanhao3@163.com>
+F:	package/open-isns/
+
 N:	Theo Debrouwere <t.debrouwere@televic.com>
 F:	board/beagleboardx15/
 F:	configs/beagleboardx15_defconfig
diff --git a/package/Config.in b/package/Config.in
index d1c098c48f..de51be400b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1919,6 +1919,7 @@ menu "Networking"
 	source "package/nss-myhostname/Config.in"
 	source "package/nss-pam-ldapd/Config.in"
 	source "package/omniorb/Config.in"
+	source "package/open-isns/Config.in"
 	source "package/open62541/Config.in"
 	source "package/openldap/Config.in"
 	source "package/openmpi/Config.in"
diff --git a/package/open-isns/Config.in b/package/open-isns/Config.in
new file mode 100644
index 0000000000..d3f391342a
--- /dev/null
+++ b/package/open-isns/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_OPEN_ISNS
+	bool "open-isns (libisns)"
+	depends on BR2_USE_MMU # fork()
+	help
+	  iSNS server and client for Linux.
+
+	  Note that this option only installs the libraries, and not the
+	  programs.
+
+	  https://github.com/open-iscsi/open-isns
+
+if BR2_PACKAGE_OPEN_ISNS
+
+config BR2_PACKAGE_OPEN_ISNS_PROGS
+	bool "open-isns programs"
+	help
+	  This option tells open-isns to not only install the libraries,
+	  but also the programs.
+
+endif
diff --git a/package/open-isns/open-isns.hash b/package/open-isns/open-isns.hash
new file mode 100644
index 0000000000..653fabaa9f
--- /dev/null
+++ b/package/open-isns/open-isns.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  9611344733c0cdf14395f60880950ea4c3c7d6b765565b6493ad3e1afbe216de  open-isns-0.102.tar.gz
+sha256  00a89b0d18aacd4114decf79122db87bf35bddaf2bc50e383c9c9f4c263390b2  COPYING
diff --git a/package/open-isns/open-isns.mk b/package/open-isns/open-isns.mk
new file mode 100644
index 0000000000..3db1271d4e
--- /dev/null
+++ b/package/open-isns/open-isns.mk
@@ -0,0 +1,59 @@
+################################################################################
+#
+# open-isns
+#
+################################################################################
+
+OPEN_ISNS_VERSION = 0.102
+OPEN_ISNS_SITE = $(call github,open-iscsi,open-isns,v$(OPEN_ISNS_VERSION))
+OPEN_ISNS_LICENSE = LGPL-2.1+
+OPEN_ISNS_LICENSE_FILES = COPYING
+OPEN_ISNS_INSTALL_STAGING = YES
+
+OPEN_ISNS_CONF_OPTS = -Dslp=disabled
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+OPEN_ISNS_DEPENDENCIES += openssl
+OPEN_ISNS_CONF_OPTS += -Dsecurity=enabled
+else
+OPEN_ISNS_CONF_OPTS += -Dsecurity=disabled
+endif
+
+define OPEN_ISNS_INSTALL_STAGING_CMDS
+	$(INSTALL) -d -m 755 $(STAGING_DIR)/usr/{include/libisns,lib}
+	$(INSTALL) -m 644 -t $(STAGING_DIR)/usr/include/libisns \
+		$(@D)/{,build/}include/libisns/*.h
+	cp -dpf $(if $(BR2_STATIC_LIBS),$(@D)/build/libisns.a,$(@D)/build/libisns.so{,.0}) \
+		$(STAGING_DIR)/usr/lib/
+	$(INSTALL) -D -m 644 {$(@D),$(STAGING_DIR)/usr/lib/pkgconfig}/libisns.pc
+endef
+
+define OPEN_ISNS_INSTALL_TARGET_CMDS
+	$(OPEN_ISNS_INSTALL_LIBS)
+	$(OPEN_ISNS_INSTALL_PROGS)
+endef
+
+ifeq ($(BR2_STATIC_LIBS),)
+define OPEN_ISNS_INSTALL_LIBS
+	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/lib
+	cp -dpf $(@D)/build/libisns.so{,.0} $(TARGET_DIR)/usr/lib/
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_OPEN_ISNS_PROGS),y)
+define OPEN_ISNS_INSTALL_PROGS
+	$(INSTALL) -d -m 755 $(TARGET_DIR)/{etc/isns,usr/sbin}
+	$(INSTALL) -d -m 700 $(TARGET_DIR)/var/lib/isns
+	$(INSTALL) -m 555 -t $(TARGET_DIR)/usr/sbin \
+		$(@D)/build/{isnsadm,isnsd,isnsdd}
+	$(INSTALL) -m 644 -t $(TARGET_DIR)/etc/isns $(@D)/etc/*.conf
+endef
+
+define OPEN_ISNS_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/lib/systemd/system
+	$(INSTALL) -m 644 -t $(TARGET_DIR)/usr/lib/systemd/system \
+		$(@D)/isnsd.{service,socket}
+endef
+endif
+
+$(eval $(meson-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
