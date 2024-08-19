Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA32E6FE46
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B4C684366;
	Fri,  6 Sep 2024 20:02:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GZKAk-UbhUDK; Fri,  6 Sep 2024 20:02:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA102841D0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA102841D0;
	Fri,  6 Sep 2024 20:02:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 242801BF20B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 227EB60787
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:58:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CQMO1cLM_NdR for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:58:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 030F9606B4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 030F9606B4
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F2AA486EE5; Fri,  6 Sep 2024 19:58:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Aug 2024 13:07:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 25139754098ba3a69c060ac19edf79f393d3f197
X-Git-Newrev: 56574a950b443638949d35d9f6999503291b206b
X-Patchwork-Hint: ignore
Message-Id: <20240906195854.F2AA486EE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/erofs-utils: bump to version 1.8.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=56574a950b443638949d35d9f6999503291b206b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For a change log since 1.7.1, see:
https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/ChangeLog?h=v1.8.1

Version 1.8 introduced a preliminary Zstd support, so this commit adds
this new optional dependency for target, and disable this option for the
host variant.

Version 1.8 also introduced a use of atomic operations, in commit [1].
This commit adds linking with libatomic when appropriate.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/commit/?id=0d6f9835ce27ead0f23848408366d9ca7f2b0d15

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
