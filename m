Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB72E77173
	for <buildroot@archiver.kernel.org>; Mon,  9 Dec 2024 08:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 938D0404D4;
	Mon,  9 Dec 2024 08:27:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id duCWgAsrzM5C; Mon,  9 Dec 2024 08:27:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B90D404BF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B90D404BF;
	Mon,  9 Dec 2024 08:27:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D8B4979
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 08:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C73680A7A
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 08:27:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SDw3njy6pMqr for <buildroot@buildroot.org>;
 Mon,  9 Dec 2024 08:27:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DA994802D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA994802D3
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA994802D3
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 08:27:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C3CAA1BF20D;
 Mon,  9 Dec 2024 08:27:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1tKZ6y-00CnPT-0m;
 Mon, 09 Dec 2024 09:27:24 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon,  9 Dec 2024 09:27:00 +0100
Message-Id: <20241209082722.3049825-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241209082722.3049825-1-peter@korsgaard.com>
References: <20241209082722.3049825-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 02/23] package/dmraid: fix 'maintenance' typo
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Found by codespell.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dmraid/0001-fix-compilation-under-musl.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dmraid/0001-fix-compilation-under-musl.patch b/package/dmraid/0001-fix-compilation-under-musl.patch
index a6f5c41075..3d45641b8d 100644
--- a/package/dmraid/0001-fix-compilation-under-musl.patch
+++ b/package/dmraid/0001-fix-compilation-under-musl.patch
@@ -8,7 +8,7 @@ Patch borrowed from Void Linux :
 https://github.com/voidlinux/void-packages/blob/master/srcpkgs/dmraid/patches/25_musl-libc.patch
 
 Upstream package appears dormant, no mailing list and no
-maintainence releases since Nov 2010.
+maintenance releases since Nov 2010.
 
 Upstream-Status: dormant
 Signed-off-by: Brendan Heading <brendanheading@gmail.com>
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
