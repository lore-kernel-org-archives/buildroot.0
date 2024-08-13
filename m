Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15CC2C52D7B
	for <buildroot@archiver.kernel.org>; Tue, 13 Aug 2024 17:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A5AD40ACE;
	Tue, 13 Aug 2024 17:31:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KSb79SQqIzFR; Tue, 13 Aug 2024 17:31:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F324640A95
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F324640A95;
	Tue, 13 Aug 2024 17:31:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EE7991BF5AD
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 17:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB5AF403D1
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 17:31:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q_hPX1rsFlgz for <buildroot@lists.busybox.net>;
 Tue, 13 Aug 2024 17:31:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1CE69403CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CE69403CA
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1CE69403CA
 for <buildroot@buildroot.org>; Tue, 13 Aug 2024 17:31:22 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id A8CF9B0055E;
 Tue, 13 Aug 2024 19:31:18 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 13 Aug 2024 19:31:13 +0200
Message-ID: <20240813173113.138454-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1723570281;
 bh=EHPCBYLA2Iyqa5WebN3w8i8VmHM5JKJYTITEDROJeo0=;
 h=From:To:Cc:Subject:Date:From;
 b=YcQCGJrgPj7EL/gAa/0zZOrX749CAWnMvaSFqBAbyvswq3BClheQ8k0BeqZSf4DEn
 AiqBJu6Cqx85yEkVe//mYL0vObWjsg6NgHiZ8XnoAZ68D+WFah98xy/z09f7J1AH8e
 9FrG94lPcGOvU7P/iR5/tewHveyAu7VxTdZgLjxsXxW3npYGdUnpOUhNTgVOY+jyue
 f0oXXo/nMhAcmNPk/s5LU92FjmFTXS8iC4HHibEv4DfMV0LXwLgJe3tI3AYsCFV4eA
 THhgUpVrv+Fa1h9uOyg+LRGbtFturha6Pnp0nQrjHPGpiDiLQclOh6tOng599vm4KL
 XZ5+2hDeOJavA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YcQCGJrg
Subject: [Buildroot] [PATCH next 1/1] package/uhd: bump to version 4.7.0.0
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
Cc: Julien Olivain <ju.o@free.fr>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log since 4.3.0.0, see:
https://github.com/EttusResearch/uhd/blob/v4.7.0.0/CHANGELOG

This commit removes the package patch 0002, which is now included in
this new version.

Also, uhd version 4.5.0.0 raised the minimal gcc version requirement
to 7.3.0. This change is reflected in the package dependencies.

Also, some UHD Kconfig sub-options (B100, B200, USB, USRP1) had
dependencies on gcc >= 4.9. Since the whole uhd package raised the
gcc dependency to gcc >= 7, those sub-options dependencies are now
useless. This commit removes those.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...h-GCC-13-add-missing-cstdint-include.patch | 117 ------------------
 package/uhd/Config.in                         |  22 +---
 package/uhd/uhd.hash                          |   2 +-
 package/uhd/uhd.mk                            |   2 +-
 4 files changed, 5 insertions(+), 138 deletions(-)
 delete mode 100644 package/uhd/0002-Fix-build-with-GCC-13-add-missing-cstdint-include.patch

