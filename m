Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8922EC4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 16:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44A4C4149D;
	Sun,  3 Dec 2023 16:59:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44A4C4149D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wwVRmUTdXtw8; Sun,  3 Dec 2023 16:59:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79D9A415BB;
	Sun,  3 Dec 2023 16:59:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79D9A415BB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E1E781BF2EF
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 16:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C854C81AF5
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 16:59:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C854C81AF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id heOZsenCSTcF for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 16:59:19 +0000 (UTC)
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0C9B818E6
 for <buildroot@busybox.net>; Sun,  3 Dec 2023 16:59:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0C9B818E6
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id ADC094403AE;
 Sun,  3 Dec 2023 18:57:48 +0200 (IST)
To: buildroot@busybox.net
Date: Sun,  3 Dec 2023 18:58:56 +0200
Message-ID: <f5a02eb64178d326efcec689537ffc874f88e982.1701622736.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1701622668;
 bh=smQjCP7scS6/l/zk32jqU6XLusxwWPcX9xVmor5RuZY=;
 h=From:To:Cc:Subject:Date:From;
 b=GUGDZeD5tyugrJRZnu9NNnSyVuEffeIEmUxk87zinCAil3hyhHtggCdCi8tuDUk6F
 mOU1YZQywQ1Gs5x/71JjOAe7ac5p6rfRErimf0GJwFhfWuTq2tjgLWld9VliXhHlMH
 aYNvRlzhDy68xoaPWtClCzsCSMPUxqKGlL5GaXdfieFI52KKhPj6snS6+wtbnHDoQz
 mqtiLJHXSZ1dN4Y5VH5ChcQErIgpd4Zlm8VwXWDpV5PiAHeDazXrT2aW1acWIcXZ+w
 VYMGBVsePniIf8ogzNYCCOVl56EU745suJR7wXsE+k/khIATYzhLP6TI0z2KJtRS7/
 a+rlcAHKGL57g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=GUGDZeD5
Subject: [Buildroot] [PATCH] package/socat: drop patch 2
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As upstream developer mentioned in private communication, the code using
NETDB_INTERNAL is now disabled. Remove the patch.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../0002-compat-set-NETDB_INTERNAL.patch      | 36 -------------------
 1 file changed, 36 deletions(-)
 delete mode 100644 package/socat/0002-compat-set-NETDB_INTERNAL.patch

diff --git a/package/socat/0002-compat-set-NETDB_INTERNAL.patch b/package/socat/0002-compat-set-NETDB_INTERNAL.patch
deleted file mode 100644
index f526664210dd..000000000000
--- a/package/socat/0002-compat-set-NETDB_INTERNAL.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 4b86f141c7c4725093fb2e12c769fec393727519 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Sun, 28 Aug 2016 21:04:01 +0200
-Subject: [PATCH] compat: set NETDB_INTERNAL
-
-Musl doesn't provide NETDB_INTERNAL which is defined in resolv/netdb.h
-in Glibc [1].
-
-Set NETDB_INTERNAL to -1 locally if not already defined.
-Based on [2].
-
-[1] https://sourceware.org/git/?p=glibc.git;a=blob;f=resolv/netdb.h;h=3aba530932c7a62a4f23e3193e9186da677f552b;hb=fdfc9260b61d3d72541f18104d24c7bcb0ce5ca2#l74
-[2] http://git.alpinelinux.org/cgit/aports/tree/main/socat/netdb-internal.patch?id=5a45173b50892cb634197c30b3506ebff98d3b7d
-
-Upstream: sent to socat@dest-unreach.org
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- compat.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/compat.h b/compat.h
-index bb7e2d8f1782..72e73c701f64 100644
---- a/compat.h
-+++ b/compat.h
-@@ -851,6 +851,8 @@ typedef unsigned long T_sigset;
- 
- #if !defined(NETDB_INTERNAL) && defined(h_NETDB_INTERNAL)
- #  define NETDB_INTERNAL h_NETDB_INTERNAL
-+#elif !defined(NETDB_INTERNAL)
-+#  define NETDB_INTERNAL (-1)
- #endif
- 
- #ifndef INET_ADDRSTRLEN
--- 
-2.5.5
-
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
