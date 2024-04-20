Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C06EC4345F
	for <buildroot@archiver.kernel.org>; Sat, 20 Apr 2024 14:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C33FA40547;
	Sat, 20 Apr 2024 14:36:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7VCkavyhBRry; Sat, 20 Apr 2024 14:36:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45897401D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45897401D5;
	Sat, 20 Apr 2024 14:36:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8CE931BF271
 for <buildroot@lists.busybox.net>; Sat, 20 Apr 2024 14:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FB2160603
 for <buildroot@lists.busybox.net>; Sat, 20 Apr 2024 14:36:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id okhnnp632KqY for <buildroot@lists.busybox.net>;
 Sat, 20 Apr 2024 14:36:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6BA84605FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BA84605FB
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6BA84605FB
 for <buildroot@buildroot.org>; Sat, 20 Apr 2024 14:36:28 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 6975CB00596;
 Sat, 20 Apr 2024 16:36:23 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 20 Apr 2024 16:36:17 +0200
Message-ID: <20240420143618.1809745-1-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1713623785;
 bh=SaHsLmO1zp4b14HVWGf8kFy6SQuBcYUts/z2ewnocS8=;
 h=From:To:Cc:Subject:Date:From;
 b=BRTso4X9wa9WDB6GGhGXfoPJLT2hrl6aVJaNzJEy3mabCWPhDpjDB7w/A0/ouB/9k
 j/rXotl11MLfTQ+sfKbzjTONF4FHlZPhtnuimyY+xVZNqtvCvLGf82Hg/DqxXIYrr/
 jJT75/Q2gl9r9klPap1pL1Fu4RJHctIVuYtLhw+GJKEmIGUxPjX9EtUjizqEXXWhq9
 FgaA21bp3IgetYn8fbOnazrFCFGPiIi/4bcPxvo9P0fgmgbFqfpl729R8XqkwgMxQo
 MZH4pEY/1Z7JZKJ0mt6hNfTbQITYMfR9bmECQJXmMCxb1ZebIZvQoCrOHAr+uIPx5X
 fzi5R7/YhkYnA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BRTso4X9
Subject: [Buildroot] [PATCH 1/2] package/fwts: update _SITE url to use https
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The http URL redirects to https. This commit updates this URL to
directly use https.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/fwts/fwts.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
index f06609777db..a3f91ee4959 100644
--- a/package/fwts/fwts.mk
+++ b/package/fwts/fwts.mk
@@ -6,7 +6,7 @@
 
 FWTS_VERSION = 23.07.00
 FWTS_SOURCE = fwts-V$(FWTS_VERSION).tar.gz
-FWTS_SITE = http://fwts.ubuntu.com/release
+FWTS_SITE = https://fwts.ubuntu.com/release
 FWTS_STRIP_COMPONENTS = 0
 FWTS_LICENSE = GPL-2.0, LGPL-2.1, Custom
 FWTS_LICENSE_FILES = debian/copyright
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
