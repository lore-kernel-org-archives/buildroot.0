Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48817C87FD1
	for <buildroot@archiver.kernel.org>; Tue,  5 Aug 2025 15:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 410AE41BEA;
	Tue,  5 Aug 2025 15:39:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id viYfxXqzLyxI; Tue,  5 Aug 2025 15:39:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86DCF41BB6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86DCF41BB6;
	Tue,  5 Aug 2025 15:39:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DA21A1A2
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 15:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFE8B60B62
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 15:39:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kcxTpw66OfUs for <buildroot@buildroot.org>;
 Tue,  5 Aug 2025 15:39:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8FB9960EE1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FB9960EE1
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8FB9960EE1
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 15:39:01 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from pc-1.fritz.box ([82.135.81.178]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MUosN-1vA1aM26QD-00OfpZ; Tue, 05
 Aug 2025 17:38:59 +0200
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>,
	Peter Seiderer <ps.report@gmx.net>
Date: Tue,  5 Aug 2025 17:38:56 +0200
Message-ID: <20250805153857.150708-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:q4qoIBNGUqcyukZgU1hwnoyErtZIkpyAd3c/pR+Zu6KFlZTEaU5
 xoOjsznHArLWYFbAGughIpdPEMK43R4K4MClIyViC/uEFVWz8NNUHHLz6MusACLtkgK/k3L
 xBKWXfTIyknJh7Ammf8+kM4DvHrmS3UqI4q63UgySkf2mEziBzMc/uB30cPHPTp2FrJFjlz
 yOouYfowguvUGt2+NfM8w==
UI-OutboundReport: notjunk:1;M01:P0:/m8NgkeIUk4=;V9ZOvzWhASw2MEwkJT4PsINmaUK
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1754408339; x=1755013139; i=ps.report@gmx.net;
 bh=x31aPWU/x7F5mBzv8/Iccke2iOwMQwp+3y5m7axf4Ow=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Z7LF1m2KlMqM04zxIDRfRvw+K5D24qMOaXpBQgMTaXC1hfAhwAoK4CnEiyHkYIip
 WM3NFrDh4PPDtf91dhYnRvb3WaRO57CtHpBbyQZ+1H9vnDve5+W4qfXQVANoGuMO5
 RbEoBp+A2WK7illhBKmiLM+A/xyGFN7TXrjI99l+pHiHuifgxHh5v16z4NlLxN+v3
 lvwSw04TaIcQrKqkjQNJqtMA/OHjasgo8Z9orF33dqH2+Cw2x5an7mW27vxmW+URM
 LBALBKw6b6ldY8RCKkp9Wn4ZDKBerxFQ8q/cMfuQhVHC2Zr7ij+0bk01n8IZ5Mhid
 0+tKTn3B40A2HUMKNQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=Z7LF1m2K
Subject: [Buildroot] [PATCH v2 1/2] package/iwd: update S40iwd (use long
 options)
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- use long options (as suggested in [1] example)
- drop '-q'/quiet option from startup

[1] https://nightly.buildroot.org/#adding-packages-start-script

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - no changes
---
 package/iwd/S40iwd | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/iwd/S40iwd b/package/iwd/S40iwd
index 7858ff3e42..de5a1efb6f 100644
--- a/package/iwd/S40iwd
+++ b/package/iwd/S40iwd
@@ -10,7 +10,8 @@ IWD_ARGS=""
 start() {
 	printf 'Starting %s: ' "$DAEMON"
 	mkdir -p /tmp/iwd/hotspot
-	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/usr/libexec/$DAEMON" \
+	start-stop-daemon --start --background --make-pidfile \
+		--pidfile "$PIDFILE" --exec "/usr/libexec/$DAEMON" \
 		-- $IWD_ARGS
 	status=$?
 	if [ "$status" -eq 0 ]; then
@@ -23,7 +24,7 @@ start() {
 
 stop() {
 	printf 'Stopping %s: ' "$DAEMON"
-	start-stop-daemon -K -q -p "$PIDFILE"
+	start-stop-daemon --stop --quiet --pidfile "$PIDFILE"
 	status=$?
 	if [ "$status" -eq 0 ]; then
 		echo "OK"
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
