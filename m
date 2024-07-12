Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD3B9C3DA4D
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 08:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E25B845F1;
	Fri, 12 Jul 2024 08:41:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6-QzalmJUqJy; Fri, 12 Jul 2024 08:41:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63304845E9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63304845E9;
	Fri, 12 Jul 2024 08:41:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1923C1BF584
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 08:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11DE44129B
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 08:41:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j9e_FWOtkPl7 for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 08:41:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F40A640917
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F40A640917
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 08:41:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DDC9485B50; Fri, 12 Jul 2024 08:41:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 10:31:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8aa7d057a797bbb60e741889de1d7cc540a1cd87
X-Git-Newrev: bb19ffeaab5ba4be0a1033ca326b25d4d4e8203f
X-Patchwork-Hint: ignore
Message-Id: <20240712084123.DDC9485B50@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mtd: make zlib an optional
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

commit: https://git.buildroot.net/buildroot/commit/?id=bb19ffeaab5ba4be0a1033ca326b25d4d4e8203f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream changed zlib to be an optional dependency in release 2.2.0[1]

See https://github.com/sigma-star/mtd-utils/commit/2465754716634422620b4577e0b7ba79c4ce1a39

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/mtd/Config.in |  2 --
 package/mtd/mtd.mk    | 11 +++++++++--
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index 9e5bb1735b..57a562c108 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -12,13 +12,11 @@ if BR2_PACKAGE_MTD
 
 config BR2_PACKAGE_MTD_JFFS_UTILS
 	bool
-	select BR2_PACKAGE_ZLIB
 
 config BR2_PACKAGE_MTD_UBIFS_UTILS
 	bool
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
-	select BR2_PACKAGE_ZLIB
 
 comment "MTD tools selection"
 
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index f790ef5ec4..fe40cf6c06 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -27,17 +27,24 @@ else
 MTD_CONF_OPTS += --without-lzo
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+MTD_DEPENDENCIES += zlib
+MTD_CONF_OPTS += --with-zlib
+else
+MTD_CONF_OPTS += --without-zlib
+endif
+
 MTD_CONF_ENV += LDFLAGS="$(MTD_LDFLAGS)"
 
 ifeq ($(BR2_PACKAGE_MTD_JFFS_UTILS),y)
-MTD_DEPENDENCIES += zlib host-pkgconf
+MTD_DEPENDENCIES += host-pkgconf
 MTD_CONF_OPTS += --with-jffs
 else
 MTD_CONF_OPTS += --without-jffs
 endif
 
 ifeq ($(BR2_PACKAGE_MTD_UBIFS_UTILS),y)
-MTD_DEPENDENCIES += util-linux zlib host-pkgconf
+MTD_DEPENDENCIES += util-linux host-pkgconf
 MTD_CONF_OPTS += --with-ubifs
 # crypto needs linux/hash_info.h
 ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12)$(BR2_PACKAGE_OPENSSL),yy)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
