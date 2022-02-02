Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BEA9C433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 11:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC160415E5;
	Wed,  2 Feb 2022 11:25:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gR3QADiOhC7L; Wed,  2 Feb 2022 11:25:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C83854166D;
	Wed,  2 Feb 2022 11:25:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 906261BF27C
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 11:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BE0183486
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 11:25:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C9jK5FpVOXkd for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 11:25:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 69F03817F5
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 11:25:37 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id s13so64679278ejy.3
 for <buildroot@buildroot.org>; Wed, 02 Feb 2022 03:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=2RlHWxOrZCPSWG3PM6UvopWywTqKMSPxDvR8JagFUOE=;
 b=nWmHvkWUzR1U6lS9NdgW70Ai5NHzKp6JOEb0dnJFdwiLp+ChKguAlRI+H+dCYlsDH9
 ZejuFof492F+Fqscx1eQbRP8xa+D1FkTLyMAdgI6YQNzm7Rq/njUtVsfJpfzTfgNODqp
 KsCWlt0spyA4+syVLP9KMCBg3KGt3O/ddPI+rYyOtS3VWeLIzmT+Ze4146PHJsNZqFsZ
 wUY+ItWK06yPnCNJAbx2Zc1wkFsp4zTNO+VSVnwUT5H0GwMOgpTXPrQFSFUGPTdVrgwU
 iA6AxK2mZ5c334XhpmL88O4QbYXpdbbfJE2i1KMLQHNP8LOqGnh6m861qWbJxYSIWQFs
 g6AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=2RlHWxOrZCPSWG3PM6UvopWywTqKMSPxDvR8JagFUOE=;
 b=NosmFjcV/oLQgZOrFUcD4+WsajROrN/Vr77uXQB5Eh7cuBkIrSkCu/lnQMCqKyQKez
 PNNZAUttm6dKU6TA6f0Ni6SV2b+j+0ic3rAh5APNP2NOaQSujq0aqBcg6A68ONVZ4p/q
 ZQoSYiGdQo4POgYwCGKwkbSkJzR2MaGLT4jRO7on6GF/nyj+gSdOZZvWCpxFsf5OyWAD
 Ajfb9LO2AqD38TuJVmP9XlRKICKTzNLaLJMiQLjNxpPSwyGngeycbrmiiuIner+wKpWr
 2a42afIbQwB46ejZhoA9nglm1XyYpTajaAnrv1M+q5kdECYrBs7igD8DPxG35r62WCFw
 pnCQ==
X-Gm-Message-State: AOAM530soHjTkVLU/Czw2D7PaU4CD1e27mKX1SkIP51F7DbxWmv2f8r7
 o0d7H3CwU6KfSw4KSsCUVorvaen5YbVyjQ==
X-Google-Smtp-Source: ABdhPJxcnvRGyu2aYHO/F8jsYKEN4IjbEf1soWBIZvoxKb6Utyx0URNX+hvkj1RLuYzhrtADd6qXFA==
X-Received: by 2002:a17:907:9494:: with SMTP id
 dm20mr24025737ejc.148.1643801135103; 
 Wed, 02 Feb 2022 03:25:35 -0800 (PST)
Received: from thomas-Latitude-5590.barco.com ([87.66.230.131])
 by smtp.googlemail.com with ESMTPSA id g12sm20969382edv.89.2022.02.02.03.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 03:25:34 -0800 (PST)
From: Thomas Devoogdt <thomas.devoogdt@gmail.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Wed,  2 Feb 2022 12:25:28 +0100
Message-Id: <20220202112528.7778-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.17.1
Subject: [Buildroot] [PATCH] pacakge/glib-networking: bump to version 2.70.0
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
Cc: Thomas Devoogdt <thomas.devoogdt@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Devoogdt <thomas.devoogdt@gmail.com>

PKCS#11 is required if gnutls is used:
https://gitlab.gnome.org/GNOME/glib-networking/-/commit/9b3d30e40f306f0e36e2a396d3b6df1edeea9f21

Older compilers require c_std=gnu99:
https://gitlab.gnome.org/GNOME/glib-networking/-/commit/b192086b9936602a40a14d00a6883b339b9d7955

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@gmail.com>
---
 .../0001-meson-change-std-to-gnu99.patch      | 30 +++++++++++++++++++
 package/glib-networking/Config.in             |  1 +
 package/glib-networking/glib-networking.hash  |  4 +--
 package/glib-networking/glib-networking.mk    |  2 +-
 4 files changed, 34 insertions(+), 3 deletions(-)
 create mode 100644 package/glib-networking/0001-meson-change-std-to-gnu99.patch

diff --git a/package/glib-networking/0001-meson-change-std-to-gnu99.patch b/package/glib-networking/0001-meson-change-std-to-gnu99.patch
new file mode 100644
index 0000000000..9f266bc2c8
--- /dev/null
+++ b/package/glib-networking/0001-meson-change-std-to-gnu99.patch
@@ -0,0 +1,30 @@
+From cdfa726bae1d82b7bd3735475fc2b2c6a31c1d2f Mon Sep 17 00:00:00 2001
+From: Ignacio Casal Quinteiro <qignacio@amazon.com>
+Date: Fri, 12 Nov 2021 11:51:33 +0100
+Subject: [PATCH] meson: change std to gnu99
+
+This is the same as glib and should fix issues with old
+compilers
+
+(cherry picked from commit b192086b9936602a40a14d00a6883b339b9d7955)
+Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index b018ca7b..130a2bf0 100644
+--- a/meson.build
++++ b/meson.build
+@@ -3,7 +3,7 @@ project(
+   version: '2.70.0',
+   license: 'LGPL2.1+',
+   meson_version: '>= 0.50.0',
+-  default_options: ['c_std=c99']
++  default_options: ['c_std=gnu99']
+ )
+ 
+ prefix = get_option('prefix')
+-- 
+2.17.1
+
diff --git a/package/glib-networking/Config.in b/package/glib-networking/Config.in
index 22331255f7..38cded5e6b 100644
--- a/package/glib-networking/Config.in
+++ b/package/glib-networking/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_GLIB_NETWORKING
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_P11_KIT if BR2_PACKAGE_GNUTLS
 	help
 	  Network-related GIO modules for glib.
 
diff --git a/package/glib-networking/glib-networking.hash b/package/glib-networking/glib-networking.hash
index 976a19f25e..6a53b436b0 100644
--- a/package/glib-networking/glib-networking.hash
+++ b/package/glib-networking/glib-networking.hash
@@ -1,3 +1,3 @@
-# From http://ftp.gnome.org/pub/gnome/sources/glib-networking/2.66/glib-networking-2.66.0.sha256sum
-sha256  c5d7be2437fdd196eebfb70c4517b96d3ba7ec13bd496318b8f02dea383e0099  glib-networking-2.66.0.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/glib-networking/2.70/glib-networking-2.70.0.sha256sum
+sha256  66b408e7afa86c582fe38963db56133869ab4b57d34e48ec56aba621940d6f35  glib-networking-2.70.0.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index 65630c7fed..53280700bc 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GLIB_NETWORKING_VERSION_MAJOR = 2.66
+GLIB_NETWORKING_VERSION_MAJOR = 2.70
 GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).0
 GLIB_NETWORKING_SITE = http://ftp.gnome.org/pub/gnome/sources/glib-networking/$(GLIB_NETWORKING_VERSION_MAJOR)
 GLIB_NETWORKING_SOURCE = glib-networking-$(GLIB_NETWORKING_VERSION).tar.xz
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
