Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02512CD98DA
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 17:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D55B484193;
	Mon, 15 Jun 2026 17:30:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oO8M3AiuPyfU; Mon, 15 Jun 2026 17:30:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C493383D75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781544624;
	bh=yVBwg0sbRa90jMbHqCak5MoWZnf2F7BFxfZibK3e1mo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=L7nkfY4E9I9fdJZI817A2sHtwQmUp3nXNb4/z165cmBJ5WAaSjrUU9lAv/0cB3VXM
	 mRupmi1cMpoPTkLCYqheah/0KHTn7UxI2nHsrQfYWKl6kzqAy1/w6sotZXPKmWHXSP
	 4jPBVnmfi6rXkMRZMx9tVDc+rhV/BDSBMYSs2QrwYmYaDJzqls2UCS+YioAsk5urUp
	 3PLcG/UX3saj/6IVuD6E8qiCy3JMHRsdqYnYLfrTmj0jgg4hmuH3twIgO4KVnaa2HF
	 RP7+X4GntzIQxD9mf8VqAEmAk7sYnFINMMRZE4B9mdyQJ3wWh0cX5FR7bfzjRv+H5D
	 4wEwwz2Fk6lVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C493383D75;
	Mon, 15 Jun 2026 17:30:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E28FDE
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 17:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BDD140485
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 17:30:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b8Q0PIQegLwf for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 17:30:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79CC14004B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79CC14004B
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 17:30:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE5CF88342; Mon, 15 Jun 2026 17:30:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jun 2026 19:29:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1fa2d87c8553c6fa31dbb07029764d90e18b7efa
X-Git-Newrev: 4ad755143bfb63244d912492a38a1c3756ddde94
X-Patchwork-Hint: ignore
Message-Id: <20260615173000.AE5CF88342@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnss: bump version to 3.125
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4ad755143bfb63244d912492a38a1c3756ddde94
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For release note, see:
https://hg-edge.mozilla.org/projects/nss/file/836970ddd36ab1076ae0958e76bd948d9d67f2da/doc/rst/releases/nss_3_125.rst

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 4d08187fcb..544681c9a4 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_124_RTM/src/SHA256SUMS
-sha256  80da9f1cbcb267293b2248818d288bc02f874d6a34f1989a2828401d74a0bc9b  nss-3.124.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_125_RTM/src/SHA256SUMS
+sha256  1ad541f10da7c58dec01f540ecc44d28cbbc033f741a57473de5a0893d91606d  nss-3.125.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 86d2fcd41c..c01d313da5 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.124
+LIBNSS_VERSION = 3.125
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
