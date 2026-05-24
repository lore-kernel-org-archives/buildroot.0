Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0588CD5BB1
	for <buildroot@archiver.kernel.org>; Sun, 24 May 2026 11:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7566D60E5F;
	Sun, 24 May 2026 11:33:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LKv7XdXONSWt; Sun, 24 May 2026 11:33:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 828AB60E5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779622384;
	bh=OWGfgvsnaaVnoJda9B95R5wBRlzc4Y+2BkuhCdJzF6c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WRrAG8DppJ2nPs1KLwKr5E2w7FLLgXdgSmwjDGapIH19VWnFfBK2XGuwfbJmBXNu6
	 jQBlpokdqwo2NEndC+b93CxFTnRy2EqfyS/I5Bj1b7K9pMslWdIqDx6RbBs4Lz9k0z
	 0stFgcuwQvUtQ3X6fyb4rrLtZbBKnpsbUvcqz9byzLZBJFacEe2+HYj67CeRhWeKtT
	 QtTURvVOx91ckkReXEqOMtJ1ylS+71FmYC8wZVHLWnHrz1ljn2WwtawtZJLhiNvFxA
	 QDZFg8FZTA6H8Ne7YocNhkKhzz2l/sL7FRhr2kCbb1eVoXyP47kdk6YbgWB/EVqEpr
	 B/LpAnDjKtAWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 828AB60E5B;
	Sun, 24 May 2026 11:33:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E87D265
 for <buildroot@buildroot.org>; Sun, 24 May 2026 11:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E38D403A0
 for <buildroot@buildroot.org>; Sun, 24 May 2026 11:33:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WCu32lhiZdl6 for <buildroot@buildroot.org>;
 Sun, 24 May 2026 11:33:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF2A940384
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF2A940384
 for <buildroot@buildroot.org>; Sun, 24 May 2026 11:33:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BFA1C86D7A; Sun, 24 May 2026 11:32:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 May 2026 13:18:46 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 298ef0bf92645cad35d2aa731da2c8b7ab8e5abb
X-Git-Newrev: 1140401f6832f42d0c0c92f1e03c53c778576a1e
X-Patchwork-Hint: ignore
Message-Id: <20260524113252.BFA1C86D7A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/cmake: bump version to
 4.3.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1140401f6832f42d0c0c92f1e03c53c778576a1e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

https://cmake.org/cmake/help/latest/release/4.3.html#id3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index f531e73c31..af7c7dd72b 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v4.3/cmake-4.3.2-SHA-256.txt
-sha256  b0231eb39b3c3cabdc568c619df78208a7bd95ea10c9b2236d61218bac1b367d  cmake-4.3.2.tar.gz
+# From https://cmake.org/files/v4.3/cmake-4.3.3-SHA-256.txt
+sha256  cba4bb7a44edf2877bb6f059932896383babe435b3a8c3b5df48b4aa41c9bb85  cmake-4.3.3.tar.gz
 
 # Locally calculated
 sha256  4382e7c1879ac90e3f101a395d23846fa4dbcaa1eed7265b43681e348754825d  LICENSE.rst
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 0223e65551..6971232f76 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
 CMAKE_VERSION_MAJOR = 4.3
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).2
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = LICENSE.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
