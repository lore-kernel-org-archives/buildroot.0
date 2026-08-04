Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5342C55ABF
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 16:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35DD64065B;
	Tue,  4 Aug 2026 16:23:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sNe2dpNhR94O; Tue,  4 Aug 2026 16:23:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8739C40651
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785860615;
	bh=tvdp8RoG9+AclTCCgcBO8G2N9WZVGQxdiNfhARr+y6E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fiK7XpVJZct2b6uz4FCtLVGf/fWk6lxfHkBGsg9fOncwiLUDLTZPaLKhvqMm/RPbR
	 gGGTfrRw151egTbXMc1xnMBEZ+iRAN23mg8Y5b1KPypBg02bRXEy+OinyE+wTChCtB
	 jqs8l1+jIeDfnHfAKzyA/Eyo2OGocZ3Y5tgXx+2inYm+9wIUd1mpO1ndH3KN5ysPbW
	 dyq5DE6na0W+9NiQCQyZS/sU+N26Soc5yVBwYgltSfvVIi192KNfwiy3Z4R3u4fm8c
	 tLa8PQmgYOY8bwxmYsXX/rYTSx+U5EA0hVY19Xz2PBH7bfXYeXaGkXC/7l/nZ79WZ7
	 d5DA8++fHd+hw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8739C40651;
	Tue,  4 Aug 2026 16:23:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4406F350
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 16:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FDCA60771
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 16:23:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RYSbp4l8MHG4 for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 16:23:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 590846076B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 590846076B
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 16:23:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D14D88248; Tue,  4 Aug 2026 16:22:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Aug 2026 18:22:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7af1e0a157088f1a674895b5fe5cc8760aa9382c
X-Git-Newrev: 54485e075d86a468f213d0ffcd339edc338df1dc
X-Patchwork-Hint: ignore
Message-Id: <20260804162248.2D14D88248@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mini-snmpd: add sysv init script
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/54485e075d86a468f213d0ffcd339edc338df1dc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

A start script has been missing since the package was added, so the
daemon was not started automatically on sysv/busybox systems.

This also fixes a regression in systemd builds introduced in fccdc6bd,
when the package switched from local unit file to upstream.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mini-snmpd/S60mini-snmpd | 52 ++++++++++++++++++++++++++++++++++++++++
 package/mini-snmpd/mini-snmpd    |  2 +-
 package/mini-snmpd/mini-snmpd.mk |  5 ++++
 3 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/package/mini-snmpd/S60mini-snmpd b/package/mini-snmpd/S60mini-snmpd
new file mode 100644
index 0000000000..e7c61d7a85
--- /dev/null
+++ b/package/mini-snmpd/S60mini-snmpd
@@ -0,0 +1,52 @@
+#!/bin/sh
+
+DAEMON="mini-snmpd"
+PIDFILE="/var/run/$DAEMON.pid"
+
+DAEMON_OPTS=""
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon --start --quiet --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON" -- $DAEMON_OPTS
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
+	start-stop-daemon --stop --quiet --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON"
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
diff --git a/package/mini-snmpd/mini-snmpd b/package/mini-snmpd/mini-snmpd
index 0ca9901d58..371f57f15f 100644
--- a/package/mini-snmpd/mini-snmpd
+++ b/package/mini-snmpd/mini-snmpd
@@ -1,2 +1,2 @@
 # Require client authentication, thus SNMP version 2c
-EXTRA_PARAMS=-a
+DAEMON_OPTS="-a -c public -s"
diff --git a/package/mini-snmpd/mini-snmpd.mk b/package/mini-snmpd/mini-snmpd.mk
index 89eca4ce79..99bef47477 100644
--- a/package/mini-snmpd/mini-snmpd.mk
+++ b/package/mini-snmpd/mini-snmpd.mk
@@ -19,4 +19,9 @@ endef
 
 MINI_SNMPD_POST_INSTALL_TARGET_HOOKS += MINI_SNMPD_INSTALL_ETC_DEFAULT
 
+define MINI_SNMPD_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/mini-snmpd/S60mini-snmpd \
+		$(TARGET_DIR)/etc/init.d/S60mini-snmpd
+endef
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
