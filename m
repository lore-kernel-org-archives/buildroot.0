Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D180AC43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0E5D40E76;
	Fri, 26 Jun 2026 14:50:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8-dOWWlGAiPU; Fri, 26 Jun 2026 14:50:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADE5C40F01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485404;
	bh=DX+zQN2jw8cqF37NtV7u6cn2JBWZv357DHmGeT7Qhik=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mpVqgw8gzu5stPyGbo2U4Lvam7UFglfg2U99l0XQtaUtqAuSmDmlWPzf0HHEwxe1N
	 WRdRmlZ+pte6N+1/NhQ0s+bnP4/Tz7/3h07ydbWLaIJJdNKBjtogxsvu3CALXO1xc2
	 ugOUkoqrcXH8ZEJVSMXztJxBAiA9LsSzqFyzZm9MQCbofN5V0SQSpFUnIBrbNUNLBW
	 pzNTqFdd/1HWAK9RGVLDitdIDcbu7+xIXZOsBoBdCpS5xhE0vx8AyRSntqIFutSTou
	 BjhG4biPnAlZdIPpbNngkoRUUY61k3qh6+8oOTbvYNq/tC1a/bcCZdCrD9vmMpps5T
	 xRiuS4r+brHig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADE5C40F01;
	Fri, 26 Jun 2026 14:50:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F67514A6
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5556260F25
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jH2qV5WM_VHT for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:49:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0995260F05
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0995260F05
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0AEBF864B9; Fri, 26 Jun 2026 14:49:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:28:29 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4cc43ad01416e6c817d825c64ed9fc09bc742ed2
X-Git-Newrev: f825a5d00a4e4dc834fb95cc70ba4b28fb168809
X-Patchwork-Hint: ignore
Message-Id: <20260626144920.0AEBF864B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/mdnsd/S50mdnsd:
 rewrite to match current guidelines
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f825a5d00a4e4dc834fb95cc70ba4b28fb168809
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

With the action function as the last command in the script its return
code automatically becomes that of the script, and without explicit
exit shellcheck does not complain about unused functions.

Also wait for the process to stop in "stop", and simplify restart.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
(cherry picked from commit b4884a29379ff8de6fb9d77eadaac8d905d9d1db)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mdnsd/S50mdnsd | 55 +++++++++++++++++++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 18 deletions(-)

diff --git a/package/mdnsd/S50mdnsd b/package/mdnsd/S50mdnsd
index 803ac12a8e..a3d8835918 100644
--- a/package/mdnsd/S50mdnsd
+++ b/package/mdnsd/S50mdnsd
@@ -1,5 +1,4 @@
 #!/bin/sh
-# shellcheck disable=SC2317  # Don't warn about unreachable commands in this file
 
 DAEMON=mdnsd
 MDNSD=/usr/sbin/$DAEMON
@@ -12,43 +11,63 @@ MDNSD_ARGS=""
 # shellcheck source=/dev/null
 [ -r "$CFGFILE" ] && . "$CFGFILE"
 
-# shellcheck disable=SC2086
 start() {
-	[ -n "$1" ] || printf 'Starting %s: ' "$DAEMON"
-	start-stop-daemon -S -q -p "$PIDFILE" -x "$MDNSD" -- $MDNSD_ARGS
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need word splitting
+	start-stop-daemon --start --pidfile "$PIDFILE" \
+		--exec "$MDNSD" -- $MDNSD_ARGS
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
 }
 
 stop() {
-	[ -n "$1" ] || printf 'Stopping %s: ' "$DAEMON"
-	start-stop-daemon -K -q -p "$PIDFILE" -x "$MDNSD"
+	printf "Stopping %s: " "$DAEMON"
+	start-stop-daemon --stop --pidfile "$PIDFILE" \
+		--exec "$MDNSD"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+		return "$status"
+	fi
+	# mdnsd deletes its PID file on exit, wait for it to be gone
+	while [ -f "$PIDFILE" ]; do
+		sleep 0.1
+	done
+	return "$status"
 }
 
 restart() {
-	printf 'Restarting %s: ' "$DAEMON"
-	stop  silent
-	start silent
+	stop
+	start
 }
 
 # SIGHUP reloads /etc/mdns.d/*.service
 reload() {
 	printf 'Reloading %s: ' "$DAEMON"
-	start-stop-daemon -K -s HUP -q -p "$PIDFILE" -x "$MDNSD"
+	start-stop-daemon --stop --signal HUP -q --pidfile "$PIDFILE" \
+		--exec "$MDNSD"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
 }
 
 case "$1" in
 	start|stop|restart|reload)
 		"$1"
-		status=$?
-		if [ "$status" -eq 0 ]; then
-			echo "OK"
-		else
-			echo "FAIL"
-		fi
 		;;
 	*)
 		echo "Usage: $0 {start|stop|restart|reload}"
 		exit 1
 		;;
 esac
-
-exit "$status"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
