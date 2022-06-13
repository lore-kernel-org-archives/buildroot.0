Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EF8C433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Jun 2022 20:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C3574097E;
	Mon, 13 Jun 2022 20:09:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id erZW_OETVu5u; Mon, 13 Jun 2022 20:09:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B2C1404A1;
	Mon, 13 Jun 2022 20:09:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2FF501BF37C
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 20:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E2EC60E48
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 20:09:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hR0fyeJlO4v4 for <buildroot@lists.busybox.net>;
 Mon, 13 Jun 2022 20:09:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 002E660E44
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 20:09:00 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id u8so8427500wrm.13
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 13:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QKvliF5ol1W8oHZROtNG00GRqnXDT55sOSanvNX9HR4=;
 b=hCpE1FXMP85rs1i/AY1l3XhD4uPCN3KOzOkWHrimxNA9SycE78LHSogG/IKXxNhuF/
 HPkCOtMF8ttvpD1Yr7RCb0tOws+xY9pQdjLxfnX008Tsf17Dz69pUhP8SPyoDOvOM/b/
 lqSD3rOxFZynE++pTaaWGCipOOQOIz7jhHsH/BQjI6WX9bxo3O3Xk/0JYLpDsvX36Z9O
 cR6N8ixbMdSwr/rVi+ZdAM8vjpgkqbut3CSekxEsFD0+TpU0Hbt61h6Taqp6A0AbrVbq
 kC3b+gF0HtflbxVdx7TXUhe+pDiZUfPivAO1eTuGeA7RD758YXcOzTheR0SuNGUCibRN
 lakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QKvliF5ol1W8oHZROtNG00GRqnXDT55sOSanvNX9HR4=;
 b=Ae7rZo9oxcSgq4pKpgLOwPfvDpSKXBL5rgjiVFm1u385RvI6VrKcEriEZnf4GOqhEH
 23AkwuH/70NG8MZ9Ltsx2oYUSYnnIQiQhL0jecG34YT9WeF35mE7Ss1qWLzSVGEVztEz
 thUhM3hHr8tsh1rpAwWdTDAj1lOqR+LurFG2e3SiNqNqwQmJQBVNV5057XjAhsDIpQ3r
 JzlHnoZTfUImXQ5TTYyPy6AYsCR8CjPXVleBOD7Y1r014IXky4gH0tAqilRpCjGO6a7D
 JNR5i1tmaUqyyxAvEa+FSzGl6D5DaGxutG+ylRC0crFQ6FO8A3OKdaMwoKsTL06Jcu8r
 D28g==
X-Gm-Message-State: AJIora/OliMrZkXrJvDjlsfk/q+1y0ePNMigjGc9j+G4AUddOsKEiZxY
 hNtIs8j8ajxSC5opdcsqf9e2QqqG2/c=
X-Google-Smtp-Source: AGRyM1tk1dP28Jx+ub9ThUkXPpzK/JFf2Gc8y///KVAKe34y9EWg7o8/EVyASZEMcRbSu3s4IvgTnQ==
X-Received: by 2002:adf:f2c9:0:b0:219:f719:21d0 with SMTP id
 d9-20020adff2c9000000b00219f71921d0mr1425951wrp.115.1655150938968; 
 Mon, 13 Jun 2022 13:08:58 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 v6-20020adfedc6000000b0020ff7246934sm9533864wro.95.2022.06.13.13.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 13:08:58 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 Jun 2022 22:06:20 +0200
Message-Id: <20220613200620.292365-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libmodsecurity: needs dynamic
 library with libcurl and mbedtls
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
Cc: Frank Vanbever <frank.vanbever@essensium.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libmodsecurity embeds several mbedtls source files since version 3.0.0
and
https://github.com/SpiderLabs/ModSecurity/commit/a3ae686f2555bdacbfc9e1889ad05065711a165d
resulting in the following static build failure if curl is built with
mbedtls support:

/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/m68k-buildroot-uclinux-uclibc/bin/ld.real: /home/buildroot/autobuild/instance-0/output-1/host/bin/../m68k-buildroot-uclinux-uclibc/sysroot/usr/lib/libmbedcrypto.a(md5.c.o): in function `mbedtls_md5_free':
md5.c:(.text+0x16): multiple definition of `mbedtls_md5_free'; ../../src/.libs/libmodsecurity.a(libmbedtls_la-md5.o):md5.c:(.text+0x16): first defined here

Fixes:
 - http://autobuild.buildroot.org/results/98472a3a41cdbcb3d02289a437074a267f4b2e8e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmodsecurity/Config.in    | 5 +++++
 package/nginx-modsecurity/Config.in | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/package/libmodsecurity/Config.in b/package/libmodsecurity/Config.in
index 87f7a9c103..f65ab3de93 100644
--- a/package/libmodsecurity/Config.in
+++ b/package/libmodsecurity/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_LIBMODSECURITY
 	bool "libmodsecurity"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# libmodsecurity embeds several mbedtls source files
+	depends on !(BR2_STATIC_LIBS && BR2_PACKAGE_LIBCURL_MBEDTLS)
 	select BR2_PACKAGE_PCRE
 	help
 	  Libmodsecurity is one component of the ModSecurity
@@ -17,3 +19,6 @@ config BR2_PACKAGE_LIBMODSECURITY
 
 comment "libmodsecurity needs a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "libmodsecurity needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS && BR2_PACKAGE_LIBCURL_MBEDTLS
diff --git a/package/nginx-modsecurity/Config.in b/package/nginx-modsecurity/Config.in
index b1fcbadd7a..5cbe57a866 100644
--- a/package/nginx-modsecurity/Config.in
+++ b/package/nginx-modsecurity/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_NGINX_MODSECURITY
 	depends on BR2_PACKAGE_NGINX_HTTP
 	depends on BR2_INSTALL_LIBSTDCPP # libmodsecurity
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libmodsecurity
+	depends on !(BR2_STATIC_LIBS && BR2_PACKAGE_LIBCURL_MBEDTLS) # libmodsecurity
 	select BR2_PACKAGE_LIBMODSECURITY
 	help
 	  The ModSecurity-nginx connector is the connection
@@ -14,3 +15,7 @@ config BR2_PACKAGE_NGINX_MODSECURITY
 comment "nginx-modsecurity needs a toolchain w/ C++, threads"
 	depends on BR2_PACKAGE_NGINX_HTTP
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "nginx-modsecurity needs a toolchain w/ dynamic library"
+	depends on BR2_PACKAGE_NGINX_HTTP
+	depends on BR2_STATIC_LIBS && BR2_PACKAGE_LIBCURL_MBEDTLS
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
