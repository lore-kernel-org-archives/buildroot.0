Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D190EC433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 17:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88EB840880;
	Wed, 27 Apr 2022 17:20:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PP8PdjQJn8Cv; Wed, 27 Apr 2022 17:20:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A57F140442;
	Wed, 27 Apr 2022 17:20:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 59ADE1BF9B6
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 17:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 363B360E4B
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 17:18:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vqI9Ox3z8RnM for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 17:18:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D1CD60EFF
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 17:18:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E0395845FC; Wed, 27 Apr 2022 17:08:06 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 19:16:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 78fd43c5924e4c24804027e4bb6722e97fd5d942
X-Git-Newrev: 608d754cebb126745153c0a3d836355e43dc1c54
X-Patchwork-Hint: ignore
Message-Id: <20220427170806.E0395845FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmdbx: bump version to 0.11.7
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
Content-Type: multipart/mixed; boundary="===============6570090329274391671=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6570090329274391671==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=608d754cebb126745153c0a3d836355e43dc1c54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is stable bugfix release of libmdbx. So it is reasonable to backport
this patch to all applicable releases/branches of buildroot.

The project as well as all its forks were removed from Github (see e.g.
https://blog.desdelinux.net/en/libmdbx-0-11-7-arrives-with-project-migration-to-gitflic-bug-fixes-and-more/),
therefore it moved to gitflic.ru. There is also a website with the
documentation and the downloads.

Release notes for v0.11.7 https://gitflic.ru/project/erthink/libmdbx/release/90ec9985-cd60-4d9a-8c98-8417506fd26d

The complete ChangeLog: https://gitflic.ru/project/erthink/libmdbx/blob?file=ChangeLog.md

Signed-off-by: Леонид Юрьев (Leonid Yuriev) <leo@yuriev.ru>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libmdbx/Config.in    | 2 +-
 package/libmdbx/libmdbx.hash | 4 ++--
 package/libmdbx/libmdbx.mk   | 6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libmdbx/Config.in b/package/libmdbx/Config.in
index d13f73938f..4849d60b92 100644
--- a/package/libmdbx/Config.in
+++ b/package/libmdbx/Config.in
@@ -13,7 +13,7 @@ config BR2_PACKAGE_LIBMDBX
 	  libmdbx surpasses the legendary LMDB in terms of
 	  reliability, features and performance.
 
-	  https://github.com/erthink/libmdbx
+	  https://libmdbx.website.yandexcloud.net/
 
 if BR2_PACKAGE_LIBMDBX
 
diff --git a/package/libmdbx/libmdbx.hash b/package/libmdbx/libmdbx.hash
index 2483d14dd1..7d663b3da0 100644
--- a/package/libmdbx/libmdbx.hash
+++ b/package/libmdbx/libmdbx.hash
@@ -1,5 +1,5 @@
-# Hashes from: https://github.com/erthink/libmdbx/releases/
-sha256  884de528f5c2abab2187b7c4c84b769d2551e1a748cbfdf0ae4c0f5c9f8dbd27  libmdbx-amalgamated-0.11.4.tar.gz
+# Hashes from: https://libmdbx.website.yandexcloud.net/release/SHA256SUMS
+sha256  3a9fb6a4cd941e646597235518714373fda1ca6d4c5e23669afe70ea87c20940  libmdbx-amalgamated-0.11.7.tar.xz
 
 # Locally calculated
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/libmdbx/libmdbx.mk b/package/libmdbx/libmdbx.mk
index 1aff8fbb4d..a7056b2850 100644
--- a/package/libmdbx/libmdbx.mk
+++ b/package/libmdbx/libmdbx.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBMDBX_VERSION = 0.11.4
-LIBMDBX_SOURCE = libmdbx-amalgamated-$(LIBMDBX_VERSION).tar.gz
-LIBMDBX_SITE = https://github.com/erthink/libmdbx/releases/download/v$(LIBMDBX_VERSION)
+LIBMDBX_VERSION = 0.11.7
+LIBMDBX_SOURCE = libmdbx-amalgamated-$(LIBMDBX_VERSION).tar.xz
+LIBMDBX_SITE = https://libmdbx.website.yandexcloud.net/release
 LIBMDBX_SUPPORTS_IN_SOURCE_BUILD = NO
 LIBMDBX_LICENSE = OLDAP-2.8
 LIBMDBX_LICENSE_FILES = LICENSE

--===============6570090329274391671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6570090329274391671==--
