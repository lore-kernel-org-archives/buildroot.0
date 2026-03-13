Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9A3105F79E
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 07:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E96E841013;
	Sat, 14 Mar 2026 07:58:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HrfCin0loD3n; Sat, 14 Mar 2026 07:58:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 231F141014
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773475128;
	bh=wCSAPVAK3JZIqErEbUGgF5YWqWoLXJkFr+GmaJGDnAQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EN1BEFabGlU//jk7boB/0Td3tAv0eDWcB9yf0tYT+XLcv1L+V8l0+cYCY2Zgu+h/Q
	 Xw6nREkcXzW79X4moBMazS7NiXB6EdiBsaEfUd5j9xS99vl/Sh5oqREQhmEkzAepwN
	 eKlJE7nbUfJHGA5XvV0GaKg7Z5edrEUZaGg38QMQ0s+1lsvJqSA5xRAl0tu2zFeguO
	 WIawAfujd/G5DIuAwmkNlK2mxH3kHey7IMyvsikMgvMHhyeUoQvXZlBRyOMd44NqRJ
	 U1/G0MZNqg2BT9Oo/n6EkPEcnDH5t8mQnf6gtsMHNY13NJMLzEvcx1cYM5fFY+GjMl
	 //2+lJHtBf6Iw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 231F141014;
	Sat, 14 Mar 2026 07:58:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AEE2B201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92D1D400A2
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:58:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TFB4IdKoX6tC for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 07:58:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6A0C40135
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6A0C40135
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:58:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE0CD85E16; Sat, 14 Mar 2026 07:58:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 16:09:52 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 03c7e219800d39ed544b7b96fd1f68724906ada9
X-Git-Newrev: a9c5fc6729e42023e97b65c2ee9373c76e027b64
X-Patchwork-Hint: ignore
Message-Id: <20260314075838.EE0CD85E16@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] DEVELOPERS: remove Bernd
 Kuhls from libldns
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a9c5fc6729e42023e97b65c2ee9373c76e027b64
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 156e2be96cedf904d973748b8ac5d4423a0f74e6)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index afd228e6a8..c6b384f935 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -411,7 +411,6 @@ F:	package/libhdhomerun/
 F:	package/libheif/
 F:	package/libid3tag/
 F:	package/libilbc/
-F:	package/libldns/
 F:	package/libmicrohttpd/
 F:	package/libminiupnpc/
 F:	package/libmspack/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
