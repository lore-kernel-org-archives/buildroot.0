Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 335CEC433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 16:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFA7040C25;
	Thu, 12 May 2022 16:02:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m6iLCpVawBs1; Thu, 12 May 2022 16:02:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 009D340C1D;
	Thu, 12 May 2022 16:02:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 53CDA1BF336
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 16:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FB2E40C0B
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 16:01:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZlFDkS3Nv2jD for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 16:01:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E9B640BF5
 for <buildroot@buildroot.org>; Thu, 12 May 2022 16:01:22 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id n10so11168669ejk.5
 for <buildroot@buildroot.org>; Thu, 12 May 2022 09:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2lugRhGhZrHkQcS87Br4ubzVXjOdhcqkZjEPPDZRrn8=;
 b=FT21L+s/ApyLSVlI5E1LLGdtr8+t7RdIiOn2AesI35bK6DGdQ1HorQWyfbyxHhk44N
 bV6KxzAXCjd51T6XCbue8/ySVWj45TDGwlwjLTZJ4ZXu8t0l7BTCZjmMYXpKtXD3sm1T
 uTbxpD/O47IcNA3L183iQOmcd02tKjYA7BEnp9nyPAxfdVllKehiSo7QP1wuyi7FKrvn
 bKcgcC61GePCKlbHNP395UhGaxmLA21NGJkaAPhKYbx4i1+Zrcjp/HWn7JajLMuPhEae
 5mFe1ZYJeBgjFQEjLfRTG/6vIClJnZGHjebA/6yelmpTgFJZca+xjBaCG93yEbx9hlqF
 Ebtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2lugRhGhZrHkQcS87Br4ubzVXjOdhcqkZjEPPDZRrn8=;
 b=hr1ppbpO/LF0k/31wcKMF61JP4+6JwkqBvyskRY/K/vFc/pDYdlXYwMSd3RuEAnC3K
 1FzTSwqZ2vXR2Z6pILkhNyagazgp5lDWfHATRm15Q4GOSDf4mzxB9pjUUfH0eqRURnPt
 V7yJGKS3EIUVW4RzyEpiD4i4zkWXayMVQmssjFyzmCDFXy6oigzvdcXURcYzB+hRwcBj
 sJz68jAWmsh0o4tu3Ud5C2M+NE4fqBYKVKgXVYWChmYWju/EHp8hEP0sqOXeLtg5BEyI
 fBarwNAipj7VxSqhexOo5bM4NxkQl6j3/LQLSvgtH5MLeCXbyMYKtsbq6NNPqENHtGTZ
 Irtg==
X-Gm-Message-State: AOAM533LpiDYl20dDXs8BONfam2uNH1j9TYEwMUUMM5c8u0kNp78HujJ
 NrplSquoT3y0usq+mOlHzib8g7TLK/YJ4g==
X-Google-Smtp-Source: ABdhPJyqobZNw49NlYe8aI00mg0nb0pGvmtk2NJVmssdxbrHvbe+3TC19vwSHc5SkhdJ5DJNqzl3OA==
X-Received: by 2002:a17:906:148a:b0:6f3:833d:5a0f with SMTP id
 x10-20020a170906148a00b006f3833d5a0fmr513506ejc.49.1652371280574; 
 Thu, 12 May 2022 09:01:20 -0700 (PDT)
Received: from arnoutx1.. (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 lb20-20020a170907785400b006f3ef214df6sm2312382ejc.92.2022.05.12.09.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 09:01:20 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 18:01:16 +0200
Message-Id: <20220512160116.2011627-5-arnout@mind.be>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220512160116.2011627-1-arnout@mind.be>
References: <20220512160116.2011627-1-arnout@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/5] package/gnutls: libunistring is not optional
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the very beginning, libunistring was a mandatory dependency of
gnutls. However, it would use its internal copy if libunistring was not
selected. We never want that, so make libunistring an actual mandatory
dependency.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gnutls/Config.in | 5 ++---
 package/gnutls/gnutls.mk | 9 ++-------
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
index 28982b15a1..b3f9f5420b 100644
--- a/package/gnutls/Config.in
+++ b/package/gnutls/Config.in
@@ -2,10 +2,9 @@ config BR2_PACKAGE_GNUTLS
 	bool "gnutls"
 	# https://gitlab.com/gnutls/gnutls/issues/203
 	depends on !BR2_STATIC_LIBS
-	# gnulib requires a library that implements wctomb().
-	# This is noticed only when linking with libgnutls.so.
-	depends on BR2_USE_WCHAR
+	depends on BR2_USE_WCHAR # libunistring
 	select BR2_PACKAGE_LIBTASN1
+	select BR2_PACKAGE_LIBUNISTRING
 	select BR2_PACKAGE_NETTLE
 	help
 	  GnuTLS is a secure communications library implementing the SSL
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 0210d18597..89ab9b9476 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -17,7 +17,7 @@ GNUTLS_LICENSE += , GPL-3.0+ (gnutls-openssl library)
 GNUTLS_LICENSE_FILES += doc/COPYING
 endif
 
-GNUTLS_DEPENDENCIES = host-pkgconf libtasn1 nettle
+GNUTLS_DEPENDENCIES = host-pkgconf libtasn1 libunistring nettle
 GNUTLS_CPE_ID_VENDOR = gnu
 GNUTLS_CONF_OPTS = \
 	--disable-doc \
@@ -25,6 +25,7 @@ GNUTLS_CONF_OPTS = \
 	--disable-libdane \
 	--disable-rpath \
 	--disable-tests \
+	--without-included-unistring \
 	--without-libcrypto-prefix \
 	--without-libdl-prefix \
 	--without-libev-prefix \
@@ -72,12 +73,6 @@ else
 GNUTLS_CONF_OPTS += --without-p11-kit
 endif
 
-ifeq ($(BR2_PACKAGE_LIBUNISTRING),y)
-GNUTLS_DEPENDENCIES += libunistring
-else
-GNUTLS_CONF_OPTS += --with-included-unistring
-endif
-
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 GNUTLS_CONF_OPTS += --with-zlib
 GNUTLS_DEPENDENCIES += zlib
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
