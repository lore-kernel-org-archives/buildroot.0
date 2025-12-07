Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89ABCD1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 16:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 634E260C24;
	Sun,  7 Dec 2025 16:02:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nvT81XGZdMeq; Sun,  7 Dec 2025 16:02:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2718160C14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765123363;
	bh=Gn1XcGoofNQ76uNqdubSsIs5y32NwTk6420rT8AfUio=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=m+AXUbsAfgIhMjJtwTHXJpyhCByIvl5/dTBI2HP98AwUUFKsSMJlAVxtNlOz9sOfH
	 DIVi/iZHjcWb935Uz9Y33wo9vUjRk0esR6r+5mCNarAZnm55KhhU26y6RXUP1QksU6
	 setxDKYx+AGCwZgm1/icZk+bsD/fbaz+ltwjXZgf+IsW28bC9q4NqQJeqw8kdi7QEa
	 bqvtKEsoQRkXiw6ZVWe9ID/VnX3emlI901CP6LDA95L4xVL/Dv9rNi3zDtQrIRmXjm
	 xmteJY9EIRQaSwEBiBllRVWWC5zjVY6K7Q45DaDN66N27u4qRIfMiTWvf7Ifp/VUCd
	 7qWjN6SPlu4YA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2718160C14;
	Sun,  7 Dec 2025 16:02:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B9512F0
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF926822BF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S6hNEy1wDETg for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B221822C6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B221822C6
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 98E6985DB7; Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 16:17:37 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4f41172f0d04710f165be3ef383b020919fc5c86
X-Git-Newrev: cdb731f2cf64decbc24081c033df883c109ee9e9
X-Patchwork-Hint: ignore
Message-Id: <20251207160225.98E6985DB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mariadb: fix cmake 4
 compatibility
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

commit: https://git.buildroot.net/buildroot/commit/?id=cdb731f2cf64decbc24081c033df883c109ee9e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mariadb/0002-cmake-version-REQUIRES.patch | 25 +++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/package/mariadb/0002-cmake-version-REQUIRES.patch b/package/mariadb/0002-cmake-version-REQUIRES.patch
new file mode 100644
index 0000000000..6c776f5d63
--- /dev/null
+++ b/package/mariadb/0002-cmake-version-REQUIRES.patch
@@ -0,0 +1,25 @@
+From 726cc3684b4de08934c2b14f347799fd8c3aac9a Mon Sep 17 00:00:00 2001
+From: Leonid Fedorov <leonid.fedorov@mariadb.com>
+Date: Tue, 30 Aug 2022 22:41:44 +0000
+Subject: [PATCH] Proper external_boost for storage manager, cmake version
+ REQUIRES
+
+Upstream: https://github.com/mariadb-corporation/mariadb-columnstore-engine/commit/726cc3684b4de08934c2b14f347799fd8c3aac9a
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[partial backport for 10.11.15]
+---
+ storage/columnstore/columnstore/CMakeLists.txt |  2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 0be025103b..15f0eb0f48 100644
+--- a/storage/columnstore/columnstore/CMakeLists.txt
++++ b/storage/columnstore/columnstore/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ 
+-CMAKE_MINIMUM_REQUIRED(VERSION 2.8.12)
++CMAKE_MINIMUM_REQUIRED(VERSION 3.12)
+ 
+ PROJECT(Columnstore)
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
