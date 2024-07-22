Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899DBC3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 12:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38482408CA;
	Mon, 22 Jul 2024 12:09:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xd9_qpfglMZ1; Mon, 22 Jul 2024 12:09:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D65BE40907
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D65BE40907;
	Mon, 22 Jul 2024 12:09:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E99D41BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6C2781159
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:09:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KR8rNs8dHrnJ for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 12:09:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1900081154
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1900081154
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 12:09:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 12AC086FFC; Mon, 22 Jul 2024 12:09:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 14:09:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1c955f89ab2d0ff9df1d1ae638685f2c0383c81a
X-Git-Newrev: 4521734348dd075fe7e1224ce4688c4fc683536a
X-Patchwork-Hint: ignore
Message-Id: <20240722120924.12AC086FFC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/erofs-utils: add libdeflate and
 zlib optional dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=4521734348dd075fe7e1224ce4688c4fc683536a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libdeflate and zlib are optional dependencies and zlib is enabled by
default since bump to version 1.7.1 in commit
f5f3d8ca007d46c1b4a351e53b619209b232b113 and
https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/commit/?id=29b9e71401621d3417599067a75bd9b13154c6a7:

checking for zlib... no
configure: error: Package requirements (zlib) were not met:

Package 'zlib', required by 'virtual:world', not found

Fixes: f5f3d8ca007d46c1b4a351e53b619209b232b113
 - http://autobuild.buildroot.org/results/a56d5917b5a1e8c75368349f75ec425aeba1ff15

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/erofs-utils/erofs-utils.mk | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/package/erofs-utils/erofs-utils.mk b/package/erofs-utils/erofs-utils.mk
index fbf7795583..f994ea9d07 100644
--- a/package/erofs-utils/erofs-utils.mk
+++ b/package/erofs-utils/erofs-utils.mk
@@ -42,8 +42,28 @@ else
 EROFS_UTILS_CONF_OPTS += --disable-fuse
 endif
 
+ifeq ($(BR2_PACKAGE_LIBDEFLATE),y)
+EROFS_UTILS_DEPENDENCIES += libdeflate
+EROFS_UTILS_CONF_OPTS += --with-libdeflate
+else
+EROFS_UTILS_CONF_OPTS += --without-libdeflate
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+EROFS_UTILS_DEPENDENCIES += zlib
+EROFS_UTILS_CONF_OPTS += --with-zlib
+else
+EROFS_UTILS_CONF_OPTS += --without-zlib
+endif
+
 HOST_EROFS_UTILS_DEPENDENCIES = host-pkgconf host-util-linux host-lz4 host-xz
-HOST_EROFS_UTILS_CONF_OPTS += --enable-lz4 --enable-lzma --disable-fuse --without-selinux
+HOST_EROFS_UTILS_CONF_OPTS += \
+	--enable-lz4 \
+	--enable-lzma \
+	--disable-fuse \
+	--without-libdeflate \
+	--without-selinux \
+	--without-zlib
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
