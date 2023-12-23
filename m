Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E1DEC3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 17:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 551BC417BA;
	Sat, 23 Dec 2023 17:42:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 551BC417BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6bSrpNmaDAG1; Sat, 23 Dec 2023 17:42:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CCBA417BC;
	Sat, 23 Dec 2023 17:42:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CCBA417BC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8025C1BF2C2
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 17:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5893F81A1C
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 17:42:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5893F81A1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t2CsyHwySPVf for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 17:42:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B7A381911
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 17:42:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B7A381911
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2835781422; Sat, 23 Dec 2023 17:42:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Dec 2023 18:41:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 601fef4ab55319ef8f2f28bf0c1fb8f06f502b0a
X-Git-Newrev: c9c28434b2bc3f0bf87b17ab8733b6709861b093
X-Patchwork-Hint: ignore
Message-Id: <20231223174220.2835781422@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/swupdate: bump version to 2023.12
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c9c28434b2bc3f0bf87b17ab8733b6709861b093
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* make json-c mandatory according to [0]
* make libubootenv mandatory according to [1]
* drop local patch that has been upstreamed [2]
* libconfig is not mandatory anymore if no lua parser is enabled
* adjust Config.in comment according to json-c and libubootenv

[0]: https://github.com/sbabic/swupdate/commit/82e75322443e021d119a026a3476c410f4705d67
[1]: https://github.com/sbabic/swupdate/commit/75838874e2575f822ed85d89532f47e9adf781b6
[2]: https://github.com/sbabic/swupdate/commit/1999685830d6e9b57014666b9e53e46de17a471c

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-include-util-h-fix-build-on-musl.patch    | 41 ----------------------
 package/swupdate/Config.in                         | 13 ++++---
 package/swupdate/swupdate.hash                     |  2 +-
 package/swupdate/swupdate.mk                       | 17 ++-------
 4 files changed, 9 insertions(+), 64 deletions(-)

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
index 7d9fc90e10..ba3f6a0c0f 100644
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
@@ -89,4 +87,5 @@ endif
 
 comment "swupdate needs a toolchain w/ dynamic library, threads"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
