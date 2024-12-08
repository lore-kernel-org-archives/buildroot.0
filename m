Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 919E3E77173
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 14:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E64C60619;
	Sun,  8 Dec 2024 14:50:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P4LWKGhqOJHs; Sun,  8 Dec 2024 14:50:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6414260632
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6414260632;
	Sun,  8 Dec 2024 14:50:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AEF506F
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FD0F4024F
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:50:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z3P1520OqbSF for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 14:50:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82807400BD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82807400BD
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:50:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6DBFF86B98; Sun,  8 Dec 2024 14:50:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 8 Dec 2024 15:43:46 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 6c8de012ae84d6f12104ca58fcf13ac97a996613
X-Git-Newrev: 3e34505ce0f7773ca208dddc7c8068f311ac508b
X-Patchwork-Hint: ignore
Message-Id: <20241208145030.6DBFF86B98@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/gnutls: fix
 configure options
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

commit: https://git.buildroot.net/buildroot/commit/?id=3e34505ce0f7773ca208dddc7c8068f311ac508b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Two configure option names have been changed since version 3.7.5 [1]:

> Old: --without-libbrotli --without-libzstd (also --with-*)
> New: --without-brotli --without-zstd (also --with-*)

Fixes:

  configure: WARNING: unrecognized options: [...] --without-libbrotli, --without-libzstd

[1]: https://gitlab.com/gnutls/gnutls/-/commit/6b794e49d1a14e43f9e08023f958364712c3c89a

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit c4a56d3f6d45898c889b68f1ab785dcabcce31bf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnutls/gnutls.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 67b3c16b94..a977093bd5 100644
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
