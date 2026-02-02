Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7B4E7DF08
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 16:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E9DD40BF9;
	Mon,  2 Feb 2026 16:50:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tJo7aEoMjUCj; Mon,  2 Feb 2026 16:50:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D67F40BEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770051042;
	bh=OALWkpShtuKZxcwDDxv/GcTUv7p2f4HFXPSbec/8Ecw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FXk4tQCZ2X5glSJ4pqQforvPwQGaDKObn7YyfRk2m1u29z8Tb5MYuuH7CK6mU+7XZ
	 F+ehpiA664EXadwuNCdEK002ZNgVAy1w7XAkSz/q8Crjk5ZW6RDWPouA+UEl2+O+7/
	 DgeXe1yamZ7ucpNc+raJ+WpLfb94yhwqgUFDRj57EBXtTPJeJXSkRCufb/LN1tuzVS
	 SWoceA3UlJ+9oKpMB3CIE1clqjhuq4uzETJMmpfWcjrhvOuR9eXPkHg+Sr/8Rt46xZ
	 HTIkAuFaL86cFXvByKdtp8ja86QtTmAYJdRzY8sr2I5ymLMs5Qxpty21jKaIaXVIIO
	 9++fRCTEhwRbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D67F40BEC;
	Mon,  2 Feb 2026 16:50:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D3C99149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF00C83147
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:50:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id btXl5SJ38xWp for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 16:50:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E764781509
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E764781509
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:50:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D72B3863DF; Mon,  2 Feb 2026 16:50:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 17:50:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d2141bceefda32bef06ddda594eaf8665913276
X-Git-Newrev: b76884a0b6a6413b95160b404bd4c596c43e9fd2
X-Patchwork-Hint: ignore
Message-Id: <20260202165039.D72B3863DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zeek: fix build with cmake 4
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

commit: https://git.buildroot.net/buildroot/commit/?id=b76884a0b6a6413b95160b404bd4c596c43e9fd2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://autobuild.buildroot.net/results/d92/d92e7280203f62e9baf94161a28b68c3c899e4a0/

The upstream package is currently at version 8.0.4 while the buildroot
package is at 4.1.1. Due to the huge divergation in the codebase the
cmake 4 fix needed to be handcrafted based on upstream commits.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zeek/0001-Bump-minimum-cmake-version.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/zeek/0001-Bump-minimum-cmake-version.patch b/package/zeek/0001-Bump-minimum-cmake-version.patch
new file mode 100644
index 0000000000..27c453078d
--- /dev/null
+++ b/package/zeek/0001-Bump-minimum-cmake-version.patch
@@ -0,0 +1,42 @@
+From bab553abf0dddc9e8fe90baf4c3b0b7ac5e5bfdd Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 4 Jan 2026 13:24:31 +0100
+Subject: [PATCH] Bump minimum cmake version
+
+This commit fixes buildroot errors after cmake was bumped to 4.x.
+
+This upstream commit removed CMP0063:
+https://github.com/zeek/libkqueue/commit/34cc1fea01e2f1d49238e1c58997c09bfa241568
+
+This upstream commit bumped cmake_minimum_required to 3.8.0:
+https://github.com/zeek/libkqueue/commit/a947dee39c70d151b1efff2b5bfc7fa46499e619
+
+Upstream: https://github.com/zeek/libkqueue/commit/a947dee39c70d151b1efff2b5bfc7fa46499e619
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 8 +-------
+ 1 file changed, 1 insertion(+), 7 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 835e211..7b3dadf 100644
+--- a/auxil/libkqueue/CMakeLists.txt
++++ b/auxil/libkqueue/CMakeLists.txt
+@@ -16,13 +16,7 @@
+ 
+ set(PROJECT_VERSION 2.4.0)
+ 
+-cmake_minimum_required(VERSION 3.0)
+-
+-# This policy doesn't exist until version 3.3
+-if (${CMAKE_VERSION} VERSION_EQUAL "3.3" OR
+-    ${CMAKE_VERSION} VERSION_GREATER "3.3")
+-  cmake_policy(SET CMP0063 OLD)
+-endif()
++cmake_minimum_required(VERSION 3.8.0)
+ 
+ # Both variables used in include/sys/libkqueue_version.h.in
+ string(TIMESTAMP PROJECT_VERSION_DATE "%b %d %Y at %H:%M:%S")
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
