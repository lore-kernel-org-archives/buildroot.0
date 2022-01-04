Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC20C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 18:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9699460B6A;
	Tue,  4 Jan 2022 18:12:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s0Vu87b6BXZU; Tue,  4 Jan 2022 18:11:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBF5C60B38;
	Tue,  4 Jan 2022 18:11:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5646A1BF5DB
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A69A81D4F
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:09:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nvfBiBlnfTuQ for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 18:09:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B07DD813CE
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 18:09:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 11C7483249; Tue,  4 Jan 2022 18:02:57 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 4 Jan 2022 18:32:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5dbdb2535c649ee617595b8c4ae3cbba0ee37b97
X-Git-Newrev: 3b9c8f8cb53e449e39899a40712703c272c5eeff
X-Patchwork-Hint: ignore
Message-Id: <20220104180257.11C7483249@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tinyalsa: bump to version 2.0.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3b9c8f8cb53e449e39899a40712703c272c5eeff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch to meson-package to drop first patch and disable examples and
  utils
- Drop second patch (already in version)
- Update hash of NOTICE (empty new lines added with
  https://github.com/tinyalsa/tinyalsa/commit/902b8c8f9fa5a2e1937007d7d5ee90f01790808b)

https://github.com/tinyalsa/tinyalsa/releases/tag/v2.0.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/tinyalsa/0001-disable-doxygen-usage.patch  | 35 ---------------------
 .../0002-interval.h-add-missing-header.patch       | 36 ----------------------
 package/tinyalsa/tinyalsa.hash                     |  4 +--
 package/tinyalsa/tinyalsa.mk                       | 27 +++-------------
 4 files changed, 6 insertions(+), 96 deletions(-)

diff --git a/package/tinyalsa/0001-disable-doxygen-usage.patch b/package/tinyalsa/0001-disable-doxygen-usage.patch
deleted file mode 100644
index ed939fb9bf..0000000000
--- a/package/tinyalsa/0001-disable-doxygen-usage.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Disable doxygen usage
-
-In order to avoid a dependency on doxygen on the build machine, this
-patch adjusts the main Makefile to not build and install the
-documentation.
-
-[Vincent: tweak patch for 1.1.1 version]
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-diff -rup a/Makefile b/Makefile
---- a/Makefile	2017-05-24 05:23:57.000000000 +0100
-+++ b/Makefile	2017-05-25 10:35:20.781747053 +0100
-@@ -11,14 +11,12 @@ export MANDIR ?= $(PREFIX)/share/man
- all:
- 	$(MAKE) -C src
- 	$(MAKE) -C utils
--	$(MAKE) -C doxygen
- 	$(MAKE) -C examples
- 
- .PHONY: clean
- clean:
- 	$(MAKE) -C src clean
- 	$(MAKE) -C utils clean
--	$(MAKE) -C doxygen clean
- 	$(MAKE) -C examples clean
- 
- .PHONY: install
-@@ -30,5 +28,4 @@ install:
- 	install include/tinyalsa/version.h $(DESTDIR)$(INCDIR)/
- 	$(MAKE) -C src install
- 	$(MAKE) -C utils install
--	$(MAKE) -C doxygen install
- 
diff --git a/package/tinyalsa/0002-interval.h-add-missing-header.patch b/package/tinyalsa/0002-interval.h-add-missing-header.patch
deleted file mode 100644
index c043145b55..0000000000
--- a/package/tinyalsa/0002-interval.h-add-missing-header.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 685e530d8a0063134642371eaacd01fee2f62d85 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Fri, 2 Jun 2017 12:19:03 +0300
-Subject: [PATCH] interval.h: add missing header
-
-The ssize_t type requires the unistd.h header. This fixes build with musl
-libc:
-
-In file included from ../include/tinyalsa/limits.h:32:0,
-                 from limits.c:1:
-../include/tinyalsa/interval.h:38:2: error: unknown type name 'ssize_t'
-  ssize_t max;
-  ^
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://github.com/tinyalsa/tinyalsa/pull/98
-
- include/tinyalsa/interval.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/include/tinyalsa/interval.h b/include/tinyalsa/interval.h
-index 3f6f3dce5d90..068571df5a63 100644
---- a/include/tinyalsa/interval.h
-+++ b/include/tinyalsa/interval.h
-@@ -30,6 +30,7 @@
- #define TINYALSA_INTERVAL_H
- 
- #include <stdlib.h>
-+#include <unistd.h>
- 
- /** A closed range signed interval. */
- 
--- 
-2.11.0
-
diff --git a/package/tinyalsa/tinyalsa.hash b/package/tinyalsa/tinyalsa.hash
index d078bab597..f7673b1769 100644
--- a/package/tinyalsa/tinyalsa.hash
+++ b/package/tinyalsa/tinyalsa.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  d92b438cea348ae316c4b2cbf367b4f01ed821a947e6a34d813624e9e3c936c1  tinyalsa-1.1.1.tar.gz
-sha256  ca2b89a68c33fba3c8bcaec96f32907e2ede0eb33688ae61d29ec49732158f6d  NOTICE
+sha256  573ae0b2d3480851c1d2a12503ead2beea27f92d44ed47b74b553ba947994ef1  tinyalsa-2.0.0.tar.gz
+sha256  ea22a4711f5250f88a4d7011fbc65367d1b02ac954dcc49f5b6d7c135e6537c4  NOTICE
diff --git a/package/tinyalsa/tinyalsa.mk b/package/tinyalsa/tinyalsa.mk
index bd9d9a00d0..b5c39e35d6 100644
--- a/package/tinyalsa/tinyalsa.mk
+++ b/package/tinyalsa/tinyalsa.mk
@@ -4,30 +4,11 @@
 #
 ################################################################################
 
-TINYALSA_VERSION = 1.1.1
-TINYALSA_SITE = $(call github,tinyalsa,tinyalsa,$(TINYALSA_VERSION))
+TINYALSA_VERSION = 2.0.0
+TINYALSA_SITE = $(call github,tinyalsa,tinyalsa,v$(TINYALSA_VERSION))
 TINYALSA_LICENSE = BSD-3-Clause
 TINYALSA_LICENSE_FILES = NOTICE
 TINYALSA_INSTALL_STAGING = YES
+TINYALSA_CONF_OPTS = -Ddocs=disabled -Dexamples=disabled -Dutils=disabled
 
-define TINYALSA_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D)
-endef
-
-define TINYALSA_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) \
-		-C $(@D) \
-		PREFIX="/usr" \
-		CROSS_COMPILE="$(TARGET_CROSS)" \
-		DESTDIR="$(STAGING_DIR)" install
-endef
-
-define TINYALSA_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) \
-		-C $(@D) \
-		PREFIX="/usr" \
-		CROSS_COMPILE="$(TARGET_CROSS)" \
-		DESTDIR="$(TARGET_DIR)" install
-endef
-
-$(eval $(generic-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
