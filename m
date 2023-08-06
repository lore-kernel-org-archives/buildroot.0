Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B08C001B0
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 21:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0460D60FA8;
	Sun,  6 Aug 2023 21:52:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0460D60FA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 10Q2yrd0SE0W; Sun,  6 Aug 2023 21:52:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EC7060F67;
	Sun,  6 Aug 2023 21:52:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EC7060F67
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 222A21BF909
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93C2140082
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:51:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93C2140082
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O9-R0XuENOSc for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 21:51:33 +0000 (UTC)
Received: from smtpcmd14173.aruba.it (smtpcmd14173.aruba.it [62.149.156.173])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8A27940248
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 21:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A27940248
Received: from localhost.localdomain ([217.14.215.226])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Slepq85luXI7ySlerqHa7i; Sun, 06 Aug 2023 23:51:30 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  6 Aug 2023 23:51:27 +0200
Message-Id: <20230806215127.283714-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230806215127.283714-1-giulio.benetti@benettiengineering.com>
References: <20230806215127.283714-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJsIsCYMiMPolv2m5sg3VBky2g3TMhKJMawSYAUH3nj8RDIOnxjkMapbs3TM0CpTFjB931w9if96i9DqxgUElMVLSd5Yo5GsLiL8zcnLZFdCQVvvq+dV
 4z+lGe6qfif2j+CjuvTeTs7kiMTcyclhXSSB/1FxR+sZGHDW3cV77u+MNG+PZxPAIapko+YsAE6KcYkButbejtqBfwKK4P/3wT3H6uVTUKGSEATCKC59FCzT
 Fs7CxyP6NOZTjY+mikOvDUrSdT3ZcYWGuKK0k7gYs5YrjljJI4ufQF5YubJZgejbHTFIrQBDnNxDKkeVRpJ1c2kN8SAGE6TbqZXoTG58W0GIQOiSXuwZBlqC
 6mZdgPMXsIwf3VgQ9TytWNBM0q2FnunnFMcHkYK2LkScygo+NEGHnoyIq1suKLJ47C7lLN/2l3f/dEZ6isyIov0vl/dckg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1691358690; bh=mhMaH2VpfE9QFLqydliXXqJMguULEyKW/O3MRHCmo58=;
 h=From:To:Subject:Date:MIME-Version;
 b=jQh90ZjuCPa0pbxmll4v28jLoRh+VpsFTB8ms7jv/7ih8q/hWbqvR3Lbkx6YyQNj+
 Ml5J2FrzsnZxntpAFPK8QKpWbO9dqhJ+QoLWxv9hi9VuGu7SbAw/oGN3nREkHBoG9O
 4gXuf81QZNGQQ+a991wGpxjOx7YrN76CBotv3w7+KqFKBQBUAKQIgxRKeSyqIrWE1X
 wiez78+4LregJvK6rh8m/j/XcRTaCLPBiKXuewBMwRoMMLB8CXBzbEe8nE+ygLb0UW
 Uws79+nhTE/OAi1LPO4A1gW7Kvq1gGaI2ZfPSGx6P2YuO2+uGVJ45JPpa+1EEOvLSW
 qvLXXdeqBcMHg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=jQh90Zju
Subject: [Buildroot] [PATCH 2/2] package/libheif: let's use
 BR2_TOOLCHAIN_HAS_BINUTILS_BUG_30730
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Let's use binutils bug define instead of architecture checking in packages.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/kodi-imagedecoder-heif/Config.in | 4 ++--
 package/libheif/Config.in                | 4 +---
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/kodi-imagedecoder-heif/Config.in b/package/kodi-imagedecoder-heif/Config.in
index 7cf2d1ef6e..d0950385a0 100644
--- a/package/kodi-imagedecoder-heif/Config.in
+++ b/package/kodi-imagedecoder-heif/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_KODI_IMAGEDECODER_HEIF
 	bool "kodi-imagedecoder-heif"
 	depends on BR2_INSTALL_LIBSTDCPP # libde265, libheif, tinyxml2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libde265
-	depends on !BR2_m68k_cf # libheif
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_30730 # libheif
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # libheif
 	select BR2_PACKAGE_LIBDE265
 	select BR2_PACKAGE_LIBHEIF
@@ -13,6 +13,6 @@ config BR2_PACKAGE_KODI_IMAGEDECODER_HEIF
 	  https://github.com/xbmc/imagedecoder.heif
 
 comment "kodi-imagedecoder-heif needs a toolchain w/ C++, threads, gcc >= 4.8"
-	depends on !BR2_m68k_cf # libheif
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_30730 # libheif
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/libheif/Config.in b/package/libheif/Config.in
index d0ea72430e..1310205c41 100644
--- a/package/libheif/Config.in
+++ b/package/libheif/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_LIBHEIF
 	bool "libheif"
-	# avoid build error
-	# Internal error in emit_expr_encoded at dw2gencfi.c:215
-	depends on !BR2_m68k_cf
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_30730
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	help
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
