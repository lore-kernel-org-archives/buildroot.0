Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E18C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 13:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4278540155;
	Thu, 30 Dec 2021 13:56:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kJz-w-o8Tr8f; Thu, 30 Dec 2021 13:56:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 978B04013D;
	Thu, 30 Dec 2021 13:56:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DBB8E1BF408
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 13:56:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D908D40641
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 13:56:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zABKduhjV3Wr for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 13:56:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE43E405AE
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 13:56:39 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id t26so50593437wrb.4
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 05:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Su71JalmvWJuFZmz5dpZ35sto7PU56QtAae/vfhp7g8=;
 b=WDPUb2mD+pk2haQOBJZM3w8m6ZTILlX6GXquIr1XlkRYFHbGzWihcykuS6HxCYn3pq
 O4R2rQXxABMlebaSI4gwByYOSA/yhp3dbNW1pQSxqrEx4iOQzXlCoxS3asJ7IHSHdor7
 l7NAC4TwHjYzdvOaeZgU1u2Ib/GNQQ5JqD5R1gLJxAdal0whDU/rHE106c90pzceP9/K
 uEV/ZZ5SepCfjPCAVQfJm1XmVvk4mbML8tHpTdEXeS+1AgvksYisHBGBztc95tbTSv4x
 iBywQHvOSZOX7Sq4DI+00VDveBXUP1ofL4qB2grmKMEjja9UFGtPKWn1RBRVPSnNclCV
 Qmcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Su71JalmvWJuFZmz5dpZ35sto7PU56QtAae/vfhp7g8=;
 b=n2iQc+gDdF8KkNHOarWH0RaAKs5rJ8qQHon54oZBQSzpSgVKIc08EUMnVrQlFv2M3/
 PAu0D+jzFWEsPrDZL7KUXSYA2xItHG1Yhk5L9R1PfB8RlAYuDWb28pyIf9aEA2u+tvwf
 2VKQZc4HwfcdkiWo/tTiF5s38Dz1PQj6miijxi94ufZswGT0rEo5VMmPu2lu5OmKKnf3
 KFTN8yz8WQwV2dovfH6kpukOLy+dxLtFdsUrhoSrlLdG00ylxxBOBvhqydhpriW4OJXW
 YDN7ORrqtqoafVKFgXL4O4h/IUTR6B9FXw9OD+K/rZ50SmpedRqp3bJe1oLLvVZZg2lK
 KyOg==
X-Gm-Message-State: AOAM531+IhSEQapy/h0DS0tJ4pWXRWpV9v4g8tWTx2npItDPRZY181Pt
 GabW4YUSUPDIfsO+hiZVDDXjYjnfPk0=
X-Google-Smtp-Source: ABdhPJwNNNLgMwO6xuFO7nNVnwsowQId7OoOslmU6Dnb/97y311kuMHdHSLWVGDePr4XLdFQlpxuBQ==
X-Received: by 2002:a05:6000:104c:: with SMTP id
 c12mr24424687wrx.419.1640872597887; 
 Thu, 30 Dec 2021 05:56:37 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id l7sm24353765wms.1.2021.12.30.05.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 05:56:37 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 14:56:16 +0100
Message-Id: <20211230135621.2255847-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211230135621.2255847-1-romain.naour@gmail.com>
References: <20211230135621.2255847-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/7] package/supertuxkart: bump to version 1.3
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to github to download the release archive.

Add sdl2 dependency added by [1].

Remove FriBidi dependency replaced by SheenBidi library (bundled) for
better unicode support [2] [3].

Remove libglew removed by [4].

Replace MbedTLS instead of Nettle [5].

[1] https://github.com/supertuxkart/stk-code/commit/00cb6c2d480d99785f52e0352bc3a21a803a467d
[2] https://github.com/supertuxkart/stk-code/commit/13db1b83c1e7160276c87b1faa8b573bb390cce3
[3] https://github.com/supertuxkart/stk-code/commit/dc0a5a9c661a676941d202500713a7d736071838
[4] https://github.com/supertuxkart/stk-code/commit/3f0eb215f73e4edf8a91309e6de6db926f8dfa54
[5] https://github.com/supertuxkart/stk-code/commit/d753393f4dcec79f2bd5a60a853247b9d854e240

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/supertuxkart/Config.in         |  5 ++---
 package/supertuxkart/supertuxkart.hash |  7 +------
 package/supertuxkart/supertuxkart.mk   | 16 ++++++++--------
 3 files changed, 11 insertions(+), 17 deletions(-)

