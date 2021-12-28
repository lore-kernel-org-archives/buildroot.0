Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C85AC433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 14:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4871605DB;
	Tue, 28 Dec 2021 14:30:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B9ByA_u5eA7C; Tue, 28 Dec 2021 14:30:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E343F60760;
	Tue, 28 Dec 2021 14:30:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D51691BF46A
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 14:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D130E81D67
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 14:30:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZEu8lQngjr8R for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 14:30:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A7CA08174F
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 14:30:04 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id r17so38749930wrc.3
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 06:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hriZ0fvtfb+Qu9K0O5KZd++wrDise0a74TvCfKJ181w=;
 b=X7lkY0XWGjoxH6Ym25841lhRZAEE5Ma2wB7/x+m729+XzDTsaez0V1ERYkeYgPfQv9
 9NwllaY1xa2w7ZBho2zbEgu7VgNuBdL43/vh32NEIVD9BSZmLUGYa2mIK2tPGeh6oNR7
 ky2RAniCcdqh/Sy8og0p7+pWN3aKfDgbjztbk7ekbNh4i9uwsgfmf5O0Wxny9tCcimH9
 QP5ovXYtFF6rEtQ9zAqCV3dM1BpYiXZie4LLISfU2h+vx1e2XbH0FN0oun0BKZk5ZT1o
 BBohBOvvaX68UGZwu7JZf80Mq9FFShnoTybqnyF5hHyqR+FxNzYBGnVZxa5SJos0/TP9
 ckMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hriZ0fvtfb+Qu9K0O5KZd++wrDise0a74TvCfKJ181w=;
 b=2ILpyn9OicgAFXCRnDl1q3cI5GUmpxlHpEpp5PM40PgnWcMtX+2UiwKmyx2TepoqmM
 QwSZDy/JOVjRKx28D990PTkFGQ/GVtsTgvXN3kYydA+T8bergx38S6VOuFmFoewPvOs9
 dzS9O8q4xqL+mD6cNpHeOWtab5n6Odm9Yzj4pNIkALQhgL+KrPngYgR4tHjr9ImIZ+PY
 sSyEM7YHR06q9tPZ4Lap2qhwnMKqRuwdJ824Ac1/O+7KxqHUXXlfBPQTS9CN4HGjqwIs
 6so88pyd+JEMS0bYlkNh2RfjUol6D16cblNVpOOMYJ3+Nr+KJJXGs3s9nCSubVgig3a5
 Gang==
X-Gm-Message-State: AOAM530CSsudZw5o6EQtkYd+1fMi0jzSj9+AnU1lhRY0RgLAh5HsszNo
 cKsrUkuQzsErJB0NjT/XfqW1Wemna1UnyA==
X-Google-Smtp-Source: ABdhPJz9tj42B1rfQiR0gOkgNIBHbpR4Zgthgtv/35a5pdL/zpU6cFAzmo39dXMU1qbfE3Rm/vxjNA==
X-Received: by 2002:a5d:4e92:: with SMTP id e18mr17054019wru.89.1640701802645; 
 Tue, 28 Dec 2021 06:30:02 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id d62sm21710891wmd.3.2021.12.28.06.30.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 06:30:02 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 15:28:24 +0100
Message-Id: <20211228142824.4046660-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libsigc: needs C++17
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
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Knight <james.knight@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

C++17 is mandatory since bump to version 3.0.7 in commit
d676c0e494ff75f00402f8bbd4afa90d27cea89b and
https://github.com/libsigcplusplus/libsigcplusplus/commit/617276cf47db463159263c359f7db09fcb6aaa9e

Fixes:
 - http://autobuild.buildroot.org/results/6753fc9dce030a7d8be9afd202a5e27bc09a0041

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/atkmm/Config.in                    | 6 +++---
 package/cairomm/Config.in                  | 6 +++---
 package/glibmm/Config.in                   | 6 +++---
 package/gstreamer1/gstreamer1-mm/Config.in | 6 +++---
 package/gtkmm3/Config.in                   | 6 +++---
 package/libsigc/Config.in                  | 6 +++---
 package/libsigrok/Config.in                | 6 +++---
 package/libxmlpp/Config.in                 | 6 +++---
 package/pangomm/Config.in                  | 6 +++---
 package/pulseview/Config.in                | 6 +++---
 10 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/package/atkmm/Config.in b/package/atkmm/Config.in
