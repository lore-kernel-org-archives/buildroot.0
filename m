Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB8F9C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 17:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77B9D415F8;
	Sun,  3 Dec 2023 17:09:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77B9D415F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gGJO3GhtIxvT; Sun,  3 Dec 2023 17:09:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BA66415FA;
	Sun,  3 Dec 2023 17:09:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BA66415FA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 423E71BF8C7
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 17:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11804400B2
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 17:09:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11804400B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WpiMqZcsC4qM for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 17:09:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 276CC4035D
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 17:09:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 276CC4035D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E53A87802; Sun,  3 Dec 2023 17:09:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 3 Dec 2023 18:08:58 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 026c8f80ff2294f08d70aa17d38b4be8c0c9d0de
X-Git-Newrev: ad21d833e0d0876f43e409548481c6030db2d16e
X-Patchwork-Hint: ignore
Message-Id: <20231203170928.0E53A87802@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/socat: drop patch 2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ad21d833e0d0876f43e409548481c6030db2d16e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

As upstream developer mentioned in private communication, the code using
NETDB_INTERNAL is now disabled. Remove the patch.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/socat/0002-compat-set-NETDB_INTERNAL.patch | 36 ----------------------
 1 file changed, 36 deletions(-)

diff --git a/package/socat/0002-compat-set-NETDB_INTERNAL.patch b/package/socat/0002-compat-set-NETDB_INTERNAL.patch
deleted file mode 100644
index f526664210..0000000000
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
