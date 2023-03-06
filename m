Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD291C61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Mar 2023 18:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39C9D40116;
	Mon,  6 Mar 2023 18:41:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39C9D40116
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RwHMsqsB6py1; Mon,  6 Mar 2023 18:41:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74670404F0;
	Mon,  6 Mar 2023 18:41:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74670404F0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6CE181BF34D
 for <buildroot@lists.busybox.net>; Mon,  6 Mar 2023 18:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43F5F6100C
 for <buildroot@lists.busybox.net>; Mon,  6 Mar 2023 18:41:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43F5F6100C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ex9Zuea0FOmP for <buildroot@lists.busybox.net>;
 Mon,  6 Mar 2023 18:41:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FE8860FFF
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4FE8860FFF
 for <buildroot@buildroot.org>; Mon,  6 Mar 2023 18:41:03 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.167.227.234])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id B2F615FFA7;
 Mon,  6 Mar 2023 19:40:58 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon,  6 Mar 2023 19:40:50 +0100
Message-Id: <20230306184050.7107-1-ju.o@free.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1678128060;
 bh=rSSCYguX+P5y3jZR8ryomp0FSOZZi3AqtBr0kReNuuo=;
 h=From:To:Cc:Subject:Date:From;
 b=hervKB2j6NY9g1xtoIdTmac7zOq8rUJHi8NPidY2RK1UyHPlw7LGC7TK2NmICMo4A
 wO5n8XFDoDui+QZDx6rt8A5pBQnbzjl9A9YRPQ/t9ihyU4Jrxj38klL0+zrTsOp3i+
 fSVqJXRtPZIovyv16Ern0T3HY1AXOfLXMXWCzc3HGj9NlgeFe7B0BKrqbb/4nDikOg
 dtzR86q2MPPZcXr65dbJ0auuMkj2PaSOojfrAGGG8XSz7nrVAL688tRzH1G7uQP+8Q
 T/6hd4M9+369e1tEKB0k67jQQJaisEI9TAgUTYxaR/i/YnNYddfpHnXSQfO8kVjord
 HJXxbUZXxktjw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hervKB2j
Subject: [Buildroot] [PATCH next 1/1] package/unrar: bump to version 6.2.6
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Uptream does not provide a change log.

The package now needs a C++11 compiler. For example, the source file
"blake2s.hpp" is using the "constexpr" keyword.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch next at commit b793f3a, with commands:

    make check-package
    ...
    0 warnings generated

    utils/test-pkg -a -p unrar
    ...
    45 builds, 3 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/unrar/Config.in  | 4 +++-
 package/unrar/unrar.hash | 2 +-
 package/unrar/unrar.mk   | 4 ++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/unrar/Config.in b/package/unrar/Config.in
index 29696c35aa..8a3def699b 100644
--- a/package/unrar/Config.in
+++ b/package/unrar/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_UNRAR
 	bool "unrar"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
 	help
@@ -8,6 +9,7 @@ config BR2_PACKAGE_UNRAR
 
 	  http://www.rarlab.com/rar_add.htm
 
-comment "unrar needs a toolchain w/ C++, wchar, threads"
+comment "unrar needs a toolchain w/ C++, wchar, threads, gcc >= 4.8"
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/unrar/unrar.hash b/package/unrar/unrar.hash
index 40e05a1a32..bc8f986875 100644
--- a/package/unrar/unrar.hash
+++ b/package/unrar/unrar.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  de75b6136958173fdfc530d38a0145b72342cf0d3842bf7bb120d336602d88ed  unrarsrc-6.1.7.tar.gz
+sha256  0c2d4cbc8b34d0e3bec7b474e0f52bbcc6c4320ec089b4141223ee355f63c318  unrarsrc-6.2.6.tar.gz
 sha256  6ecc1687808b7d66b24f874755abfed7464d9751ed0001cd4e8e5d9bf397ff8a  license.txt
diff --git a/package/unrar/unrar.mk b/package/unrar/unrar.mk
index fee9fb753b..f59d199558 100644
--- a/package/unrar/unrar.mk
+++ b/package/unrar/unrar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNRAR_VERSION = 6.1.7
+UNRAR_VERSION = 6.2.6
 UNRAR_SOURCE = unrarsrc-$(UNRAR_VERSION).tar.gz
 UNRAR_SITE = https://www.rarlab.com/rar
 UNRAR_LICENSE = unrar
@@ -13,7 +13,7 @@ UNRAR_CPE_ID_VENDOR = rarlab
 
 define UNRAR_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) CXX="$(TARGET_CXX)" STRIP="/bin/true" \
-		CXXFLAGS="$(TARGET_CXXFLAGS) -pthread" \
+		CXXFLAGS="$(TARGET_CXXFLAGS) -pthread -std=c++11" \
 		LDFLAGS="$(TARGET_LDFLAGS) -pthread" -C $(@D)
 endef
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
