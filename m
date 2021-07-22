Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34122C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:23:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9560060F8F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:23:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9560060F8F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DBD783D41;
	Wed,  4 Aug 2021 00:23:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AMLyDuIkPkhT; Wed,  4 Aug 2021 00:23:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76F3884336;
	Wed,  4 Aug 2021 00:23:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 840A91BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3EC6841492
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9JVU1YdlxJtt for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26E3E40EAF
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6D4828B3ED; Tue,  3 Aug 2021 21:10:14 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 22 Jul 2021 23:14:59 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ccfc90e1010e42e6529afae3a5ea8bf7226dabc1
X-Git-Newrev: fbf25acfbfd5a73b3560918bea081768abbe5723
X-Patchwork-Hint: ignore
Message-Id: <20210803211014.6D4828B3ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libvirt: add daemon
 libvirtd
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=fbf25acfbfd5a73b3560918bea081768abbe5723
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update to add the libvirtd daemon for libvirt

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
[Arnout: put all CONF_OPTS that depend on LIBVIRT_DAEMON together]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libvirt/Config.in   |  20 +++++++
 package/libvirt/S91virtlogd |  65 ++++++++++++++++++++++
 package/libvirt/S92libvirtd | 132 ++++++++++++++++++++++++++++++++++++++++++++
 package/libvirt/libvirt.mk  |  52 +++++++++++++++--
 4 files changed, 263 insertions(+), 6 deletions(-)

diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
index 6175cc489c..deb1636c9f 100644
--- a/package/libvirt/Config.in
+++ b/package/libvirt/Config.in
@@ -37,3 +37,23 @@ config BR2_PACKAGE_LIBVIRT
 
 	  https://libvirt.org/
 
