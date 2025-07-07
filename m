Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CFAC8303C
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 14:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2127C61469;
	Mon,  7 Jul 2025 14:11:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wr79yRIq1d7C; Mon,  7 Jul 2025 14:11:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34CFC61465
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34CFC61465;
	Mon,  7 Jul 2025 14:11:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 759BC12E
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 14:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58A9261457
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 14:11:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S0Hr4pBCCAtd for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 14:11:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0512D61453
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0512D61453
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0512D61453
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 14:11:07 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.121.75]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M9Fjb-1udR7e3klL-00GsNc; Mon, 07
 Jul 2025 16:11:06 +0200
To: buildroot@buildroot.org
Cc: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Mon,  7 Jul 2025 16:10:52 +0200
Message-ID: <20250707141052.280200-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250707141052.280200-1-fiona.klute@gmx.de>
References: <20250707141052.280200-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:AzcQ94p6GaTbQ9UQj9LAELostEy3wzGMW2lWWp+vZZoRXKiT/kY
 kVqKxm/S31mwh0rE1lyS8kck/WY/Q5TMJjUAEFYe1e8gXkCNifaxRfSbg52o+CiRzofx/Wl
 Jf7r8MT0iaIeKdLE1pOzkc2F1FnyFDtVMyFDVRkUGO1Cko+FIvE+aHPKKW4Ev6y8FaLzY+1
 IOpklDNAHJ8NoynMEUI+w==
UI-OutboundReport: notjunk:1;M01:P0:PV7JFC3MHUo=;8ISTd2nWF59vrNrnS6+FRB9jSBz
 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
 eETloyI4Hk/+jS/rm2dCtyQy04xmRq1s/9O
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1751897466; x=1752502266; i=fiona.klute@gmx.de;
 bh=JdU7TQy5zNfexisna4EErLa/Y8bGVzVGggpvc7xvdZc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=t2rbIwVUelngVtIOmzeMam+DcElmqug/5tZprISR+6Ii/5JLhD5OT5C/XIyOaiEP
 HCe6r3o6sIHGM6tacuW+Ni9jfdp7Urp5hF6H17Uw1bu26/OPhAu8sXJOpaHl7nUzl
 wDNdFJrwmKcBWfZTTefhd5bDGPEY2X6XDMxB/zX6tehtl0u+WEMYoSWbiRNyh/tEC
 LcsguVOaSUM+nG2ivw4aLpkMw9PR+gEYBtGDLPP1JVF2b8wqji8nPRQZaQV18XVqR
 IqXvu95mC4qlsSOcAFvLL5sEgpOTLKylPkrF3F7gv7Lr27usE4leZnmiY/rbIiO/R
 efiLcmMwbvNcLDt0Tw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=t2rbIwVU
Subject: [Buildroot] [PATCH 3/3] package/tpm2-abrmd: rewrite init script
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

This brings the init script in line with current standards, including
PID file management.

The chown & chmod commands in the check_device function will run only
for systems without udev, and the permissions have been adjusted to
those udev would set.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
I don't particularly like the chown & chmod, but for systems without
udev it's probably the best option we have.

 .checkpackageignore              |  1 -
 package/tpm2-abrmd/S80tpm2-abrmd | 95 +++++++++++++++-----------------
 2 files changed, 45 insertions(+), 51 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index ea830aca48..617ed6c87e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1138,7 +1138,6 @@ package/tinycbor/0001-Makefile-add-DISABLE_WERROR.patch lib_patch.Upstream
 package/tinycompress/0001-wave-add-time.h-missing-header-inclusion.patch lib_patch.Upstream
 package/tinydtls/0001-sha2-sha2.c-fix-build-on-big-endian.patch lib_patch.Upstream
 package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch lib_patch.Upstream
-package/tpm2-abrmd/S80tpm2-abrmd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch lib_patch.Upstream
 package/transmission/S92transmission Shellcheck lib_sysv.ConsecutiveEmptyLines lib_sysv.Indent lib_sysv.Variables
 package/triggerhappy/S10triggerhappy Shellcheck lib_sysv.Indent lib_sysv.Variables
