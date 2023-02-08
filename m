Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D16C05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 15:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0703160E7C;
	Wed,  8 Feb 2023 15:34:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0703160E7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9-uEhxfJs9nq; Wed,  8 Feb 2023 15:34:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CDCE60EA5;
	Wed,  8 Feb 2023 15:34:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CDCE60EA5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D82B91BF36C
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 15:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B241860EA5
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 15:34:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B241860EA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f8PMDT-YGwyF for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 15:34:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE3C260E7C
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 15:34:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE3C260E7C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DB28F8470E; Wed,  8 Feb 2023 15:34:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Feb 2023 16:34:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e5a83df8da04f5854c2e248e23dea3af620954cd
X-Git-Newrev: 2a571acddd0badaf9636649d98fd095757878348
X-Patchwork-Hint: ignore
Message-Id: <20230208153425.DB28F8470E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/open-iscsi: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2a571acddd0badaf9636649d98fd095757878348
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/open-iscsi/Config.in       | 18 ++++++++++++++++++
 package/open-iscsi/open-iscsi.hash |  3 +++
 package/open-iscsi/open-iscsi.mk   | 29 +++++++++++++++++++++++++++++
 5 files changed, 52 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0bb4db81bb..0e116e92a3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2791,6 +2791,7 @@ F:	package/most/
 N:	TIAN Yuanhao <tianyuanhao3@163.com>
 F:	package/cli11/
 F:	package/libsolv/
+F:	package/open-iscsi/
 F:	package/open-isns/
 F:	package/reproc/
 F:	package/termcolor/
diff --git a/package/Config.in b/package/Config.in
index 2adfcdbb1d..511e691ed3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2408,6 +2408,7 @@ endif
 	source "package/odhcp6c/Config.in"
 	source "package/odhcploc/Config.in"
 	source "package/olsr/Config.in"
+	source "package/open-iscsi/Config.in"
 	source "package/open-lldp/Config.in"
 	source "package/open-plc-utils/Config.in"
 	source "package/openntpd/Config.in"
diff --git a/package/open-iscsi/Config.in b/package/open-iscsi/Config.in
new file mode 100644
index 0000000000..e55bbfd867
--- /dev/null
+++ b/package/open-iscsi/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_OPEN_ISCSI
+	bool "open-iscsi"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pthread
+	depends on !BR2_STATIC_LIBS # kmod
+	select BR2_PACKAGE_KMOD
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPEN_ISNS
+	select BR2_PACKAGE_UTIL_LINUX
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
index 0000000000..249253c64f
--- /dev/null
+++ b/package/open-iscsi/open-iscsi.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# open-iscsi
+#
+################################################################################
+
+OPEN_ISCSI_VERSION = 2.1.8
+OPEN_ISCSI_SITE = $(call github,open-iscsi,open-iscsi,$(OPEN_ISCSI_VERSION))
+# The COPYING file says GPL-2.0, but there is some GPL-3.0+ code as
+# well. See https://github.com/open-iscsi/open-iscsi/issues/379
+OPEN_ISCSI_LICENSE = GPL-2.0+, GPL-3.0+
+OPEN_ISCSI_LICENSE_FILES = COPYING
+OPEN_ISCSI_DEPENDENCIES = kmod open-isns openssl util-linux
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
