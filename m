Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3601CE7716D
	for <buildroot@archiver.kernel.org>; Thu,  5 Dec 2024 14:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD25161114;
	Thu,  5 Dec 2024 14:37:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IGgPyn4JSX7i; Thu,  5 Dec 2024 14:37:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD6F7610C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD6F7610C6;
	Thu,  5 Dec 2024 14:37:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BF6621DD9
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 14:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC0E661114
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 14:37:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TtZgoeqJ49aj for <buildroot@buildroot.org>;
 Thu,  5 Dec 2024 14:37:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 79ED7605BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79ED7605BA
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 79ED7605BA
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 14:37:15 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.30.37]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M72sJ-1tIMQc1Iad-00DRuX; Thu, 05
 Dec 2024 15:37:09 +0100
To: buildroot@buildroot.org
Cc: Grzegorz Blach <grzegorz@blach.pl>, Marcin Bis <marcin@bis.org.pl>,
 Fiona Klute <fiona.klute@gmx.de>
Date: Thu,  5 Dec 2024 15:36:50 +0100
Message-ID: <20241205143650.3262372-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241205143650.3262372-1-fiona.klute@gmx.de>
References: <20241205143650.3262372-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:soRNXC0eFVYM9QcHPPe5ORGh6RMIzigmugGYrd2vMvE9t8h4m/7
 G8ROeWJyNNJmY07hyRsyRHYElyOnxZarl2ZmyvK6tPKPayh7y0U674E4ugVDCPSH7tLJ83o
 gtP1fcUAjcfLZgCToIBlcZK9tb4cTyUGY8S9ybga6ORoxcPZ0UTgQ6KN47p+0VkblRGgmZ0
 rNkAMOxfa986HCS2p+x5w==
UI-OutboundReport: notjunk:1;M01:P0:lbMuO0A8b04=;e8dEohka6p0ZjEPfQ7Ni8ywegt8
 1XYitAoey7hIAa/leyyOt7lARHYPsXL8dAAM5xdDlMDcnsUIy4G/GLqBsUYhO9w6kdUaWG6w7
 um6okDTMJszyAntZuD6PmwoXdTDyqGlxOgwbh0gKPsl2FcnDVxn5qytVtgU0RthXxZIEiMc0u
 fOagYKmhhMwgGJ/OaDoi7MUQoUX8IrZ6oJzszXsTGSkMgDxsZkSwamzTnMqzI1OcbZrokELVf
 +0asHu2yvtnbvhOWR+EMOHFT3nifLAn5DqVFQCtIr8dpk2vD0ASACH41r8F5sRqcKD7O+ZO3z
 hTfTN92pL92FqEUgOn8EOp4QlxvsakCTxUwpfSbuiY/jSEUei1FuWxN6s3Vdt6P2zNsFBJ4FM
 h2JIEXmi0/xECUBecxENTTUqBa9f4kGyQzkfLK+gwgFp5nopob8/OBQuGZ56uTor/0fG/d4hO
 33JAeYt1wXaQNBz23BMlPfC6pU8MUJtAtDRxTNtpz3QN37P42E9ZRA73S2i3OO7zgeA6cS6TW
 nX/n0K8z4/IWncCgF/C3CvE5IgmHAP4uV6PenMtcQvA5fs5KZKv9iv7afORjPHI8r0GsTZHqG
 59469Ratta1qAzaWld9eX5KzCZj0lx708kzThBdWYpCXr2n3C6/SVVt3Kn7sfFWGicLgIr+oD
 nXwWMFkNNx0MtnZfd7JcopBySvbt3HnQsJ4pFJUUcEzkBqb/qp/pSj3dLxz74z5h7hXQSX+D4
 1ndtNcIUBOrsMhpp5GuuH1GFtKtJXnKghvIdw42b+OYRvUaygqqO2lg67pdqmJ2DZMO5oZBqC
 op5tu+OZM8Ih3QOmhYSLjPernGtcVdINj4RWcvrWEy+rAJzwXzo/KmCDDpljBp1J+3Bg5dI3m
 dmzQ3YwgmKLFwe6KQWSgZHs852r+ywPQelL/sasUyzpB2O2f0/6f8A9RuPzawk8h5FZGq2nRU
 tXfs0IjFHpv+8JNF8On0/E1sgNy4bxXGbyteYsuvDYVU6t4L2fPD22uMkOg43pqaFj3uOf00p
 P0DpFsammzHnWder2ujEuNdsrMm8JEJVZ9gDmKP9usKa+GwJDatFrzNz0DzB4J9LgFz7sDLC3
 Kb72sPIzVaSQs6ibpBbSczupAYj91N
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1733409429; x=1734014229; i=fiona.klute@gmx.de;
 bh=VTOQQx/Hfq3+NDmh6xrSo83G668sHlhdxKUq66+aiyQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=KeewCXqO4ZiWUDDjjs/aLNUs+tR3gZJ4npIgsFaRWSL5UYf0b2+y0zSBpugbCJgh
 FjFhQa7CPmwnzm5BsD5jJBfli0zi+uMzkoYy2w5dvgQJsQzgYp8NRzCeQz3xvMVof
 mNFpqoFmERYWDLPMnaRQihvpUGIP2I7EQnYPSMNtfdUEQNCq0qhRrZvX6Zug8ePTP
 WD+NbGozji8JoWiTmRb/HOaN0r6of3ODqEBwfBh7anZUpdeCWetKS1GDAO96gCCm+
 1mTLMVBMa92ph5b57ANPt/76qv6IH1D0SnHO73TdMoZcSN103DU40Vt/P6Y0o7M5a
 HTZU3NTuqqXQEi3rVA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=KeewCXqO
