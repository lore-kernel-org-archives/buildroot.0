Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123DFC3DA4B
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 12:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D11B161320;
	Fri, 12 Jul 2024 12:50:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MxONQe08QjPw; Fri, 12 Jul 2024 12:50:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 626AA6133E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 626AA6133E;
	Fri, 12 Jul 2024 12:50:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF3051BF40F
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 12:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8342D417D2
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 12:50:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4qTudooHl6bU for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 12:50:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1B9F24173A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B9F24173A
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B9F24173A
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 12:50:15 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.120.126]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MWzk3-1sqEo90Zar-00OOOJ; Fri, 12
 Jul 2024 14:50:12 +0200
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 14:49:56 +0200
Message-ID: <20240712124956.3925574-7-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240712124956.3925574-1-fiona.klute@gmx.de>
References: <20240712124956.3925574-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:IVi/nHrWENsW4IiwHHxL1tiaUjCCEn8UxwVURdZ7O3LrEkUqCQB
 XaNusZprbAjavpxgES+3nsM3PznBo/ypGfvw4O0brNYba8F+kxb4mB3SgsSGJ2BGpSFqAdK
 782W19qZh1nWwDGm4PDtaoFnW9xIQcINZuvafbYVfnrkIIJ7jDKh+sWd5n5MceofvftpEOE
 V4j80EUEOqt2kKdx7SAKw==
UI-OutboundReport: notjunk:1;M01:P0:TzGa1YQzSJg=;BNaTBwJSU49M4PZQqiqK7CbN0O8
 Xug1EF48YsAmyJz+LbGElQMoKLl79CevI3AVGGNVpPngVjUaGR9Py06VBeQN7Q+f1wOuR0qri
 E2DUP3G+Q2AitPD1OGltTuW++Y/4COR10JcBbul1PVCpEKN/CYIc/bKgXv9CVGNXabS6kAEj9
 FjAwVj8DOTC4PSyaH2swi7jmbFPODa3Xie/2HfIFm+i78nMzg8p4WMJ4uxuaG0sEYaatIkDxn
 6VzjS4cL/HiFPKxd3rOs5bXGo8LgmuHH3GeRite9k2ODv+KZHfmrBIHrDbhq8N0nKQho+kCTZ
 L2gh59jWK/lTz4/gVa2UajNg1hQhqvDJc1UTJAGilPRa2i4mIG6UZBzE3qQBzroaYllcRsZNu
 Lp753usAGET5uUVNniRomuiK7MkbXU88ypUEXwvv14s4FT8D5hqYwwgCJ9sewgZcDFYAepb3N
 SYrj5oiqPpCwdjhClpLbz4qX/ttlX0mnz3J2nZgaHbiaxcqLm5W8y+NqKzKUSOVqm+e/pZ7Qp
 qZdAKYhp+hzsXnImDPQpFGDikSyoYM+BcAUO1mAyd+GH5fWoRLE2x/Nc2jJIYqiz3PIc2HMLG
 waiAmAQIOpWDaDRagCRpw43YJqa7RpHiMUfTSPBiiWC5sDMK/F6RGXBgxVbmRep2YLb/plYE4
 EO/1Au97Lio4OVMODQlv2aeAs6JLBcAQ+0WKcqH3CX7PT6bMRTxVkYt5WiotfUI0NpkSZCOj1
 1UzKv9GLB9wygCx/baZvoLlnmgstaGlQCWcYXzhvDmoA+rwXHUvsa5gF/yVTz+ZEm/m7BquiM
 GUIhZTNkExWAYAr0XZrXAO1w==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720788612; x=1721393412; i=fiona.klute@gmx.de;
 bh=w3B+RI+7pxmCXCdzZ3KxF2J0N0iRpPuj/eCuDaar2eQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Me4N4ZBl3kBESx8FM8JY85YIcGs2kavQ5XPdftczICCb3x8q+hZyBU9XK0QUpx7f
 rK/cEa8hkSwoCi4htsVDUBFRxfXcw3h1ywsSd3OnjXklZfGNsoLcy1sPcty31SiD2
 0803TLrboOBxDRRdvtTjqMEl9/hOz+2La2ifAR3k3t8zpYMMsXII2L9hhimmsXE4q
 DtwHnp4vqxWbJyovbzZfnt+2XiBrDdpxrk/3LXQlGKJMr8vYlROQvICJZL6OqxyVr
 OAig4I0GDy0nPki6z9DFehjVWLKGwJyU4vENbEY+sXgeWeodtwQodXqPOXdNiDpph
 jC67tSYUnz6hY5lTig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=Me4N4ZBl
Subject: [Buildroot] [PATCH v2 6/6] package/network-manager: rewrite init
 script
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Bernd Kuhls <bernd@kuhls.net>, "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

This brings the NetworkManager init script in line with the standard
Buildroot init script pattern, including the script name.

