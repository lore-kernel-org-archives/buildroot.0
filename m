Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C72AC3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 12:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42EAA404C8;
	Mon, 29 Jul 2024 12:20:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GfE_T-vwS0Xx; Mon, 29 Jul 2024 12:20:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D32B8404B6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D32B8404B6;
	Mon, 29 Jul 2024 12:20:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AD5FA1BF473
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 12:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B07C40173
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 12:20:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2s-PxtqgmrcB for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 12:20:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B7B9C400F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7B9C400F8
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B7B9C400F8
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 12:20:30 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.120.168]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M9nxt-1sbSAg1YyD-00F16R; Mon, 29
 Jul 2024 14:20:27 +0200
To: buildroot@buildroot.org
Date: Mon, 29 Jul 2024 14:20:10 +0200
Message-ID: <20240729122011.1112914-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:zZkmp3xLGDqEzLijrNZ7e8VOnrZAhGu4s5WgqdawCFzHMEFq6kR
 JikLZGY9KXY2T6mBWJP6N6JXP10cFrbW0kCwXVWGaScbv/vk2kOxsnNzLK8r7nThSdc9Aoi
 VPNmnM5zx/s8CBOEyH7rtsybn4ti+jzOwAzsNdctzMuiyiXdJCc9IIx0ISKi+KJEZSQL8Uy
 bteqyQDif6S+H8iQyl/zg==
UI-OutboundReport: notjunk:1;M01:P0:+nBz3eYkW0k=;wALrpdRlhn7vyvQbMiIV6tjd9NJ
 xPW6N0bfWG4Kg+f1wEagvLf2Q9wPlTx1Y/Tc4ILwU9jS15LVAMqId9kVSJV11sHIwhf+ZJUi8
 jOo0TqJgIGKtZVcy2qN7HFGv6EYPg7Ysl+bJtGSbokEqs7IEI4OwY4KuxPJ8cuWLIL271j0Gs
 8E3DXq9NFEn52kQ+x1Nhr7HnjwpIwQ09ajRw09mVmVXZVyN5rGF/AJfU9/C4QJd4YfJLZfZOs
 a/zJuyFzAd8SrgZW6+X4/5ZkXOszfrPizbH1TjQuZ5fnn8WN6dweCx01NSOWDl8DUFjeh9zBs
 QEg5sJ+yVJUvC1cH+1oA+cFxIySN0cBcBt6SxzvR8FO7Wa0qdkNkAmDl4XhdPX5T2cf8D1t3Y
 FYqe+8kSPQDJQhcb5Bbo6FIR9cMt7//ngnHgHvhhNgTSKBiSsJQM1qd0YJwMerhRRMMaWREZV
 Yzh2CX0JKmjWVtHGPPv8FvsR/sG8n5N740e10PihgNRf3uS3+acn057Pu+EQaYBpP/tvyH3Ua
 nDyco3VUuWY2Y+5+c9WJiYho7aLmL3lGIayhhOxf5frOAtqD8qYkRjVxbSAvLfkYpXXdWcrq1
 GwlYJlqq4Y+PCSyGAP2Q6+dHG9Rt7OcK1w9mJ+mKVEzhagqHj0FlXmZuVdBVwWIsSiIl4qX1U
 q6PFHr2TqI5P/5Rwa6tm+1iFCDm7+5T6fAa+rA0i32Ee4um9qQGvjsvKxeRzbS8NUPQEEnKQt
 hjisf/g5ihttl3EG4EV6FuavY8V5Wp/xAHQ/gZFvaKIVyf6gWPBOQOMrqrRhTOQXIRYNahH1e
 SUMe23BW5Gudl5H7/VOfK+nw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1722255627; x=1722860427; i=fiona.klute@gmx.de;
 bh=afK6RFiUZiXcyUhclATZBw4+l6Ik3+p7hbz60Izvjfw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=pAGjugaMWBRUET0uqMPH+xcjI4T24I3gEHxP3ut5JL9bMBHs4lakH+U36zFPZHos
 6sNMc1S402MdpQ5SLcG+5O+php5zlou1ml9w8oqqPXV5EnufCrpAn59OvjJCb2uDB
 eJOiZdWWnpMZGWgGEzfVQjIY3YbCgu0EwGH4WHobC/qGRchcN/acWuqQghZs//j1p
 CYYoxsBWJMkp7FRSZ1o5I3GWK7KCIx1NuBHM6Pu82JjGFYUkLCeXYANucu76gbS6A
 7UAH0kHBNDqYAxELokWr9JWBjkGVVfhqXQTXozQvLY46Qz9cl93oekLaA4fk4+Vm2
 umUnIDy9Q4JmMNaK+w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=pAGjugaM