Subject: [Buildroot] [PATCH 4/4] package/bluez5_utils: tidy up the init
 script
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

* use long-form options
* consistently use start-stop-daemon with --exec
* wait for process to be gone and delete PID file on stop

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/bluez5_utils/S40bluetoothd | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/package/bluez5_utils/S40bluetoothd b/package/bluez5_utils/S40bluetoothd
index ee4abe8b63..04f3f5ee94 100644
--- a/package/bluez5_utils/S40bluetoothd
+++ b/package/bluez5_utils/S40bluetoothd
@@ -11,7 +11,8 @@ BLUETOOTHD_ARGS="-n"
 start() {
 	printf 'Starting %s: ' "$DAEMON"
 	# shellcheck disable=SC2086 # we need the word splitting
-	start-stop-daemon -S -q -m -b -p "$PIDFILE" -x "/usr/libexec/bluetooth/$DAEMON" \
+	start-stop-daemon --start --background --make-pidfile \
+		--pidfile "$PIDFILE" --exec "/usr/libexec/bluetooth/$DAEMON" \
 		-- $BLUETOOTHD_ARGS
 	status=$?
 	if [ "$status" -eq 0 ]; then
@@ -24,25 +25,32 @@ start() {
 
 stop() {
 	printf 'Stopping %s: ' "$DAEMON"
-	start-stop-daemon -K -q -p "$PIDFILE"
+	start-stop-daemon --stop --pidfile "$PIDFILE" \
+		--exec "/usr/libexec/bluetooth/$DAEMON"
 	status=$?
 	if [ "$status" -eq 0 ]; then
 		echo "OK"
 	else
 		echo "FAIL"
+		return "$status"
 	fi
+	while start-stop-daemon --stop --test --quiet --pidfile "$PIDFILE" \
+		--exec "/usr/libexec/bluetooth/$DAEMON"; do
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
 
 reload() {
 	printf 'Reloading %s: ' "$DAEMON"
-	start-stop-daemon -K -s HUP -q -p "$PIDFILE"
+	start-stop-daemon --stop --signal HUP -q --pidfile "$PIDFILE" \
+		--exec "/usr/libexec/bluetooth/$DAEMON"
 	status=$?
 	if [ "$status" -eq 0 ]; then
 		echo "OK"
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
