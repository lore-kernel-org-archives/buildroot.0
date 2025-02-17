Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C231C021A9
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 13:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E647080B97;
	Mon, 17 Feb 2025 13:44:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zOzDGi_VP58F; Mon, 17 Feb 2025 13:44:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCC0880AFD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCC0880AFD;
	Mon, 17 Feb 2025 13:44:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 357FDDE
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 13:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C57D440428
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 13:44:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qnxd9GJqgaw8 for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 13:44:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3A3BF40258
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A3BF40258
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A3BF40258
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 13:44:23 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.115.144]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MAwXh-1td6Sb1oxV-0072ms; Mon, 17
 Feb 2025 14:44:20 +0100
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>,
	Joachim Wiberg <troglobit@gmail.com>
Date: Mon, 17 Feb 2025 14:44:14 +0100
Message-ID: <20250217134414.276793-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250217134414.276793-1-fiona.klute@gmx.de>
References: <20250217134414.276793-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:WIPzkZyIUXQCzSO1HcVhK8tjgqHyw0bFo01nqm0dEwa9FM+X3cM
 mHhiitCNVfwMNcxzhQvHmp55NS2JAIep6v8SXdsKjATbMc7Ol70aGYg7fzE9sSTJYSWXDCN
 aMpqO5aO4du//pVGGKKQKKS9jJ4ULK+Uockbvn1OXAn7sSJB7i5Se3ZzR37ZyzMDKN/XvYk
 BlPFwu7wlQoY8aDR6FwyQ==
UI-OutboundReport: notjunk:1;M01:P0:uqB9UDI2UIA=;EjHYjBAWc7M+B1q1sh33J78vZ5b
 1/UvcbhP3kY4NAEs86ZXWSHFvkivh7KM855JWnEGD7iDemBR3+zBLp910YgnAjhBo6b229y8e
 6W1BNtGo3x8q7qXX9i8aN4xrVxKuO2G5BKyxvneTaSHsRwQi2yae4vmG6HJysobpw4XIKF2Bq
 HbutCbudoEdf261tUvzNOMOrUGOF588ZSpS9ICllpfQqxWwfpCOen2DgEiC4dGJEgQi1WX4bD
 jWiv/AaRZ0Sq0U75gF+WJ4gOM0AI6kJmYvldm6kAvAwAn7AelH3mDKTJe3pdWczXpC4YGliMu
 kypZ506oWW4nvv91fh8yMw2Wnw6ETLalW8a0n9NzTxSeOEkjZyO8wZ6j98ZCyfGCt05WpC7Pb
 wFGH9hRrAA83bWngiD5ZqAIUzZ9FHA8Vzd/AhVZtA7aPJ8RcSqvmDlfnzjdhoFdHOmwUdQW9O
 gRaQFoIdGtZL4kU8SUWXAPnJH9M68rvrvJNnXW5VXSjbFH4eBPqHWG/4rRAuN2kUKMyTPmz7Y
 8nyBjKAEEk+amqeTZAmqqaTRS1CKi3N5Npo9SR53ODyCiOOATWO8yK0WNDNXiPSxSjNTucbaI
 Fy2M4QjrB3/BKzfU9xdqDleKRB1vIJMdoluev9OMYQ56pWdXBENPf5ZaKz234EQ9v56VHvMRQ
 zyGaI0sp6O4GX6CGYuJ69q17t5YnSy8tIAgCIsbn7wsgc7SIQWROKqqkZ3nKAmGz7dcOun8MP
 qAPQpb4Dzgrgov+2aq1XuIyoussm+ZeiBII7qcZLMC1iJtQa4QarI3mgbpKHTpEPnnkZHObOF
 TvoUT2rMnT+9eVmtw8BJYLYjncvYMB+V2W/xhmeZYos5lnAgYRA/22gpozr/t1CYc6Hp4gAgP
 AjappkoXg2wsm9PPqEcyaczpWnX+fVB7KD8rGGlnNgBTqPayDujx/JNoDffPZ3paY0d6nL01O
 7gDKIa0Kw5aaS0BqM0z0YJC+DS63RPzmv/5+jb71I7X8eS+qQ8iapVlW01lwCDZ3E9iFyPGG6
 7C4PoJI6RO4L2xyLKsG9g5yhCV8xSiEM39gJw/LfWC2S/Em/Zt/p5gTdVtiFNuk1z0/jQcUw1
 G3uDmM0x2+S1xtAIMfC2abLCHUfT9ZqG3F9VvpDEhI8HDh+ic1+JLIgM8dY56WZMgkvLSt7zz
 ldhDHpulR3X9dbiNBTOH+zdjcMRD3jEgoQi6n5+lZAycjdBRJ9JivpgtF8qo8eiE/l8aAMZL1
 2+jGqHoN7EwkHRtPqXQ/qErka/139mx/ZZ5ygvew6aEGujGDjhNCmqXPxyMDjhBRKtmMXPrA/
 zqVTbmcW+wcs8+3rPaOGKMQEoJvEYmCfUrbuzcMqCvLmVnuhRJOzuAId3rBKPARF5kxJDJzq7
 8rauG7zVqUaA6Ed9kMLdVNOXBc8G/6KTDIXsYkN4kxeiKNPDlMVnNcs82F+U6aH7SgPNiR/7E
 8IIMx1g==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1739799860; x=1740404660; i=fiona.klute@gmx.de;
 bh=tcztPMFj5wetxNqX3gULnEW6Ff8EySnpsmvFzW48F+0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=rMoesrWH/LSCWQz5xZ8UgvVCKePCRfaN2bVDOdh/T01ndkp8gRQbtQosMNI5jKAX
 K6QIc2PsjIhUoWMEkPB7346u71btqZ6BZ/kyvhV0Xao1wcDQpcSpGNONWOwkmHbmu
 ImdgctRWCwuStSYC9nDqfI+bpe9QfeO4oAs3qIopWipfkAwhnIldwfbTp89vGVZfR
 YVEnBwvx+O9khn3vsSSBSHbF4hpO2YR2+GuNxw9NA8b77cjHfOIpArUYr3F7x5hG3
 MVsNHv9WopSwVeZWsINCslznykiJ9Zd3e10jRpvGGL3j6wsofCIoEQTMlk0QO+p2D
 MlR0S+7BOl3DJUVXtg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=rMoesrWH
