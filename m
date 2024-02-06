Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402EFC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEC7541E9D;
	Tue,  6 Feb 2024 10:54:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEC7541E9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dVmyFFV_Qhyp; Tue,  6 Feb 2024 10:54:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BDD841E92;
	Tue,  6 Feb 2024 10:54:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BDD841E92
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 81F671BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FB4F821AF
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:53:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AUEK9uWbDynv for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:53:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4CF4A821A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CF4A821A6
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4CF4A821A6
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:53:53 +0000 (UTC)
Received: from bubutux.localdomain (unknown [85.119.216.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 475B72C80CED;
 Tue,  6 Feb 2024 11:53:51 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 11:52:42 +0100
Message-ID: <20240206105246.1220945-6-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240206105246.1220945-1-buildroot@bubu1.eu>
References: <20240206105246.1220945-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707216831; bh=kUr3ZRzXTtxCGySh9zLYCtyc+0Td48bYeTXisxBX9vs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=k2MFS32D3CduF84eSsAa6cFqRpfr2CExjaw1qmnLDOaX08pBhV2Rg4fI7a6kHokaJ
 /0KajaBAn9S+pdu7xjFYpxGljUxgmig+XkO4ImbQA4oh5DFB9lu5pRSk7ZtGG8VI6z
 8djfQ1sXGLHVX0y4MLtvbEx+a2Ie2ydj4z7VKKVN86lkoY2dV88QxcLFQZj0CrYLi4
 O92WhPAxR4QA7RqhF8XNAsnwkNfY+sOHkMsxhd1hdqtQt+HhCrvYu3ejQ3NeZizJPq
 BIVA67oFVuhOi9VCQhMscF9hWybtt5XIpdqMFPRrzaxJAhkGMmpcTt9UBedDaZIpAk
 CKlWwunlpJNww==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=k2MFS32D
Subject: [Buildroot] [PATCH 6/6] docs/manual/contribute.adoc: mention sr.ht
 as an alternative for sending patches
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 docs/manual/contribute.adoc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/docs/manual/contribute.adoc b/docs/manual/contribute.adoc
index 684e9f4809..7d0611be28 100644
--- a/docs/manual/contribute.adoc
+++ b/docs/manual/contribute.adoc
@@ -375,6 +375,14 @@ If you do not use +git send-email+, make sure posted *patches are not
 line-wrapped*, otherwise they cannot easily be applied. In such a case,
 fix your e-mail client, or better yet, learn to use +git send-email+.
 
+https://sr.ht also has a light-weight UI for
+https://man.sr.ht/git.sr.ht/#sending-patches-upstream[preparing patchseries]
+and can also send out the patches for you. There are a few drawbacks to
+this, as you cannot edit your patches' status in Patchwork and you
+currently can't edit your display name with which the match emails are
+sent out but it is an option if you cannot get git send-email to work
+with your mail provider (i.e. O365).
+
 ==== Cover letter
 
 If you want to present the whole patch set in a separate mail, add
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
