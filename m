Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00C4E77171
	for <buildroot@archiver.kernel.org>; Wed,  4 Dec 2024 22:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66ACB60697;
	Wed,  4 Dec 2024 22:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1zALxHSiun40; Wed,  4 Dec 2024 22:01:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72DA06084B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72DA06084B;
	Wed,  4 Dec 2024 22:01:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 380CF1FDB
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 22:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33210400FF
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 22:01:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JAMlh8SeoR2H for <buildroot@buildroot.org>;
 Wed,  4 Dec 2024 22:01:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BD1140B9C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BD1140B9C
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 22:01:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 113898692F; Wed,  4 Dec 2024 22:01:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Dec 2024 22:49:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1eec67d164c7087aa0bed30599681e908fb2fb41
X-Git-Newrev: c4a56d3f6d45898c889b68f1ab785dcabcce31bf
X-Patchwork-Hint: ignore
Message-Id: <20241204220106.113898692F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnutls: fix configure options
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c4a56d3f6d45898c889b68f1ab785dcabcce31bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Two configure option names have been changed since version 3.7.5 [1]:

> Old: --without-libbrotli --without-libzstd (also --with-*)
> New: --without-brotli --without-zstd (also --with-*)

Fixes:

  configure: WARNING: unrecognized options: [...] --without-libbrotli, --without-libzstd

[1]: https://gitlab.com/gnutls/gnutls/-/commit/6b794e49d1a14e43f9e08023f958364712c3c89a

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/gnutls/gnutls.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index a5012b1b21..2584f843ad 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -62,11 +62,11 @@ HOST_GNUTLS_CONF_OPTS = \
 	--without-tpm \
 	--without-tpm2 \
 	--disable-openssl-compatibility \
-	--without-libbrotli \
+	--without-brotli \
 	--without-idn \
 	--without-p11-kit \
 	--without-zlib \
-	--without-libzstd
+	--without-zstd
 
 ifeq ($(BR2_PACKAGE_GNUTLS_OPENSSL),y)
 GNUTLS_LICENSE += , GPL-3.0+ (gnutls-openssl library)
@@ -77,10 +77,10 @@ GNUTLS_CONF_OPTS += --disable-openssl-compatibility
 endif
 
 ifeq ($(BR2_PACKAGE_BROTLI),y)
-GNUTLS_CONF_OPTS += --with-libbrotli
+GNUTLS_CONF_OPTS += --with-brotli
 GNUTLS_DEPENDENCIES += brotli
 else
-GNUTLS_CONF_OPTS += --without-libbrotli
+GNUTLS_CONF_OPTS += --without-brotli
 endif
 
 ifeq ($(BR2_PACKAGE_CRYPTODEV_LINUX),y)
@@ -110,10 +110,10 @@ GNUTLS_CONF_OPTS += --without-zlib
 endif
 
 ifeq ($(BR2_PACKAGE_ZSTD),y)
-GNUTLS_CONF_OPTS += --with-libzstd
+GNUTLS_CONF_OPTS += --with-zstd
 GNUTLS_DEPENDENCIES += zstd
 else
-GNUTLS_CONF_OPTS += --without-libzstd
+GNUTLS_CONF_OPTS += --without-zstd
 endif
 
 # Provide a default CA cert location
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
