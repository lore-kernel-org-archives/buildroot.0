Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70026C5B559
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 12:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2253F41D26;
	Wed,  4 Jun 2025 12:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cKG_-_5BerE4; Wed,  4 Jun 2025 12:58:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 407C341CF2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 407C341CF2;
	Wed,  4 Jun 2025 12:58:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 92625DA
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 12:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 845DC81BA8
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 12:58:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LcWFUUU0ysIc for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 12:58:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD96B81361
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD96B81361
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 12:58:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CCA7A8794B; Wed,  4 Jun 2025 12:58:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jun 2025 14:56:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e5865fec7e5451d7112a6c3c01ca310d6d8bd682
X-Git-Newrev: 1dfe081a19e7e3618d0583d6e1554786939bab4e
X-Patchwork-Hint: ignore
Message-Id: <20250604125848.CCA7A8794B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcurl: security bump to version
 8.14.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=1dfe081a19e7e3618d0583d6e1554786939bab4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:
- CVE-2025-5025:
  No QUIC certificate pinning with wolfSSL.
  https://curl.se/docs/CVE-2025-5025.html

- CVE-2025-4947:
  QUIC certificate check skip with wolfSSL.
  https://curl.se/docs/CVE-2025-4947.html

- CVE-2025-5399:
  WebSocket endless loop
  https://curl.se/docs/CVE-2025-5399.html

Changelog:
https://curl.se/ch/8.14.0.html
https://curl.se/ch/8.14.1.html

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
[Peter: bump to 8.14.1 instead]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 388ddc1418..a463e1db4e 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.se/download/curl-8.13.0.tar.xz.asc
+# https://curl.se/download/curl-8.14.1.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  4a093979a3c2d02de2fbc00549a32771007f2e78032c6faa5ecd2f7a9e152025  curl-8.13.0.tar.xz
+sha256  f4619a1e2474c4bbfedc88a7c2191209c8334b48fa1f4e53fd584cc12e9120dd  curl-8.14.1.tar.xz
 sha256  e18f1989333b70044b2adfb7dc2f905d0119dbdcac3bc9f4bc9d540e3a29de5b  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 5f04fc381f..68d638609b 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 8.13.0
+LIBCURL_VERSION = 8.14.1
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
@@ -14,6 +14,7 @@ LIBCURL_LICENSE = curl
 LIBCURL_LICENSE_FILES = COPYING
 LIBCURL_CPE_ID_VENDOR = haxx
 LIBCURL_INSTALL_STAGING = YES
+LIBCURL_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
 
 # We disable NTLM delegation to winbinds ntlm_auth ('--disable-ntlm-wb')
 # support because it uses fork(), which doesn't work on non-MMU platforms.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