Subject: [Buildroot] [PATCH 1/2] package/docker-engine: rewrite dockerd init
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
Cc: "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

This brings the dockerd init script in line with the standard
Buildroot init script pattern.

Reload using SIGHUP is also supported now, note that the Docker
documentation cautions that not all parameters can be changed at
runtime (without a full restart).

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Please note that while the second patch in this series is an RFC, this
is not and in my opinion can be merged with or without the syslog fix.

 .checkpackageignore              |   1 -
 package/docker-engine/S60dockerd | 103 ++++++++++++++++++++++---------
 2 files changed, 74 insertions(+), 30 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 4fb65d231a..a9711f484f 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -460,7 +460,6 @@ package/dmalloc/0004-Makefile-use-the-configure-detected-or-user-supplied.patch
 package/dmalloc/0005-configure-use-LD-instead-of-hard-coding-ld.patch lib_patch.Upstream
 package/dmraid/0001-fix-compilation-under-musl.patch lib_patch.Upstream
 package/dmraid/S20dmraid lib_sysv.Variables
-package/docker-engine/S60dockerd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/docopt-cpp/0001-only-build-one-target-use-BUILD_SHARED_LIBS-where-appropriate.patch lib_patch.Upstream
 package/domoticz/S99domoticz Shellcheck
 package/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch lib_patch.Upstream
diff --git a/package/docker-engine/S60dockerd b/package/docker-engine/S60dockerd
index def8bea149..6850092eb2 100644
--- a/package/docker-engine/S60dockerd
+++ b/package/docker-engine/S60dockerd
@@ -1,38 +1,83 @@
 #!/bin/sh

-NAME=dockerd
-DAEMON=/usr/bin/$NAME
-PIDFILE=/var/run/$NAME.pid
-DAEMON_ARGS=""
-
-[ -r /etc/default/$NAME ] && . /etc/default/$NAME $1
-
-do_start() {
-        echo -n "Starting $NAME: "
-        start-stop-daemon --start --quiet --background --make-pidfile \
-		--pidfile $PIDFILE --exec $DAEMON -- $DAEMON_ARGS \
-                && echo "OK" || echo "FAIL"
+DAEMON="dockerd"
+PIDFILE="/var/run/$DAEMON.pid"
+# expect dockerd to write its PID file within this number of seconds
+# after start
+STARTUP_TIMEOUT="5"
+
+DOCKERD_ARGS=""
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+dockerd_running() {
+	start-stop-daemon --stop --test --quiet --pidfile "$PIDFILE" \
+		--exec "/usr/bin/$DAEMON"
+	return $?
+}
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need word splitting for DOCKERD_ARGS
+	start-stop-daemon --start --background --pidfile "$PIDFILE" \
+		--exec "/usr/bin/$DAEMON" \
+		-- --pidfile "$PIDFILE" $DOCKERD_ARGS
+	# We have to use --background because dockerd doesn't
+	# daemonize on its own. Unfortunately that means
+	# start-stop-daemon cannot check the return status, so at
+	# least check the process is actually running.
+	timeout="$(($(date +%s) + STARTUP_TIMEOUT))"
+	while [ "$(date +%s)" -lt "$timeout" ]; do
+		if dockerd_running; then
+			echo "OK"
+			return 0
+		fi
+		sleep 0.1
+	done
+	echo "FAIL"
+	return 1
+}
+
+stop() {
+	printf 'Stopping %s: ' "$DAEMON"
+	start-stop-daemon --stop --pidfile "$PIDFILE" --exec "/usr/bin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+		return "$status"
+	fi
+	while dockerd_running; do
+		sleep 0.1
+	done
+	rm -f "$PIDFILE"
+	return "$status"
+}
+
+restart() {
+	stop
+	start
 }

-do_stop() {
-        echo -n "Stopping $NAME: "
-        start-stop-daemon --stop --quiet --pidfile $PIDFILE \
-                && echo "OK" || echo "FAIL"
+reload() {
+	printf "Reloading %s config: " "$DAEMON"
+	start-stop-daemon --stop --signal HUP -q --pidfile "$PIDFILE" \
+		--exec "/usr/bin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
 }

 case "$1" in
-        start)
-                do_start
-                ;;
-        stop)
-                do_stop
-                ;;
-        restart)
-                do_stop
-                sleep 1
-                do_start
-                ;;
+	start|stop|restart|reload)
+		"$1";;
 	*)
-                echo "Usage: $0 {start|stop|restart}"
-                exit 1
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
 esac
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
