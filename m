Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECAD2C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 09:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B30F417F7;
	Fri, 12 Jul 2024 09:48:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WtC9rI9U_jxN; Fri, 12 Jul 2024 09:48:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F1F74187E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F1F74187E;
	Fri, 12 Jul 2024 09:48:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B142A1BF5A9
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 09:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EDDB4129B
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 09:48:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HQhYtgPstuXP for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 09:47:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 31A4640A1E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31A4640A1E
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 31A4640A1E
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 09:47:58 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.120.126]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N3bX1-1sJzIm1mwV-00sKpX; Fri, 12
 Jul 2024 11:47:55 +0200
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 11:47:16 +0200
Message-ID: <20240712094717.2539892-6-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240712094717.2539892-1-fiona.klute@gmx.de>
References: <20240712094717.2539892-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:BF/ltZM5OYHcp3s/YYfvbg119xwVzVQMS7Z8mGsoTIhmSEwrXjh
 SGu/xMWsW6kCMltW5d8tJhL55IauW5A5/YoYLYbUSzrAsb5vuYGjieuR+M0QalDB723NXpH
 AozEVlXLB2rSLYxQN1t7PpU+5qM4gEE9eTcyVSQSPIRTs6Sr0zQJjdN61FRUrVXXLA9H1He
 Y+Otufz1DflT2rSPpt/Tw==
UI-OutboundReport: notjunk:1;M01:P0:k7WIqs9Dq3k=;FGoIeT1ObGDnzbApuQlauIPBSVC
 XeHDdurZ4JkFoVCy+Yt5waYSJIWWe6TlBC+I8MTcn0EtvDq6mSR0ux3B5nZ2I7q4LZeG/eG1D
 i8azdJ46Jz/IDHthz7I6q2YHXUMNfB2epMYc9yFtArqPXoPqx7OYSZEtvKACX8H8BeJWFKs+V
 6mf47qnpMQJ5/rMv/g27rzfy0ujcUkB3/pRUfZvLkOcEncOsxB+OT5sr2l6nkclOmgZXQyW48
 H9+Rgsjfw8mpQYzHc9lt9RqUHBZuR31sC5fAfyTIRaBNIrD+wwERkC8+4k2zoN+tEDTFqFpMv
 WcQtXa7NS3dPdOJBUpesbHDdn8WMEKRRf/9ZC/898YvoIOHA5DyC4kCAPmqG69FMIendLxiX7
 CsgG+H6+mwNAhLI7mjsOQpOyCaYuuSMuWWEzwkaB6iONLKba8Zu8qs5D6zPbUmEngl7VJ2vCQ
 SL0lgOX1FPHUnKQyNg4TczYJ99y5SClBYY+ze9fS4W3QLWLm613/ng79n5NAexBWMXBluDdpD
 4yZVwZLjlytwf2knW12dEpVvJL760YAnMrkz6YCijF2YdTWlvBb45QxmTVTO3oepsluVbZpIq
 DHCyjFwdH3hOYBw/1IpV3v/zlK3weQWwYyTDUbXCA/1AbYC+w3vVssHNyHEJYNBY7/yxoMF8R
 MNXCvQePFc6WIIxFjICzfZtk4JLBMeIwDw1nGk6YZIaJZBh12H1agnI0D6kTo8hetiJofutBG
 Q+grgVMr+IJ24UJHAgu5Cc1aXUJw1kllHPiGLqYdXmgQr5gTtzOpMMp0IOf42QEBhpvkvCbSu
 Klr+//Z2kBkwtnGtXuUs8fGg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720777675; x=1721382475; i=fiona.klute@gmx.de;
 bh=CC3lzMI2n9JpRCob477GBq6b5pSIjgxZ1cpxiUXKB1Q=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=jwx5J8FxC2CCD4N6vZSQxrLviAzRrDXAvllVjRz5Lz/I465ms4ca3QkbiaJrqoo0
 mRDdOC9/EATa2G2G56okJKblLgvUfdpBR220CCuUmkEgmITASHLOBuwQeibh1DNNR
 8h3MornP9HtCNzm9lu1Z+dW6NTEHE2INYyqSj1/GYPaB/qXl/wQtewXu7IHNW8oMm
 Jp04BPVgUY+iOw39LskOvlQBrYQ0GfzOiAdi+cc8MzHpG+yEI+3Lwc9e2PjCLZwxh
 WnskqL9ENVj3uCtZzqafW+zvpPWlxDHVLA1swV9mmflTPYABkdxemFYpwg/v4CwcJ
 d4gZw45ApleY9mre1w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=jwx5J8Fx
Subject: [Buildroot] [PATCH 5/6] package/dnsmasq: tidy up init script
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

* Create start/stop/restart functions

* Use long start-stop-daemon options, avoid --quiet

* Return start-stop-daemon exit code from start/stop functions

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/dnsmasq/S80dnsmasq | 63 +++++++++++++++++++++++++-------------
 1 file changed, 41 insertions(+), 22 deletions(-)

diff --git a/package/dnsmasq/S80dnsmasq b/package/dnsmasq/S80dnsmasq
index f1e1a68585..b876e3d411 100644
--- a/package/dnsmasq/S80dnsmasq
+++ b/package/dnsmasq/S80dnsmasq
@@ -5,30 +5,49 @@ PIDFILE="/var/run/$DAEMON.pid"

 [ -f /etc/dnsmasq.conf ] || exit 0

+start() {
+	printf "Starting dnsmasq: "
+	start-stop-daemon --start --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON" \
+		-- --pid-file="$PIDFILE"
+	status=$?
+	[ "$status" -eq 0 ] && echo "OK" || echo "FAIL"
+	return "$status"
+}
+
+stop() {
+	printf "Stopping dnsmasq: "
+	start-stop-daemon --stop --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+		return "$status"
+	fi
+	# wait for dnsmasq process to be gone
+	while true; do
+		pid="$( cat "${PIDFILE}" 2>/dev/null || true )"
+		{ [ -n "${pid}" ] && [ -d "/proc/${pid}" ]; } || break
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
 case "$1" in
-	start)
-		printf "Starting dnsmasq: "
-		start-stop-daemon -S -p "$PIDFILE" -x "/usr/sbin/$DAEMON" -- \
-			--pid-file="$PIDFILE"
-		# shellcheck disable=SC2181
-		[ $? = 0 ] && echo "OK" || echo "FAIL"
-		;;
-	stop)
-		printf "Stopping dnsmasq: "
-		start-stop-daemon -K -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON"
-		# shellcheck disable=SC2181
-		[ $? = 0 ] && echo "OK" || echo "FAIL"
-		# wait for dnsmasq process to be gone
-		while true; do
-			pid="$( cat "${PIDFILE}" 2>/dev/null || true )"
-			{ [ -n "${pid}" ] && [ -d "/proc/${pid}" ]; } || break
-			sleep 0.1
-		done
-		rm -f "$PIDFILE"
+	start|stop|restart)
+		"$1"
 		;;
-	restart|reload)
-		$0 stop
-		$0 start
+	reload)
+		# Restart, since there is no true "reload" feature.
+		restart
 		;;
 	*)
 		echo "Usage: $0 {start|stop|restart}"
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
