Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F2A606C5AD
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 20:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=R21iWs4s
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BCA36085C;
	Wed,  4 Nov 2026 20:52:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6qhSTWBA6Fs6; Wed,  4 Nov 2026 20:52:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9083760828
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793825559;
	b=AElWOkKupuVUP4T4lp4qv3GExvM3nfv9iFbg2GImmR7+GlC6WLV/UAWl5WueKTyLbdV3
	 wgsQyTBWTrR1i0zNRltFPioiPDztTTstVW4xIFuiouiOr/QAw1un7AYFCkIe+1aVQKKw7
	 6/BbOX5DPE8PPHg+qcYNiGeLSHjXAgBJs1ZkKalt8BeuG7JZ8ZiKsJY4pG6kA6QugZ4Pc
	 ogp29OOV9FwON3fQNzcxznFFrnBRCWDoslGZjACKfc1BMxzvWuLzFvkLKFWjplqqqDN6i
	 s4cb82QkaJYh1WcvUNgBSrzATFY+IfTsKX569+EmV17HA+eZcvZN+O9xbhFvmWopLgQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793825559;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qAoYVzvfn8eTs0I4EaogstD93s/p31c3hgTSuX8810M=;
	b=tAo18FGzTmpsKcV/PpFTVpgf3rzhSkFUiFaKiFGlKMs7Fld1zrfkyY+IHBuOe7Y90bVV
	 aFT0YaWRhB6Rg/brpyncek8ir9tWBJ8cycCitQMUXpzOpeTQbID1+Pfkt6Vaq4jL1dXMu
	 EtipgLo3CLbvzHYBYZ5NJeLFMmnZFBpvXbAHC5QvC1Sbs3+PAztWl77nZctyzZxWD10SL
	 ytl+nbvevPfFU3tHV/m6vk3u69FAIo7gpG63b3r/CLaLHo/1BvPBTO1m6kz0p4EMZ7wi6
	 6xsnX8bRpFWHfYnPvgDsFw/OWWU4Lsggv6NKWqCQExkKjAjRM+3Mwgf15jgIFjMJtew==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793825559;
	bh=qAoYVzvfn8eTs0I4EaogstD93s/p31c3hgTSuX8810M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=R21iWs4s/nT0VTqodQ0Jg89pUhb/3I219DMiNpr9NNBoDZ4Y8NQt8dEx42ajI1oRi
	 bny6RIGxLuVNw8Tgj+oi1RlgswvEU35waqEB5RUqBW0M5+Zdk9gKsOoc867ZYwtohn
	 tkqV3lYPtkilbYvu9SqMPxFTnWQ5t4AkSxvg5ZFahfoaAvYfR0mBOBKPaL+bvI+6ze
	 Sf4r0S4Sg3nRHRXOiBYFiHVm8Tal+LlGO34hN5Nqshl3hACTgC+wmDxKQG1cSggtUP
	 nkXnjG7xEVCMznw/NCqNb+6vN8g7py2+ndmxACywWUQL0OmH8ILlvbAxRPrK6w1R/g
	 T0gPIc6flehRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9083760828;
	Wed,  4 Nov 2026 20:52:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A23A231F
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87E156080B
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:52:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CrMH7qxES1gq for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 20:52:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8080E60728
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8080E60728
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:52:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A4EBD9DE0A; Wed,  4 Nov 2026 20:51:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 21:52:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 689e3813dfa4b6b84843b496f93165e3de63d212
X-Git-Newrev: 44b6ba3af318f26b29ab80b8414cb9a553d5d619
X-Patchwork-Hint: ignore
Message-Id: <20261104205103.A4EBD9DE0A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/httpdate: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/44b6ba3af318f26b29ab80b8414cb9a553d5d619
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

httpdate synchronizes the system time using the Date header of HTTP and
HTTPS servers, which is useful on networks where NTP is blocked but web
access is permitted. It is the successor of htpdate, from the same
author: it delegates the network transport (HTTP, HTTPS, HTTP/2,
proxies) to libcurl, and estimates the time from several servers.

Like the htpdate package, add a SysV init script and a systemd unit,
running httpdate with the arguments of HTTPDATE_ARGS, that can be
overridden in /etc/default/httpdate. As httpdate does not write a
pidfile, it runs in the foreground (-F), and start-stop-daemon
backgrounds it and writes the pidfile.

