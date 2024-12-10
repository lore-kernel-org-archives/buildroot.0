Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 304BAE7717F
	for <buildroot@archiver.kernel.org>; Tue, 10 Dec 2024 16:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CED9E403B5;
	Tue, 10 Dec 2024 16:23:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lt8XN7wY7hPj; Tue, 10 Dec 2024 16:23:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B552B403B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B552B403B9;
	Tue, 10 Dec 2024 16:23:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D4D6ED2
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 16:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DAAE403B9
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 16:23:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hcQ8QIE5GT3c for <buildroot@buildroot.org>;
 Tue, 10 Dec 2024 16:23:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D6485403B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6485403B5
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D6485403B5
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 16:23:18 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.124.199]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MXGvG-1t7Cok2rVu-00Xtd4; Tue, 10
 Dec 2024 17:23:08 +0100
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>, Grzegorz Blach <grzegorz@blach.pl>,
 Marcin Bis <marcin@bis.org.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Dec 2024 17:22:42 +0100
Message-ID: <20241210162243.1541113-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241210162243.1541113-1-fiona.klute@gmx.de>
References: <20241210162243.1541113-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:hVmECmR1OGofmFYllmIGXDsASLLJ/Q2fEBAMIXPqhhDh5qnfnnY
 jbCBP7YpJjsavvGEVXjgXeswxJcM6SbZOqK0YqHdRBCX3jvL101vQ+ZRZZjCveeCTLQ+RqG
 Oa/ywleG0Oamh72ZW2kP4+aDefyRPfkmBX4UyuXHp0AKyXx/xusbEa8nNwTyXTaprLU+ihL
 haiX4z++88e+8iXkveiLA==
UI-OutboundReport: notjunk:1;M01:P0:wi5M/S+wj1k=;BPKD9qVJYwA8g0isM45iZTOrRkr
 ocJA273KSpXwg14GxGdcIb6/QH2IfzZsEPMbiJYdH0APV9HBBQXgSfuPMGKuIi8zRWNoU98SA
 zQKYl3fncWhStJvs5T2LprJtgERe19RXTuiL09QSSaW/2yxjVbcx7wVtNjd/JEjQREXFfDw7L
 h17ZtdAupa8cjVSM8/o0tmphfFqYqjomuYwZ7+sgLwldotdcg3K82yHdxZ3uzlteVyHh7EOve
 xp3yUctGnlk9VNIlu4OE00D/qbUIW3Y+8kcfFOLx7XAM1PXf5ZfGb1QF41sFCuhiP8xjip8iP
 ldKLxPuHe0f8+toRGIaQMfELsEnmm7XCbJ3Lh1woU5XFVMTndeDqyMdBqVFzI440wh8AgZ+I6
 FaaP+Dc6Bfa/OEtp9WqR6fTdYOoVm/InhnCdtTSBVyUoPkcASRXNOJXRD778dfyBzVdFTrl6e
 fC1p2lQtU2V+G96T/SAg9sFIOJRrMK7tOWCBngQzOH/K067ngqtlKod+gvIdMt4v1Sa4/CoAy
 rib2B32sA0RCNxLxzZOaMmfYWfDqe8knSguk4EiqYMrKJCIDVgVgNDq7twZIpJO/sI00/a11t
 Opcb9O17U/1AqGEtqy7f0m5SCYASpFmMnHsOQdzTad9WfYK9oBQe0hElUO6b1vueYMkgpPb5e
 AHX9O6XJ5tFdzpj0d/hzGJUpivvFBztv/hfnvGVRuqeVsJwXg549DJLf+SxrdjKyTA4MkwwIv
 VyW94VumefyTp/OZhxuGDUQWPakyk0ITAWI8+69vUhOnhRPqo7oC9Dk8enCkSZkqPIqj8qq4K
 FuETGo3XtRT4u8GZ1NLSqhVVyOlthA7hsJ0X9qro+ztNAbe4z/Yv96LaXfYSJo7jLuNAkK4nS
 czT7MW15an7unF3Wpb1R+M//9zk92+VdzMd5C++ALChg5fLqi91xFbZ1nFjz+dO9/5B4HSXTF
 6/ZurDd83wYKuvttDDpNsDueCFY4OUsUn8RdKPcSS6NXbzodrWvRUg3v/vKGSIkAsAkqxSvuR
 2r3l/K1wkAiKYlJGefPzh9urQzwazivEWNLtVmlHaGco2HgPUN72mrn6MXL/tOVfYdgIrjJNI
 +O8rqLEBgAWfeH8HzWGIm8IzaqiMow
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1733847788; x=1734452588; i=fiona.klute@gmx.de;
 bh=VTOQQx/Hfq3+NDmh6xrSo83G668sHlhdxKUq66+aiyQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=oTfi9pc5XQRVdYN5S3GIFrBNEKdxAr8O6YOcaAwdZuhLzEBIE0+zZvwm9F0P4ahz
 aCCRdD6kwuwh89Fe2SRm2vbScZdL9pKIsBqckghSFWBfSGHaJexKt6RC1jlIMMKMA
 XuqYuCLlpPVcvi7nkhotpYGIQdEUlzawoQqgoBuAB6ad736uNzshy2iYqxr3/9WMv
 69Naj1F8ywcY2NcknycxpRNv2L8SJYxR0HglM5z0piF4YjGswU0Ergu5A9602fyEV
 wic2yyLpI5aDABY0y4AjusbtgAgpCCG4FWaRyYA79T0O56sCmSpapyX52JtNuLNP5
 McDngXvWtX/LoqoHVA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=oTfi9pc5
Subject: [Buildroot] [PATCH v2 4/4] package/bluez5_utils: tidy up the init
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
