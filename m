Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273B0C001DE
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 14:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A45EB40583;
	Sun, 30 Jul 2023 14:13:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A45EB40583
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WnKVCy5qVZa0; Sun, 30 Jul 2023 14:13:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0DFD40549;
	Sun, 30 Jul 2023 14:13:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0DFD40549
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E1801BF3F2
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 14:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7113460E77
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 14:13:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7113460E77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dc9hLmYZS4rm for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 14:13:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 278CF60BA7
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 14:13:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 278CF60BA7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0EDB083C79; Sun, 30 Jul 2023 14:13:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 14:52:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 210306b4fa1f1a018393c69334eb48bf247a91c7
X-Git-Newrev: 5010cac4970d8a1e3d7b027921d18713a2d841ea
X-Patchwork-Hint: ignore
Message-Id: <20230730141337.0EDB083C79@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mdnsd: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=5010cac4970d8a1e3d7b027921d18713a2d841ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                    |  1 +
 package/Config.in             |  1 +
 package/mdnsd/Config.in       | 49 +++++++++++++++++++++++++++++++++++++++++
 package/mdnsd/S50mdnsd        | 51 +++++++++++++++++++++++++++++++++++++++++++
 package/mdnsd/ftp.service     |  2 ++
 package/mdnsd/http.service    |  2 ++
 package/mdnsd/ipp.service     |  2 ++
 package/mdnsd/mdnsd.hash      |  5 +++++
 package/mdnsd/mdnsd.mk        | 50 ++++++++++++++++++++++++++++++++++++++++++
 package/mdnsd/printer.service |  2 ++
 package/mdnsd/ssh.service     |  2 ++
 11 files changed, 167 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index fe2ebc3e1b..d4a6637671 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1537,6 +1537,7 @@ F:	package/libnet/
 F:	package/libteam/
 F:	package/libuev/
 F:	package/mg/
+F:	package/mdnsd/
 F:	package/mini-snmpd/
 F:	package/mrouted/
 F:	package/netcalc/
diff --git a/package/Config.in b/package/Config.in
index bc1f403ff0..908806db41 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1972,6 +1972,7 @@ menu "Networking"
 	source "package/libyang/Config.in"
 	source "package/lksctp-tools/Config.in"
 	source "package/mbuffer/Config.in"
+	source "package/mdnsd/Config.in"
 	source "package/mongoose/Config.in"
 	source "package/nanomsg/Config.in"
 	source "package/neon/Config.in"
