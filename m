Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F7AC3DA4A
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 22:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C26644018E;
	Mon,  5 Aug 2024 22:39:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kz4D90xWygIg; Mon,  5 Aug 2024 22:39:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9665740200
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9665740200;
	Mon,  5 Aug 2024 22:39:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4E6291BF313
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 22:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AC5E405BA
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 22:39:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ExVhCkoAHVZf for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 22:39:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B64E1402F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B64E1402F3
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B64E1402F3
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 22:39:50 +0000 (UTC)
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sb6Ml-008JAb-OD
 for <buildroot@buildroot.org>; Tue, 06 Aug 2024 00:39:47 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id ec3480fa
 for <buildroot@buildroot.org>; Mon, 5 Aug 2024 22:39:46 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Tue,  6 Aug 2024 01:39:44 +0300
Message-ID: <20240805223946.116873-1-aperez@igalia.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c3XztxeyZNBMTHqUkEbRZJj8FJUKEMuRj1FiqUcstcY=; b=QbdKFKSP/Va2be2OJt17c7WAEa
 HtBns1p21+evLjA3ZFEAyjq2OnLmj0eewLW/YoumW7rknrEjVtgcgJ3ko8mhlcfnNYT50EWLzMrqF
 RwoitDV4xCT9EtOTsBwswlpMzg6bQuX2yQAR0NPTnNFD8XJFhe4Rr2m8Y/aUuzJSjvtzJgHfpezP8
 X/BBx3DHkClXhp3u/0ZUS3VAXIoF68y+ASaqeyWqnGBiDD3mw/VU2tnqXAu53kvsNxHc3ALI+Hfy6
 9QC3J2dpOyubrN4nXJt8uvrYy1FgqerKYJgMY1lx6ljI9NPH+Qjop+gF6Y6EDEXmYzOsjjxvFIIuU
 55/SEtTQ==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=QbdKFKSP
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: assign Adrian Perez for sysprof
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8e46beff00..76f7fc5ed6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -61,6 +61,7 @@ F:	package/libepoxy/
 F:	package/libmanette/
 F:	package/libpsl/
 F:	package/libwpe/
+F:	package/sysprof/
 F:	package/webkitgtk/
 F:	package/wlroots/
 F:	package/woff2/
@@ -3295,7 +3296,6 @@ N:	Will Newton <will.newton@gmail.com>
 F:	package/enchant/
 F:	package/erlang/
 F:	package/libmicrohttpd/
-F:	package/sysprof/
 F:	package/time/
 
 N:	Will Wagner <will_wagner@carallon.com>
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
