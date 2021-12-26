Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA39C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 23:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1180C40298;
	Sun, 26 Dec 2021 23:08:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0_vHol0aZKY4; Sun, 26 Dec 2021 23:08:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E439A4049D;
	Sun, 26 Dec 2021 23:08:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 719D91BF324
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 23:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6084260E14
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 23:08:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1SfgayKSoVTS for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 23:08:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8CDA460D4D
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 23:08:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BD52782B46; Sun, 26 Dec 2021 23:02:53 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 00:08:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 47913a504b9122ea17542ebacbc7796c6e62e054
X-Git-Newrev: 3f9f84b6ba751c987b6de164c67501b494949d04
X-Patchwork-Hint: ignore
Message-Id: <20211226230253.BD52782B46@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cfm: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=3f9f84b6ba751c987b6de164c67501b494949d04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS              |  1 +
 package/Config.in       |  1 +
 package/cfm/Config.in   | 17 +++++++++++++++
 package/cfm/S65cfm      | 55 +++++++++++++++++++++++++++++++++++++++++++++++++
 package/cfm/cfm.hash    |  3 +++
 package/cfm/cfm.mk      | 23 +++++++++++++++++++++
 package/cfm/cfm.service | 10 +++++++++
 7 files changed, 110 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0359a4832f..7f8459dab7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1178,6 +1178,7 @@ F:	package/gmrender-resurrect/
 F:	package/squeezelite/
 
 N:	Horatiu Vultur <horatiu.vultur@microchip.com>
+F:	package/cfm/
 F:	package/easyframes/
 F:	package/mrp/
 
diff --git a/package/Config.in b/package/Config.in
index bcb23132c9..6fd79d2772 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2149,6 +2149,7 @@ endif
 	source "package/can-utils/Config.in"
 	source "package/cannelloni/Config.in"
 	source "package/casync/Config.in"
+	source "package/cfm/Config.in"
 	source "package/chrony/Config.in"
 	source "package/civetweb/Config.in"
 	source "package/connman/Config.in"
diff --git a/package/cfm/Config.in b/package/cfm/Config.in
new file mode 100644
index 0000000000..1c2e92be67
--- /dev/null
+++ b/package/cfm/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_CFM
+	bool "cfm"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
+	select BR2_PACKAGE_LIBEV
+	select BR2_PACKAGE_LIBMNL
+	select BR2_PACKAGE_LIBNL
+	help
+	  This is the userspace application that configures the kernel
+	  to run CFM protocol. The userspace application is made of 2
+	  applications, one daemon and a client.
+
+	  https://github.com/microchip-ung/cfm
+
+comment "cfm needs a toolchain w/ threads, kernel headers >= 5.0"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
diff --git a/package/cfm/S65cfm b/package/cfm/S65cfm
new file mode 100644
index 0000000000..1019268608
--- /dev/null
+++ b/package/cfm/S65cfm
@@ -0,0 +1,55 @@
+#!/bin/sh
+#
+# Start cfm
+#
+
+DAEMON="cfm_server"
+
+PIDFILE="/var/run/$DAEMON.pid"
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/cfm_server" ] && . "/etc/default/cfm_server"
+
+start() {
+	printf "Starting cfm daemon: "
+	start-stop-daemon -S -b -q -m -p $PIDFILE \
+		-x /usr/bin/$DAEMON
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return $status
+}
+
+stop() {
+	printf "Stopping cfm daemon: "
+	start-stop-daemon -K -q -p $PIDFILE
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		rm -f "$PIDFILE"
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return $status
+}
+
+case "$1" in
+  start)
+	start
+	;;
+  stop)
+	stop
+	;;
+  restart|reload)
+	stop
+	start
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/cfm/cfm.hash b/package/cfm/cfm.hash
new file mode 100644
index 0000000000..a1805d81be
--- /dev/null
+++ b/package/cfm/cfm.hash
@@ -0,0 +1,3 @@
+# locally calculated
+sha256  b5ce096e8c496c397d108201f1a46855f735da6c4163b7a9af345916e75a7126  cfm-0.3.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/cfm/cfm.mk b/package/cfm/cfm.mk
new file mode 100644
index 0000000000..a998bb11ca
--- /dev/null
+++ b/package/cfm/cfm.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# cfm
+#
+################################################################################
+
+CFM_VERSION = 0.3
+CFM_SITE = $(call github,microchip-ung,cfm,v$(CFM_VERSION))
+CFM_DEPENDENCIES = libev libmnl libnl
+CFM_LICENSE = GPL-2.0
+CFM_LICENSE_FILES = LICENSE
+
+define CFM_INSTALL_INIT_SYSV
+	$(INSTALL) -m 755 -D $(CFM_PKGDIR)/S65cfm \
+		$(TARGET_DIR)/etc/init.d/S65cfm
+endef
+
+define CFM_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 $(CFM_PKGDIR)/cfm.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/cfm.service
+endef
+
+$(eval $(cmake-package))
diff --git a/package/cfm/cfm.service b/package/cfm/cfm.service
new file mode 100644
index 0000000000..1a00c5ba08
--- /dev/null
+++ b/package/cfm/cfm.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Connectivity Fault Management
+After=network.target
+
+[Service]
+ExecStart=/usr/bin/cfm_server
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
