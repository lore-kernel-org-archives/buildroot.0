Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CCB3C433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 18:35:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A132613B3
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 18:35:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7A132613B3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25F7F4030D;
	Mon,  8 Nov 2021 18:35:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FllBRkjxCsAI; Mon,  8 Nov 2021 18:35:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CDBF40309;
	Mon,  8 Nov 2021 18:35:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1A4D81BF97E
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 18:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 170E480E10
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 18:35:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QVli-aU1egm8 for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 18:35:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7EB2680DA6
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 18:35:22 +0000 (UTC)
Received: from localhost.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id k9UGmI72yueW5k9UHmLDg6; Mon, 08 Nov 2021 19:35:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636396521; bh=oL1uWkLvn30n+vOhb/c/p6YarjfMVdCp7JFsIn3qB7w=;
 h=From:To:Subject:Date:MIME-Version;
 b=Hk6rkd/P5kx15ZoGBy1we9Htpi8HPLqlLOp21mDzK7KyZiPAZxioifjdMlr8COPLj
 unWU5VSlxpNEzaaGf8K+suiIOHw0FTwaUVvMfqnSAFvpMx09xHXG/KbSsuhW2R/Jfk
 5lqCaWrd3UXvbMMyBPsdYDe7muxv79MjVYxeYTnTrnSoLKhLEHPzxPqSucQ8C41cFH
 r3TgLW+5uqPg9V+8bAuq7lVyd7k59NoINDsLA5hJE3aGv4bbhdxx9qVOJ+rsYozjxT
 jPAUPrT3DTX3ZDZTWyas9kNVw9Yks2t4hw0SquNGycNIHofXQJO9TiGPKJjy6U6Is8
 2EQe5fD1yPufg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon,  8 Nov 2021 19:35:19 +0100
Message-Id: <20211108183519.2561478-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211108183519.2561478-1-giulio.benetti@benettiengineering.com>
References: <20211106181322.302485-1-giulio.benetti@benettiengineering.com>
 <20211108183519.2561478-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfK/xnP3eMjhTIZZIaV1QoDE0mNvIViuOg3KA26gkoiQgOQ00tnmkWM8CbJJ46URWrET+N1Iq7486+RTe0iutWICfviKcxaudpgwC66sxodCGhhSBlu/4
 bLNlOXbi3kLt7zcvdEntfjFj5wNzhytIP/gT49hiPAS8pupXhui8HWpc4hSKSyNfus1Tg6T9bulqQDzO/tffepfwYjLkZr+CItLSiMUGUAMh9zkq3bVxZ18U
 h8Qlf7ULBSRKqpnvVjcvyLBLWE7a0rBL+fs3Crw3RIV6PjW87KmAj9FAwDibvVKnRAlPTiSfk8hzOOi5/rhL0LS7GwvTfIrbCsctuw8dRIFOyMDoeoNTUkZN
 teZoQw4HZjnrZMrv+wA9W6i7Zh0dQkyxKgi77F3YDOy5w7gzb7q2pQzpH5OzkvifMDvjNbNATwyErmr/tL5/7LY4VboMKUVQ+jGzt6lsv22NG69rjx6HuKGu
 ktPD50yo0uztyRPK
Subject: [Buildroot] [PATCH 1/1] package/harfbuzz: bump to version 3.1.1
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Peter Seiderer <ps.report@gmx.net>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>, Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump to version 3.1.1 by:
- requiring BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 instead of _4_8 in this
package taking care of reverse dependencies, since now harfbuzz requires
gcc 4.9 to be built successfully.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/Config.in     | 6 +++---
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 package/libass/Config.in       | 6 +++---
 package/mupdf/Config.in        | 6 +++---
 package/pango/Config.in        | 2 +-
 package/qt5/qt5base/Config.in  | 2 +-
 package/supertuxkart/Config.in | 2 +-
 8 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/package/harfbuzz/Config.in b/package/harfbuzz/Config.in
index 8bc88f4284..2e4219ee22 100644
--- a/package/harfbuzz/Config.in
+++ b/package/harfbuzz/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_HARFBUZZ
 	bool "harfbuzz"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	help
 	  HarfBuzz is an OpenType text shaping engine
 
@@ -11,7 +11,7 @@ config BR2_PACKAGE_HARFBUZZ
 	  Harfbuzz can make optional use of cairo, freetype,
 	  glib2 and icu packages if they are selected.
 
-comment "harfbuzz needs a toolchain w/ C++, gcc >= 4.8"
+comment "harfbuzz needs a toolchain w/ C++, gcc >= 4.9"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 97fc5a2c5f..ec1a9a59ea 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  036b0ee118451539783ec7864148bb4106be42a2eb964df4e83e6703ec46f3d9  harfbuzz-3.0.0.tar.xz
+sha256  f3f3247bdeabf36765acc237a5f651e651e4e9706582b9cc2cf6c9b8102dfa93  harfbuzz-3.1.1.tar.xz
 sha256  4345e1735f8bc6d812fed5180cabb5a5e88a4109d332652f2a45c13cfa5ee692  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 4534d166ef..2f9a166787 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 3.0.0
+HARFBUZZ_VERSION = 3.1.1
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
diff --git a/package/libass/Config.in b/package/libass/Config.in
index 803f6b4438..d7725d5e1b 100644
--- a/package/libass/Config.in
+++ b/package/libass/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBASS
 	bool "libass"
 	depends on BR2_INSTALL_LIBSTDCPP # harfbuzz
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # harfbuzz
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_HARFBUZZ
 	select BR2_PACKAGE_LIBFRIBIDI
@@ -12,7 +12,7 @@ config BR2_PACKAGE_LIBASS
 
 	  https://github.com/libass/libass
 
-comment "libass needs a toolchain w/ C++, gcc >= 4.8"
+comment "libass needs a toolchain w/ C++, gcc >= 4.9"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/mupdf/Config.in b/package/mupdf/Config.in
index ff176f4b99..cf97711160 100644
--- a/package/mupdf/Config.in
+++ b/package/mupdf/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_MUPDF
 	bool "mupdf"
 	depends on BR2_INSTALL_LIBSTDCPP # harfbuzz
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # harfbuzz
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_GUMBO_PARSER
@@ -18,7 +18,7 @@ config BR2_PACKAGE_MUPDF
 
 	  https://www.mupdf.com/index.html
 
-comment "mupdf needs a toolchain w/ C++, gcc >= 4.8"
+comment "mupdf needs a toolchain w/ C++, gcc >= 4.9"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/pango/Config.in b/package/pango/Config.in
index cf5170c8f3..ff529ab0dc 100644
--- a/package/pango/Config.in
+++ b/package/pango/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_PANGO
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # freetype support
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # harfbuzz
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBFRIBIDI
 	select BR2_PACKAGE_EXPAT
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index e93b2dec38..a328190a98 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -237,7 +237,7 @@ config BR2_PACKAGE_QT5BASE_HARFBUZZ
 	bool "harfbuzz support"
 	select BR2_PACKAGE_HARFBUZZ if \
 		BR2_TOOLCHAIN_HAS_SYNC_4 && \
-		BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	help
 	  This option enables HarfBuzz support (either system harfbuzz
 	  if the toolchain supports __sync for 4 bytes, or the qt
diff --git a/package/supertuxkart/Config.in b/package/supertuxkart/Config.in
index 8af006d632..a18b9c1a0a 100644
--- a/package/supertuxkart/Config.in
+++ b/package/supertuxkart/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_SUPERTUXKART
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP # openal
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # openal
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # harfbuzz, openal
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS # openal
 	depends on BR2_PACKAGE_HAS_LIBGL
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
