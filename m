Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25C1C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 22:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E8FE4018C;
	Mon, 18 Dec 2023 22:47:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E8FE4018C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QHR6ijt_5Hjl; Mon, 18 Dec 2023 22:47:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5928940118;
	Mon, 18 Dec 2023 22:47:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5928940118
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BAC391BF2C8
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 22:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A195461397
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 22:47:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A195461397
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7SjlDbZrX1ds for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 22:47:52 +0000 (UTC)
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 21C0361379
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 22:47:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21C0361379
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id FMOqrPIDZKdTZFMOqrO2HA; Mon, 18 Dec 2023 23:47:48 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 23:47:47 +0100
Message-Id: <20231218224747.545311-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGSGDJHBougx/NpnceLATey5zxfIBAQMOejBftlThMJWCX07VxWxZWRlOCp/J1FV2iaooP9Q6Q5UpZySLN6T/SJ0a+L7RUuRMiYi0hNjsodMXa4yMNEZ
 v5rGChE/h3L0MtghzM2S9mBjDYGXBv5NKC/PBCde4BQ6O7QGS9u6r8zcGPbWJjl4Q/RzrZaoO/NJ97voGXa1lPAQGJFIub7/xavSRnIH25hlRZ5YivT/+5o/
 uFhkiBQ9tFKHrfujo5ClYl/japlMquHmUopxUfhdHC9Dn79ed4UpgPGKoFEEOBrjWNwFAdjYD2bbNCjSLvmltQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1702939668; bh=griMNtChK9ZgnGCF54bFgcsqvtmIzwgwwJRoBsfz/IE=;
 h=From:To:Subject:Date:MIME-Version;
 b=OXAA26U4r1zXHDzkmhmkWrtcHOvqyeoS8hkt70JuEAVVszI02lFEm/9usqh/8Lu1x
 CG/p+zzj9TtpHUv5b+QhL1fPVToCJv7tzgstK/nm9+oOjollcYH6Cto3+zQXIxKYmp
 tc+1+9+DHn0UvbGt1I2SgW3gr8WVYGuceaSrYaGjDYyzziebFlNREvC29WFCCoRBKp
 bS1q0cIUpQ4/pCQdkOBOdhV8sdolaWDNm1b9JqNwG96NGhp6NenonD5ZqGw6qRTyRz
 1EUhS48nnqjNxI1yikYfnPMHvdlRwcqaupZnv3MPwL0R9KkqgoRcsBbw/BhRhBYE6e
 9k5HURhInvqWQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=OXAA26U4
Subject: [Buildroot] [PATCH v2] package/swupdate: bump version to 2023.12
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

* make json-c mandatory according to [0]
* make libubootenv mandatory according to [1]
* drop local patch that has been upstreamed [2]
* libconfig is not mandatory anymore if no lua parser is enabled
* adjust Config.in comment according to json-c and libubootenv

[0]: https://github.com/sbabic/swupdate/commit/82e75322443e021d119a026a3476c410f4705d67
[1]: https://github.com/sbabic/swupdate/commit/75838874e2575f822ed85d89532f47e9adf781b6
[2]: https://github.com/sbabic/swupdate/commit/1999685830d6e9b57014666b9e53e46de17a471c

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* adjusted Config.in comment according to json-c and libubootenv select
* added SYNC_4 dependency as suggested by Yann Morin
* removed LIBCONFIG selection if no Lua interpreter is present since it's not
  mandatory anymore as pointed by Yann Morin
---
 ...001-include-util-h-fix-build-on-musl.patch | 41 -------------------
 package/swupdate/Config.in                    | 12 +++---
 package/swupdate/swupdate.hash                |  2 +-
 package/swupdate/swupdate.mk                  | 17 +-------
 4 files changed, 8 insertions(+), 64 deletions(-)
 delete mode 100644 package/swupdate/0001-include-util-h-fix-build-on-musl.patch

diff --git a/package/swupdate/0001-include-util-h-fix-build-on-musl.patch b/package/swupdate/0001-include-util-h-fix-build-on-musl.patch
deleted file mode 100644
index d1e0db6b56..0000000000
--- a/package/swupdate/0001-include-util-h-fix-build-on-musl.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 1999685830d6e9b57014666b9e53e46de17a471c Mon Sep 17 00:00:00 2001
-From: Dominique Martinet <dominique.martinet@atmark-techno.com>
-Date: Fri, 15 Sep 2023 18:14:57 +0900
-Subject: [PATCH] include/util.h: fix build on musl
-
-Building on musl 1.2.4 fails with the following error/warnings:
-
-include/util.h:211:23: error: unknown type name 'mode_t'
-  211 | int mkpath(char *dir, mode_t mode);
-include/util.h:269:36: warning: 'struct timeval' declared inside parameter list will not be visible outside of this definition or declaration
-  269 | char *swupdate_time_iso8601(struct timeval *tv);
-
-These were caused by a recent reorganization of the headers and glibc
-appears more tolerant here.
-
-Fixes: 8228b1390632 ("Reorganize includes to have smaller files")
-Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
-Upstream: https://github.com/sbabic/swupdate/commit/1999685830d6e9b57014666b9e53e46de17a471c
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- include/util.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/include/util.h b/include/util.h
-index 2f5c7adc..5f4cdc01 100644
---- a/include/util.h
-+++ b/include/util.h
-@@ -8,11 +8,13 @@
- #ifndef _UTIL_H
- #define _UTIL_H
- 
-+#include <fcntl.h>
- #include <stdint.h>
- #include <stdlib.h>
- #include <string.h>
- #include <stdio.h>
- #include <stdbool.h>
-+#include <sys/time.h>
- #if defined(__linux__)
- #include <linux/types.h>
- #endif
diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
index 7d9fc90e10..171805bea9 100644
--- a/package/swupdate/Config.in
+++ b/package/swupdate/Config.in
@@ -3,9 +3,9 @@ config BR2_PACKAGE_SWUPDATE
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
-	# swupdate requires a parser and uses libconfig as default
-	select BR2_PACKAGE_LIBCONFIG if !BR2_PACKAGE_JSON_C && \
-		!BR2_PACKAGE_HAS_LUAINTERPRETER
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
+	select BR2_PACKAGE_JSON_C
+	select BR2_PACKAGE_LIBUBOOTENV
 	help
 	  swupdate provides a reliable way to update the software on
 	  an embedded system.
