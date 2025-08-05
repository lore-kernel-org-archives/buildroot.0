Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08EDAC87FDA
	for <buildroot@archiver.kernel.org>; Tue,  5 Aug 2025 17:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A63FF83FE1;
	Tue,  5 Aug 2025 17:16:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MX5EHELbOL7V; Tue,  5 Aug 2025 17:16:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B260584014
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B260584014;
	Tue,  5 Aug 2025 17:16:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A36CA233
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 17:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 897C283FED
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 17:16:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id niSc8iN3owzQ for <buildroot@buildroot.org>;
 Tue,  5 Aug 2025 17:16:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7BACD83FEB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BACD83FEB
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7BACD83FEB
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 17:16:11 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from pc-1.fritz.box ([82.135.81.178]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MowGU-1uHMyl0dbi-00derh; Tue, 05
 Aug 2025 19:16:09 +0200
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>, Joachim Wiberg <troglobit@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>
Date: Tue,  5 Aug 2025 19:16:03 +0200
Message-ID: <20250805171603.1296472-3-ps.report@gmx.net>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250805171603.1296472-1-ps.report@gmx.net>
References: <20250805171603.1296472-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Em5BKQ+AXKuUeRHlVLBb6LCCS6MHgDno1IDW6aU0m6ZGQi+wBMh
 m8qArkimYIHp7FK8E/NUNeOl/wBTHCp7AJEW6PCNkxwesoxdc5xwPnbmdWRxI0wXPowdNNm
 2SVS3kXWYcU7+vodt+VsiCtY5hG2JyRtzs9Kqmr8MGa5v/3X5F90vONE2HsyjOLXMdn8eBY
 B2PKkPih6jV1vCSpUGZrw==
UI-OutboundReport: notjunk:1;M01:P0:mZrMD+P/TZY=;41QvbPmk8AqgTKAspg1JiYKdNj4
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1754414169; x=1755018969; i=ps.report@gmx.net;
 bh=BjcEA5nGjZyXSFErTjCTXeElw5FYmZcmgqcZHU512F0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=dq6zHcxBoeuITDC/Mmh+CCUAfB++l6VIJ+e2uPgJUyeynyu9bqHGVL16hqPNRQDJ
 baRyDyJX/l0LzBw0anmXG9dLROVDP4vQIsupt3eeoCV6tIKdkARdU5SwWeUqsEK2D
 8jXSyuz9wPFZawmox0D4LVwupfHXMJKVQwl4c8N/rdGmDqLfHAHf7R+ZPofKBQ9Iu
 ZLQXVq/+Zw9B+zACOGGUuSfMSGVA3ixP2QwocNdeatxsYmt4kXxp/Lw6VoW7JNyx9
 Q2ZdBXUsUGHowvy4RyDRiJpYYD4VRZVskgJ85t9jEbpOUuS6RGbo4MV/3IFfeQ0yd
 MegvuvqabRUNmHV7Qg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=dq6zHcxB
Subject: [Buildroot] [PATCH v3 3/3] package/ssdp-responder: update S50ssdpd
 (move shellcheck comment)
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

- S50ssdpd: move shellcheck comment to the line where needed

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v2 -> v3:
  - new patch
---
 package/ssdp-responder/S50ssdpd | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ssdp-responder/S50ssdpd b/package/ssdp-responder/S50ssdpd
index 8654de4f26..7b8106dcc8 100644
--- a/package/ssdp-responder/S50ssdpd
+++ b/package/ssdp-responder/S50ssdpd
@@ -10,9 +10,9 @@ DAEMON_ARGS=""
 # shellcheck source=/dev/null
 [ -r "$CFGFILE" ] && . "$CFGFILE"
 
-# shellcheck disable=SC2086
 start() {
 	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
 	if start-stop-daemon -S -q -p "$PIDFILE" -x "$DAEMON" -- $DAEMON_ARGS; then
 		echo "OK"
 	else
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