Reload using SIGHUP is also supported now, note that the
NetworkManager documentation cautions that not all parameters can be
changed at runtime (without a full restart).

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 .checkpackageignore                        |  1 -
 package/network-manager/S45NetworkManager  | 68 ++++++++++++++++++++++
 package/network-manager/S45network-manager | 41 -------------
 package/network-manager/network-manager.mk |  2 +-
 4 files changed, 69 insertions(+), 43 deletions(-)
 create mode 100644 package/network-manager/S45NetworkManager
 delete mode 100644 package/network-manager/S45network-manager

diff --git a/.checkpackageignore b/.checkpackageignore
index 7cb4b98bfc..d39b5bdebd 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1020,7 +1020,6 @@ package/netsurf/0002-do-not-cross-compile-nsgenbind.patch lib_patch.Upstream
 package/netsurf/0003-fix-compilation-without-curl.patch lib_patch.Upstream
 package/netsurf/0004-framebuffer-Fix-internal-font-generated-source-for-GCC-10.patch lib_patch.Upstream
 package/nettle/0001-disable-testsuite-examples.patch lib_patch.Upstream
-package/network-manager/S45network-manager Shellcheck lib_sysv.ConsecutiveEmptyLines lib_sysv.EmptyLastLine lib_sysv.Variables
 package/nfs-utils/S60nfs Shellcheck lib_sysv.ConsecutiveEmptyLines lib_sysv.Variables
 package/nginx-modsecurity/0001-config-use-pkg-config.patch lib_patch.Upstream
 package/nginx/0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch lib_patch.Upstream
diff --git a/package/network-manager/S45NetworkManager b/package/network-manager/S45NetworkManager
new file mode 100644
index 0000000000..9f3398a347
--- /dev/null
+++ b/package/network-manager/S45NetworkManager
@@ -0,0 +1,68 @@
+#!/bin/sh
+
+DAEMON="NetworkManager"
+PIDFILE="/var/run/$DAEMON.pid"
+
+# shellcheck source=/dev/null
+test -r "/etc/default/$DAEMON" && . "/etc/default/$DAEMON"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	[ ! -d "/var/run/$DAEMON" ] && install -d "/var/run/$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon --start --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON" \
+		-- --pid-file="$PIDFILE" $NETWORKMANAGER_ARGS
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
+	start-stop-daemon --stop --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+		return "$status"
+	fi
+	# NetworkManager deletes its PID file on exit, wait for it to
+	# be gone
+	while [ -f "$PIDFILE" ]; do
+		sleep 0.1
+	done
+	return "$status"
+}
+
+restart() {
+	stop
+	start
+}
+
+reload() {
+	printf 'Reloading %s config: ' "$DAEMON"
+	start-stop-daemon --stop --signal HUP -q --pidfile "$PIDFILE" \
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
+case "$1" in
+	start|stop|restart|reload)
+		"$1";;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
diff --git a/package/network-manager/S45network-manager b/package/network-manager/S45network-manager
deleted file mode 100644
index bc775d3b20..0000000000
--- a/package/network-manager/S45network-manager
+++ /dev/null
@@ -1,41 +0,0 @@
-#!/bin/sh
-
-# Allow a few customizations from a config file
-test -r /etc/default/NetworkManager && . /etc/default/NetworkManager
-
-PID=`pidof NetworkManager`
-case "$1" in
-	start)
-		printf "Starting NetworkManager ... "
-		[ ! -d /var/run/NetworkManager ] && install -d /var/run/NetworkManager
-		if [ -z "$PID" ]; then
-			/usr/sbin/NetworkManager $NETWORKMANAGER_ARGS
-		fi
-		if [ ! -z "$PID" -o $? -gt 0 ]; then
-			echo "failed!"
-		else
-			echo "done."
-		fi
-		;;
-	stop)
-		printf "Stopping NetworkManager ... "
-			[ ! -z "$PID" ] && kill $PID > /dev/null 2>&1
-		if [ $? -gt 0 ]; then
-			echo "failed!"
-		else
-			echo "done."
-		fi
-		;;
-	restart)
-		$0 stop
-		sleep 1
-		$0 start
-		;;
-	*)
-		echo "usage: $0 {start|stop|restart|sleep|wake}"
-		;;
-esac
-exit 0
-
-
-
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index cbd2ba8839..3937982c5f 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -163,7 +163,7 @@ NETWORK_MANAGER_CONF_OPTS += -Dnmcli=false
 endif

 define NETWORK_MANAGER_INSTALL_INIT_SYSV
-	$(INSTALL) -m 0755 -D package/network-manager/S45network-manager $(TARGET_DIR)/etc/init.d/S45network-manager
+	$(INSTALL) -m 0755 -D package/network-manager/S45NetworkManager $(TARGET_DIR)/etc/init.d/S45NetworkManager
 endef

 define NETWORK_MANAGER_INSTALL_INIT_SYSTEMD
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