https://github.com/twekkel/httpdate

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                        |  1 +
 package/Config.in                 |  1 +
 package/httpdate/Config.in        | 11 ++++++++
 package/httpdate/S43httpdate      | 55 +++++++++++++++++++++++++++++++++++++++
 package/httpdate/httpdate.hash    |  3 +++
 package/httpdate/httpdate.mk      | 33 +++++++++++++++++++++++
 package/httpdate/httpdate.service | 12 +++++++++
 7 files changed, 116 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d6ed6b2b1a..00035d933f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -234,6 +234,7 @@ F:	package/fail2ban/
 F:	package/grep/
 F:	package/gtkiostream/
 F:	package/htpdate/
+F:	package/httpdate/
 F:	package/i2c-tools/
 F:	package/jq/
 F:	package/libapparmor/
diff --git a/package/Config.in b/package/Config.in
index 32fc1496c9..089860e7ec 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2509,6 +2509,7 @@ endif
 	source "package/hostapd/Config.in"
 	source "package/hplip/Config.in"
 	source "package/htpdate/Config.in"
+	source "package/httpdate/Config.in"
 	source "package/httping/Config.in"
 	source "package/i2pd/Config.in"
 	source "package/iana-assignments/Config.in"
diff --git a/package/httpdate/Config.in b/package/httpdate/Config.in
new file mode 100644
index 0000000000..8d3f2c7bef
--- /dev/null
+++ b/package/httpdate/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_HTTPDATE
+	bool "httpdate"
+	depends on BR2_USE_MMU # daemon()
+	select BR2_PACKAGE_LIBCURL
+	help
+	  httpdate synchronizes the system time using the Date header
+	  of HTTP and HTTPS servers, which is useful on networks where
+	  NTP is blocked but web access is permitted. It is the
+	  successor of htpdate.
+
+	  https://github.com/twekkel/httpdate
diff --git a/package/httpdate/S43httpdate b/package/httpdate/S43httpdate
new file mode 100644
index 0000000000..aff7a00eb9
--- /dev/null
+++ b/package/httpdate/S43httpdate
@@ -0,0 +1,55 @@
+#!/bin/sh
+
+DAEMON="httpdate"
+PIDFILE="/var/run/$DAEMON.pid"
+
+HTTPDATE_ARGS="-s https://www.google.com"
+
+# shellcheck source=/dev/null
+test -r "/etc/default/$DAEMON" && . "/etc/default/$DAEMON"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# httpdate does not write a pidfile, so run it in the foreground
+	# and let start-stop-daemon background it and write it.
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -S -q -b -m -p "$PIDFILE" -x "/usr/bin/$DAEMON" \
+		-- -F $HTTPDATE_ARGS
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
+	start-stop-daemon -K -q -p "$PIDFILE"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		rm -f "$PIDFILE"
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
diff --git a/package/httpdate/httpdate.hash b/package/httpdate/httpdate.hash
new file mode 100644
index 0000000000..31c6d80868
--- /dev/null
+++ b/package/httpdate/httpdate.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  c7a13e693de32e48fc374f36598390eece04e4c26f21b1e7d67cdc680d60236b  httpdate-1.0.1.tar.gz
+sha256  cb7177d68741cb08ed1fade01b9f9cc7d1c56c0e96f3f6ab86f5b455cf99e44f  LICENSE
diff --git a/package/httpdate/httpdate.mk b/package/httpdate/httpdate.mk
new file mode 100644
index 0000000000..6a21f0fccc
--- /dev/null
+++ b/package/httpdate/httpdate.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# httpdate
+#
+################################################################################
+
+HTTPDATE_VERSION = 1.0.1
+HTTPDATE_SITE = $(call github,twekkel,httpdate,v$(HTTPDATE_VERSION))
+HTTPDATE_LICENSE = GPL-2.0+
+HTTPDATE_LICENSE_FILES = LICENSE
+HTTPDATE_DEPENDENCIES = host-pkgconf libcurl
+
+define HTTPDATE_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libcurl` -lm"
+endef
+
+define HTTPDATE_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		DESTDIR=$(TARGET_DIR) PREFIX=/usr install
+endef
+
+define HTTPDATE_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/httpdate/S43httpdate \
+		$(TARGET_DIR)/etc/init.d/S43httpdate
+endef
+
+define HTTPDATE_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 package/httpdate/httpdate.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/httpdate.service
+endef
+
+$(eval $(generic-package))
diff --git a/package/httpdate/httpdate.service b/package/httpdate/httpdate.service
new file mode 100644
index 0000000000..adce46d929
--- /dev/null
+++ b/package/httpdate/httpdate.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=httpdate daemon
+After=network.target
+
+[Service]
+Type=simple
+Environment=HTTPDATE_ARGS="-s https://www.google.com"
+EnvironmentFile=-/etc/default/httpdate
+ExecStart=/usr/bin/httpdate -F $HTTPDATE_ARGS
+
+[Install]
+WantedBy=multi-user.target
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
