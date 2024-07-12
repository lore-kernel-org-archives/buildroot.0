Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FE6C3DA4D
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 12:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A92B60724;
	Fri, 12 Jul 2024 12:50:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9n12UYtJBxH7; Fri, 12 Jul 2024 12:50:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF4EC60885
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF4EC60885;
	Fri, 12 Jul 2024 12:50:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F7401BF995
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 12:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16CB78452D
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 12:50:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QwWNcrDhq0yN for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 12:50:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C8F5284524
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8F5284524
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C8F5284524
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 12:50:14 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.120.126]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MN5iZ-1skk592dqX-00Re3z; Fri, 12
 Jul 2024 14:50:10 +0200
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 14:49:52 +0200
Message-ID: <20240712124956.3925574-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240712124956.3925574-1-fiona.klute@gmx.de>
References: <20240712124956.3925574-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:i4JO3JP3o14KBAIND+N4OhZDrlW1jcxee4p+TqdPk+yaYTFE/mY
 KYQtKLg/EqaL9YbMmr1ed1LU7tz9bmEZ8jNg/5aMjJQXO4Yfld90xH7r5ZqM6IDNLIYZoHb
 DP21xXThbaieXLo0Z/LuPko4gk1zdHcsVb5WXY9bL7ata1KaipmeQolEBPmvdG9yl0T2niJ
 1QG8T9w8BrTsBxAUqj9LQ==
UI-OutboundReport: notjunk:1;M01:P0:KrX5tGWJEuk=;pdsoX4eXc1FRBf5kf5181S9pQI/
 TZmK1k2CtLy3cR1SApGZDUidy0VmsKdJ05KA0vPtdB0/oFGKbDlEP43/0MXUdPh94Y4ubbBgY
 VEqMPAVQwpZmkgfYnSiohUEOOMW6AwmTYi8cg4J70/DCSiIMaI80+4U9vOi75cmisy/wbjPTh
 jLYUi4KJlg0pMPsdKT5ezQJxmSNDW2xDhJ/vhQ5l6ZVTRUfsozDotWVqCW09XFXnYQpHEz+iP
 okZFyVJu55a4RDp8lC6JW6Xg2CQ0pW7gnwYBrM/iEDfEeD8PgTYsrPFSl7QBO/ChWX55a80Wu
 ZIt/pHM27pfr1iR1h7Yh99EZqzO2rXbB7ezaUQEK3tpQ2xdpjEyPk40grmDGwWAGEkX37Yze8
 KSH3e3SY7WZX5Dc++Gc2u/R9tIbthHg0Tymbc35uttY3Gcea7xf5FQwh0H/PjAnmJ/iq4++10
 vwpvMi3JZkuCFTfeMr/rqosG/y/e7gCdYINqG0mA7fnEqOV2VEHFZ0/6xQWKwdgaMpzJtZwj8
 alQjmU3b8237k4E99EJy6HqWISYytV+jNVFm6X3r1gObM6ohVaotCpD9d1Msg2kquL0/Ob/zt
 dvxPJ5TfFb4PDz5i5tSzkBAfJp/5u6u//yk2rzBYjG7pLBUoE+VrbY2QksMY6XS4surX8cDSP
 GXbnByVy2r2V140RxB1+RBr73WTElfVwO+B0Vldlq5jsMkGo1rUTO5HxC3X41BFcLZDxBGoOa
 n7HA/SJmAV/dKSHHlvIwK63jZSYMhlu2k95CzspX0DfbC0GzJW8tu1lBt1bfSOSGSKQ755zlw
 QEAQ3Xp7Adq5HCx6wpr0eg+Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720788610; x=1721393410; i=fiona.klute@gmx.de;
 bh=wf87HFmZyUao7Z2osl5+DTc/WNzvd46N0QxDinlLSyA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=XXJeyjpdbZmzQtb6BMxbrDqX8bU+Bu8icXY3WCIfeZu81Lry6pgVNo+6QoAGuPlC
 StiaZzXE3/r8Ob9qhro1paKDcgTNJ0m03+S5mTb+W1Sif5409q2WB281aZ4H2+b95
 2/M1PDYpJX36svrICCDIKIg1lzvIiXvc1kh1jvkvc6WAHO1URCQTeQfdBOgYGkGON
 OOrWdSgv54/eNVyK3+MkugWe5m37CNAABsWsbIJ4dVTWe7xA+/Q/PRWhMy8HqxyS6
 TgLLLiOZ23xeKlHcC6RGwsNzS3x6JJH9JJqXFA6i4UMQu/TIUHXIXXrNIAeGVNFh1
 Wxfp1MltvfUsABENZw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=XXJeyjpd
Subject: [Buildroot] [PATCH v2 2/6] package/busybox: tidy up S01syslogd init
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

The manual refers to this script as a reference of how init scripts
should be written. The changes are:

* Use long form options for start-stop-daemon for clarity
* Use --exec on stop to ensure the right process gets stopped
* Avoid --quiet for clearer messages on failure
* Wait for the process to be gone during stop
* Avoid fixed wait between start and stop on restart

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Changes v1 -> v2:
* Use start-stop-daemon --stop --test to check if the service is still
  running during stop, instead of poking at procfs

 package/busybox/S01syslogd | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/package/busybox/S01syslogd b/package/busybox/S01syslogd
index 15006bc06f..d3530e1f14 100644
--- a/package/busybox/S01syslogd
+++ b/package/busybox/S01syslogd
@@ -9,11 +9,12 @@ SYSLOGD_ARGS=""
 [ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"

 # BusyBox' syslogd does not create a pidfile, so pass "-n" in the command line
-# and use "-m" to instruct start-stop-daemon to create one.
+# and use "--make-pidfile" to instruct start-stop-daemon to create one.
 start() {
 	printf 'Starting %s: ' "$DAEMON"
 	# shellcheck disable=SC2086 # we need the word splitting
-	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/sbin/$DAEMON" \
+	start-stop-daemon --start --background --make-pidfile \
+		--pidfile "$PIDFILE" --exec "/sbin/$DAEMON" \
 		-- -n $SYSLOGD_ARGS
 	status=$?
 	if [ "$status" -eq 0 ]; then
@@ -26,20 +27,27 @@ start() {

 stop() {
 	printf 'Stopping %s: ' "$DAEMON"
-	start-stop-daemon -K -q -p "$PIDFILE"
+	start-stop-daemon --stop --pidfile "$PIDFILE" --exec "/sbin/$DAEMON"
 	status=$?
 	if [ "$status" -eq 0 ]; then
-		rm -f "$PIDFILE"
 		echo "OK"
 	else
 		echo "FAIL"
+		return "$status"
 	fi
+	# Wait for process to be gone, using a loop and --stop --test
+	# because Busybox' start-stop-daemon does not support --retry
+	# (as of 1.36.1).
+	while start-stop-daemon --stop --test --quiet --pidfile "$PIDFILE" \
+		--exec "/sbin/$DAEMON"; do
+		sleep 0.1
+	done
+	rm -f "$PIDFILE"
 	return "$status"
 }

 restart() {
 	stop
-	sleep 1
 	start
 }

--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
