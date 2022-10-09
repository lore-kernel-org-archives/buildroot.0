Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287F0C433FE
	for <buildroot@archiver.kernel.org>; Sun,  9 Oct 2022 11:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 887C260D5F;
	Sun,  9 Oct 2022 11:15:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 887C260D5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B-k0nsCSOqhC; Sun,  9 Oct 2022 11:15:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A6F160B6F;
	Sun,  9 Oct 2022 11:15:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A6F160B6F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 80E031BF57C
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 11:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A15D8195D
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 11:15:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A15D8195D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8IE7mkVapGf9 for <buildroot@lists.busybox.net>;
 Sun,  9 Oct 2022 11:15:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 772C2818AC
Received: from m12-12.163.com (m12-12.163.com [220.181.12.12])
 by smtp1.osuosl.org (Postfix) with ESMTP id 772C2818AC
 for <buildroot@buildroot.org>; Sun,  9 Oct 2022 11:15:13 +0000 (UTC)
Received: from localhost.localdomain (unknown [123.185.181.72])
 by smtp8 (Coremail) with SMTP id DMCowADXKdg0rUJj1I4lgA--.36559S2;
 Sun, 09 Oct 2022 19:15:01 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Date: Sun,  9 Oct 2022 04:14:23 -0700
Message-Id: <20221009111423.7654-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220926154320.35494-1-tianyuanhao3@163.com>
References: <20220926154320.35494-1-tianyuanhao3@163.com>
MIME-Version: 1.0
X-CM-TRANSID: DMCowADXKdg0rUJj1I4lgA--.36559S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGrWUKr15uF48tr47Aw1fJFb_yoWrXFWrpr
 47Gw15Gw4xKFn3KrWfKFnFqr4a9rs3ur4UGasrG348try5JF1xXry7Ja1IkFZrJr1DAw4U
 Xw4kuw4jgrW7taDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUkrc3UUUUU=
X-Originating-IP: [123.185.181.72]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/1tbiGhaVjVaEDEeb7gAAs4
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=wBkIi
 yo9J627zvqFYPnrXIf8j4Kw2KHZUxMud6fQ3pY=; b=Dl/jZqgwzjxBl3e+job8i
 Q0bGBY8eAov3N4MRel2Bx0YVbF538kNVxWH2FfM9rAWuZuanae5tHpWpiTA98fvq
 bWPWgKT5hUnX2S2QlE/IxZ7Mc6RcyGvk+zt+hOmb3UQNBg3xkSbBKf9EMO4jx9HF
 jQq/sFOG2f9FetOETERtig=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=163.com header.i=@163.com
 header.a=rsa-sha256 header.s=s110527 header.b=Dl/jZqgw
Subject: [Buildroot] [PATCH v2 1/1] package/open-iscsi: new package
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

Changes in v2:
- Remove installation logic (suggested by Thomas)

While I think a lot of unnecessary stuff is installed, we still have a
working iSCSI agent.
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/open-iscsi/Config.in       | 19 +++++++++++++++++++
 package/open-iscsi/open-iscsi.hash |  3 +++
 package/open-iscsi/open-iscsi.mk   | 27 +++++++++++++++++++++++++++
 5 files changed, 51 insertions(+)
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
index 0000000000..04ec120e9a
--- /dev/null
+++ b/package/open-iscsi/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_OPEN_ISCSI
+	bool "open-iscsi"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pthread
+	depends on !BR2_STATIC_LIBS # kmod
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPEN_ISNS
+	select BR2_PACKAGE_KMOD
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
+	help
+	  iSCSI tools for Linux.
+
+	  https://www.open-iscsi.com
+
+comment "open-iscsi needs a toolchain w/ threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/open-iscsi/open-iscsi.hash b/package/open-iscsi/open-iscsi.hash
new file mode 100644
index 0000000000..9fd651cae8
--- /dev/null
+++ b/package/open-iscsi/open-iscsi.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  9565bdf6b68b223e1e0d455d9a04d7536724a3f5b5a254e9398d06b2a0c6b6d2  open-iscsi-2.1.8.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/open-iscsi/open-iscsi.mk b/package/open-iscsi/open-iscsi.mk
new file mode 100644
index 0000000000..4bbd96f591
--- /dev/null
+++ b/package/open-iscsi/open-iscsi.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# open-iscsi
+#
+################################################################################
+
+OPEN_ISCSI_VERSION = 2.1.8
+OPEN_ISCSI_SITE = $(call github,open-iscsi,open-iscsi,$(OPEN_ISCSI_VERSION))
+OPEN_ISCSI_LICENSE = GPL-2.0+
+OPEN_ISCSI_LICENSE_FILES = COPYING
+OPEN_ISCSI_DEPENDENCIES = kmod open-isns openssl util-linux-libs
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
