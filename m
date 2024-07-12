Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7A0C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 22:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5AD080EE9;
	Fri, 12 Jul 2024 22:24:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OyAq3hfn12ud; Fri, 12 Jul 2024 22:23:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71A1180FB5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71A1180FB5;
	Fri, 12 Jul 2024 22:23:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E0721BF995
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 389556060C
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:23:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v_Z7VHHnVzUv for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 22:23:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 542BF605C5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 542BF605C5
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 22:23:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0489086367; Fri, 12 Jul 2024 22:23:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 00:22:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f5f3d8ca007d46c1b4a351e53b619209b232b113
X-Git-Newrev: d889031e0b70390ea34703071f96a5b750803d30
X-Patchwork-Hint: ignore
Message-Id: <20240712222355.0489086367@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/erofs-utils: add config option for
 LZMA compression
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
Content-Type: multipart/mixed; boundary="===============6202569670569378201=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6202569670569378201==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d889031e0b70390ea34703071f96a5b750803d30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Enabled LZMA compression for host build.
 * Added option for LZMA support on target.

Signed-off-by: Jan Čermák <sairon@sairon.cz>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/erofs-utils/Config.in      |  6 ++++++
 package/erofs-utils/erofs-utils.mk | 11 +++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/package/erofs-utils/Config.in b/package/erofs-utils/Config.in
index 9d9aa159c0..284b2cd059 100644
--- a/package/erofs-utils/Config.in
+++ b/package/erofs-utils/Config.in
@@ -15,6 +15,12 @@ config BR2_PACKAGE_EROFS_UTILS_LZ4
 	help
 	  Support LZ4 compression algorithm
 
+config BR2_PACKAGE_EROFS_UTILS_LZMA
+	bool "lzma support"
+	select BR2_PACKAGE_XZ
+	help
+	  Support LZMA compression algorithm
+
 config BR2_PACKAGE_EROFS_UTILS_EROFSFUSE
 	bool "erofsfuse support"
 	depends on BR2_USE_MMU # libfuse
diff --git a/package/erofs-utils/erofs-utils.mk b/package/erofs-utils/erofs-utils.mk
index 0aed99ba76..fbf7795583 100644
--- a/package/erofs-utils/erofs-utils.mk
+++ b/package/erofs-utils/erofs-utils.mk
@@ -21,6 +21,13 @@ else
 EROFS_UTILS_CONF_OPTS += --disable-lz4
 endif
 
+ifeq ($(BR2_PACKAGE_EROFS_UTILS_LZMA),y)
+EROFS_UTILS_DEPENDENCIES += xz
+EROFS_UTILS_CONF_OPTS += --enable-lzma
+else
+EROFS_UTILS_CONF_OPTS += --disable-lzma
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 EROFS_UTILS_CONF_OPTS += --with-selinux
 EROFS_UTILS_DEPENDENCIES += libselinux
@@ -35,8 +42,8 @@ else
 EROFS_UTILS_CONF_OPTS += --disable-fuse
 endif
 
-HOST_EROFS_UTILS_DEPENDENCIES = host-pkgconf host-util-linux host-lz4
-HOST_EROFS_UTILS_CONF_OPTS += --enable-lz4 --disable-fuse --without-selinux
+HOST_EROFS_UTILS_DEPENDENCIES = host-pkgconf host-util-linux host-lz4 host-xz
+HOST_EROFS_UTILS_CONF_OPTS += --enable-lz4 --enable-lzma --disable-fuse --without-selinux
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))

--===============6202569670569378201==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6202569670569378201==--