index ce1e24d4ee..aa58f8d593 100644
--- a/package/atkmm/Config.in
+++ b/package/atkmm/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_ATKMM
 	bool "atkmm"
 	depends on BR2_INSTALL_LIBSTDCPP # glibmm
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libsigc
 	depends on BR2_TOOLCHAIN_HAS_THREADS # atk/glibmm -> libglib2
 	depends on BR2_USE_MMU # atk/glibmm -> libglib2
 	depends on BR2_USE_WCHAR # atk/glibmm -> libglib2
@@ -14,7 +14,7 @@ config BR2_PACKAGE_ATKMM
 
 	  http://www.gtkmm.org/
 
-comment "atkmm needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+comment "atkmm needs a toolchain w/ C++, wchar, threads, gcc >= 7"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_USE_WCHAR \
 		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/cairomm/Config.in b/package/cairomm/Config.in
index 840549b47c..dae52f01f7 100644
--- a/package/cairomm/Config.in
+++ b/package/cairomm/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_CAIROMM
 	bool "cairomm"
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libsigc
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_USE_MMU # libglib2
@@ -13,7 +13,7 @@ config BR2_PACKAGE_CAIROMM
 
 	  http://www.gtkmm.org/
 
-comment "cairomm needs a toolchain w/ C++, wchar, threads, gcc >= 4.8"
+comment "cairomm needs a toolchain w/ C++, wchar, threads, gcc >= 7"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_USE_WCHAR \
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_USE_WCHAR \
 		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/glibmm/Config.in b/package/glibmm/Config.in
index c7b4082e0e..2dfc861817 100644
--- a/package/glibmm/Config.in
+++ b/package/glibmm/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_GLIBMM
 	bool "glibmm"
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # regex_replace
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libsigc
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
@@ -12,7 +12,7 @@ config BR2_PACKAGE_GLIBMM
 
 	  http://www.gtkmm.org/
 
-comment "glibmm needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+comment "glibmm needs a toolchain w/ C++, wchar, threads, gcc >= 7"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_USE_WCHAR \
 		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gstreamer1/gstreamer1-mm/Config.in b/package/gstreamer1/gstreamer1-mm/Config.in
index 471c083ce7..3225e394f4 100644
--- a/package/gstreamer1/gstreamer1-mm/Config.in
+++ b/package/gstreamer1/gstreamer1-mm/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_GSTREAMER1_MM
 	bool "gstreamer1-mm"
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # glibmm
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # glibmm -> libsigc
 	depends on BR2_INSTALL_LIBSTDCPP # glibmm
 	depends on BR2_USE_WCHAR # glibmm -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
@@ -23,7 +23,7 @@ config BR2_PACKAGE_GSTREAMER1_MM
 
 	  https://gstreamer.freedesktop.org/bindings/cplusplus.html
 
-comment "gstreamer1-mm needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+comment "gstreamer1-mm needs a toolchain w/ C++, wchar, threads, gcc >= 7"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_USE_WCHAR \
 		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gtkmm3/Config.in b/package/gtkmm3/Config.in
index 8762c7208d..3c1c6f36e8 100644
--- a/package/gtkmm3/Config.in
+++ b/package/gtkmm3/Config.in
@@ -1,7 +1,7 @@
-comment "gtkmm3 needs libgtk3 and a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+comment "gtkmm3 needs libgtk3 and a toolchain w/ C++, wchar, threads, gcc >= 7"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_USE_WCHAR \
 		|| !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_LIBGTK3 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS
 
@@ -14,7 +14,7 @@ config BR2_PACKAGE_GTKMM3
 	depends on !BR2_nios2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pangomm, libgtk3 -> pango -> harfbuzz
 	depends on BR2_INSTALL_LIBSTDCPP # glibmm, libpangomm -> glibmm/pango
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libsigc
 	depends on BR2_TOOLCHAIN_HAS_THREADS # *mm/libgtk3 -> libglib2
 	depends on BR2_USE_MMU # *mm/libgtk3 -> libglib2
 	depends on BR2_USE_WCHAR # *mm/libgtk3 -> libglib2
