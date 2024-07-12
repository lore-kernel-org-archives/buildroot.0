Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AEADC3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 09:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C974417F2;
	Fri, 12 Jul 2024 09:48:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t0nakUQxCoJq; Fri, 12 Jul 2024 09:48:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24CA941866
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24CA941866;
	Fri, 12 Jul 2024 09:48:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 08DD41BF5A9
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 09:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0287F4129B
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 09:47:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D9oQ-Wn77y3d for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 09:47:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6DAC640A1E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DAC640A1E
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6DAC640A1E
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 09:47:53 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.120.126]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mwwdf-1s8zsM3dYR-017k6V; Fri, 12
 Jul 2024 11:47:49 +0200
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 11:47:13 +0200
Message-ID: <20240712094717.2539892-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240712094717.2539892-1-fiona.klute@gmx.de>
References: <20240712094717.2539892-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:WvF2vcHEHO3ald2RkL/i7GHdbIAdgMnXBfrdsBvwdKlZrzWG2BN
 a0v5dD6fY5BZLs9vDlhk0UooFTz4Jq1U9384Oik7LOoVCrBCFYkwQ9t56d6yd/RK+m5ijR6
 1DaocMYb9JYYwpavkDGncVIsM6m0ILcl4xPmkmFAVvnRcQBWZGzNPJC5Lc4Day6zMMQypEb
 MPySUwZiLfbHblMgwyCRg==
UI-OutboundReport: notjunk:1;M01:P0:rdmxKhUEIZ4=;ynMYkprJrU2dflLLw0wfzOtQ77k
 i8MmfL7YGOddo5/DeJOc152Yqc/OBFS8zyE+KVdNY9MbDMKl+YqLYN63p2GurS2hY23prc6AA
 lw+7IQFMNnNA4AGfea4ZR6PIOMU6naKCrmZAiZRDgNrJkQu5qD/uB0YiF0ALPrZMdKt5fHV6L
 iNbQ6GXQG9fjaz5aqrujYGfmrZcI/u14kTM2AXDBNJOUbDk8FzwZ7719ic5gFMMctn9o3xxKG
 /PECOGLlcIqI830c4kywbGMtlKy5evh5cjRNrX8uN9LkjoVp7QtdjkCb6dy+6keDYx1xpiV8s
 HxzbaDtDeW+AzFSoJ7OktM1vNt4cL8waKXKxKuBTz6n6Eg5XMZP5/kPquS7Ne/QY3M7ncvvjF
 u4+RWlfkbLWeB9QxIU3/t3C9xC6ZpZu+UH7snUceP9s23e72j8N4oyKn7pgqd3uunplnPiGjC
 tkmcIuPEjBpwN7L7/O5s1SlIdlDKE6rQI6A4AYxiYpo9q5mkRz9DOTveurKNE73fGPWYCxGrh
 KVshTmx3RnV1KFsbkSLVBcDonIJx15PhjCz2HxTmVgstWTjzUfw1a6Cz9+yBv3EZkZPlMuuY/
 hHQHTyrDDwwhfZ6zsArp+FFfot9Y7v4WqjifTQiGE1wQL2KFXtARH498wdg9GspEazzLkO3+x
 xnvmCHp7WE7FpqhdKAUDfi/H+4nJeN/AEORREdeeuOl+hwgVPKJSzBcrLeCZEceHc+3nTpOQM
 FmyoAykYRPv5zxZDjdMPG/yiOOLLJxgFtAN8CiY82cshCHi/3oaJiK+9js1qhcWvrMpP8CmH7
 Aiq9GUDOwG1O//VS/7n2ujNA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720777670; x=1721382470; i=fiona.klute@gmx.de;
 bh=cl4GSqPd+7DIocQGw1/IiPYmYCW3pQYFVfPhp1Ea3M8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=AtVkaAht3atVxVIIkuXAW0TvE9v4kv24BAIDZx2EXoVLMjHP0y9T4RXTWgQrhzP3
 bNpKtJjqN5O5soulEwDzw5K6I5DIkRQq9RDvixXwbp2SRrG8+JvrOu58z9p4M9jHq
 tbjiznZ9auru1UQyW1Hk3EtiNtOYIVEz33ih3b3MeolLuEZ+KWz7Xk0k6EDVPtRXj
 nBa3+ha7KAamN1OBHuVOROAv6KT/SeA/ILUKqJGu5vVu9OU60SNGEBtEA2A5IR8VV
 9uT0bFdhKa+zg7dMYxTeFoEcKSoxVoxhZmAIQb7pn0JjoqTfVcATR+ye1XMnmwtKR
 WghkPO91OlkIx6Pn5g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=AtVkaAht
Subject: [Buildroot] [PATCH 2/6] package/busybox: tidy up S01syslogd init
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
 package/busybox/S01syslogd | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/package/busybox/S01syslogd b/package/busybox/S01syslogd
index 15006bc06f..5975fa7a80 100644
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
+	# Wait for process to be gone, because Busybox'
+	# start-stop-daemon does not support --retry (as of 1.36.1).
+	while true; do
+		pid="$( cat "${PIDFILE}" 2>/dev/null || true )"
+		{ [ -n "${pid}" ] && [ -d "/proc/${pid}" ]; } || break
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
