Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5AB1C87FCF
	for <buildroot@archiver.kernel.org>; Sat, 26 Jul 2025 11:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A240460AEC;
	Sat, 26 Jul 2025 11:44:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4MZ2zYe-lCgR; Sat, 26 Jul 2025 11:44:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C294660BB8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C294660BB8;
	Sat, 26 Jul 2025 11:44:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 793B0DA
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 11:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B6D460757
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 11:44:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BReX3WEO8j2K for <buildroot@buildroot.org>;
 Sat, 26 Jul 2025 11:44:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92E7560AEC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92E7560AEC
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 11:44:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D44B86A33; Sat, 26 Jul 2025 11:44:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Jul 2025 13:32:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d48412b58eefc47924f7821517d77739940f81d4
X-Git-Newrev: 4cd8a7d748bdbde26a48fe1da056a4802525b2a6
X-Patchwork-Hint: ignore
Message-Id: <20250726114403.8D44B86A33@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcurl: bump version to 8.15.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4cd8a7d748bdbde26a48fe1da056a4802525b2a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream removed optional BearSSL support:
https://github.com/curl/curl/commit/08a3e8e19a59d1530bfb208e187ac7c34c978dfd

Changelog: https://curl.se/ch/8.15.0.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy             | 6 ++++++
 package/libcurl/Config.in    | 4 ----
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 9 +--------
 4 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4bc917ce00..efb59dc535 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2025.08"
 
+config BR2_PACKAGE_LIBCURL_BEARSSL
+	bool "libcurl removed BearSSL support"
+	select BR2_LEGACY
+	help
+	  Libcurl removed optional BearSSL support.
+
 config BR2_PACKAGE_LIBOLM
 	bool "libolm has been removed"
 	select BR2_LEGACY
diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
index 0e52bc69c2..b86f98262c 100644
--- a/package/libcurl/Config.in
+++ b/package/libcurl/Config.in
@@ -63,10 +63,6 @@ config BR2_PACKAGE_LIBCURL_OPENSSL
 	bool "OpenSSL"
 	depends on BR2_PACKAGE_OPENSSL
 
-config BR2_PACKAGE_LIBCURL_BEARSSL
-	bool "BearSSL"
-	depends on BR2_PACKAGE_BEARSSL
-
 config BR2_PACKAGE_LIBCURL_GNUTLS
 	bool "GnuTLS"
 	depends on BR2_PACKAGE_GNUTLS
diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index a463e1db4e..2e36917382 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.se/download/curl-8.14.1.tar.xz.asc
+# https://curl.se/download/curl-8.15.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  f4619a1e2474c4bbfedc88a7c2191209c8334b48fa1f4e53fd584cc12e9120dd  curl-8.14.1.tar.xz
+sha256  6cd0a8a5b126ddfda61c94dc2c3fc53481ba7a35461cf7c5ab66aa9d6775b609  curl-8.15.0.tar.xz
 sha256  e18f1989333b70044b2adfb7dc2f905d0119dbdcac3bc9f4bc9d540e3a29de5b  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 51716cd45b..1cfdda27d2 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 8.14.1
+LIBCURL_VERSION = 8.15.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
@@ -67,13 +67,6 @@ else
 LIBCURL_CONF_OPTS += --without-openssl
 endif
 
-ifeq ($(BR2_PACKAGE_LIBCURL_BEARSSL),y)
-LIBCURL_CONF_OPTS += --with-bearssl=$(STAGING_DIR)/usr
-LIBCURL_DEPENDENCIES += bearssl
-else
-LIBCURL_CONF_OPTS += --without-bearssl
-endif
-
 ifeq ($(BR2_PACKAGE_LIBCURL_GNUTLS),y)
 LIBCURL_CONF_OPTS += --with-gnutls=$(STAGING_DIR)/usr \
 	--with-ca-fallback
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
