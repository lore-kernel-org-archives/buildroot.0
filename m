Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCAEC3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 12:12:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFC1660A6B;
	Thu, 15 Aug 2024 12:12:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bWlUTr8XwMS3; Thu, 15 Aug 2024 12:12:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 587CA60A70
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 587CA60A70;
	Thu, 15 Aug 2024 12:12:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DF12D1BF3E1
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 12:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCC544073C
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 12:12:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fA5zsaRdgjlj for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 12:12:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9B1BF40714
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B1BF40714
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B1BF40714
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 12:12:04 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id E63763535BF0; Thu, 15 Aug 2024 14:12:00 +0200 (CEST)
Date: Thu, 15 Aug 2024 14:12:00 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zr3wkHvltQqq4L7Q@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723723920; bh=HXLKM9X6F6NQykRfsh7KUh4agGt9MCHW4oeMWdGw1ls=;
 h=Date:From:To:Subject:From;
 b=dDNt+jBoOMES5qgtn/oFFnesjfLVvFe2F+WHN/IznmGV2jJ9OnInKcyMaIVesTQan
 QRpAB7M8hmlrGukVwxHg5zPB5p0otM05MxGg0C1TqvWCLtLGVaVpH9xyMeWe4yFMI4
 7g1UrVcHr9QNEWfqZP64/Cyp7a5TrfrTOQILr1pPwaQapFZt88e8uU00R41i5eycPj
 sup3ESmOl8H6AXSCOlLF5AuwXIxvXEoxj4975b4a0aFqYJjmAA3wz67RXYsjH8J5R6
 DvEIvFzhSwDPPqO9m3WS379vqbdctROZxEqXhy0HYKu2i7imU3AYtfz6xOjSxgw3gi
 SCyWWQmRL+CEA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=dDNt+jBo
Subject: [Buildroot] [PATCH] package/iproute2: fixup Upstream url
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

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...ix-implicit-declaration-of-function-basename-in-gcc.patch | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/iproute2/0002-Fix-implicit-declaration-of-function-basename-in-gcc.patch b/package/iproute2/0002-Fix-implicit-declaration-of-function-basename-in-gcc.patch
index 7ebbb49816..ff1ddd144a 100644
--- a/package/iproute2/0002-Fix-implicit-declaration-of-function-basename-in-gcc.patch
+++ b/package/iproute2/0002-Fix-implicit-declaration-of-function-basename-in-gcc.patch
@@ -4,9 +4,12 @@ Date: Wed, 14 Aug 2024 19:43:44 +0200
 Subject: [PATCH] Fix implicit declaration of function basename in gcc-14.x
 
 From Alpine Linux.
+https://gitlab.alpinelinux.org/alpine/aports/-/blob/master/main/iproute2/basename.patch?ref_type=heads
+
+But also reported Upstream via netdev mailinglist by Gentoo people.
 
 Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://gitlab.alpinelinux.org/alpine/aports/-/blob/master/main/iproute2/basename.patch?ref_type=heads
+Upstream: https://marc.info/?l=linux-netdev&m=172278781323421&w=2
 ---
  rdma/rdma.c | 3 +++
  1 file changed, 3 insertions(+)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
