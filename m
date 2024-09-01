Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A713EC54FC6
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 12:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45B4D6066B;
	Sun,  1 Sep 2024 12:11:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h27hz7jG2hcp; Sun,  1 Sep 2024 12:11:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3ABA360678
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3ABA360678;
	Sun,  1 Sep 2024 12:11:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B5CCE1BF40D
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 12:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2DFD40162
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 12:11:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Osb-2usER7zi for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 12:11:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.42;
 helo=mail-wm1-f42.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 10C1140139
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10C1140139
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 10C1140139
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 12:11:36 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-42bb72a5e0bso28842105e9.1
 for <buildroot@buildroot.org>; Sun, 01 Sep 2024 05:11:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725192694; x=1725797494;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lw9TVS5GTqcaFjmXpCH01FFaHpS/Dxv20Pc5XxQKUfI=;
 b=FJ+jw3zQI+d056jxUmQSpoAP7gULrV/GFoZhxewfOnyUx8miORd5WNyi3hnVGgrA5s
 zf4MbLU1ycGgl6yCEQRF6GJkZ88Vevg6AT1rFdboi1hwg0HF697qMBy4Pxp1dzwM47U2
 IBH71UyZhns810FKgoBpgIPEEJaat9R6i35VAuoHouFIZ1fwZWHzVbq0Vtt9rkW0OgIw
 3Zsr9osDYXzI9j598ENrVJM8LfpFNcvvdjgBNcXYYyLXi9ATDbxPbBNmpgx2GpPaQgKu
 iapH1HzK/Fjh2jaILOJotOMUKH8ga6joI5X1D+mCWq85r8ocd3urov/U0bu+ykG6BwmB
 EpzA==
X-Gm-Message-State: AOJu0Yy42UpuRqvx/tuCc6x8drfv/ZjAO54viLVhMvhiciqq0gjkjONx
 rFPwYeH9letVcM3jpoqFUbLANXx6UzLPVPo2pWoH8pck8R9jaIbczyGTsJhK
X-Google-Smtp-Source: AGHT+IHPS5ux1Nu1RY6cuoQPUU3XyKrmDO2q65T3wlIu152ohusHIrL+uJ91kPmwZywF62fEJSU3tw==
X-Received: by 2002:a05:6000:2d01:b0:374:b6f4:d8d1 with SMTP id
 ffacd0b85a97d-374b6f4df4cmr4125613f8f.13.1725192693517; 
 Sun, 01 Sep 2024 05:11:33 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:a4dd:9d4b:bf58:82c2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c29aa150sm3064510f8f.101.2024.09.01.05.11.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Sep 2024 05:11:33 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sun,  1 Sep 2024 14:11:22 +0200
Message-ID: <20240901121122.3113482-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240829131232.2132854-2-thomas@devoogdt.com>
References: <20240829131232.2132854-2-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/webkitgtk: restore libsoup support
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas@devoogdt.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The midori browser still uses libsoup and was broken since commit
38a098df133aaa2ebf09742054b02db5a44f58e5. This commit allows the
use of libsoup, libsoup3 stays the default.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
This is a bit a replacement for https://patchwork.ozlabs.org/project/buildroot/patch/20240829131232.2132854-2-thomas@devoogdt.com/.
I don't use midori or libsoup2, and it's still not maintained, so it's also fine to accept the other commit and drop midori altogether.
---
 package/webkitgtk/Config.in    | 11 ++++++-----
 package/webkitgtk/webkitgtk.mk | 12 ++++++++++--
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index a556fec194..5f9c24d610 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -33,9 +33,9 @@ config BR2_PACKAGE_WEBKITGTK
 	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu, host-ruby
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu, libsoup3
+	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu, libsoup/libsoup3
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10
-	depends on BR2_USE_WCHAR # icu, libsoup3
+	depends on BR2_USE_WCHAR # icu, libsoup/libsoup3
 	depends on BR2_PACKAGE_LIBGTK3 || BR2_PACKAGE_LIBGTK4
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	select BR2_PACKAGE_CAIRO
@@ -47,7 +47,7 @@ config BR2_PACKAGE_WEBKITGTK
 	select BR2_PACKAGE_LIBEPOXY
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBSECRET
-	select BR2_PACKAGE_LIBSOUP3
+	select BR2_PACKAGE_LIBSOUP3 if !BR2_PACKAGE_LIBSOUP
 	select BR2_PACKAGE_LIBTASN1
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBXSLT
@@ -100,9 +100,10 @@ comment "sandboxing support needs a toolchain w/ headers >= 3.12"
 
 config BR2_PACKAGE_WEBKITGTK_HTTPS
 	bool "HTTPS support"
-	depends on !BR2_STATIC_LIBS # libsoup3 -> glib-networking, gnutls
+	depends on !BR2_STATIC_LIBS # libsoup/libsoup3 -> glib-networking, gnutls
 	select BR2_PACKAGE_CA_CERTIFICATES # runtime
-	select BR2_PACKAGE_LIBSOUP3_SSL
+	select BR2_PACKAGE_LIBSOUP_SSL if BR2_PACKAGE_LIBSOUP
+	select BR2_PACKAGE_LIBSOUP3_SSL if BR2_PACKAGE_LIBSOUP3
 	help
 	  Enable HTTPS protocol support.
 
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index ff39ee01e1..af49aad96e 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -14,8 +14,8 @@ WEBKITGTK_LICENSE_FILES = \
 	Source/WebCore/LICENSE-LGPL-2.1
 WEBKITGTK_CPE_ID_VENDOR = webkitgtk
 WEBKITGTK_DEPENDENCIES = host-ruby host-python3 host-gperf host-unifdef \
-	enchant harfbuzz icu jpeg libegl libepoxy libgcrypt libsecret \
-	libsoup3 libtasn1 libxml2 libxslt sqlite webp woff2
+	enchant harfbuzz icu jpeg libegl libepoxy libgcrypt libsecret libtasn1 \
+	libxml2 libxslt sqlite webp woff2
 
 WEBKITGTK_CMAKE_BACKEND = ninja
 
@@ -31,6 +31,14 @@ WEBKITGTK_CONF_OPTS = \
 	-DUSE_LIBHYPHEN=OFF \
 	-DUSE_WOFF2=ON
 
+ifeq ($(BR2_PACKAGE_LIBSOUP),y)
+WEBKITGTK_CONF_OPTS += -DUSE_SOUP2=ON
+WEBKITGTK_DEPENDENCIES += libsoup
+else
+WEBKITGTK_CONF_OPTS += -DUSE_SOUP2=OFF
+WEBKITGTK_DEPENDENCIES += libsoup3
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGTK4),y)
 WEBKITGTK_CONF_OPTS += -DUSE_GTK4=ON
 WEBKITGTK_DEPENDENCIES += libgtk4
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
