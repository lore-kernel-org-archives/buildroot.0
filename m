Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56192C433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 16:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EFD981388;
	Thu, 12 May 2022 16:01:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1dGxPnwV3rcW; Thu, 12 May 2022 16:01:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B6A581381;
	Thu, 12 May 2022 16:01:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4DED81BF336
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 16:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CE4F83F04
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 16:01:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sZ04vLAJlOLW for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 16:01:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 913CD83EF0
 for <buildroot@buildroot.org>; Thu, 12 May 2022 16:01:20 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id l18so11124642ejc.7
 for <buildroot@buildroot.org>; Thu, 12 May 2022 09:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7z/xlbKPpd18pUZYCEwQLQV1dVNofzceaJqx8YyanFA=;
 b=e8MPNBkLKx7ho/dUvVbxk85RemqAXj4oVkKjKiLWKDq4r9xY2rloL1bZj6/U2PjdnP
 6+km+fZ0qX/G3iXvTQ+A4Yk9Qw5709w4Pdh4IpT2BOFYfOYahdkoOh88NRk5hnQjwmFE
 SrQ7/QylP2ohjYcPis9gAevTRhlr9MjwhUpmLZk9BJ/qVkdfXEwONf+nFT4eWIVphL/w
 5ogodVztdPjo5qpBcX8YZuGLgcmjtOh0AO451mT/cKl3UoSERrB7i+dTdowDZO+BSvPi
 i+b/Qpy1W26rbnooLciEztsJ0+/8vZ1tKPkTYiQXWULttiOb1HMsrSuskbZIZEPhP6Xo
 42Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7z/xlbKPpd18pUZYCEwQLQV1dVNofzceaJqx8YyanFA=;
 b=lURwthPJZaI3i4hVNiDE5f9NsGU31DBPb4Vkk9jQkoPlRkflirTqXddQxTCXVGpY3J
 cHLqScTEhmRMifu4TPDa79vlcJfTVvRxk4vEFwmw7gOLnVkeFAHsNWaBw7hWAXrkuaJG
 R7uxFnAzRmWaibLgpkWse7qCINvHChX+w1AyC4AbwOdagQ2yOqxSRxwRwNt3+O1OX7SM
 TCLxo8ethb5/HX5CcrFVljh63N7WLme4Zj5w9wm+ohDoWiCwqWB42/pTg1xzOLmGkayC
 wos39j+IMUhMru4coKZX8WFHVgspyShOFb9GHT0K2VBmuvGQNczzH2lcTn4ZnyR8lhqI
 U5Ow==
X-Gm-Message-State: AOAM533ebYXW3UG34FnIp4lCJVuAqOVytH4aazmdGo8aSWhN3bS25MG8
 NKFX4K1Q3NYli8cPGPStQSNqL0GjYM7N/g==
X-Google-Smtp-Source: ABdhPJxdb/ITQ6r+bIb+1wE3RgtAnUteM9x7tnvX1M3TTWj7nPdB4yytLxlkKOJ78mx+OanpV4H8xQ==
X-Received: by 2002:a17:906:7313:b0:6f4:9079:2b2a with SMTP id
 di19-20020a170906731300b006f490792b2amr495575ejc.377.1652371278798; 
 Thu, 12 May 2022 09:01:18 -0700 (PDT)
Received: from arnoutx1.. (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 lb20-20020a170907785400b006f3ef214df6sm2312382ejc.92.2022.05.12.09.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 09:01:18 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 18:01:13 +0200
Message-Id: <20220512160116.2011627-2-arnout@mind.be>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220512160116.2011627-1-arnout@mind.be>
References: <20220512160116.2011627-1-arnout@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/5] package/gnutls: remove unused libregex
 dependency
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

The pcre/libregex dependency was removed in version 3.7.3 with upstream
commit 26578b7d02c269ff1d34ff782d84c7667734d03d, which removed the
bundled libopts. Remove the pcre dependency and the relevant CONF_OPTS
handling.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
This is for stable since it's already the case for 3.7.3, the version in
2022.02.x
---
 package/gnutls/Config.in |  1 -
 package/gnutls/gnutls.mk | 11 +----------
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
index d57bb8d135..28982b15a1 100644
--- a/package/gnutls/Config.in
+++ b/package/gnutls/Config.in
@@ -7,7 +7,6 @@ config BR2_PACKAGE_GNUTLS
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_LIBTASN1
 	select BR2_PACKAGE_NETTLE
-	select BR2_PACKAGE_PCRE
 	help
 	  GnuTLS is a secure communications library implementing the SSL
 	  and TLS protocols and technologies around them.
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index b5503b1fc9..79e7d529b1 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -17,7 +17,7 @@ GNUTLS_LICENSE += , GPL-3.0+ (gnutls-openssl library)
 GNUTLS_LICENSE_FILES += doc/COPYING
 endif
 
-GNUTLS_DEPENDENCIES = host-pkgconf libtasn1 nettle pcre
+GNUTLS_DEPENDENCIES = host-pkgconf libtasn1 nettle
 GNUTLS_CPE_ID_VENDOR = gnu
 GNUTLS_CONF_OPTS = \
 	--disable-doc \
@@ -25,7 +25,6 @@ GNUTLS_CONF_OPTS = \
 	--disable-libdane \
 	--disable-rpath \
 	--disable-tests \
-	--enable-local-libopts \
 	--enable-openssl-compatibility \
 	--without-libcrypto-prefix \
 	--without-libdl-prefix \
@@ -48,14 +47,6 @@ GNUTLS_CONF_ENV = gl_cv_socket_ipv6=yes \
 	gl_cv_func_gettimeofday_clobber=no
 GNUTLS_INSTALL_STAGING = YES
 
-# gnutls needs libregex, but pcre can be used too
-# The check isn't cross-compile friendly
-GNUTLS_CONF_ENV += libopts_cv_with_libregex=yes
-GNUTLS_CONF_OPTS += \
-	--with-regex-header=pcreposix.h \
-	--with-libregex-cflags="`$(PKG_CONFIG_HOST_BINARY) libpcreposix --cflags`" \
-	--with-libregex-libs="`$(PKG_CONFIG_HOST_BINARY) libpcreposix --libs`"
-
 ifeq ($(BR2_PACKAGE_CRYPTODEV_LINUX),y)
 GNUTLS_CONF_OPTS += --enable-cryptodev
 GNUTLS_DEPENDENCIES += cryptodev-linux
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