diff --git a/package/mdnsd/Config.in b/package/mdnsd/Config.in
new file mode 100644
index 0000000000..c83c090595
--- /dev/null
+++ b/package/mdnsd/Config.in
@@ -0,0 +1,49 @@
+config BR2_PACKAGE_MDNSD
+	bool "mdnsd"
+	depends on BR2_USE_MMU # fork()
+	help
+	  Small mDNS-SD daemon for advertising services and device
+	  discovery, similar to Avahi and Bonjour.
+
+	  By default, mdnsd runs on all interfaces that support
+	  multicast.  It reads services to announce from
+	  /etc/mdns.d/*.service, a few common services are included
+	  below.  To override the defaults, e.g., path to services,
+	  TTL of multicast frames, or the default interface, set
+	  MDNSD_ARGS in /etc/default/mdnsd
+
+	  Note: currently no NSS integration with GLIBC.
+
+	  https://github.com/troglobit/mdnsd
+
+if BR2_PACKAGE_MDNSD
+
+config BR2_PACKAGE_MDNSD_MQUERY
+	bool "mquery"
+	help
+	  Scan a LAN for mDNS capable devices, or query specific
+	  records, similar to the mdns-scan tool.  Useful for
+	  verifying multicast connectivity or locating neighbors with
+	  link-local address.
+
+comment "Services to advertise"
+
+config BR2_PACKAGE_MDNSD_FTP_SERVICE
+	bool "FTP service"
+
+config BR2_PACKAGE_MDNSD_HTTP_SERVICE
+	bool "HTTP service"
+
+config BR2_PACKAGE_MDNSD_IPP_SERVICE
+	bool "IPP service"
+
+config BR2_PACKAGE_MDNSD_PRINTER_SERVICE
+	bool "Printer service"
+
+config BR2_PACKAGE_MDNSD_SSH_SERVICE
+	bool "SSH service"
+	default y if BR2_PACKAGE_DROPBEAR
+	default y if BR2_PACKAGE_OPENSSH
+	default y if BR2_PACKAGE_LIBSSH_SERVER
+
+endif
diff --git a/package/mdnsd/S50mdnsd b/package/mdnsd/S50mdnsd
new file mode 100644
index 0000000000..1c2b71802c
--- /dev/null
+++ b/package/mdnsd/S50mdnsd
@@ -0,0 +1,51 @@
+#!/bin/sh
+
+DAEMON=mdnsd
+MDNSD=/usr/sbin/$DAEMON
+PIDFILE=/var/run/$DAEMON.pid
+CFGFILE=/etc/default/$DAEMON
+
+MDNSD_ARGS=""
+
+# Read configuration variable file if it is present
+# shellcheck source=/dev/null
+[ -r "$CFGFILE" ] && . "$CFGFILE"
+
+# shellcheck disable=SC2086
+start() {
+	[ -n "$1" ] || printf 'Starting %s: ' "$DAEMON"
+	start-stop-daemon -S -q -p "$PIDFILE" -x "$MDNSD" -- $MDNSD_ARGS
+}
+
+stop() {
+	[ -n "$1" ] || printf 'Stopping %s: ' "$DAEMON"
+	start-stop-daemon -K -q -p "$PIDFILE" -x "$MDNSD"
+}
+
+restart() {
+	printf 'Restarting %s: ' "$DAEMON"
+	stop  silent
+	start silent
+}
+
+# SIGHUP reloads /etc/mdns.d/*.service
+reload() {
+	printf 'Reloading %s: ' "$DAEMON"
+	start-stop-daemon -K -s HUP -q -p "$PIDFILE" -x "$MDNSD"
+}
+
+case "$1" in
+	start|stop|restart|reload)
+		if "$1"; then
+			echo "OK"
+		else
+			echo "FAIL"
+		fi
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+		;;
+esac
+
+exit $?
diff --git a/package/mdnsd/ftp.service b/package/mdnsd/ftp.service
new file mode 100644
index 0000000000..200a379efd
--- /dev/null
+++ b/package/mdnsd/ftp.service
@@ -0,0 +1,2 @@
+type _ftp._tcp
+port 21
diff --git a/package/mdnsd/http.service b/package/mdnsd/http.service
new file mode 100644
index 0000000000..7a40d2405f
--- /dev/null
+++ b/package/mdnsd/http.service
@@ -0,0 +1,2 @@
+type _http._tcp
+port 80
diff --git a/package/mdnsd/ipp.service b/package/mdnsd/ipp.service
new file mode 100644
index 0000000000..0d43e780d1
--- /dev/null
+++ b/package/mdnsd/ipp.service
@@ -0,0 +1,2 @@
+type _ipp._tcp
+port 631
diff --git a/package/mdnsd/mdnsd.hash b/package/mdnsd/mdnsd.hash
new file mode 100644
index 0000000000..6ab0676702
--- /dev/null
+++ b/package/mdnsd/mdnsd.hash
@@ -0,0 +1,5 @@
+# Upstream sha256 from GitHub
+sha256  1af8742ab82a0af88d99d0b15508358ad4305879ab039631bea889138f5c87e8  mdnsd-0.12.tar.gz
+
+# Locally computed
+sha256  2969546227b58ce1b431cc4c36c9a9b45d604e6b94fb8b787ea5d3696f3eee3b  LICENSE
diff --git a/package/mdnsd/mdnsd.mk b/package/mdnsd/mdnsd.mk
new file mode 100644
index 0000000000..f5a5fb93fb
--- /dev/null
+++ b/package/mdnsd/mdnsd.mk
@@ -0,0 +1,50 @@
+################################################################################
+#
+# mdnsd
+#
+################################################################################
+
+MDNSD_VERSION = 0.12
+MDNSD_SITE = https://github.com/troglobit/mdnsd/releases/download/v$(MDNSD_VERSION)
+MDNSD_LICENSE = BSD-3-Clause
+MDNSD_LICENSE_FILES = LICENSE
+MDNSD_DEPENDENCIES = host-pkgconf
+
+ifeq ($(BR2_PACKAGE_MDNSD_MQUERY),y)
+MDNSD_CONF_OPTS += --with-mquery
+else
+MDNSD_CONF_OPTS += --without-mquery
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+MDNSD_DEPENDENCIES += systemd
+MDNSD_CONF_OPTS += --with-systemd
+else
+MDNSD_CONF_OPTS += --without-systemd
+endif
+
+MDNSD_SERVICES_$(BR2_PACKAGE_MDNSD_FTP_SERVICE) += ftp
+MDNSD_SERVICES_$(BR2_PACKAGE_MDNSD_HTTP_SERVICE) += http
+MDNSD_SERVICES_$(BR2_PACKAGE_MDNSD_IPP_SERVICE) += ipp
+MDNSD_SERVICES_$(BR2_PACKAGE_MDNSD_PRINTER_SERVICE) += printer
+MDNSD_SERVICES_$(BR2_PACKAGE_MDNSD_SSH_SERVICE) += ssh
+
+define MDNSD_INSTALL_SERVICES
+	$(foreach service,$(MDNSD_SERVICES_y),\
+		$(INSTALL) -D -m 0644 package/mdnsd/$(service).service \
+			$(TARGET_DIR)/etc/mdns.d/$(service).service
+	)
+endef
+MDNSD_POST_INSTALL_TARGET_HOOKS += MDNSD_INSTALL_SERVICES
+
+define MDNSD_INSTALL_INIT_SYSV
+	$(INSTALL) -m 755 -D package/mdnsd/S50mdnsd \
+		$(TARGET_DIR)/etc/init.d/S50mdnsd
+endef
+
+define MDNSD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 $(@D)/mdnsd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/mdnsd.service
+endef
+
+$(eval $(autotools-package))
diff --git a/package/mdnsd/printer.service b/package/mdnsd/printer.service
new file mode 100644
index 0000000000..cd32295471
--- /dev/null
+++ b/package/mdnsd/printer.service
@@ -0,0 +1,2 @@
+type _printer._tcp
+port 515
diff --git a/package/mdnsd/ssh.service b/package/mdnsd/ssh.service
new file mode 100644
index 0000000000..596d20ba17
--- /dev/null
+++ b/package/mdnsd/ssh.service
@@ -0,0 +1,2 @@
+type _ssh._tcp
+port 22
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
