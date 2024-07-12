Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D27C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 08:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0E0B845D4;
	Fri, 12 Jul 2024 08:41:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pC0gT7CZ5vJy; Fri, 12 Jul 2024 08:41:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26F6C845D9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26F6C845D9;
	Fri, 12 Jul 2024 08:41:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D724B1BF995
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 08:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D164660B0E
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 08:41:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EziBkC2UIwW6 for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 08:41:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE26A60AC3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE26A60AC3
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 08:41:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CA64385B4F; Fri, 12 Jul 2024 08:41:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 10:31:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 77211ae347d4d9b8efe05822609a7caa0ee9d9b0
X-Git-Newrev: 8aa7d057a797bbb60e741889de1d7cc540a1cd87
X-Patchwork-Hint: ignore
Message-Id: <20240712084123.CA64385B4F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mtd: make lzo an optional
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=8aa7d057a797bbb60e741889de1d7cc540a1cd87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream fixed lzo to be an optional dependency in release 2.2.0[1]

See https://github.com/sigma-star/mtd-utils/commit/ab4628e756ab73d8193ed62b591417dad561b298

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/mtd/Config.in |  2 --
 package/mtd/mtd.mk    | 11 +++++++++--
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index 3ba48da645..9e5bb1735b 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -12,12 +12,10 @@ if BR2_PACKAGE_MTD
 
 config BR2_PACKAGE_MTD_JFFS_UTILS
 	bool
-	select BR2_PACKAGE_LZO
 	select BR2_PACKAGE_ZLIB
 
 config BR2_PACKAGE_MTD_UBIFS_UTILS
 	bool
-	select BR2_PACKAGE_LZO
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_ZLIB
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index faf4c55eda..f790ef5ec4 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -20,17 +20,24 @@ MTD_DEPENDENCIES += libexecinfo
 MTD_LDFLAGS += -lexecinfo
 endif
 
+ifeq ($(BR2_PACKAGE_LZO),y)
+MTD_DEPENDENCIES += lzo
+MTD_CONF_OPTS += --with-lzo
+else
+MTD_CONF_OPTS += --without-lzo
+endif
+
 MTD_CONF_ENV += LDFLAGS="$(MTD_LDFLAGS)"
 
 ifeq ($(BR2_PACKAGE_MTD_JFFS_UTILS),y)
-MTD_DEPENDENCIES += zlib lzo host-pkgconf
+MTD_DEPENDENCIES += zlib host-pkgconf
 MTD_CONF_OPTS += --with-jffs
 else
 MTD_CONF_OPTS += --without-jffs
 endif
 
 ifeq ($(BR2_PACKAGE_MTD_UBIFS_UTILS),y)
-MTD_DEPENDENCIES += util-linux zlib lzo host-pkgconf
+MTD_DEPENDENCIES += util-linux zlib host-pkgconf
 MTD_CONF_OPTS += --with-ubifs
 # crypto needs linux/hash_info.h
 ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12)$(BR2_PACKAGE_OPENSSL),yy)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
