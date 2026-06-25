Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457B9C43211
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05532408FC;
	Fri, 26 Jun 2026 14:51:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8aNEW7ONVsfN; Fri, 26 Jun 2026 14:51:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2DAD40F6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485496;
	bh=ZXSDzSlpqdvi4WMPAEkGg37MDeV2ObfSJQzIsOenLwM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DmMNX1CcMz834w+2xG2eG+KoscI35wq3I9mjOuNsLIhkAmMsAnWR3fbm4IaBoez5Y
	 grIyf4Mli6KNFzXXwWUKpEFXUWQeQWy1USrxRv3A278e+y9trPRmFQ5pg+rYZ6QSIw
	 fvutTeq4JQJ1pk1L2im6efNa3y6pcK6N/cLo4uBvlRrB+bSqP3KMW0t07oShFpcCMz
	 g3gUOUPCtH5MKaX4qq88QsaJNYwyis00s1uppND5UsESkhJDiQ4a7RcO7AxMAbik+f
	 MYKJXnkQYhzyAFzne80/eCVXQHu8NMyZPsKKFF9iDrnZY0CqgjGU3gozVfoxRt0Lgg
	 W7mXlAiadZvyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2DAD40F6C;
	Fri, 26 Jun 2026 14:51:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BD6814A2
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41D7780934
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CkD5kuCX1cql for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:51:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 911AE8089D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 911AE8089D
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 85C388649C; Fri, 26 Jun 2026 14:51:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:28:32 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 1708ca006197afc4dd14c041dc06e45a3f07d066
X-Git-Newrev: 11bcf5f5f658923f0ade30d9ae00d9c299a54276
X-Patchwork-Hint: ignore
Message-Id: <20260626145106.85C388649C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/mdnsd/S50mdnsd:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/11bcf5f5f658923f0ade30d9ae00d9c299a54276
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

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