diff --git a/package/libsigc/Config.in b/package/libsigc/Config.in
index e5157e87b4..428774a3ab 100644
--- a/package/libsigc/Config.in
+++ b/package/libsigc/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBSIGC
 	bool "libsigc++"
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  libsigc++ implements a typesafe callback system for standard
@@ -10,5 +10,5 @@ config BR2_PACKAGE_LIBSIGC
 
 	  https://libsigcplusplus.github.io/libsigcplusplus/
 
-comment "libsigc++ needs a toolchain w/ C++, gcc >= 4.8"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+comment "libsigc++ needs a toolchain w/ C++, gcc >= 7"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_7
diff --git a/package/libsigrok/Config.in b/package/libsigrok/Config.in
index 69531e621c..151c432295 100644
--- a/package/libsigrok/Config.in
+++ b/package/libsigrok/Config.in
@@ -25,16 +25,16 @@ if BR2_PACKAGE_LIBSIGROK
 config BR2_PACKAGE_LIBSIGROKCXX
 	bool "build C++ bindings"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # glibmm
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # glibmm -> libsigc
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-doxygen
 	select BR2_PACKAGE_GLIBMM
 	select BR2_PACKAGE_HOST_DOXYGEN
 	help
 	  Build libsigrok C++ bindings as well.
 
-comment "C++ bindings need a toolchain w/ C++, gcc >= 4.9, host gcc >= 4.9"
+comment "C++ bindings need a toolchain w/ C++, gcc >= 7, host gcc >= 4.9"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
 		!BR2_HOST_GCC_AT_LEAST_4_9
 
 endif
diff --git a/package/libxmlpp/Config.in b/package/libxmlpp/Config.in
index 3249a84398..0b48e1082d 100644
--- a/package/libxmlpp/Config.in
+++ b/package/libxmlpp/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBXMLPP
 	bool "libxml++"
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # glibmm -> libsigc
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # glibmm -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glibmm -> libglib2
@@ -12,7 +12,7 @@ config BR2_PACKAGE_LIBXMLPP
 
 	  https://libxmlplusplus.github.io/libxmlplusplus/
 
-comment "libxml++ needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
+comment "libxml++ needs a toolchain w/ C++, wchar, threads, gcc >= 7"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_USE_WCHAR \
 		||!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU
diff --git a/package/pangomm/Config.in b/package/pangomm/Config.in
index 0702b8c5bf..c23ac4aaa8 100644
--- a/package/pangomm/Config.in
+++ b/package/pangomm/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_PANGOMM
 	bool "pangomm"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	depends on BR2_INSTALL_LIBSTDCPP # glibmm/pango
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libsigc
 	depends on BR2_TOOLCHAIN_HAS_THREADS # *mm/pango -> libglib2
 	depends on BR2_USE_MMU # *mm/pango -> libglib2
 	depends on BR2_USE_WCHAR # *mm/pango -> libglib2
@@ -15,8 +15,8 @@ config BR2_PACKAGE_PANGOMM
 
 	  http://www.gtkmm.org/
 
-comment "pangomm needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+comment "pangomm needs a toolchain w/ C++, wchar, threads, gcc >= 7"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_USE_WCHAR \
 		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/pulseview/Config.in b/package/pulseview/Config.in
index e7a73e3765..f122551b9f 100644
--- a/package/pulseview/Config.in
+++ b/package/pulseview/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_PULSEVIEW
 	# libsigrok->libzip
 	depends on !BR2_STATIC_LIBS
 	# libsigrok
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	depends on BR2_HOST_GCC_AT_LEAST_4_9
 	depends on BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBSIGROK
@@ -30,11 +30,11 @@ config BR2_PACKAGE_PULSEVIEW
 
 	  http://sigrok.org/wiki/PulseView
 
-comment "pulseview needs a toolchain w/ locale, wchar, threads, dynamic library, C++, gcc >= 4.9, host gcc >= 4.9"
+comment "pulseview needs a toolchain w/ locale, wchar, threads, dynamic library, C++, gcc >= 7, host gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_QT5
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_USE_WCHAR \
 		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP \
 		|| BR2_STATIC_LIBS || !BR2_ENABLE_LOCALE || \
 		!BR2_HOST_GCC_AT_LEAST_4_9
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
