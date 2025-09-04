Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 874FFCA1002
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61AA8607D2;
	Thu,  4 Sep 2025 16:34:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xj3lEx3yIKlO; Thu,  4 Sep 2025 16:34:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80B2E607B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80B2E607B9;
	Thu,  4 Sep 2025 16:34:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DB0F106
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E551140098
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mB0cahSLS1ml for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:33:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE5B44009E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE5B44009E
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC88887E99; Thu,  4 Sep 2025 16:33:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 14:11:44 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 09b89e98369cc28ee65a2c16d47c3b87196d3584
X-Git-Newrev: 9ee7f7edf9a865c2aeca392633064b2a3883cd55
X-Patchwork-Hint: ignore
Message-Id: <20250904163335.BC88887E99@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/busybox: add
 httpd server startup script
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9ee7f7edf9a865c2aeca392633064b2a3883cd55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

In order to remove thttpd package from Buildroot, we have to replace it
from our testsuite (TestWget and TestLibCurl).

Busybox provide an httpd server applet but it's not enabled in our
default busybox configuration.

For the sake of those tests, add a new busybox option to build and
install the Busybox's httpd server and its init script.

Import S90thttpd from thttpd package to S90httpd but with some changes
following S01syslogd init script as a reference [1].

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/3dc80614442cc3942a372a8c31abd22c1bc96241

Cc: Julien Olivain <ju.o@free.fr>
Cc: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Reviewed-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit bcd97e1424dc3985485a9eb4e5a08a70fcfb655a)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/busybox/Config.in  |  6 +++++
 package/busybox/S90httpd   | 59 ++++++++++++++++++++++++++++++++++++++++++++++
 package/busybox/busybox.mk | 16 +++++++++++++
 3 files changed, 81 insertions(+)

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index 3c2aa515f8..659c6aebfc 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -69,6 +69,12 @@ config BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES
 comment "Busybox individual binaries need a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
 
+config BR2_PACKAGE_BUSYBOX_HTTPD
+	bool "Install the httpd server startup script"
+	help
+	  Install the httpd server startup script,
+	  that just start at the boot the busybox httpd server
+
 config BR2_PACKAGE_BUSYBOX_WATCHDOG
 	bool "Install the watchdog daemon startup script"
 	help
diff --git a/package/busybox/S90httpd b/package/busybox/S90httpd
new file mode 100644
index 0000000000..0d43ea3e74
--- /dev/null
+++ b/package/busybox/S90httpd
@@ -0,0 +1,59 @@
+#!/bin/sh
+
+DAEMON="httpd"
+PIDFILE="/var/run/$DAEMON.pid"
+
+HTTPD_ARGS="-h /var/www/data"
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+# BusyBox' httpd does not create a pidfile, so pass "-f" in the command line
+# and use "--make-pidfile" to instruct start-stop-daemon to create one.
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon --start --background --quiet --make-pidfile \
+		--pidfile "$PIDFILE" --exec "/usr/sbin/$DAEMON" \
+		-- -f $HTTPD_ARGS
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+stop() {
+	printf 'Stopping %s: ' "$DAEMON"
+	start-stop-daemon --stop --quiet --pidfile "$PIDFILE"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	while start-stop-daemon --stop --test --quiet --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON"; do
+		sleep 0.1
+	done
+	rm -f "$PIDFILE"
+	return "$status"
+}
+
+restart() {
+	stop
+	start
+}
+
+case "$1" in
+	start|stop|restart)
+		"$1";;
+	reload)
+		# Restart, since there is no true "reload" feature.
+		restart;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 532932ec8f..d7eda71db6 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -258,6 +258,19 @@ define BUSYBOX_SET_SELINUX
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_BUSYBOX_HTTPD),y)
+define BUSYBOX_SET_HTTPD
+	$(call KCONFIG_ENABLE_OPT,CONFIG_HTTPD)
+endef
+define BUSYBOX_INSTALL_HTTPD_SCRIPT
+	if grep -q CONFIG_HTTPD=y $(@D)/.config; then \
+		mkdir -p $(TARGET_DIR)/var/www/data ;\
+		$(INSTALL) -m 0755 -D package/busybox/S90httpd \
+			$(TARGET_DIR)/etc/init.d/S90httpd ; \
+	fi
+endef
+endif
+
 # enable relevant options to allow the Busybox less applet to be used
 # as a systemd pager
 ifeq ($(BR2_PACKAGE_SYSTEMD):$(BR2_PACKAGE_LESS),y:)
@@ -418,6 +431,7 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
 	$(BUSYBOX_SET_WATCHDOG)
 	$(BUSYBOX_SET_SELINUX)
 	$(BUSYBOX_SET_LESS_FLAGS)
+	$(BUSYBOX_SET_HTTPD)
 	$(BUSYBOX_SET_INDIVIDUAL_BINARIES)
 	$(BUSYBOX_DISABLE_IP_LINK_CAN)
 	$(PACKAGES_BUSYBOX_CONFIG_FIXUPS)
@@ -447,6 +461,7 @@ define BUSYBOX_INSTALL_INIT_OPENRC
 	$(BUSYBOX_INSTALL_IFPLUGD_SCRIPT)
 	$(BUSYBOX_INSTALL_CROND_SCRIPT)
 	$(BUSYBOX_INSTALL_TELNET_SCRIPT)
+	$(BUSYBOX_INSTALL_HTTPD_SCRIPT)
 endef
 
 define BUSYBOX_INSTALL_INIT_SYSTEMD
@@ -461,6 +476,7 @@ define BUSYBOX_INSTALL_INIT_SYSV
 	$(BUSYBOX_INSTALL_IFPLUGD_SCRIPT)
 	$(BUSYBOX_INSTALL_CROND_SCRIPT)
 	$(BUSYBOX_INSTALL_TELNET_SCRIPT)
+	$(BUSYBOX_INSTALL_HTTPD_SCRIPT)
 endef
 
 # Checks to give errors that the user can understand
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
