Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9A4C5CFDB
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 13:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE03C81190;
	Fri, 14 Aug 2026 13:21:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FRjbce3IheBM; Fri, 14 Aug 2026 13:21:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB5CE811E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786713688;
	bh=NSQrUNSV22jNH/r4q172yO181s4MfyegAB51hEuyshw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GLw/c0E2V+ghPgvKU9VrFuI4xzO/SKqzHchgmleE7ylckqx0DtevlAT46qii02p+J
	 SdaffbsW+Tnd+8NxBsO4mewOXLL4mMUUotUy54/eKLqJ4ssdXRIt6oSGvBMWYz6cYm
	 Y2vjGiTGUMCkqSPfZvzwwIFeDu/K1qpDApuUxD4LOXmGAOVxmjB2Zy5ZshbcCE590j
	 +xWD17T/+56G3oe0bek+CWzbiwxsPh+luJtAEIxKdrGg5WBCipcuZe3BEAcUVcTg1p
	 lk0YniCN1oufJYODJePMEqYJC5LvA3dgIG+1VPSl8FCGMWDJIldIvmg/mcLWOQbUsU
	 lktP+d0wU74WA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB5CE811E9;
	Fri, 14 Aug 2026 13:21:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4443123F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36B3F60633
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BA3ZtI_WuWY3 for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 13:21:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FED2607BD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FED2607BD
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 644AC8D66A; Fri, 14 Aug 2026 13:20:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Aug 2026 16:03:39 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 0b33e52c5749a946a8a04e86ba3ca039a410db51
X-Git-Newrev: 479722a5bc9c1127d7c4223ebbfa9498092fb1ee
X-Patchwork-Hint: ignore
Message-Id: <20260814132034.644AC8D66A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/mini-snmpd: add
 sysv init script
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/479722a5bc9c1127d7c4223ebbfa9498092fb1ee
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

A start script has been missing since the package was added, so the
daemon was not started automatically on sysv/busybox systems.

This also fixes a regression in systemd builds introduced in fccdc6bd,
when the package switched from local unit file to upstream.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 54485e075d86a468f213d0ffcd339edc338df1dc)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
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
index 1f6e5c1919..40a7d2f15a 100644
--- a/package/mini-snmpd/mini-snmpd.mk
+++ b/package/mini-snmpd/mini-snmpd.mk
@@ -20,4 +20,9 @@ endef
 
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
