Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA94C021B2
	for <buildroot@archiver.kernel.org>; Thu, 20 Feb 2025 19:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0F2F41317;
	Thu, 20 Feb 2025 19:48:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9pOXiMBq8r6Q; Thu, 20 Feb 2025 19:48:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63AA141319
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63AA141319;
	Thu, 20 Feb 2025 19:48:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BFDFCF
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 19:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5106583F04
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 19:48:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id btgHFPQBfTF0 for <buildroot@buildroot.org>;
 Thu, 20 Feb 2025 19:48:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EC71083EFC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC71083EFC
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC71083EFC
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 19:48:53 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id DA1A3352088C; Thu, 20 Feb 2025 20:48:50 +0100 (CET)
Date: Thu, 20 Feb 2025 20:48:50 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Z7eHIpwpvMIoCk3I@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-33-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1740080931; bh=3tj3JNPl6nc2HsOGAF2Yrk+PJkzvdHFOKyOI0BHbStc=;
 h=Date:From:To:Subject:From;
 b=Yk17mNUo4l+i41rTfK1bF/GeoZcBBBz3dq2HWd47fKm4q/X8K+5jtNixzDyWJpYOO
 l+t6zchALiVmGBNQP1/SZPZm7LS2kR9S3pgS6nno8auJ/HBS05yuV/NQmc4og1Kzwn
 WAJXJ9RGH4OfN3LFQMsgdKMiIeucK8TtlHkRctyyXVFru/a4OTGCwBhoErOOESFpbV
 2a2e/CdxUwoKavVoi7WU6TG1tocDzIR/H8MQy2Uag6mpMvu8rxQg2o5wptgE1XSGjz
 B43ay7LIXZ0Xmdgka1myN9AFmIkJ9EX4YlMv+/qvpNBWLJqNikoOElJak/jsZ0WpSV
 cymQc32QqhXWg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=Yk17mNUo
Subject: [Buildroot] [PATCH] package/libjwt: update to 3.2.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For a complete changelog see here:
https://github.com/benmcollins/libjwt/compare/v1.17.2...v3.2.0

Convert to cmake infrastructure as autotools were removed
upstream.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/libjwt/libjwt.hash |  2 +-
 package/libjwt/libjwt.mk   | 14 ++++++++------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/libjwt/libjwt.hash b/package/libjwt/libjwt.hash
index 0049772a78..8e59d2284b 100644
--- a/package/libjwt/libjwt.hash
+++ b/package/libjwt/libjwt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f11c4544f61a31f105720b8329409fea009d6f9ef41c9361f98c2de48152eeae  libjwt-1.17.2.tar.bz2
+sha256  17ee4e25adfbb91003946af967ff04068a5c93d6b51ad7ad892f1441736b71b9  libjwt-3.2.0.tar.xz
 sha256  3f3d9e0024b1921b067d6f7f88deb4a60cbe7a78e76c64e3f1d7fc3b779b9d04  LICENSE
diff --git a/package/libjwt/libjwt.mk b/package/libjwt/libjwt.mk
index 9f94c8683e..4a02792bfa 100644
--- a/package/libjwt/libjwt.mk
+++ b/package/libjwt/libjwt.mk
@@ -4,23 +4,25 @@
 #
 ################################################################################
 
-LIBJWT_VERSION = 1.17.2
+LIBJWT_VERSION = 3.2.0
 LIBJWT_SITE = https://github.com/benmcollins/libjwt/releases/download/v$(LIBJWT_VERSION)
-LIBJWT_SOURCE = libjwt-$(LIBJWT_VERSION).tar.bz2
+LIBJWT_SOURCE = libjwt-$(LIBJWT_VERSION).tar.xz
 LIBJWT_DEPENDENCIES = host-pkgconf jansson
 LIBJWT_INSTALL_STAGING = YES
 LIBJWT_LICENSE = MPL-2.0
 LIBJWT_LICENSE_FILES = LICENSE
 LIBJWT_CPE_ID_VENDOR = bencollins
 LIBJWT_CPE_ID_PRODUCT = jwt_c_library
-LIBJWT_CONF_OPTS = --without-examples
+
+LIBJWT_CONF_OPTS += -DWITH_TESTS=OFF
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-LIBJWT_CONF_OPTS += --with-openssl
+LIBJWT_CONF_OPTS += -DWITH_OPENSSL=ON
 LIBJWT_DEPENDENCIES += openssl
 else
-LIBJWT_CONF_OPTS += --without-openssl
+LIBJWT_CONF_OPTS += -DWITH_GNUTLS=ON
 LIBJWT_DEPENDENCIES += gnutls
 endif
 
-$(eval $(autotools-package))
+
+$(eval $(cmake-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
