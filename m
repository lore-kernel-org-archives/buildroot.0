Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342FBEEB591
	for <buildroot@archiver.kernel.org>; Thu, 12 Sep 2024 11:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D31D581B0A;
	Thu, 12 Sep 2024 11:39:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lw0sQ62dwCKS; Thu, 12 Sep 2024 11:39:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2F1D81D47
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2F1D81D47;
	Thu, 12 Sep 2024 11:39:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C4C9B1BF29F
 for <buildroot@lists.busybox.net>; Thu, 12 Sep 2024 11:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFE3860D77
 for <buildroot@lists.busybox.net>; Thu, 12 Sep 2024 11:39:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nxYW1CtbkYTs for <buildroot@lists.busybox.net>;
 Thu, 12 Sep 2024 11:39:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=220.197.31.4;
 helo=m16.mail.163.com; envelope-from=tianyuanhao3@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 644BA60D51
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 644BA60D51
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by smtp3.osuosl.org (Postfix) with ESMTP id 644BA60D51
 for <buildroot@buildroot.org>; Thu, 12 Sep 2024 11:39:25 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [223.102.84.87])
 by gzga-smtp-mta-g3-2 (Coremail) with SMTP id _____wCX9rDl0uJmlPsEIw--.61162S2;
 Thu, 12 Sep 2024 19:39:18 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Date: Thu, 12 Sep 2024 04:38:55 -0700
Message-ID: <20240912113855.3983-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
X-CM-TRANSID: _____wCX9rDl0uJmlPsEIw--.61162S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFWxXrWkAF15ZryDCr4Uurg_yoW8CFW7pa
 yayw40vr1Igr45X3yqg3y09r15K39Yka1UGF97WF1v9a4DtayUXr1jya15tr1UJw1kG3y0
 v3s8GrnrAF13Aw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUgyCdUUUUU=
X-Originating-IP: [223.102.84.87]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/1tbiXAdYjWXAnvlT+wABsl
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=H59K3
 ZpOJ/jMQv07EyWKDpTH5Pzj6L8CtqSUrD6RC7I=; b=Gpof8AnfQCd75j3+VqsBr
 +ZBtegFXAqR6CNP6ffRg458mq+tQNVgjzhfgkYFQwfHqDeROSqfI8ouHdf2uiaq0
 psFi9rNshbdroKAOWhjdYv9D934CTkZvi0Lo93MdStZSht9CTHE7ZZ1TDMobGt3X
 nyIjl8x7XgDemlmgqEprcw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=Gpof8Anf
Subject: [Buildroot] [PATCH 1/1] package/gnutls: fix configure options
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
index 479922ee5d..55036594c0 100644
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
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
