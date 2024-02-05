Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9E0C48292
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 21:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0AA374012F;
	Mon,  5 Feb 2024 21:23:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AA374012F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O3J_PLrXApHM; Mon,  5 Feb 2024 21:23:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D04540BFE;
	Mon,  5 Feb 2024 21:23:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D04540BFE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 72BE91BF341
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5984960ECE
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:23:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5984960ECE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J9l4aYY8kIml for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 21:23:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B8C560E2E
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 21:23:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B8C560E2E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 27EE086DE0; Mon,  5 Feb 2024 21:23:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 22:23:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c5c3153c6a4c5bd8c4e84624addacc353d1f5724
X-Git-Newrev: 8a01774d9897310c00a0945865f5a6d5167dfca3
X-Patchwork-Hint: ignore
Message-Id: <20240205212324.27EE086DE0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/shadow: bump to version 4.14.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=8a01774d9897310c00a0945865f5a6d5167dfca3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also, the new version has an optional dependency on libbsd.

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/shadow/0001-Fix-yescrypt-support.patch | 38 --------------------------
 package/shadow/shadow.hash                     |  5 ++--
 package/shadow/shadow.mk                       |  9 +++++-
 3 files changed, 11 insertions(+), 41 deletions(-)

diff --git a/package/shadow/0001-Fix-yescrypt-support.patch b/package/shadow/0001-Fix-yescrypt-support.patch
deleted file mode 100644
index 19427676ca..0000000000
--- a/package/shadow/0001-Fix-yescrypt-support.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 7a63017b3c873a59e3482322b7824160a8c8ca67 Mon Sep 17 00:00:00 2001
-11;rgb:f6f6/f5f5/f4f4From: Bernd Kuhls <bernd@kuhls.net>
-Date: Sun, 9 Jul 2023 10:55:03 +0200
-Subject: [PATCH] Fix yescrypt support
-
-Fixes build error:
-newusers.c: In function 'update_passwd':
-newusers.c:433:21: error: 'sflg' undeclared (first use in this function); did you mean 'rflg'?
-
-introduced by
-https://github.com/shadow-maint/shadow/commit/5cd04d03f94622c12220d4a6352824af081b8531
-which forgot to define sflg for these configure options:
-
---without-sha-crypt --without-bcrypt --with-yescrypt
-
-Upstream: https://github.com/shadow-maint/shadow/commit/29da702491eea314b915ea9c7a83c9af80cf5797
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/newusers.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/newusers.c b/src/newusers.c
-index 7cb8434b..08f79798 100644
---- a/src/newusers.c
-+++ b/src/newusers.c
-@@ -60,7 +60,7 @@ static bool rflg = false;	/* create a system account */
- #ifndef USE_PAM
- static /*@null@*//*@observer@*/char *crypt_method = NULL;
- #define cflg (NULL != crypt_method)
--#if defined(USE_SHA_CRYPT) || defined(USE_BCRYPT)
-+#if defined(USE_SHA_CRYPT) || defined(USE_BCRYPT) || defined(USE_YESCRYPT)
- static bool sflg = false;
- #endif
- #ifdef USE_SHA_CRYPT
--- 
-2.39.2
-
diff --git a/package/shadow/shadow.hash b/package/shadow/shadow.hash
index 2e5c4a8168..4689a994de 100644
--- a/package/shadow/shadow.hash
+++ b/package/shadow/shadow.hash
@@ -1,3 +1,4 @@
-# Locally computed
-sha256  9afe245d79a2e7caac5f1ed62519b17416b057ec89df316df1c3935502f9dd2c  shadow-4.13.tar.xz
+# Verified from https://github.com/shadow-maint/shadow/releases/download/4.14.3/shadow-4.14.3.tar.xz.asc
+# with key A9348594CE31283A826FBDD8D57633D441E25BB5
+sha256  6969279236fe3152768573a38c9f83cb9ca109851a5a990aec1fc672ac2cfcd2  shadow-4.14.3.tar.xz
 sha256  3d25ab8f43fdc14624296a56ff8dc3e72e499ad35f32ae0c803f4959cfe17c0a  COPYING
diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
index 4bc3cce037..03eb16a3f4 100644
--- a/package/shadow/shadow.mk
+++ b/package/shadow/shadow.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHADOW_VERSION = 4.13
+SHADOW_VERSION = 4.14.3
 SHADOW_SITE = https://github.com/shadow-maint/shadow/releases/download/$(SHADOW_VERSION)
 SHADOW_SOURCE = shadow-$(SHADOW_VERSION).tar.xz
 SHADOW_LICENSE = BSD-3-Clause
@@ -120,6 +120,13 @@ else
 SHADOW_CONF_OPTS += --without-yescrypt
 endif
 
+ifeq ($(BR2_PACKAGE_LIBBSD),y)
+SHADOW_CONF_OPTS += --with-libbsd
+SHADOW_DEPENDENCIES += libbsd
+else
+SHADOW_CONF_OPTS += --without-libbsd
+endif
+
 define SHADOW_PERMISSIONS
 	/usr/bin/chage f 4755 0 0 - - - - -
 	/usr/bin/chfn f 4755 0 0 - - - - -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
