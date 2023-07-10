Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 267F0EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 18:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8935400A5;
	Mon, 10 Jul 2023 18:38:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8935400A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mKs6HfGGA2MW; Mon, 10 Jul 2023 18:38:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4C9C4185D;
	Mon, 10 Jul 2023 18:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4C9C4185D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4C3251BF3AE
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 18:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24A434090C
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 18:38:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24A434090C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H2y2FoV2ED7U for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 18:38:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6416408E7
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 18:38:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6416408E7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D32A686CBE; Mon, 10 Jul 2023 18:38:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 10 Jul 2023 20:36:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e70fefa3b89d445d2695109c02e7b65c6b3062c1
X-Git-Newrev: af85e45afcd677ce240fc951a18de9afb0ec0015
X-Patchwork-Hint: ignore
Message-Id: <20230710183823.D32A686CBE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdisplay-info: new package
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
Content-Type: multipart/mixed; boundary="===============1412785975400928461=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1412785975400928461==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=af85e45afcd677ce240fc951a18de9afb0ec0015
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed for upcoming Kodi version 21.0-Omega.
Depends on the previous patch to fix build error on Coldfire.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../0001-displayid.c-Include-sys-types.h.patch     | 36 ++++++++++++++++++++++
 package/libdisplay-info/Config.in                  |  8 +++++
 package/libdisplay-info/libdisplay-info.hash       |  3 ++
 package/libdisplay-info/libdisplay-info.mk         | 18 +++++++++++
 6 files changed, 67 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c1819954ae..3237c90c39 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -362,6 +362,7 @@ F:	package/libbroadvoice/
 F:	package/libcap/
 F:	package/libcdio/
 F:	package/libcec/
+F:	package/libdisplay-info/
 F:	package/libcodec2/
 F:	package/libcrossguid/
 F:	package/libdeflate/
diff --git a/package/Config.in b/package/Config.in
index 9cdbd677ff..c9d5c9ccaa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1679,6 +1679,7 @@ menu "Hardware handling"
 	source "package/libatasmart/Config.in"
 	source "package/libblockdev/Config.in"
 	source "package/libcec/Config.in"
+	source "package/libdisplay-info/Config.in"
 	source "package/libfreefare/Config.in"
 	source "package/libftdi/Config.in"
 	source "package/libftdi1/Config.in"
diff --git a/package/libdisplay-info/0001-displayid.c-Include-sys-types.h.patch b/package/libdisplay-info/0001-displayid.c-Include-sys-types.h.patch
new file mode 100644
index 0000000000..3fa57ee10d
--- /dev/null
+++ b/package/libdisplay-info/0001-displayid.c-Include-sys-types.h.patch
@@ -0,0 +1,36 @@
+From 648c1cb66b571b037976b61363654f39448f5fac Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 7 May 2023 14:14:48 +0200
+Subject: [PATCH] displayid.c: Include sys/types.h
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes build error
+../displayid.c:377:10: error: ‘ssize_t’ undeclared (first use in this function); did you mean ‘size_t’?
+
+seen with:
+arc-linux-gcc.br_real (Buildroot 2021.11-4428-g6b6741b) 10.2.0
+
+Upstream: https://gitlab.freedesktop.org/emersion/libdisplay-info/-/commit/5c9801a75f2815790ad1ed5500cec2728a36c6ec
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ displayid.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/displayid.c b/displayid.c
+index 398772b..f1749c6 100644
+--- a/displayid.c
++++ b/displayid.c
+@@ -3,6 +3,7 @@
+ #include <inttypes.h>
+ #include <stdlib.h>
+ #include <string.h>
++#include <sys/types.h>
+ 
+ #include "bits.h"
+ #include "displayid.h"
+-- 
+2.39.2
+
diff --git a/package/libdisplay-info/Config.in b/package/libdisplay-info/Config.in
new file mode 100644
index 0000000000..b8363ed61b
--- /dev/null
+++ b/package/libdisplay-info/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBDISPLAY_INFO
+	bool "libdisplay-info"
+	select BR2_PACKAGE_HWDATA
+	select BR2_PACKAGE_HWDATA_PNP_IDS
+	help
+	  EDID and DisplayID library.
+
+	  https://gitlab.freedesktop.org/emersion/libdisplay-info
diff --git a/package/libdisplay-info/libdisplay-info.hash b/package/libdisplay-info/libdisplay-info.hash
new file mode 100644
index 0000000000..a0829479a8
--- /dev/null
+++ b/package/libdisplay-info/libdisplay-info.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  51cdb0362882ca2af62532ab4d95e60d81e9890b339264719fd55f8e3945d695  libdisplay-info-0.1.1.tar.bz2
+sha256  15b396244e58830c5614b9394f4deccfe684970cd507f299383ab57ad339eedd  LICENSE
diff --git a/package/libdisplay-info/libdisplay-info.mk b/package/libdisplay-info/libdisplay-info.mk
new file mode 100644
index 0000000000..26a6a9a4d9
--- /dev/null
+++ b/package/libdisplay-info/libdisplay-info.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# libdisplay-info
+#
+################################################################################
+
+LIBDISPLAY_INFO_VERSION = 0.1.1
+LIBDISPLAY_INFO_SOURCE = libdisplay-info-$(LIBDISPLAY_INFO_VERSION).tar.bz2
+LIBDISPLAY_INFO_SITE = https://gitlab.freedesktop.org/emersion/libdisplay-info/-/archive/$(LIBDISPLAY_INFO_VERSION)
+LIBDISPLAY_INFO_LICENSE = MIT
+LIBDISPLAY_INFO_LICENSE_FILES = LICENSE
+LIBDISPLAY_INFO_INSTALL_STAGING = YES
+LIBDISPLAY_INFO_DEPENDENCIES = hwdata
+
+# workaround for static_assert on uclibc-ng < 1.0.42
+LIBDISPLAY_INFO_CFLAGS += $(TARGET_CFLAGS) -Dstatic_assert=_Static_assert
+
+$(eval $(meson-package))

--===============1412785975400928461==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1412785975400928461==--
