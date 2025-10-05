Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68179CCA476
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 13:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C70A74139C;
	Sun,  5 Oct 2025 13:45:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id URFggxk5y7lL; Sun,  5 Oct 2025 13:45:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8ECB41358
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8ECB41358;
	Sun,  5 Oct 2025 13:45:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F850226
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21AB540A6E
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:45:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4gCuQvAzuN8F for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 13:45:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1517440A66
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1517440A66
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:45:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10DBA813F7; Sun,  5 Oct 2025 13:45:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Oct 2025 15:39:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0d430ac7281b5fd35f6d76707faea4eae04bd72e
X-Git-Newrev: 851c6ad27981af9c8d537058df8eacdbcb0eb638
X-Patchwork-Hint: ignore
Message-Id: <20251005134509.10DBA813F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libbson: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=851c6ad27981af9c8d537058df8eacdbcb0eb638
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The upstream libbson repository has been archived since october 2020,
and there is a known vulnerabilities affecting it (CVE-2025-0755).

Since no other package depends on libbson, and it hasn't seen any recent
activity, let's simply remove it from Buildroot. In case anyone needs a
bson implementation, one could integrate the replacement from mongo-c-driver
instead, see https://github.com/mongodb/mongo-c-driver/tree/master/src/libbson

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy             |  6 ++++++
 DEVELOPERS                   |  1 -
 package/Config.in            |  1 -
 package/libbson/Config.in    | 11 -----------
 package/libbson/libbson.hash |  4 ----
 package/libbson/libbson.mk   | 22 ----------------------
 6 files changed, 6 insertions(+), 39 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index ffcd53930a..2c5b389dc8 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_PACKAGE_LIBBSON
+	bool "libbson has been removed"
+	select BR2_LEGACY
+	help
+	  libbson is officially deprecated upstream and has been removed
+
 config BR2_TARGET_ROOTFS_AXFS
 	bool "AXFS root filesystem has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index d3fdbb49a0..e00a8a48ea 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2994,7 +2994,6 @@ F:	package/wlr-randr/
 
 N:	Semyon Kolganov <semenak94@mail.ru>
 F:	package/fmt/
-F:	package/libbson/
 F:	package/lua-resty-http/
 F:	package/mpir/
 
diff --git a/package/Config.in b/package/Config.in
index 756f48266e..e9906b066e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1924,7 +1924,6 @@ menu "JSON/XML"
 	source "package/json-for-modern-cpp/Config.in"
 	source "package/json-glib/Config.in"
 	source "package/jsoncpp/Config.in"
-	source "package/libbson/Config.in"
 	source "package/libfastjson/Config.in"
 	source "package/libjson/Config.in"
 	source "package/libjwt/Config.in"
diff --git a/package/libbson/Config.in b/package/libbson/Config.in
deleted file mode 100644
index 95f224e29e..0000000000
--- a/package/libbson/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_LIBBSON
-	bool "libbson"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	help
-	  libbson is a library providing useful routines related to
-	  building, parsing, and iterating BSON documents.
-
-	  http://mongoc.org/libbson/
-
-comment "libbson needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libbson/libbson.hash b/package/libbson/libbson.hash
deleted file mode 100644
index e4b636d2fd..0000000000
--- a/package/libbson/libbson.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# Locally calculated
-sha256  6bb51b863a4641d6d7729e4b55df8f4389ed534c34eb3a1cda906a53df11072c  libbson-1.9.5.tar.gz
-sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
-sha256  8dc5cb3146b026715e6c145621c7732f36c295d825b7b3a03076ad3f238db48e  THIRD_PARTY_NOTICES
diff --git a/package/libbson/libbson.mk b/package/libbson/libbson.mk
deleted file mode 100644
index 1ac7202830..0000000000
--- a/package/libbson/libbson.mk
+++ /dev/null
@@ -1,22 +0,0 @@
-################################################################################
-#
-# libbson
-#
-################################################################################
-
-LIBBSON_VERSION = 1.9.5
-LIBBSON_SITE = https://github.com/mongodb/libbson/releases/download/$(LIBBSON_VERSION)
-LIBBSON_LICENSE = Apache-2.0, MIT (jsonl), ISC (b64), Zlib (md5)
-LIBBSON_LICENSE_FILES = COPYING THIRD_PARTY_NOTICES
-LIBBSON_CPE_ID_VENDOR = mongodb
-LIBBSON_CONF_OPTS = \
-	--disable-tests \
-	--disable-examples \
-	--disable-man-pages \
-	--disable-html-docs
-
-LIBBSON_INSTALL_STAGING = YES
-
-# Also has CMake support, but that forces shared+static libs and static
-# lib has a different name.
-$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
