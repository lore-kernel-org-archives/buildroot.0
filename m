Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 649A7C87FCB
	for <buildroot@archiver.kernel.org>; Tue,  5 Aug 2025 06:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 062E141A35;
	Tue,  5 Aug 2025 06:32:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XIkgnby4L9Bl; Tue,  5 Aug 2025 06:32:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3257941A2D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3257941A2D;
	Tue,  5 Aug 2025 06:32:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E01A1A2
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 06:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FEFA615F9
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 06:32:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GwDvhrWbb1-j for <buildroot@buildroot.org>;
 Tue,  5 Aug 2025 06:32:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D4554615F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4554615F4
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D4554615F4
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 06:32:02 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from pc-1.fritz.box ([82.135.81.178]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MIx3C-1v3bkQ2fRi-00O5YZ; Tue, 05
 Aug 2025 08:32:00 +0200
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>,
	Peter Seiderer <ps.report@gmx.net>
Date: Tue,  5 Aug 2025 08:31:57 +0200
Message-ID: <20250805063158.94884-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:eLNcLfapsEv14ycJuBDAIgLaBUUW33NPpVd9SbhT78Nv4nIfXYf
 C/UiplqrnD7tK5BRphrvEQclUQiHMi1owKUeyWtVF+DYc6byJuA3JcxTw5ynlNOOR7a1H9G
 jEYSr0VCA2XxxApKWTQIDU7RLlEkS9bi6ck5CF+eETlUKLha5WQPQvFejDb0q9Qm6hpsV9L
 jPgzIh2A0o7v7reOgI4sw==
UI-OutboundReport: notjunk:1;M01:P0:IiUuDk0IfwM=;sWUdDOOkHZKVzkoxCqeI8kn+W5q
 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
 2Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1754375520; x=1754980320; i=ps.report@gmx.net;
 bh=yxhpPlvGSQblxcsBWLGh7QevE4VES3mkhBvJgjV+vEM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=cFOleFhqxY5/kf6Kw+Vr10DeN1z4FavyjwHDynOKsa7e9q3+78yEvIMWqxF9sayU
 4XZReDDlyXNXHLlhSdbGctqQR3wOASBuFW4DonFkzrpS0UiG/mOPGfhElnabyqWcJ
 tzCCuUcZtvNGGcCS6Q4zJCcYvYAhpc0b6j6C+K0rqODVmeVZKFAxZsKVnraOEY9JV
 +qnrJunbFfApNlymAOgc1ZexYUga7PPnFI0MxLarmwXTUxLha3WgqV+E16CuSNAQw
 DIe7Hy1F/4C7o72NgnBi9fSMQPKYhyoUDKMjnaOVpl1j4Qfd6UMxRVSbc7aW0NlD+
 Y1qaFhNIBD9HqqdlZg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=cFOleFhq
Subject: [Buildroot] [PATCH v1 1/2] package/iwd: update S40iwd (use long
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
