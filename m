Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A62B5C87FCB
	for <buildroot@archiver.kernel.org>; Tue,  5 Aug 2025 17:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52CFC828DE;
	Tue,  5 Aug 2025 17:16:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nrCLbv9GSeVU; Tue,  5 Aug 2025 17:16:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F55183FE8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F55183FE8;
	Tue,  5 Aug 2025 17:16:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A08A12C
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 17:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF77560F06
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 17:16:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DFQLIIC7387I for <buildroot@buildroot.org>;
 Tue,  5 Aug 2025 17:16:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B4C7561773
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4C7561773
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B4C7561773
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 17:16:09 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from pc-1.fritz.box ([82.135.81.178]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MzQgC-1uNX5b1Gls-017wDX; Tue, 05
 Aug 2025 19:16:07 +0200
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>, Joachim Wiberg <troglobit@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>
Date: Tue,  5 Aug 2025 19:16:01 +0200
Message-ID: <20250805171603.1296472-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:l4uh2rr+w+PcXUSsIttH1CIvd/vHQyHGlVMtyHP4IEpaRR1EMjX
 tdsbD7cExuRpqSqi0ua4+EZ35PA+No2FwLwN7nmGR4chtqCKSK5OeZbBxQf0oq6alNdRG19
 WQiAbjtFclpulUGhykNxyfUlK423E0qkygS6uv0Are+WN0OQ4UL5n49zrDlpMHK9loxjSJ5
 d7x/dszWl2u4JfHn9eAPA==
UI-OutboundReport: notjunk:1;M01:P0:q1Z2eWHFlBo=;v8GhrXiKo08BpGbKNJ3mBhV9IJq
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1754414167; x=1755018967; i=ps.report@gmx.net;
 bh=6dEEnyufrF1co5iMIDM4QzYRdUJ3qX2J/TpLfuykRy4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=tDUFpTvV3DchPAlNyEGbbFOofz36WS9c68354OsB6a8RldCX6JiPybSwAQQJ7KDN
 NlPNcDlH3y+XoupVQmjEqhhWk8GbzRSDU7W+zlQ4FzIfvFgwwjBQZifn/GT/XWoD8
 UkthGihjw4mJIDmR9ITNx9kkQImZUE38hyX+RPFExnk7BEdsXwch0NuiKsPTnQh3e
 193fLaAvUgFvyqEyyC2H3ZSN+PRr8SKQ5OPDPHcZytC2OWC4rsZZJvo7DTqJXWHtp
 cDrRn4LPId00QcoRVaeuA8onUBOENtwbSmwFmSz6MllIY6youAQVeFBtvUwqPLogi
 6xkjNx49fu0bC39hYA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=tDUFpTvV
Subject: [Buildroot] [PATCH v3 1/3] package/iwd: update S40iwd (use long
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

Changes v2 -> v3:
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