+
+if BR2_PACKAGE_LIBVIRT
+
+config BR2_PACKAGE_LIBVIRT_DAEMON
+	bool "libvirtd"
+	default y
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_DNSMASQ
+	select BR2_PACKAGE_EBTABLES
+	select BR2_PACKAGE_IPTABLES
+	select BR2_PACKAGE_IPROUTE2
+	# These are required because there is no way to unequivocally select a modern netcat
+	select BR2_PACKAGE_NMAP      if !BR2_PACKAGE_NETCAT_OPENBSD
+	select BR2_PACKAGE_NMAP_NCAT if !BR2_PACKAGE_NETCAT_OPENBSD
+	select BR2_PACKAGE_RADVD
+	help
+	  Build the libvirt daemon (libvirtd) otherwise build only the
+	  utility programs.
+
+endif
diff --git a/package/libvirt/S91virtlogd b/package/libvirt/S91virtlogd
new file mode 100644
index 0000000000..03d17b5dbd
--- /dev/null
+++ b/package/libvirt/S91virtlogd
@@ -0,0 +1,65 @@
+#!/bin/sh
+
+DAEMON="virtlogd"
+EXECFILE="/usr/sbin/$DAEMON"
+PIDFILE="/var/run/$DAEMON.pid"
+
+VIRTLOGD_ARGS=""
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -S -q -p "$PIDFILE" -x "$EXECFILE" \
+		-- -d $VIRTLOGD_ARGS
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
+	start-stop-daemon -K -q -p "$PIDFILE" -x "$EXECFILE"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+restart() {
+	stop
+	sleep 1
+	start
+}
+
+# On receipt of SIGUSR1 virtlogd will re-exec() its binary, while maintaining
+# all current logs and clients. This allows for live upgrades of the virtlogd
+# service.
+reload() {
+	printf 'Reloading %s: ' "$DAEMON"
+	start-stop-daemon -K -s USR1 -q -p "$PIDFILE" -x "$EXECFILE"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+case "$1" in
+	start|stop|restart|reload)
+		"$1";;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
diff --git a/package/libvirt/S92libvirtd b/package/libvirt/S92libvirtd
new file mode 100644
index 0000000000..736519f3d0
--- /dev/null
+++ b/package/libvirt/S92libvirtd
@@ -0,0 +1,132 @@
+#!/bin/sh
+
+DAEMON="libvirtd"
+EXECFILE="/usr/sbin/$DAEMON"
+PIDFILE="/var/run/$DAEMON.pid"
+
+LIBVIRTD_ARGS=""
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+trap 'rm -f "$TMP_MODULE_LIST" "$TMP_PIDFILE_LIST"' EXIT
+
+is_alive() {
+	[ -e "$1" ] \
+	&& exe="/proc/$(cat "$1" 2>/dev/null)/exe" \
+	&& [ -s "$exe" ] \
+	&& [ "$(readlink -f "$exe")" = "$2" ]
+}
+
+load_modules() {
+	printf 'Loading kernel modules: '
+	kver="$(uname -r)"
+	TMP_MODULE_LIST="$(mktemp -q)" || {
+		echo 'FAIL creating temporary modules list'
+		exit 1
+	}
+	[ -d "/lib/modules/$kver/kernel/drivers/net" ] && \
+		find "/lib/modules/$kver/kernel/drivers/net" \
+		-name "tun.ko*" >> "$TMP_MODULE_LIST"
+	[ -d "/lib/modules/$kver/kernel/drivers/vhost" ] && \
+		find "/lib/modules/$kver/kernel/drivers/vhost" \
+		-name "vhost?net.ko*" >> "$TMP_MODULE_LIST"
+	[ -d "/lib/modules/$kver/kernel/drivers/net" ] && \
+		find "/lib/modules/$kver/kernel/drivers/vfio" \
+		-name "*.ko*" >> "$TMP_MODULE_LIST"
+	while read -r f; do
+		m="$(basename "${f%.ko*}")"
+		if modprobe -q "$m"; then
+			printf '%s ' "$m"
+		else
+			echo "FAIL on $m"
+			exit 1
+		fi
+	done < "$TMP_MODULE_LIST"
+	echo "OK"
+}
+
+#
+# If libvirtd dies it leves behind one stale dnsmasq per virtual network that
+# must be killed before starting libvirtd again.
+#
+rm_stale_dnsmasq() {
+	[ -d /var/run/libvirt/network ] || return 0
+	TMP_PIDFILE_LIST="$(mktemp -q)" || {
+		echo "Could not create temporary pidfile list"
+		exit 1
+	}
+	find /var/run/libvirt/network -name '*.pid' > "$TMP_PIDFILE_LIST"
+	while read -r pidfile; do
+		if is_alive "$pidfile" /usr/sbin/dnsmasq; then
+			start-stop-daemon -K -q -p "$pidfile" -x /usr/sbin/dnsmasq
+			status=$?
+			if [ "$status" -ne 0 ]; then
+				echo "Could not stop stale dnsmasq daemons"
+				exit 1
+			fi
+			rm -f "$pidfile"
+		fi
+	done < "$TMP_PIDFILE_LIST"
+}
+
+start() {
+	if is_alive "$PIDFILE" "$EXECFILE"; then
+		# libvirtd is already running. Leave it alone.
+		printf 'Starting %s: FAIL\n' "$DAEMON"
+		return 1
+	fi
+	rm_stale_dnsmasq
+	load_modules
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -S -q -p "$PIDFILE" -x "$EXECFILE" \
+		-- -d $LIBVIRTD_ARGS
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
+	start-stop-daemon -K -q -p "$PIDFILE" -x "$EXECFILE"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		rm_stale_dnsmasq
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+restart() {
+	stop
+	sleep 1
+	start
+}
+
+# On receipt of SIGHUP libvirtd will reload its configuration.
+reload() {
+	printf 'Reloading %s: ' "$DAEMON"
+	start-stop-daemon -K -s HUP -q -p "$PIDFILE" -x "$EXECFILE"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+case "$1" in
+	start|stop|restart|reload)
+		"$1";;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
index 80b9529404..a8099c936a 100644
--- a/package/libvirt/libvirt.mk
+++ b/package/libvirt/libvirt.mk
@@ -25,7 +25,6 @@ LIBVIRT_CONF_OPTS = \
 	-Ddriver_interface=enabled \
 	-Ddriver_libxl=disabled \
 	-Ddriver_lxc=disabled \
-	-Ddriver_network=disabled \
 	-Ddriver_openvz=disabled \
 	-Ddriver_qemu=disabled \
 	-Ddriver_remote=enabled \
@@ -39,19 +38,14 @@ LIBVIRT_CONF_OPTS = \
 	-Dglusterfs=disabled \
 	-Dhost_validate=enabled \
 	-Dinit_script=$(if $(BR2_INIT_SYSTEMD),systemd,none) \
-	-Dlibssh=disabled \
-	-Dlibvirtd=disabled \
 	-Dlogin_shell=disabled \
 	-Dnetcf=disabled \
-	-Dnss=disabled \
 	-Dnumad=disabled \
 	-Dopenwsman=disabled \
 	-Dpciaccess=enabled \
 	-Dpm_utils=disabled \
 	-Dsanlock=disabled \
-	-Dsasl=disabled \
 	-Dsecdriver_apparmor=disabled \
-	-Dssh2=disabled \
 	-Dstorage_iscsi=disabled \
 	-Dstorage_iscsi_direct=disabled \
 	-Dstorage_mpath=disabled \
@@ -166,6 +160,45 @@ else
 LIBVIRT_CONF_OPTS += -Dyajl=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIBVIRT_DAEMON),y)
