Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDAA3C3DA7F
	for <buildroot@archiver.kernel.org>; Wed, 31 Jul 2024 18:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3282840B3E;
	Wed, 31 Jul 2024 18:14:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EfADqA0wLwwx; Wed, 31 Jul 2024 18:14:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C98CC40B4F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C98CC40B4F;
	Wed, 31 Jul 2024 18:14:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1E5C11BF44A
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 18:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C00B40B3E
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 18:14:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gzMa7RhW75oS for <buildroot@lists.busybox.net>;
 Wed, 31 Jul 2024 18:14:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 66A11409F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66A11409F7
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 66A11409F7
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 18:14:02 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.116.187]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N79u8-1sC7wJ1MRY-00tE2H; Wed, 31
 Jul 2024 20:13:59 +0200
To: buildroot@buildroot.org
Date: Wed, 31 Jul 2024 20:13:33 +0200
Message-ID: <20240731181334.3717996-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:DxktGmUiotcfPKRUm6zQ1hxdONy8VJvkIZiatTwYTDoW/HwWtxV
 2zv2e29mI8yyAkM9pCaO0vTac//lJBdSm2mpYGaoLH5KsKa43nQKYsuicmaD8R3EOC465ub
 tVJiKOQZABB0qWxrIflqNI4AIWUqClbCUFwcASo2IcPBYJKIsrP58r3xDHuIeTLlHkLpa3k
 3cO4NbEzvbfLEPk39YR3w==
UI-OutboundReport: notjunk:1;M01:P0:9tGCVVkLOMk=;f0Ep1JC5MYuLi9Rvoo0OxgIdHbn
 DSDw5sDRhY6JDA2mHeJ7lD/fmKtakBlChEFn+lQBNfElTaEerQoP3WaQCGkEyao4/tnQDRqAs
 2PuABUfSZm9dH8bO6leXj3e7IKICAOrj1i2jf23gSVJOMhFUi/syO0g1GWI6iPKeRNW6IOhpk
 dcZnA2IctPy3x/A+KrEeI+BFvENGeW7w9aV7lMa9WyFOph/Lkrq+RbvFFbz8/vtU6jW2mX0O7
 gUAuy7VWgcoSKk4j+2GULZz8ja+I29UpHTKLlqGih/Pc6/wc9+3ebjTCv1b/uPw96uB7wWXnD
 3WXOUvrUolTVT0ssJTgYvpMcKqjOZ50MTVddUSgSw3AHVlFLDCAz/+vgyv/+gIMbfm89n4Q6T
 zpWZE0KEg893AVQ1sfXBJlIUBuJTmZ8aJr/C3R9fnjB3kGrSHnwk1MNINODKA7Ufy1jOzNbHY
 CWs31FhdgnL75K94RFRrzPNN6SbsJDRqtuGdelCFSbpeHtigfv8GwrGrQ+NdpjeMIIADkItsU
 os+KaH0p/20iqd+zCcToeuohYGMfCYaxQ/U+UeDUoC8bgIlLSSmUTTUn46rZ1uX/u33Tg1jzL
 II79aUkpZ/TOmak+jDC41glglMHIyLqhUR31PsLiF/YIzfLXAcjANb/vwiS6Gp5wYvRVHzqcK
 qecJq83F9TK96vFZdy1x5fnVCHQIJLG6KItEw+gYf1om54wIP3jZ+NrghEIYAmvuYxAJOMvrN
 elFC6wQPP5l1Yb7wNOEd6FIJ9k5buFDVa3TErkN2xZsOgVeoZnx7TjBrIcxjCg/yIYL/Ip6K3
 c39HGmOKEcEf3Ox5CDWakM3Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1722449639; x=1723054439; i=fiona.klute@gmx.de;
 bh=6cb+Ta5bnZRSHuV5c5pvd85GDXU+HhdkpYurtdbDF+M=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=JtszsSG6PEC6MVYSeeBRlEydr5LumzMpmZ/o8GEudesmSGQ32ByMIRn9Gs0+OQY+
 CXScmBrhTiWgTWSL40jfTwRK2NHUV+QMcOZtdKSPDSnnqJq9EXL/kcToqYczFoKSZ
 jh6aXbbBQD6PNx2DKOhtqk9Fk7ddvPPBBGkMW7DPq3MOZJlnxtfxERFlN1dtZlc7s
 bSwpYhBnd0/t1R/Z0P1afeyqHPegXPa7mGn9gYFZsjZYUGW8tVWztRO3XSudlmg2p
 IJOwaZ37ioCjZvnOrvyuyP6+EKwGIVGVtW4eVtRRJYmS/5yJL+QiG+Sb15OWICDsF
 i1WCZonGU8b6A2cySw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=JtszsSG6
Subject: [Buildroot] [PATCH v2 1/2] package/docker-engine: rewrite dockerd
 init script
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christian Stewart <christian@aperture.us>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
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
Changes v1 -> v2:
* drop wait loop for startup

 .checkpackageignore              |  1 -
 package/docker-engine/S60dockerd | 88 +++++++++++++++++++++-----------
 2 files changed, 59 insertions(+), 30 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 70a2e88462..abf8b4c772 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -452,7 +452,6 @@ package/dmalloc/0004-Makefile-use-the-configure-detected-or-user-supplied.patch
 package/dmalloc/0005-configure-use-LD-instead-of-hard-coding-ld.patch lib_patch.Upstream
 package/dmraid/0001-fix-compilation-under-musl.patch lib_patch.Upstream
 package/dmraid/S20dmraid lib_sysv.Variables
-package/docker-engine/S60dockerd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/docopt-cpp/0001-only-build-one-target-use-BUILD_SHARED_LIBS-where-appropriate.patch lib_patch.Upstream
 package/domoticz/S99domoticz Shellcheck
 package/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch lib_patch.Upstream
diff --git a/package/docker-engine/S60dockerd b/package/docker-engine/S60dockerd
index def8bea149..aab50d84d4 100644
--- a/package/docker-engine/S60dockerd
+++ b/package/docker-engine/S60dockerd
@@ -1,38 +1,68 @@
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
+
+DOCKERD_ARGS=""
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need word splitting for DOCKERD_ARGS
+	start-stop-daemon --start --background --pidfile "$PIDFILE" \
+		--exec "/usr/bin/$DAEMON" \
+		-- --pidfile "$PIDFILE" $DOCKERD_ARGS
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
+	start-stop-daemon --stop --pidfile "$PIDFILE" --exec "/usr/bin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+		return "$status"
+	fi
+	while start-stop-daemon --stop --test --quiet --pidfile "$PIDFILE" \
+		--exec "/usr/bin/$DAEMON"; do
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