@@ -37,14 +37,12 @@ config BR2_PACKAGE_SWUPDATE
 	    remote handler.
 	  * Select BR2_PACKAGE_LIBRSYNC to add support for using
 	    rdiff handler.
-	  * Select BR2_PACKAGE_LIBUBOOTENV to add support for setting
-	    the U-Boot environment.
 	  * Select BR2_PACKAGE_LIBGPIOD to add support for
 	    microcontroller firmware update.
 	  * Select BR2_PACKAGE_EFIBOOTMGR to add support for EFI Boot
 	    Guard.
-	  * Select BR2_PACKAGE_LIBCURL, BR2_PACKAGE_JSON_C,
-	    BR2_PACKAGE_LIBWEBSOCKETS, and BR2_PACKAGE_LIBURIPARSER
+	  * Select BR2_PACKAGE_LIBCURL, BR2_PACKAGE_LIBWEBSOCKETS,
+	    and BR2_PACKAGE_LIBURIPARSER
 	    to add support for the SWU forwarder.
 
 	  https://sbabic.github.io/swupdate
diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index 72b71ce12d..c19a82304f 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  888df5050035e4fbe14e3a964885646fa3163e727f78c423c3d24c28f7a50b66  swupdate-2023.05.tar.gz
+sha256  ce24032300e2b6a6faa3d22e49f981fd90f04ac6f5d7e802166824b0cd5ca669  swupdate-2023.12.tar.gz
 sha256  4cf04ed34ff0ebbf5c71345b56e6af5093fc17206364cca0ebbae92ef3940683  LICENSES/BSD-1-Clause.txt
 sha256  e27a3e87706b3aa5ff2e50eaafe2e6ed5397fbf2d7679eaf444a6d000518a3a6  LICENSES/BSD-3-Clause.txt
 sha256  0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192  LICENSES/CC0-1.0.txt
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index ea4a5a62e5..ca8c140886 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUPDATE_VERSION = 2023.05
+SWUPDATE_VERSION = 2023.12
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
 SWUPDATE_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1+, MIT, ISC, BSD-1-Clause, BSD-3-Clause, CC0-1.0, CC-BY-SA-4.0, OFL-1.1
 SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \
@@ -18,6 +18,7 @@ SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \
 	LICENSES/MIT.txt \
 	LICENSES/OFL-1.1.txt
 SWUPDATE_INSTALL_STAGING = YES
+SWUPDATE_DEPENDENCIES = json-c libubootenv
 
 # swupdate uses $CROSS-cc instead of $CROSS-gcc, which is not
 # available in all external toolchains, and use CC for linking. Ensure
@@ -36,13 +37,6 @@ else
 SWUPDATE_MAKE_ENV += HAVE_LIBEXT2FS=n
 endif
 
-ifeq ($(BR2_PACKAGE_JSON_C),y)
-SWUPDATE_DEPENDENCIES += json-c
-SWUPDATE_MAKE_ENV += HAVE_JSON_C=y
-else
-SWUPDATE_MAKE_ENV += HAVE_JSON_C=n
-endif
-
 ifeq ($(BR2_PACKAGE_LIBARCHIVE),y)
 SWUPDATE_DEPENDENCIES += libarchive
 SWUPDATE_MAKE_ENV += HAVE_LIBARCHIVE=y
@@ -85,13 +79,6 @@ else
 SWUPDATE_MAKE_ENV += HAVE_LIBGPIOD=n
 endif
 
-ifeq ($(BR2_PACKAGE_LIBUBOOTENV),y)
-SWUPDATE_DEPENDENCIES += libubootenv
-SWUPDATE_MAKE_ENV += HAVE_LIBUBOOTENV=y
-else
-SWUPDATE_MAKE_ENV += HAVE_LIBUBOOTENV=n
-endif
-
 ifeq ($(BR2_PACKAGE_LIBURIPARSER),y)
 SWUPDATE_DEPENDENCIES += liburiparser
 SWUPDATE_MAKE_ENV += HAVE_URIPARSER=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