diff --git a/package/tpm2-abrmd/S80tpm2-abrmd b/package/tpm2-abrmd/S80tpm2-abrmd
index 6a0bef0a31..3917a698e8 100644
--- a/package/tpm2-abrmd/S80tpm2-abrmd
+++ b/package/tpm2-abrmd/S80tpm2-abrmd
@@ -1,74 +1,69 @@
 #!/bin/sh
 
-my_name="$0"
+DAEMON="tpm2-abrmd"
+PIDFILE="/var/run/$DAEMON.pid"
 
-check_required_files() {
-	[ -f "$1" ] || {
-		echo "$my_name: $1 is missing"
-		exit 1
-	}
-}
+TABRMD_ARGS="--tcti=device --logger=syslog --max-connections=20"
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
 
 check_device() {
-	ls -1 /dev/tpm[0-9]* > /dev/null 2>&1 || {
-		echo "device driver not loaded, skipping."
+	if ! ls /dev/tpm[0-9]* > /dev/null 2>&1; then
+		echo "no TPM device found, skipping."
 		exit 0
-	}
-	chown tss:tss /dev/tpm[0-9]* && chmod 600 /dev/tpm*
-}
-
-rm_stale_pidfile() {
-	if [ -e "$1" ]; then
-		exe="/proc/$(cat "$1")/exe"
-		{ [ -s "$exe" ] && [ "$(readlink -f "$exe")" = "$2" ]; } || rm -f "$1"
+	fi
+	if [ ! -x /sbin/udevd ]; then
+		chown tss:tss /dev/tpm[0-9]* && chmod 660 /dev/tpm*
 	fi
 }
 
 start() {
-	printf "Starting tpm2-abrmd: "
+	printf 'Starting %s: ' "$DAEMON"
 	check_device
-	rm_stale_pidfile /var/run/tpm2-abrmd.pid /usr/sbin/tpm2-abrmd
-	start-stop-daemon -S -q -o -b -m -p /var/run/tpm2-abrmd.pid -c tss:tss -x /usr/sbin/tpm2-abrmd -- ${DAEMON_OPTS} || {
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon --start --background --chuid tss:tss --make-pidfile \
+		--pidfile "$PIDFILE" --exec "/usr/sbin/$DAEMON" \
+		-- ${TABRMD_ARGS}
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
 		echo "FAIL"
-		exit 1
-	}
-	pidof /usr/sbin/tpm2-abrmd > /var/run/tpm2-abrmd.pid
-	echo "OK"
+	fi
+	return "$status"
 }
 
 stop() {
-	printf "Stopping tpm2-abrmd: "
-	start-stop-daemon -K -q -o -p /var/run/tpm2-abrmd.pid -u tss -x /usr/sbin/tpm2-abrmd || {
+	printf 'Stopping %s: ' "$DAEMON"
+	start-stop-daemon --stop --pidfile "$PIDFILE" --exec "/usr/sbin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
 		echo "FAIL"
-		exit 1
-	}
-	rm_stale_pidfile /var/run/tpm2-abrmd.pid /usr/sbin/tpm2-abrmd
-	echo "OK"
+		return "$status"
+	fi
+	while start-stop-daemon --stop --test --quiet --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON"; do
+		sleep 0.1
+	done
+	rm -f "$PIDFILE"
+	return "$status"
 }
 
-check_required_files /etc/dbus-1/system.d/tpm2-abrmd.conf
-
-# defaults
-DAEMON_OPTS="--tcti=device --logger=syslog --max-connections=20"
-
-# Read configuration variable file if it is present
-[ -r /etc/default/tpm2-abrmd ] && . /etc/default/tpm2-abrmd
+restart() {
+	stop
+	start
+}
 
 case "$1" in
-	start)
-		start
-	       	;;
-	stop)
-	   	stop
-		;;
-	restart|reload)
-		stop
-		sleep 1
-		start
-		;;
+	start|stop|restart)
+		"$1";;
+	reload)
+		# Restart, since there is no true "reload" feature.
+		restart;;
 	*)
 		echo "Usage: tpm2-abrmd {start|stop|restart|reload}" >&2
 		exit 1
 esac
-
-exit 0
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
