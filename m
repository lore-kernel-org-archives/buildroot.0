Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35543CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 14:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 033BA60A76;
	Sun,  7 Apr 2024 14:57:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hPE1upjSlgGT; Sun,  7 Apr 2024 14:57:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AE7960A84
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AE7960A84;
	Sun,  7 Apr 2024 14:57:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 205331BF30F
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 14:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 550784035D
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 14:57:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d-MuiUOryllD for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 14:57:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5996F400D0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5996F400D0
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 14:57:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 43D37851CA; Sun,  7 Apr 2024 14:57:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 16:47:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 529c47862e0dfc369605824716759cbbd1f0f87b
X-Git-Newrev: 8dd4917d867a24a47810d5e2d104daf8fc043ccc
X-Patchwork-Hint: ignore
Message-Id: <20240407145719.43D37851CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ccache: bump version to 4.9.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8dd4917d867a24a47810d5e2d104daf8fc043ccc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch which is included in this release.

Updated license hash due to various version and copyright year bumps:
https://github.com/ccache/ccache/commits/master/LICENSE.adoc

Release notes: https://ccache.dev/releasenotes.html#_ccache_4_9_1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Tested-by: Marcus Hoffman <buildroot@bubu1.eu>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../0001-fix-Work-around-GCC-12.3-bug-109241.patch | 29 ----------------------
 package/ccache/ccache.hash                         |  4 +--
 package/ccache/ccache.mk                           |  2 +-
 3 files changed, 3 insertions(+), 32 deletions(-)

diff --git a/package/ccache/0001-fix-Work-around-GCC-12.3-bug-109241.patch b/package/ccache/0001-fix-Work-around-GCC-12.3-bug-109241.patch
deleted file mode 100644
index 42872597cd..0000000000
--- a/package/ccache/0001-fix-Work-around-GCC-12.3-bug-109241.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 689168c292f1ed26c5f4a3070aeb649dad7facb5 Mon Sep 17 00:00:00 2001
-From: Joel Rosdahl <joel@rosdahl.net>
-Date: Tue, 1 Aug 2023 12:30:12 +0200
-Subject: [PATCH] fix: Work around GCC 12.3 bug 109241
-
-See also #1289.
-
-Upstream: https://github.com/ccache/ccache/commit/689168c292f1ed26c5f4a3070aeb649dad7facb5
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/storage/local/LocalStorage.cpp | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/storage/local/LocalStorage.cpp b/src/storage/local/LocalStorage.cpp
-index 3e5abe5074..d0a904e553 100644
---- a/src/storage/local/LocalStorage.cpp
-+++ b/src/storage/local/LocalStorage.cpp
-@@ -854,7 +854,9 @@ LocalStorage::recompress(const std::optional<int8_t> level,
-           auto l2_content_lock = get_level_2_content_lock(l1_index, l2_index);
-           l2_content_lock.make_long_lived(lock_manager);
-           if (!l2_content_lock.acquire()) {
--            LOG("Failed to acquire content lock for {}/{}", l1_index, l2_index);
-+            // LOG_RAW+fmt::format instead of LOG due to GCC 12.3 bug #109241
-+            LOG_RAW(fmt::format(
-+              "Failed to acquire content lock for {}/{}", l1_index, l2_index));
-             return;
-           }
- 
diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index 736122e0ab..a2537077b6 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,4 +1,4 @@
 # sha256 computed locally
-sha256  3d3fb3f888a5b16c4fa7ee5214cca76348afd6130e8443de5f6f2424f2076a49  ccache-4.8.2.tar.xz
+sha256  4c03bc840699127d16c3f0e6112e3f40ce6a230d5873daa78c60a59c7ef59d25  ccache-4.9.1.tar.xz
 sha256  80b5112739a423dfac7bed1ca8a1df3cccda3d794425441997d4462b83db4dd5  GPL-3.0.txt
-sha256  55ce274f2b898dad70d3695ab13f82656fd455bd8fb6d1c85d6f7c453bef0b2e  LICENSE.adoc
+sha256  a6aea7358a30ded3f8abbff979219bdbe7b7a9aa489a8c70030afd96a83caf84  LICENSE.adoc
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 96b1b65c5c..4a45ea12e4 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 4.8.2
+CCACHE_VERSION = 4.9.1
 CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSION)
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
