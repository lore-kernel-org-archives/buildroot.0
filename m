Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B33C28B20
	for <buildroot@archiver.kernel.org>; Wed,  2 Apr 2025 18:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F284460AB3;
	Wed,  2 Apr 2025 18:51:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5IMJHJaoKkxU; Wed,  2 Apr 2025 18:51:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E2886F755
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E2886F755;
	Wed,  2 Apr 2025 18:51:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F4E0123
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 18:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30F514062A
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 18:51:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SYEftubleeqo for <buildroot@buildroot.org>;
 Wed,  2 Apr 2025 18:51:11 +0000 (UTC)
X-Greylist: delayed 303 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 02 Apr 2025 18:51:10 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DDC564021A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDC564021A
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DDC564021A
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 18:51:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4DB911C10EB; Wed,  2 Apr 2025 20:46:05 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Arnout Vandecappelle <arnout@rnout.be>
Date: Wed,  2 Apr 2025 20:45:56 +0200
Message-ID: <20250402184557.321089-1-arnout@rnout.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1743619565; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=GnEnybl2h9Kriy008fupV0WfodKSm5Z8VYsgU75afT0=;
 b=mnSrlpWWcJQ3q1k5C3zlW0jfCxYzxTR2/bswS9yf+hExN50JkQE1S2JWAi1tmfkVk2FENW
 Krcsqnyb7J8KFueIVgrARlGHijg5ldTAZdhXu4Cf767ExoipC288tj5qvln+DNVnycarxC
 tG/8n6KFZHQ6nFdNFikIIiyFbPKIb12fNL68+Atp9eluN+0tlp9Mgsw1UW6VlnMpyG5y1B
 tQRlRZWAf/8hLRDCnlZdXQG7j1Kjxa0dOEJIbFfaj+m5lCFGk/Z8k/kgk+H47M9WUlY9rb
 5ugc57hu1XFJr12NL2H8moDh0cvwktPO7S7eFRpCRHu+OQw3a48pRcRi/4WkUA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: [Buildroot] [PATCH] DEVELOPERS: change arnout's address
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index a26a4cbe68..1c84f95943 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -278,7 +278,7 @@ F:	package/espeak/
 N:	Arno Messiaen <arnomessiaen@gmail.com>
 F:	package/python-aiohttp-sse-client/
 
-N:	Arnout Vandecappelle <arnout@mind.be>
+N:	Arnout Vandecappelle <arnout@rnout.be>
 F:	package/arp-scan/
 F:	package/dehydrated/
 F:	package/dracut/
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
