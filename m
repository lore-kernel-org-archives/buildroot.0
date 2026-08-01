Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69073C5516F
	for <buildroot@archiver.kernel.org>; Sat,  1 Aug 2026 09:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5452780DEA;
	Sat,  1 Aug 2026 09:55:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PDGLakTNqkW1; Sat,  1 Aug 2026 09:55:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DD2080DE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785578128;
	bh=C7ScrZZS5Cuko9cSmGqq7n/BMT5JRhCJmKsYSfdzDvQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OsPChdUusiywyfEvjCq5H+6mzvJpwj0h6Mdg4jcZCrjN0Hm7z7KLWn9jVkeyUaZw6
	 jaDNX2KJ0Geu9T/V5zGoGcaIaNPvdoEdksHB2s9uGAZ8cIBORse8UUsFSkdVNsc7Vj
	 ih7oUawU5rNCsU0zHXOlR4Z/lWec5mmSLPgXNZY3fKtLQasvR0gBcYMiqCup+TLucu
	 yk6Rhe4QYuJ1y7IM/d6a8vjJkv/tbB/GymFLyQNPka/Ryu4XQlkxC2nCZRkF3vkdtb
	 ub3jrR5em/otZSsaEW71iwTF6y/VUwqiVoulisHRX2SvOQ5yj4n1Rfjgmz8tEsmgTO
	 XUtmHXCQNmJjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DD2080DE2;
	Sat,  1 Aug 2026 09:55:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E7777194
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 09:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D98224082C
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 09:55:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7bSuYmt7Tq08 for <buildroot@buildroot.org>;
 Sat,  1 Aug 2026 09:55:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCBAF4082B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCBAF4082B
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 09:55:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 41DCD869A4; Sat,  1 Aug 2026 09:54:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 1 Aug 2026 11:47:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9bc585a804b2ce7b5f82f538f6108cca27c3116a
X-Git-Newrev: 2110131cab2a613567c99491ba540bb33440e46c
X-Patchwork-Hint: ignore
Message-Id: <20260801095442.41DCD869A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/atop: bump to 2.13.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2110131cab2a613567c99491ba540bb33440e46c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See here for changes:
https://github.com/Atoptool/atop/releases/tag/v2.13.0

This commit fixes uClibc-ng autobuild failures:
https://github.com/Atoptool/atop/commit/5e853bba484d22620e8b6f97bf329da3075070b5

Fixes:
 - https://autobuild.buildroot.net/results/f98/f983d97b232a45ce4e176d93684fffcc771daa44

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/atop/atop.hash | 2 +-
 package/atop/atop.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/atop/atop.hash b/package/atop/atop.hash
index 7b4bd2e942..fc5b33ce79 100644
--- a/package/atop/atop.hash
+++ b/package/atop/atop.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  4fdbe67c5dfaf89405639e18599f4eae77978073ffa54f3c78c368ab54bd12f6  atop-2.12.1.tar.gz
+sha256  ea182f84c9f52ca922e5af4f17dff97ff424400a4f2f92393317a6af66e6a874  atop-2.13.0.tar.gz
 
 # Hash for license file:
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/atop/atop.mk b/package/atop/atop.mk
index 346bd0ff57..677b60ac1b 100644
--- a/package/atop/atop.mk
+++ b/package/atop/atop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ATOP_VERSION = 2.12.1
+ATOP_VERSION = 2.13.0
 ATOP_SITE = http://www.atoptool.nl/download
 ATOP_LICENSE = GPL-2.0+
 ATOP_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
