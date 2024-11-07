Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A435D4335F
	for <buildroot@archiver.kernel.org>; Thu,  7 Nov 2024 13:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 066CC61097;
	Thu,  7 Nov 2024 13:44:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LdzXoRTbOd28; Thu,  7 Nov 2024 13:44:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EADCF6109A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EADCF6109A;
	Thu,  7 Nov 2024 13:44:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ECC0CC0
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 13:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D988142F73
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 13:44:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DLLWVSBAXtKw for <buildroot@buildroot.org>;
 Thu,  7 Nov 2024 13:44:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.135.210.3;
 helo=m16.mail.163.com; envelope-from=tianyuanhao3@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 34AA24011B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34AA24011B
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34AA24011B
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 13:44:13 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [223.102.84.14])
 by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id
 _____wDXLikdxCxnbgaOFw--.1287S3; 
 Thu, 07 Nov 2024 21:44:09 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Date: Thu,  7 Nov 2024 05:43:42 -0800
Message-ID: <20241107134342.4306-2-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20241107134342.4306-1-tianyuanhao3@163.com>
References: <20241107134342.4306-1-tianyuanhao3@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wDXLikdxCxnbgaOFw--.1287S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFWxXrWkAF15ZryDCr4Uurg_yoW8CFW7pa
 yayw40vr1Igr15X3yqg3y0kF1rK39Yka1UGF97WF10v34DtayUXr1jya1rtr1UAwn7G3y0
 v3s8GrnrAF13Aw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUsF4_UUUUU=
X-Originating-IP: [223.102.84.14]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/1tbiXByQjWcssY-hwwAAsK
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=qPM6Z
 zrcG8QA/gd8jEACmIySa9p/Y7pV58d64myjg2s=; b=n3I+LSrVGfyD4awfOoM5N
 MFVbrfx63tAk/TMCdKwqlXIyeNosLr97IRRt/0mNfZUf1R5rvT8wBQplhteQ1Ofj
 FG+9SF6+zYugUMyycrcxDTRMOeS5ON4df5w+7f8w7vBKKKv035bvXURZprpr1TaG
 ISI5T/kdsgns373CPNtQao=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=n3I+LSrV
Subject: [Buildroot] [PATCH v2 2/2] package/gnutls: fix configure options
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
Cc: TIAN Yuanhao <tianyuanhao3@163.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Two configure option names have been changed since version 3.7.5 [1]:

> Old: --without-libbrotli --without-libzstd (also --with-*)
> New: --without-brotli --without-zstd (also --with-*)

Fixes:

  configure: WARNING: unrecognized options: [...] --without-libbrotli, --without-libzstd

[1]: https://gitlab.com/gnutls/gnutls/-/commit/6b794e49d1a14e43f9e08023f958364712c3c89a

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
-- 
2.46.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
