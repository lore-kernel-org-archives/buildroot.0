Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A7FCD13D8
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 13:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 868D860093;
	Sat, 31 Aug 2024 13:58:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BB1YEBrIUh2i; Sat, 31 Aug 2024 13:58:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AA3960586
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AA3960586;
	Sat, 31 Aug 2024 13:58:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 39EEE1BF2C2
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 13:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 34D1460723
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 13:58:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B8o9h0mLFyLJ for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 13:58:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 629356070E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 629356070E
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 13:58:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4CA9C8663B; Sat, 31 Aug 2024 13:58:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 31 Aug 2024 11:45:31 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 7b16d1e482d7df6a9576141f64150627005fd3c6
X-Git-Newrev: d2777c335a3534a4771120af793d4216a6cb7b22
X-Patchwork-Hint: ignore
Message-Id: <20240831135812.4CA9C8663B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/libfreefare: bump
 to latest git commit
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

commit: https://git.buildroot.net/buildroot/commit/?id=d2777c335a3534a4771120af793d4216a6cb7b22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

This bump will fix the following build failure with gcc >= 14 thanks to
https://github.com/nfc-tools/libfreefare/commit/494233d33b3a9d21da1bb0f1c59606820afe4691

mifare_desfire_crypto.c: In function 'cmac':
mifare_desfire_crypto.c:139:23: error: implicit declaration of function 'malloc' [-Wimplicit-function-declaration]
  139 |     uint8_t *buffer = malloc (padded_data_length (len, kbs));
      |                       ^~~~~~
mifare_desfire_crypto.c:69:1: note: include '<stdlib.h>' or provide a declaration of 'malloc'
   68 | #include "freefare_internal.h"
  +++ |+#include <stdlib.h>
   69 |

Fixes:
 - http://autobuild.buildroot.org/results/778be216f62b8c2e05aba1b3e297dab0c6c6ccd0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d1e812e739d0de9554c4e8a62fbc8743746b4aa7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libfreefare/libfreefare.hash | 4 ++--
 package/libfreefare/libfreefare.mk   | 9 ++++-----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/libfreefare/libfreefare.hash b/package/libfreefare/libfreefare.hash
index 9115518a3f..6ef30513d1 100644
--- a/package/libfreefare/libfreefare.hash
+++ b/package/libfreefare/libfreefare.hash
@@ -1,5 +1,5 @@
-# From https://github.com/nfc-tools/libfreefare/releases/download/libfreefare-0.4.0/libfreefare-0.4.0.tar.bz2
-sha256  bfa31d14a99a1247f5ed49195d6373de512e3eb75bf1627658b40cf7f876bc64  libfreefare-0.4.0.tar.bz2
+# Locally computed
+sha256  48db20cccdf3435a9f205bcbb67dbd4eec055991d21840fb419874efd9ce9df8  libfreefare-c2b0cfa4b9fb0e4be88604f00b7a2405618d5abc.tar.gz
 
 # Hash for license file:
 sha256  be6209dfd763a0ba77fbe990cfd2512804441d8b5f0cad927baa3341b50fcade  COPYING
diff --git a/package/libfreefare/libfreefare.mk b/package/libfreefare/libfreefare.mk
index 16f15b34e4..7065c441dc 100644
--- a/package/libfreefare/libfreefare.mk
+++ b/package/libfreefare/libfreefare.mk
@@ -4,14 +4,13 @@
 #
 ################################################################################
 
-LIBFREEFARE_VERSION = 0.4.0
-LIBFREEFARE_SOURCE = libfreefare-$(LIBFREEFARE_VERSION).tar.bz2
-# Do not use the github helper here, the generated tarball is *NOT*
-# the same as the one uploaded by upstream for the release.
-LIBFREEFARE_SITE = https://github.com/nfc-tools/libfreefare/releases/download/libfreefare-$(LIBFREEFARE_VERSION)
+LIBFREEFARE_VERSION = c2b0cfa4b9fb0e4be88604f00b7a2405618d5abc
+LIBFREEFARE_SITE = $(call github,nfc-tools,libfreefare,$(LIBFREEFARE_VERSION))
 LIBFREEFARE_DEPENDENCIES = host-pkgconf libnfc openssl
 LIBFREEFARE_LICENSE = LGPL-3.0+ with exception
 LIBFREEFARE_LICENSE_FILES = COPYING
+# From git
+LIBFREEFARE_AUTORECONF = YES
 LIBFREEFARE_CONF_ENV += LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
