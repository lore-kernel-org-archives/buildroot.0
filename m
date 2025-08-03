Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E31C87FCA
	for <buildroot@archiver.kernel.org>; Sun,  3 Aug 2025 14:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDC84608D1;
	Sun,  3 Aug 2025 14:00:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oMlflDoae8-j; Sun,  3 Aug 2025 14:00:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9BDA61042
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9BDA61042;
	Sun,  3 Aug 2025 14:00:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C56801A2
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 14:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6D6B80E25
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 14:00:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZnlHjJDYQfot for <buildroot@buildroot.org>;
 Sun,  3 Aug 2025 14:00:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7A19680B2C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A19680B2C
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A19680B2C
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 14:00:23 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.232]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MDysm-1uqEkr1Kaa-00Ek7I; Sun, 03
 Aug 2025 16:00:21 +0200
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>,
	Peter Seiderer <ps.report@gmx.net>
Date: Sun,  3 Aug 2025 16:00:11 +0200
Message-ID: <20250803140011.186274-3-ps.report@gmx.net>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803140011.186274-1-ps.report@gmx.net>
References: <20250803140011.186274-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:tlmv2lIdBBTjQxjWANoFYcYWUgy0u+OgVZF04EQTRICrm/hu5Hl
 TMJRrqubFwLa4WX2yr8nsemrmZXyZK+zjC0HJpETsSRS+YWyGh4nnbRmr3AEc5spUupsdbZ
 TO0lVgTeXxuXMIVfFL4x4qyomsTlrX1SmTRvuN0S516kIV82KGTbqi4cCkoPw4GOZc88FAJ
 eqBt+RFA2Rfr8kSngwbOQ==
UI-OutboundReport: notjunk:1;M01:P0:dgyt4k9YK8s=;LYQ31PNWEBxga8RHr9tGm4LR/j/
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1754229621; x=1754834421; i=ps.report@gmx.net;
 bh=XC5QMqU29tSZ4BkJ9acQ34WR0k6SuQa0Q8Ga0Gbmi4s=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ZpMURZj479MhZDsV1dU/i+yypRn/k+cyGLLgrMk+V0tku2NY6cce1OrEb6HtZaB6
 6ut4udDe4D9EghXtu4JsyOrfejlDEIZ8YeI97SAjYxooN8ZhTCudOIrF0b2WWi/jB
 mCZPhtVjxbSfiZTmia6cCRTmwJZsQCtomQBWdamLZ8Eas9iLhZ4aiWiy10GcuX/7F
 FjCQcI9gq0ZUTYQ5B4uQ6N20RqNSjHE6Wl/BWmZbPQG9cVvkbecU/3Fwwtd+o1OIj
 rkBEUQozZ+uOXNGagKiOzVbBcVp9nOhm97WgMEPrl4v0SzaVJM4wVYypJdPCmpq1C
 Sbl9P71U5pwtzEAYcg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=ZpMURZj4
Subject: [Buildroot] [PATCH 3/3] package/iwd: fix S40iwd check-package
 warnings
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

Fix fix S40iwd check-package warnings:

- package/iwd/S40iwd:3: Do not include path in DAEMON
  (https://nightly.buildroot.org/#adding-packages-start-script)

- package/iwd/S40iwd:4: Incorrect PIDFILE value
  (https://nightly.buildroot.org/#adding-packages-start-script)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/iwd/S40iwd | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/iwd/S40iwd b/package/iwd/S40iwd
index 6714ca9956..7858ff3e42 100644
--- a/package/iwd/S40iwd
+++ b/package/iwd/S40iwd
@@ -1,16 +1,16 @@
 #!/bin/sh
 
-DAEMON="/usr/libexec/iwd"
-PIDFILE="/var/run/iwd.pid"
+DAEMON="iwd"
+PIDFILE="/var/run/$DAEMON.pid"
 
 IWD_ARGS=""
 
-[ -r "/etc/default/iwd" ] && . "/etc/default/iwd"
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
 
 start() {
-	printf "Starting iwd:"
+	printf 'Starting %s: ' "$DAEMON"
 	mkdir -p /tmp/iwd/hotspot
-	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "$DAEMON" \
+	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/usr/libexec/$DAEMON" \
 		-- $IWD_ARGS
 	status=$?
 	if [ "$status" -eq 0 ]; then
@@ -22,7 +22,7 @@ start() {
 }
 
 stop() {
-	printf "Stopping iwd:"
+	printf 'Stopping %s: ' "$DAEMON"
 	start-stop-daemon -K -q -p "$PIDFILE"
 	status=$?
 	if [ "$status" -eq 0 ]; then
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