Subject: [Buildroot] [PATCH v2 2/2] package/watchdogd: fix sysv init script
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

PIDFILE was set incorrectly, watchdogd writes its PID file to
/var/run/watchdogd/pid (note the slash), which is not configurable
without patching.

Restructure the rest of the script to match current style while at it.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 .checkpackageignore            |   1 -
 package/watchdogd/S01watchdogd | 102 +++++++++++++++++++++------------
 2 files changed, 66 insertions(+), 37 deletions(-)
 mode change 100755 => 100644 package/watchdogd/S01watchdogd

diff --git a/.checkpackageignore b/.checkpackageignore
index 6e46b44b09..3366122d04 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1262,7 +1262,6 @@ package/waffle/0003-drop-C-dependency.patch lib_patch.Upstream
 package/wampcc/0001-Add-RISC-V-endian-detection.patch lib_patch.Upstream
 package/wampcc/0002-include-wampcc-platform.h-fix-build-with-musl-1.2.0.patch lib_patch.Upstream
 package/wampcc/0003-Broken-build-on-Windows.patch lib_patch.Upstream
-package/watchdogd/S01watchdogd NotExecutable lib_sysv.Indent
 package/wget/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch lib_patch.Upstream
 package/wilc-driver/0001-cfg80211.c-fix-missing-prandom_u32-with-Linux-6.1.0.patch lib_patch.Upstream
 package/wilc-driver/0002-spi.c-fix-build-failure-on-remove-callback.patch lib_patch.Upstream
diff --git a/package/watchdogd/S01watchdogd b/package/watchdogd/S01watchdogd
old mode 100755
new mode 100644
index df57b8ad7a..8f811ac0fc
--- a/package/watchdogd/S01watchdogd
+++ b/package/watchdogd/S01watchdogd
@@ -1,47 +1,77 @@
 #!/bin/sh
 
 DAEMON="watchdogd"
-PIDFILE="/var/run/$DAEMON.pid"
+PIDFILE="/var/run/$DAEMON/pid"
 
 # shellcheck source=/dev/null
 [ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
 
-cmd()
-{
-    start-stop-daemon -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON" "$@"
-    status=$?
-    if [ $status -eq 0 ]; then
-	echo "OK"
-    else
-	echo "FAIL"
-    fi
-    return $status
+start() {
+	printf "Starting %s: " "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon --start --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON" -- $WATCHDOGD_ARGS
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
+	printf "Stopping %s: " "$DAEMON"
+	start-stop-daemon --stop --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	# watchdogd deletes its PID file on exit, wait for it to be gone
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
+	printf "Reloading %s config: " "$DAEMON"
+	start-stop-daemon --stop --signal HUP -q --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
 }
 
 case "$1" in
-    start)
-	printf 'Starting %s: ' "$DAEMON"
-	# shellcheck disable=SC2086 # we need the word splitting
-	cmd -S -- $SMCROUTED_ARGS
-	;;
-
-    stop)
-	printf 'Stopping %s: ' "$DAEMON"
-	cmd -K
-	;;
-
-    restart)
-	$0 stop
-	sleep 1
-	$0 start
-	;;
-
-    reload)
-	printf 'Reloading %s: ' "$DAEMON"
-	cmd -K -s HUP
-	;;
-
-    *)
-	echo "Usage: $0 {start|stop|restart|reload}"
-	exit 1
+	start)
+		start
+		;;
+	stop)
+		stop
+		;;
+	restart)
+		restart
+		;;
+	reload)
+		reload
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+		;;
 esac
+
+exit $?
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
