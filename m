Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12DBEC433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 20:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C5AC4193D;
	Wed, 20 Apr 2022 20:44:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fIsy7Gf1hhIA; Wed, 20 Apr 2022 20:44:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 611E1417CF;
	Wed, 20 Apr 2022 20:44:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 70D111BF2A5
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 20:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E49E82CD4
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 20:43:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zUc-grOxYJ6D for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 20:43:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5DD882C61
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 20:43:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id B19CC83F65; Wed, 20 Apr 2022 20:33:36 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 20 Apr 2022 22:43:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: adab02c5ac1fd78e7bdd7629ab7983124b24d3ac
X-Git-Newrev: 6f1130afcdac3c2fb54b7a3d95ca7b4073b9453b
X-Patchwork-Hint: ignore
Message-Id: <20220420203336.B19CC83F65@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zchunk: bump to version 1.2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=6f1130afcdac3c2fb54b7a3d95ca7b4073b9453b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Libcurl is now an optional dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/zchunk/Config.in   |  1 -
 package/zchunk/zchunk.hash |  2 +-
 package/zchunk/zchunk.mk   | 10 ++++++++--
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/zchunk/Config.in b/package/zchunk/Config.in
index 2d2a78a210..11463dd4bd 100644
--- a/package/zchunk/Config.in
+++ b/package/zchunk/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_ZCHUNK
 	bool "zchunk"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
-	select BR2_PACKAGE_LIBCURL
 	help
 	  A file format designed for highly efficient deltas while
 	  maintaining good compression.
diff --git a/package/zchunk/zchunk.hash b/package/zchunk/zchunk.hash
index d6b425dc70..fa097d4ae0 100644
--- a/package/zchunk/zchunk.hash
+++ b/package/zchunk/zchunk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  33934adecddc50c64615dd8cdfe52a79df674a5bb1d5e83a9c09e1d1e6e9b92c  zchunk-1.1.16.tar.gz
+sha256  bc36f13b1bcb2ab52d046bfc3ec04a9bd1f89b070b4e8fca52eded235a583526  zchunk-1.2.2.tar.gz
 sha256  3c6a4fd5a93cacec6bf694d0537246bc15a95a274f5c5301749754e56d27b797  LICENSE
diff --git a/package/zchunk/zchunk.mk b/package/zchunk/zchunk.mk
index 6f7ac799a0..5582c21e77 100644
--- a/package/zchunk/zchunk.mk
+++ b/package/zchunk/zchunk.mk
@@ -4,15 +4,21 @@
 #
 ################################################################################
 
-ZCHUNK_VERSION = 1.1.16
+ZCHUNK_VERSION = 1.2.2
 ZCHUNK_SITE = $(call github,zchunk,zchunk,$(ZCHUNK_VERSION))
 ZCHUNK_LICENSE = BSD-2-Clause
 ZCHUNK_LICENSE_FILES = LICENSE
 ZCHUNK_INSTALL_STAGING = YES
 ZCHUNK_DEPENDENCIES = \
-	libcurl \
 	$(if $(BR2_PACKAGE_ARGP_STANDALONE),argp-standalone)
 
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+ZCHUNK_DEPENDENCIES += libcurl
+ZCHUNK_CONF_OPTS += -Dwith-curl=enabled
+else
+ZCHUNK_CONF_OPTS += -Dwith-curl=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 ZCHUNK_DEPENDENCIES += openssl
 ZCHUNK_CONF_OPTS += -Dwith-openssl=enabled
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