diff --git a/package/supertuxkart/Config.in b/package/supertuxkart/Config.in
index a18b9c1a0a..8e8eafb51c 100644
--- a/package/supertuxkart/Config.in
+++ b/package/supertuxkart/Config.in
@@ -15,14 +15,13 @@ config BR2_PACKAGE_SUPERTUXKART
 	select BR2_PACKAGE_HARFBUZZ
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBCURL
-	select BR2_PACKAGE_LIBFRIBIDI
-	select BR2_PACKAGE_LIBGLEW
 	select BR2_PACKAGE_LIBOGG
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_LIBSQUISH
 	select BR2_PACKAGE_LIBVORBIS
-	select BR2_PACKAGE_NETTLE if !BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_MBEDTLS if !BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENAL
+	select BR2_PACKAGE_SDL2
 	select BR2_PACKAGE_XLIB_LIBXRANDR
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID if BR2_PACKAGE_BLUEZ5_UTILS # runtime
diff --git a/package/supertuxkart/supertuxkart.hash b/package/supertuxkart/supertuxkart.hash
index 9654ad24a2..306634d28e 100644
--- a/package/supertuxkart/supertuxkart.hash
+++ b/package/supertuxkart/supertuxkart.hash
@@ -1,8 +1,3 @@
 # Locally computed
-sha256	e9b02b0b11ab68aacaec38306903feffe59a501224805cd3645cebf10e880ae8  supertuxkart-1.1-src.tar.xz
-# From https://sourceforge.net/projects/supertuxkart/files/SuperTuxKart/1.1/
-sha1	68be26f4b15d30dede26563cbcc6de999036c5e0  supertuxkart-1.1-src.tar.xz
-md5	731569c58428f32a0e46943fad7ba1e3  supertuxkart-1.1-src.tar.xz
-
-# Locally computed
+sha256	eeabeb0d9801688a218f6f0a76ea3546a46a322ccaca9a258148ecacfe083ffd  SuperTuxKart-1.3-src.tar.xz
 sha256	d27207a5213f746aac53893e9ecc18456e9595d3ffa662bd1ec9eb10787c214a  COPYING
diff --git a/package/supertuxkart/supertuxkart.mk b/package/supertuxkart/supertuxkart.mk
index 97cd2a40b8..8ec366f792 100644
--- a/package/supertuxkart/supertuxkart.mk
+++ b/package/supertuxkart/supertuxkart.mk
@@ -4,9 +4,11 @@
 #
 ################################################################################
 
-SUPERTUXKART_VERSION = 1.1
-SUPERTUXKART_SOURCE = supertuxkart-$(SUPERTUXKART_VERSION)-src.tar.xz
-SUPERTUXKART_SITE = http://downloads.sourceforge.net/project/supertuxkart/SuperTuxKart/$(SUPERTUXKART_VERSION)
+SUPERTUXKART_VERSION = 1.3
+SUPERTUXKART_SOURCE = SuperTuxKart-$(SUPERTUXKART_VERSION)-src.tar.xz
+# Do not use the github helper here, the generated tarball is *NOT*
+# the same as the one uploaded by upstream for the release.
+SUPERTUXKART_SITE = https://github.com/supertuxkart/stk-code/releases/download/$(SUPERTUXKART_VERSION)
 
 # Supertuxkart itself is GPL-3.0+, but it bundles a few libraries with different
 # licenses. Irrlicht, bullet and angelscript have Zlib license, while glew is
@@ -21,14 +23,13 @@ SUPERTUXKART_DEPENDENCIES = \
 	harfbuzz \
 	jpeg \
 	libcurl \
-	libfribidi \
 	libgl \
-	libglew \
 	libogg \
 	libpng \
 	libsquish \
 	libvorbis \
 	openal \
+	sdl2 \
 	xlib_libXrandr \
 	zlib
 
@@ -37,7 +38,6 @@ SUPERTUXKART_DEPENDENCIES = \
 # Disable In-game recorder (there is no libopenglrecorder package)
 SUPERTUXKART_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF \
 	-DBUILD_RECORDER=OFF \
-	-DUSE_SYSTEM_GLEW=ON \
 	-DUSE_SYSTEM_ENET=ON \
 	-DUSE_SYSTEM_SQUISH=ON
 
@@ -49,12 +49,12 @@ else
 SUPERTUXKART_CONF_OPTS += -DUSE_WIIUSE=OFF
 endif
 
-# Prefer openssl (the default) over nettle.
+# Prefer openssl (the default) over mbedtls
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 SUPERTUXKART_DEPENDENCIES += openssl
 SUPERTUXKART_CONF_OPTS += -DUSE_CRYPTO_OPENSSL=ON
 else
-SUPERTUXKART_DEPENDENCIES += nettle
+SUPERTUXKART_DEPENDENCIES += mbedtls
 SUPERTUXKART_CONF_OPTS += -DUSE_CRYPTO_OPENSSL=OFF
 endif
 
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