+# Network is used by daemon, only
+LIBVIRT_CONF_OPTS += -Dlibvirtd=enabled -Ddriver_network=enabled
+
+ifeq ($(BR2_PACKAGE_LIBSSH),y)
+LIBVIRT_CONF_OPTS += -Dlibssh=enabled
+LIBVIRT_DEPENDENCIES += libssh
+else
+LIBVIRT_CONF_OPTS += -Dlibssh=disabled
+endif
+
+# Can't build nss plugin without network
+ifeq ($(BR2_PACKAGE_LIBNSS),y)
+LIBVIRT_CONF_OPTS += -Dnss=enabled
+LIBVIRT_DEPENDENCIES += libnss
+else
+LIBVIRT_CONF_OPTS += -Dnss=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGSASL),y)
+LIBVIRT_CONF_OPTS += -Dsasl=enabled
+LIBVIRT_DEPENDENCIES += libgsasl
+else
+LIBVIRT_CONF_OPTS += -Dsasl=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSSH2),y)
+LIBVIRT_CONF_OPTS += -Dssh2=enabled
+LIBVIRT_DEPENDENCIES += libssh2
+else
+LIBVIRT_CONF_OPTS += -Dssh2=disabled
+endif
+
+else # BR2_PACKAGE_LIBVIRT_DAEMON
+
+LIBVIRT_CONF_OPTS += -Dlibvirtd=disabled -Ddriver_network=disabled
+
+endif
+
 define LIBVIRT_INSTALL_UDEV_RULES
 	$(INSTALL) -D -m 644 package/libvirt/90-kvm.rules \
 		$(TARGET_DIR)/etc/udev/rules.d/90-kvm.rules
@@ -210,4 +243,11 @@ endef
 
 LIBVIRT_PRE_INSTALL_TARGET_HOOKS += LIBVIRT_CREATE_SYMLINKS
 
+ifeq ($(BR2_PACKAGE_LIBVIRT_DAEMON),y)
+define LIBVIRT_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/libvirt/S91virtlogd $(TARGET_DIR)/etc/init.d/S91virtlogd
+	$(INSTALL) -D -m 0755 package/libvirt/S92libvirtd $(TARGET_DIR)/etc/init.d/S92libvirtd
+endef
+endif
+
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
