Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9827AC36010
	for <buildroot@archiver.kernel.org>; Mon,  7 Apr 2025 10:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BD2340685;
	Mon,  7 Apr 2025 10:04:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y9nC-77f5adr; Mon,  7 Apr 2025 10:04:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A47C40670
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A47C40670;
	Mon,  7 Apr 2025 10:04:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FBBB1DE
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 10:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11B554067C
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 10:04:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wxrANAa2KwpF for <buildroot@buildroot.org>;
 Mon,  7 Apr 2025 10:04:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.43;
 helo=mail-wm1-f43.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ECC6F40670
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECC6F40670
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ECC6F40670
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 10:04:52 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so46519125e9.3
 for <buildroot@buildroot.org>; Mon, 07 Apr 2025 03:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744020290; x=1744625090;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yoDiOGJ80UeMjf9OEXq5DruaZb1Pg2nBW4he+b4WJ/c=;
 b=p5ghJcQJZYZ7jWMqA6xts9IEz2Lq6YAXZZfDctkH/lyYi2G6lvSAYgkiBJ2W+0tAVG
 JejDb6iEUYq0eYMxSaLSwl7EbFY7vgW++YKkizV44614iV3Hzl8Owx6YTUO4V0g1paqq
 wsmwsO7zGIM4nAJalKJJw7hQZ5GRZkYmZySl9jSKOUK6aGDj4djz+KgTRxhB2ZxpGcyL
 7tU7Z5D3nATJr4XIpHzW1+c/HSSgZglYBSjZ6LDpqF/9E8mWsiq/BCIXpmzHu9LUVsTj
 kKXyXKXyYa2GaFZh1YZu9IpN1LRXDlxk993r1n9EAu+jrOvQcRpv4BzaoaPYi2gh6+pe
 kGgg==
X-Gm-Message-State: AOJu0Yy1iym063l7BlbkCLk/ok0F/XqACSreECbqoSzkvziCCwFOX7b5
 c9WaDazgooZgE94DRvZTqXgEOeUEUt3TxztT5imqQF3RpsQgriVvq0ILAVSJ
X-Gm-Gg: ASbGncuLj7P2Q91c/RUtX+F11+c/apwLw4In37bCLoluS69ehvI+XRUP5ZAD0vJtptF
 hFH19pLM4iJy7KuoqXN4kmHZOo2Uj6EehbpLzyk6XWbbOcMz8md3snh3EmxqXlcVoYT0cxd2Obo
 yPtfYMjTd9XM7XwJc4/+98PKKENupLei2TY06lIdaIY357bl5gHIIuJHKdSI4Oc7Pmg1WxEuz0j
 n33WPr4wMs0A/r91KclSPl7vic1mKrLtnp9ak1alTZzpbLuGWPxrWngCExjhZ9/RBjG/ioh1zvS
 QPmJK1dBWtP0K7USAFTfQBIESeBOxvfYc03gQ0JXb3mBSAfvzLEBKUX2BupZTKdEikE24pNlxVz
 ae+UmSn+q9flfYQzjFqV84A==
X-Google-Smtp-Source: AGHT+IFOUK1Js19plRGPuxQLwj4IcCu7THWyItVHxYD36deUYQXTkUtrm2pFwL2p6n0FGkV2vhkyIw==
X-Received: by 2002:a05:600c:34c2:b0:43c:fdbe:43be with SMTP id
 5b1f17b1804b1-43ed0da05c8mr95479735e9.27.1744020289703; 
 Mon, 07 Apr 2025 03:04:49 -0700 (PDT)
Received: from thomas-Precision-7670.barco.com (d528f5fde.static.telenet.be.
 [82.143.95.222]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec1692ba4sm126578885e9.16.2025.04.07.03.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 03:04:49 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas@devoogdt.com>
Date: Mon,  7 Apr 2025 12:04:46 +0200
Message-ID: <20250407100446.400994-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/webkitgtk: bump to 2.48.1
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

This bumps webkit to the 2.48 stable series.

News:
- https://webkitgtk.org/2025/03/14/webkitgtk2.48.0-released.html
- https://webkitgtk.org/2025/04/02/webkitgtk2.48.1-released.html

And brings some security fixes:
- https://webkitgtk.org/security/WSA-2025-0002.html

Also,

- Raise the minimal GCC requirement [1],
which should have been raised by the 2.46.4 bump.

- Handle SPEECH_SYNTHESIS, which has been enabled
by default in commit [2].

[1] https://github.com/WebKit/WebKit/commit/682ac4ba74c53d0cd488c7a595096224a9abb036
[2] https://github.com/WebKit/WebKit/commit/10381a8de938024f31935184af470ccbce0b22d9

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/webkitgtk/Config.in      | 6 +++---
 package/webkitgtk/webkitgtk.hash | 6 +++---
 package/webkitgtk/webkitgtk.mk   | 9 ++++++++-
 3 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 3594299314..bcb4b12fa3 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -16,12 +16,12 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 
-comment "webkitgtk needs libgtk3 and a toolchain w/ C++, wchar, NPTL, dynamic library, gcc >= 10, host gcc >= 4.9"
+comment "webkitgtk needs libgtk3 and a toolchain w/ C++, wchar, NPTL, dynamic library, gcc >= 11, host gcc >= 4.9"
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_PACKAGE_LIBGTK3 || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_11 || \
 		!BR2_HOST_GCC_AT_LEAST_4_9
 	depends on BR2_USE_MMU
 
@@ -33,7 +33,7 @@ config BR2_PACKAGE_WEBKITGTK
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu, host-ruby
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	depends on BR2_USE_WCHAR # icu, libsoup3
 	depends on BR2_PACKAGE_LIBGTK3
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 96100d4c7c..fd9420bad9 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,6 +1,6 @@
-# From https://www.webkitgtk.org/releases/webkitgtk-2.46.4.tar.xz.sums
-sha1  10d4dbd222acec30b1d20ee3b7d02c0d9727c5a9  webkitgtk-2.46.4.tar.xz
-sha256  0eff5f0ab0a2872ec87df62bc32e3289c8af625716ac71e94b298d74e0374176  webkitgtk-2.46.4.tar.xz
+# From https://www.webkitgtk.org/releases/webkitgtk-2.48.1.tar.xz.sums
+sha1  f7939f920f92f6b1395b8573f069d3fb9c085b3f  webkitgtk-2.48.1.tar.xz
+sha256  98efdf21c4cdca0fe0b73ab5a8cb52093b5aa52d9b1b016a93f71dbfa1eb258f  webkitgtk-2.48.1.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index ec63d093b7..2c22bfb607 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.46.4
+WEBKITGTK_VERSION = 2.48.1
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
@@ -73,6 +73,13 @@ else
 WEBKITGTK_CONF_OPTS += -DENABLE_MINIBROWSER=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_FLITE),y)
+WEBKITGTK_CONF_OPTS += -DENABLE_SPEECH_SYNTHESIS=ON
+WEBKITGTK_DEPENDENCIES += flite
+else
+WEBKITGTK_CONF_OPTS += -DENABLE_SPEECH_SYNTHESIS=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LCMS2),y)
 WEBKITGTK_CONF_OPTS += -DUSE_LCMS=ON
 WEBKITGTK_DEPENDENCIES += lcms2
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
