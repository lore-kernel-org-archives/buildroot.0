Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E49C5320E
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 16:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C353440096;
	Sun, 18 Aug 2024 16:21:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hMecS8jFkHuR; Sun, 18 Aug 2024 16:21:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E10A400A8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E10A400A8;
	Sun, 18 Aug 2024 16:21:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 369841BF23C
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 16:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2450A605BD
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 16:21:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oHK4QNvmxGUE for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 16:21:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0152E605B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0152E605B7
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0152E605B7
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 16:21:35 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 34E54B0054E;
 Sun, 18 Aug 2024 18:21:30 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 Aug 2024 18:21:23 +0200
Message-ID: <20240818162123.1012529-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1723998092;
 bh=pq9PtlmfgJ/oCbFlyOYky02IIKBhNyGhBOK7W9DNMo0=;
 h=From:To:Cc:Subject:Date:From;
 b=TSiet5Z7yC4xr5/vVH+essiyvC6LgFbULCMNYTFxI2T3hnKwDBaEZOXdaSWij3n0k
 XvDA1owGcHdZrURng64Fm/qtI7s57ZN13DL5+JXKpXUXSjhDeo+v/rR14O4lrLz5S4
 rGYwwWDbRfw6P0JEhheQF1Cjnl+lpM6zeAnRE80Yngx1myqbrAaqlKUZ3cIgvGI1+p
 oejRzEsbL6YHmF6pUqhjeo9nK9zoQUNSB+TCDsgy9ox2LPvVWZaG6qVbDc0DH+qmRN
 H9PQZk01QUQxRVc2lILC+bKCjnDbdkMyZsSx9kGDqMQOfmy/BwbnMWwjSvCiYkDEFK
 q2MQv44yL21cg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TSiet5Z7
Subject: [Buildroot] [PATCH next 1/1] package/erofs-utils: bump to version
 1.8.1
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
Cc: Julien Olivain <ju.o@free.fr>, Gao Xiang <hsiangkao@aol.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For a change log since 1.7.1, see:
https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/ChangeLog?h=v1.8.1

Version 1.8 introduced a preliminary Zstd support, so this commit adds
this new optional dependency for target, and disable this option for the
host variant.

Version 1.8 also introduced a use of atomic operations, in commit [1].
This commit adds linking with libatomic when appropriate.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/commit/?id=0d6f9835ce27ead0f23848408366d9ca7f2b0d15

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch next at commit 71899d7 with commands:

    utils/docker-run make check-package
    ...
    0 warnings generated

    utils/test-pkg -a -p erofs-utils
    ...
    41 builds, 0 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/erofs-utils/erofs-utils.hash |  2 +-
 package/erofs-utils/erofs-utils.mk   | 14 +++++++++++++-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/package/erofs-utils/erofs-utils.hash b/package/erofs-utils/erofs-utils.hash
index 063d384511..8140dad83b 100644
--- a/package/erofs-utils/erofs-utils.hash
+++ b/package/erofs-utils/erofs-utils.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  196083d63e5e231fb5799e7ce86a944bbca564daabce3de9225a8aca9dcaff15  erofs-utils-1.7.1.tar.gz
+sha256  5dbf7b492f7682462b97a77121d43ca7609cd90e65f8c96931aefc820a6f0da3  erofs-utils-1.8.1.tar.gz
 sha256  0df042de29b44887355db86c79708a4489ce6e6666f6e33ad02040293f09e6a2  COPYING
 sha256  a400f85dd06d230f1b308cde4290a53f345b6e320a376b7904b31c51c2fd4b1a  LICENSES/Apache-2.0
 sha256  feee3b3157dcdf78d4f50edefbd5dd7adf8b6d52c11bfaaa746a85a373256713  LICENSES/GPL-2.0
diff --git a/package/erofs-utils/erofs-utils.mk b/package/erofs-utils/erofs-utils.mk
index f994ea9d07..7033be4a06 100644
--- a/package/erofs-utils/erofs-utils.mk
+++ b/package/erofs-utils/erofs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EROFS_UTILS_VERSION = 1.7.1
+EROFS_UTILS_VERSION = 1.8.1
 EROFS_UTILS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/snapshot
 EROFS_UTILS_LICENSE = GPL-2.0+, GPL-2.0+ or Apache-2.0 (liberofs)
 EROFS_UTILS_LICENSE_FILES = COPYING LICENSES/Apache-2.0 LICENSES/GPL-2.0
@@ -14,6 +14,10 @@ EROFS_UTILS_AUTORECONF = YES
 
 EROFS_UTILS_DEPENDENCIES = host-pkgconf util-linux
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+EROFS_UTILS_CONF_ENV += LIBS=-latomic
+endif
+
 ifeq ($(BR2_PACKAGE_EROFS_UTILS_LZ4),y)
 EROFS_UTILS_DEPENDENCIES += lz4
 EROFS_UTILS_CONF_OPTS += --enable-lz4
@@ -56,12 +60,20 @@ else
 EROFS_UTILS_CONF_OPTS += --without-zlib
 endif
 
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+EROFS_UTILS_DEPENDENCIES += zstd
+EROFS_UTILS_CONF_OPTS += --with-libzstd
+else
+EROFS_UTILS_CONF_OPTS += --without-libzstd
+endif
+
 HOST_EROFS_UTILS_DEPENDENCIES = host-pkgconf host-util-linux host-lz4 host-xz
 HOST_EROFS_UTILS_CONF_OPTS += \
 	--enable-lz4 \
 	--enable-lzma \
 	--disable-fuse \
 	--without-libdeflate \
+	--without-libzstd \
 	--without-selinux \
 	--without-zlib
 
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
