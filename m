Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8703D1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 17:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C48144062F;
	Sun,  7 Dec 2025 17:13:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OKD0_areUd7W; Sun,  7 Dec 2025 17:13:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAE33406E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765127626;
	bh=t9LdvKv02HkKQlFpXlOqnqEClQpalG+tZAzDNxqUx2c=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JCL9kMfFpErH+Tyi2OjGlROAOhfpzLwFPLykFn6q5D/r399DImM5yCjJEwkT7RNaU
	 O/LqBPLKbXE7CJ4vL8rrCiwHBvPC54u6tvWPgz6SOEdH/z03Wslicgu8BE18rZnLkU
	 6umXjr+Gm9IlUwayvfCbz/IyOoIa84BX/NbXoEVdYyjwWIuZ7vlhnP6mIm5mPQuciN
	 xrcw1C1n+TFx7Xm4RuEEqHmDR+WPh0IemHqNkFbcQ2oH9PJ7l7igNtX2KHCigIJ+bU
	 /uh9aHoa8IhgHpZsRm3mJ5X8aTNIwHl6FmjpBgtblNK3yKOXMkF10bncv6oRU4U5/d
	 cg0BiiX7S68XQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAE33406E2;
	Sun,  7 Dec 2025 17:13:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B0C2E7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 634B34019A
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:13:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RMlzVvfBI_3R for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 17:13:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA171404E8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA171404E8
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:13:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9EA5867FE; Sun,  7 Dec 2025 17:13:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 18:10:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 699a4a629fea7ae76dcb06441f11d24feda02763
X-Git-Newrev: f2b5cdf5a3b84612de3e51b210fd31c5152b057f
X-Patchwork-Hint: ignore
Message-Id: <20251207171336.C9EA5867FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ficl: update SITE
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f2b5cdf5a3b84612de3e51b210fd31c5152b057f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream moved the tarball to another folder:
https://sourceforge.net/p/ficl/news/2025/07/ficl4-is-retiring/
and also retired the package.

This patch just fixes the download problem.
CC'ing Francois to ask whether the package should be removed until a new
version 3.x is released.

Fixes:
https://autobuild.buildroot.net/results/125/125fa1c0a3b37b4d09389a49640b90121838c665/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ficl/ficl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ficl/ficl.mk b/package/ficl/ficl.mk
index af900fa2cf..c0698a3433 100644
--- a/package/ficl/ficl.mk
+++ b/package/ficl/ficl.mk
@@ -6,7 +6,7 @@
 
 FICL_VERSION_MAJOR = 4.1
 FICL_VERSION = $(FICL_VERSION_MAJOR).0
-FICL_SITE = http://downloads.sourceforge.net/project/ficl/ficl-all/ficl$(FICL_VERSION_MAJOR)
+FICL_SITE = https://sourceforge.net/projects/ficl/files/OldFiles/Ficl4%20%28retired%29
 FICL_LICENSE = BSD-2-Clause
 FICL_LICENSE_FILES = ReadMe.txt
 FICL_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
