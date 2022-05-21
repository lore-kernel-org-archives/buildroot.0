Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B82C433F5
	for <buildroot@archiver.kernel.org>; Sat, 21 May 2022 12:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22D2B4196C;
	Sat, 21 May 2022 12:39:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gdXhBfW0nhvy; Sat, 21 May 2022 12:39:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9E8941909;
	Sat, 21 May 2022 12:39:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D14231BF2C0
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 12:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFE6A60BD7
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 12:39:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SEm54lW1GVIH for <buildroot@lists.busybox.net>;
 Sat, 21 May 2022 12:39:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0ABFE60BAE
 for <buildroot@buildroot.org>; Sat, 21 May 2022 12:39:18 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id gh17so7008768ejc.6
 for <buildroot@buildroot.org>; Sat, 21 May 2022 05:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=736Q+XqS67SePRnKx7cMj42Rz70Ya4h9DkG9ypymuVw=;
 b=J/fUWgIJ8kgbwKYEKKpy/QU7FLsl3mP2gOLZT/fl6m8gypLoGstuQUEjOuIBgqb8Fb
 1QOAL6ApNaBY+aeBcfZ4RHXLBMaGar9zm8YBK6pCRSOhrrLro406rw5Al6hQ0QTKUGYH
 YWwHmJVRkG47yBni1+3BLeRD979uS7tHr9Y86XbEDURYLQziv3sA9r45AwsgR1NMAg6P
 0NHGxt4/UidGc3iqw+aYvDYXFebIkeaiKARI8etPoWFUGQL3WH6x4tvNClWswdfQfMHR
 JgwoE3QQz4S+qTIfXWTfxV/aEfn8ZkTUrUStoe7IrY9m5rUUBolA+8MkwzsoMWG9X6br
 dooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=736Q+XqS67SePRnKx7cMj42Rz70Ya4h9DkG9ypymuVw=;
 b=myGGVDk4t2QcQv/+hnyNbh6xa4cKHi4BXHMXV+FvDJWwCxDZsrhdDNI1dOfoZJZIhw
 np0MdMUFbp8rzv8zPNc9CdzuYjSfghqW2h55jxTUxKPuMDN/0f4JEBgcFB8S8qHIj68u
 28b6wMGpU5/7eHV9lv0a6x3uGM7W5sabkLAp7rv1p+xqCuZP0wQNlEb0vBMYht+Oa56n
 LEX+xKJac8KAp02hazwTEQFR9oraaTYOhTTRMrN5g02nPc6B41syqPsvDf8b7xKRd9T3
 jp1uLQWsk1NziS+yTjWqK+6Vzoo1a9u1Cmt5S3p0jvjiV1WoZCuRciYGzCK16uR6+iST
 89Zw==
X-Gm-Message-State: AOAM530BoA/d4WA65aaraFbW24m3ZpXTPUdnk3G90yxOQOrKACUd0fcK
 HvrIkMXqCNh0NbzS0GiOMsc4yyQ2KIk=
X-Google-Smtp-Source: ABdhPJz2EKlwae9Dq9bIffmHDSawv7j2uNS7hvrAhoOEVE+zjWz2huIUmEpMh4w5bB9J/DeZpb5++A==
X-Received: by 2002:a17:907:94c6:b0:6f5:287a:2bf2 with SMTP id
 dn6-20020a17090794c600b006f5287a2bf2mr13104092ejc.124.1653136756968; 
 Sat, 21 May 2022 05:39:16 -0700 (PDT)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 jx4-20020a170907760400b006f3ef214da3sm4110479ejc.9.2022.05.21.05.39.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 May 2022 05:39:16 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 May 2022 14:38:43 +0200
Message-Id: <20220521123838.2881-4-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220521123838.2881-1-heiko.thiery@gmail.com>
References: <20220521123838.2881-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/4] package/gnutls: add build support for host
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 Matt Weber <matthew.weber@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/gnutls/gnutls.mk | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index f7f3e046e9..ac83bb35d3 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -41,6 +41,31 @@ GNUTLS_CONF_ENV = gl_cv_socket_ipv6=yes \
 	gl_cv_func_gettimeofday_clobber=no
 GNUTLS_INSTALL_STAGING = YES
 
+HOST_GNUTLS_DEPENDENCIES = host-pkgconf host-libtasn1 host-libunistring host-nettle
+HOST_GNUTLS_CONF_OPTS = \
+	--disable-doc \
+	--disable-guile \
+	--disable-libdane \
+	--disable-rpath \
+	--disable-tests \
+	--without-included-unistring \
+	--without-libcrypto-prefix \
+	--without-libdl-prefix \
+	--without-libev-prefix \
+	--without-libiconv-prefix \
+	--without-libintl-prefix \
+	--without-libpthread-prefix \
+	--without-libseccomp-prefix \
+	--without-librt-prefix \
+	--without-libz-prefix \
+	--without-tpm \
+	--disable-openssl-compatibility \
+	--without-libbrotli \
+	--without-idn \
+	--without-p11-kit \
+	--without-zlib \
+	--without-libzstd
+
 ifeq ($(BR2_PACKAGE_GNUTLS_OPENSSL),y)
 GNUTLS_LICENSE += , GPL-3.0+ (gnutls-openssl library)
 GNUTLS_LICENSE_FILES += doc/COPYING
@@ -103,3 +128,4 @@ endif
 GNUTLS_CONF_ENV += LIBS="$(GNUTLS_LIBS)"
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
