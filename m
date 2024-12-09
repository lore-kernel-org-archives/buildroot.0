Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12828E77173
	for <buildroot@archiver.kernel.org>; Mon,  9 Dec 2024 08:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7B78405F3;
	Mon,  9 Dec 2024 08:27:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Z7u_4ltxVkO; Mon,  9 Dec 2024 08:27:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0A96405B6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0A96405B6;
	Mon,  9 Dec 2024 08:27:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DAD91ED2
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 08:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6485F80A83
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 08:27:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U96Mfpmu-hyW for <buildroot@buildroot.org>;
 Mon,  9 Dec 2024 08:27:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 92BC780A82
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92BC780A82
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 92BC780A82
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 08:27:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 70B56FF80A;
 Mon,  9 Dec 2024 08:27:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1tKZ72-00CnQP-0g;
 Mon, 09 Dec 2024 09:27:28 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon,  9 Dec 2024 09:27:08 +0100
Message-Id: <20241209082722.3049825-10-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241209082722.3049825-1-peter@korsgaard.com>
References: <20241209082722.3049825-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 10/23] package/pkg-golang: fix 'unknown' typo
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
Cc: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Found by codespell.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-golang.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 8e27602d41..33cf9bfb1a 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -102,7 +102,7 @@ endif
 
 # Due to vendoring, it is pretty likely that not all licenses are
 # listed in <pkg>_LICENSE. If the license is unset, it is "unknown"
-# so adding unknowns to some unknown is still some other unkown,
+# so adding unknowns to some unknown is still some other unknown,
 # so don't append the blurb in that case.
 ifneq ($$($(2)_LICENSE),)
 $(2)_LICENSE += , vendored dependencies licenses probably not listed
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