diff --git a/package/uhd/0002-Fix-build-with-GCC-13-add-missing-cstdint-include.patch b/package/uhd/0002-Fix-build-with-GCC-13-add-missing-cstdint-include.patch
deleted file mode 100644
index acf720a15d..0000000000
--- a/package/uhd/0002-Fix-build-with-GCC-13-add-missing-cstdint-include.patch
+++ /dev/null
@@ -1,117 +0,0 @@
-From 3acf784e988608cbce34cd0be0a8703ba53ea515 Mon Sep 17 00:00:00 2001
-From: Sam James <sam@gentoo.org>
-Date: Tue, 3 Jan 2023 23:04:52 +0000
-Subject: [PATCH] Fix build with GCC 13 (add missing <cstdint> include)
-
-GCC 13 (as usual for new compiler releases) shuffles around some
-internal includes and so <cstdint> is no longer transitively included.
-
-Explicitly include <cstdint> for uint8_t.
-
-```
-/var/tmp/portage/net-wireless/uhd-4.3.0.0/work/uhd-4.3.0.0/host/include/uhd/rfnoc/defaults.hpp:43:14: error: 'uint32_t' does not name a type
-   43 | static const uint32_t DEFAULT_NOC_ID  = 0xFFFFFFFF;
-      |              ^~~~~~~~
-/var/tmp/portage/net-wireless/uhd-4.3.0.0/work/uhd-4.3.0.0/host/include/uhd/rfnoc/defaults.hpp:1:1: note: 'uint32_t' is defined in header '<cstdint>'; did you forget to '#include <cstdint>'?
-  +++ |+#include <cstdint>
-    1 | //
-```
-
-Signed-off-by: Sam James <sam@gentoo.org>
-
-Upstream: https://github.com/EttusResearch/uhd/commit/3acf784e988608cbce34cd0be0a8703ba53ea515
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- host/include/uhd/cal/database.hpp                      | 1 +
- host/include/uhd/rfnoc/defaults.hpp                    | 1 +
- host/include/uhd/types/eeprom.hpp                      | 1 +
- host/include/uhd/usrp/zbx_tune_map_item.hpp            | 1 +
- host/lib/usrp/dboard/magnesium/magnesium_constants.hpp | 1 +
- host/lib/usrp/dboard/rhodium/rhodium_constants.hpp     | 1 +
- host/lib/utils/serial_number.cpp                       | 1 +
- 7 files changed, 7 insertions(+)
-
-diff --git a/host/include/uhd/cal/database.hpp b/host/include/uhd/cal/database.hpp
-index b6abbb6df7..9d47febedd 100644
---- a/host/include/uhd/cal/database.hpp
-+++ b/host/include/uhd/cal/database.hpp
-@@ -8,6 +8,7 @@
- 
- #include <uhd/config.hpp>
- #include <stddef.h>
-+#include <cstdint>
- #include <string>
- #include <vector>
- #include <functional>
-diff --git a/host/include/uhd/rfnoc/defaults.hpp b/host/include/uhd/rfnoc/defaults.hpp
-index aa7778aacf..6c878a8d70 100644
---- a/host/include/uhd/rfnoc/defaults.hpp
-+++ b/host/include/uhd/rfnoc/defaults.hpp
-@@ -8,6 +8,7 @@
- 
- #pragma once
- 
-+#include <cstdint>
- #include <string>
- 
- namespace uhd { namespace rfnoc {
-diff --git a/host/include/uhd/types/eeprom.hpp b/host/include/uhd/types/eeprom.hpp
-index 3a7605d3cb..420440aa64 100644
---- a/host/include/uhd/types/eeprom.hpp
-+++ b/host/include/uhd/types/eeprom.hpp
-@@ -6,6 +6,7 @@
- 
- #pragma once
- 
-+#include <cstdint>
- #include <map>
- #include <string>
- #include <vector>
-diff --git a/host/include/uhd/usrp/zbx_tune_map_item.hpp b/host/include/uhd/usrp/zbx_tune_map_item.hpp
-index e49f49f785..ce95623de2 100644
---- a/host/include/uhd/usrp/zbx_tune_map_item.hpp
-+++ b/host/include/uhd/usrp/zbx_tune_map_item.hpp
-@@ -6,6 +6,7 @@
- 
- #pragma once
- #include <uhd/config.hpp>
-+#include <cstdint>
- #include <cstring>
- #include <string>
- #include <vector>
-diff --git a/host/lib/usrp/dboard/magnesium/magnesium_constants.hpp b/host/lib/usrp/dboard/magnesium/magnesium_constants.hpp
-index 99f2b910c6..99f5a4933f 100644
---- a/host/lib/usrp/dboard/magnesium/magnesium_constants.hpp
-+++ b/host/lib/usrp/dboard/magnesium/magnesium_constants.hpp
-@@ -9,6 +9,7 @@
- 
- #include <uhd/types/ranges.hpp>
- #include <cstddef>
-+#include <cstdint>
- #include <string>
- #include <vector>
- 
-diff --git a/host/lib/usrp/dboard/rhodium/rhodium_constants.hpp b/host/lib/usrp/dboard/rhodium/rhodium_constants.hpp
-index 591d02d305..1577e02d9e 100644
---- a/host/lib/usrp/dboard/rhodium/rhodium_constants.hpp
-+++ b/host/lib/usrp/dboard/rhodium/rhodium_constants.hpp
-@@ -9,6 +9,7 @@
- 
- #include <array>
- #include <cstddef>
-+#include <cstdint>
- #include <string>
- #include <vector>
- 
-diff --git a/host/lib/utils/serial_number.cpp b/host/lib/utils/serial_number.cpp
-index 61296a9139..c07730e24d 100644
---- a/host/lib/utils/serial_number.cpp
-+++ b/host/lib/utils/serial_number.cpp
-@@ -5,6 +5,7 @@
- //
- 
- #include <uhdlib/utils/serial_number.hpp>
-+#include <cstdint>
- #include <stdexcept>
- #include <string>
- 
diff --git a/package/uhd/Config.in b/package/uhd/Config.in
index 2ccfe3ccb8..58bf91c1df 100644
--- a/package/uhd/Config.in
+++ b/package/uhd/Config.in
@@ -1,9 +1,9 @@
-comment "uhd needs a toolchain w/ C++, NPTL, wchar, dynamic library, gcc >= 5"
+comment "uhd needs a toolchain w/ C++, NPTL, wchar, dynamic library, gcc >= 7"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
 
 comment "uhd needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
@@ -17,7 +17,7 @@ config BR2_PACKAGE_UHD
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU # use fork()
 	depends on BR2_USE_WCHAR # boost
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # boost-math
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_ATOMIC
 	select BR2_PACKAGE_BOOST_CHRONO
@@ -37,24 +37,16 @@ if BR2_PACKAGE_UHD
 
 config BR2_PACKAGE_UHD_B100
 	bool "b100 support"
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_UHD_USB
 	help
 	  enable B100 support
 
-comment "B100 support needs a toolchain w/ gcc >= 4.9"
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-
 config BR2_PACKAGE_UHD_B200
 	bool "b200 support"
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_UHD_USB
 	help
 	  enable B200 support
 
-comment "B200 support needs a toolchain w/ gcc >= 4.9"
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-
 config BR2_PACKAGE_UHD_E300
 	bool "E300 support"
 	select BR2_PACKAGE_UHD_MPMD
@@ -115,24 +107,16 @@ config BR2_PACKAGE_UHD_PYTHON
 
 config BR2_PACKAGE_UHD_USB
 	bool "USB support"
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
 	help
 	  enable UHD USB support
 
-comment "USB support needs a toolchain w/ gcc >= 4.9"
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-
 config BR2_PACKAGE_UHD_USRP1
 	bool "USRP1 support"
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_UHD_USB
 	help
 	  enable USRP1 support
 
-comment "USRP1 support needs a toolchain w/ gcc >= 4.9"
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-
 config BR2_PACKAGE_UHD_USRP2
 	bool "USRP2 support"
 	help
diff --git a/package/uhd/uhd.hash b/package/uhd/uhd.hash
index 3af1bc9251..3282da2ec7 100644
--- a/package/uhd/uhd.hash
+++ b/package/uhd/uhd.hash
@@ -1,5 +1,5 @@
 # Locally calculated:
-sha256  8695800d593c58b557cbf9905b02bbf65a74ca68674e8c8c8c28bb6e203635ad  uhd-4.3.0.0.tar.gz
+sha256  afe56842587ce72d6a57535a2b15c061905f0a039abcc9d79f0106f072a00d10  uhd-4.7.0.0.tar.gz
 sha256  94cc36ada2641d037980bf6c2418a750ac10a115ae11de5a5cda6177769dbd4c  LICENSE.md
 sha256  70bf7e79c8cd73a81f97ce81745ea0719a617eebe299a61868165daeae71fff2  host/LICENSE
 sha256  206adc03412b6c5b71b9c9df9c1f2e60e11833e89393877d5031fd11d332b1d4  fpga/usrp3/LICENSE.md
diff --git a/package/uhd/uhd.mk b/package/uhd/uhd.mk
index a9d711acd4..52ea06a394 100644
--- a/package/uhd/uhd.mk
+++ b/package/uhd/uhd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UHD_VERSION = 4.3.0.0
+UHD_VERSION = 4.7.0.0
 UHD_SITE = $(call github,EttusResearch,uhd,v$(UHD_VERSION))
 UHD_LICENSE = GPL-3.0+, LGPL-3.0+ (fpga/usrp3)
 UHD_LICENSE_FILES = LICENSE.md host/LICENSE fpga/usrp3/LICENSE.md
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
