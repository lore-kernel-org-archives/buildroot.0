Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63079C021A4
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 19:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF6C484B9B;
	Fri, 14 Feb 2025 19:25:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ghoUd_XKZ-mF; Fri, 14 Feb 2025 19:25:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71F2D84B9D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71F2D84B9D;
	Fri, 14 Feb 2025 19:25:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 015D81F1
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 19:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D99B584B88
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 19:25:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zB48QMd9xrh2 for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 19:25:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 923FA84B86
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 923FA84B86
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 923FA84B86
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 19:25:45 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.116.208]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MWRRT-1ttH822yhn-00KpxW; Fri, 14
 Feb 2025 20:25:41 +0100
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>,
	Joachim Wiberg <troglobit@gmail.com>
Date: Fri, 14 Feb 2025 20:25:32 +0100
Message-ID: <20250214192532.1772100-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250214192532.1772100-1-fiona.klute@gmx.de>
References: <20250214192532.1772100-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:YCUed+Wxi0gskuEP/iRp6MKAe++eoPyoDbzYZFkLnJob8IjDlMO
 PPsEym6hWF//whN1uCrS5EgfoCXpZ4zwzJVqJv5uSzRVAmK+fADWlJ7v3WV8XhzUWIi9lO4
 mJdWdmuj70InVW6DrNQiMAuO51lCLIbV3Xmbgioed2AMevir0x9giyvh5YqwWy+WwCamn7f
 7Dc6RFw79W0lPFXKLoCcQ==
UI-OutboundReport: notjunk:1;M01:P0:Fw3iKuZ5MgU=;wWT0mxvWZ06U2X1Olyi305pDjp8
 vMXoZug/B7Q/siM2fvhul/ueFFBRLcLSpGYLrei/YK5u1zxtYG9Kc4qZ+5DBLxlZx/yktHqsB
 RHtW8rUq+qe4WefIONlZTpB8kAmAYSqWPRbzA56tEB5aRFEdxiBF8J18M+bV6VTMDbYSyX5Pt
 Ue/OYDioU+Ao4UVpYknR8O9j7ZMhco1qrKJ8WS6+txN2nn8TGB8/b/hO1vOvc7d6j8XWJyGrR
 GGNXVt8gOqqr2hQvpC4lAfSOdBWC4vlTO2HWjApG9uQZMBMy//PtQz6HiLVL79YLYQNBaJwRe
 q9SC9uUrjdDOkGrkxHixFS+/WZF+zCEI2hwb4zf5x56CCPE6mzcZbNCOI2/bxmBBOoQhHRI7r
 BaOpqtewfYPY/PxUZtqMpfzqj1Cf797loxSpYk/aC+SKGRtZRzmElfJ9hswLwWpV9aIUKMQ2h
 DXE5R+8htFUt1VxRbXp8sOE8s1/HUNcPwazCMjtqo/QBy9ftUsR5e3iXMxJe2+iVoHWqhpkaT
 DxCvNH64nw6BtQfwPrwpeoL4oUim+7aWwn/GSJXFo3wRaBd7ee14tJgI3QShXh6o/bzdrAW1V
 wwNNkBz169MKTX0czynOwTkal41UG1XVsNYimH6vWDzcTvrU4TwIS8XEVqBGM6U12rruqBJZW
 wKX7F4adDhCotkqfqq0XE0P7ek/bVMQp9tH91jYHHNoJpMjqjwmkWKe5W59XEgnBpsta9XIQQ
 LF92al916I2mrDM9Mv/oRBHPM8SAwwLDw7idUnij9Xfv5GVoxjhdPokvY/DyJGPx02ML6BqXZ
 n629jkUvTvpVk8etVq/EwmzkJKrnxyI4x+yTOBySMZKh+mSY0Bu11pu/HoB+PR1NZUSw85QQD
 Uuz8jnz7IPGM8BD5oIfXKUW1S7mEYsOsfpdL/BaaKyVphg0Lcor03Yjm3xiSGbvIgB2w+3nEq
 WtHdyzx/lSgJO8ZezfXX++VYecxlYKyibPwA9eR6w0iYbez+zoQx+vLJ+QuLMgUO7NSqv0qKO
 GkS9Gbwiwht9vGKQFx5jStexv9NaAdu3th7iONQ1CUxm0jYRFO97Z42AQDtSVFZkpsTr/3q/M
 Pv4WzBe9Eqsl/o5R8Xlg932K6OiB4wx/4hcZa9qSrBJu+c3rqedyySsDcGhexSx7I52owfbwp
 DCdpss4OL9BWtuG4CMa9drs9WW3YA1JzqAW4A/yVTpwaG4mI4tYB5KYf3rnLrzRE70nyjZVrd
 sRMAcgTzGITQw33FYis3r9BFQ+4mcJ8DEkxWaLEhFisBPyKeM+9yNo6LEBHYsnHqUNbrN3dC4
 uLO9MEsU/wRpS6L10gqpAq9UTdqd2WEFjTyyatzAALOJ5uAaXj3Fqi58uxcGeRv2ZPLzbc8x+
 qw6tF/odCnNyHoyBGAs8k8DkCELhxSDBh56tZLO3Ykn1/Nyyckf+QoSPDC
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1739561141; x=1740165941; i=fiona.klute@gmx.de;
 bh=cjJCXAZBwJIjtXCUQtHdtln5Mw3XsB7rLGpOuJJgp0M=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=kbyE+cIso/EXNgWAqpNpvjh7NcBgx6mfe0kGGlz9+d1k2s0uGeCGyfi3Ds2nHWgQ
 ezbSfcwE8o8pXtnnsMYM/PPR5zMWsRNXN8E7dV4RJsWfRJB7Zal+jwN3A59d1/KXV
 phcjJC3DGmHP0UpcGYAH7yW/r3FcFLe0E2oem0yqvXwzBMNVQJgqFnSBkiSiZpghC
 idCRULPO8Z9uh5ssnlP/A8lh7r0SEEwvIE9DYiQ0QBUuNuSiUHHSVqB39HU/TA3Vw
 bhV4oUQP79KEma1mTMDMwsHaWFFBnNBFi3xNEBq7UXyQzkxfkB/1UBxj6LiL1gl+L
 ltNUcK2fOmt0s4uq3A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=kbyE+cIs
Subject: [Buildroot] [PATCH 2/2] package/watchdogd: fix sysv init script
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
index fc249b30ea..45130ba6c7 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1263,7 +1263,6 @@ package/waffle/0003-drop-C-dependency.patch lib_patch.Upstream
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
