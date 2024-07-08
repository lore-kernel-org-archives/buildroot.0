Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 496DCC3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 21:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 190B460ADF;
	Mon,  8 Jul 2024 21:01:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BYOm-3ELcNVG; Mon,  8 Jul 2024 21:01:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0834B60ACD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0834B60ACD;
	Mon,  8 Jul 2024 21:01:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B3F221BF390
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 21:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D818403F4
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 21:01:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5K36I0GpBkK8 for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 21:01:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7892A403E5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7892A403E5
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 21:01:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 61DA683E3D; Mon,  8 Jul 2024 21:01:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Jul 2024 23:00:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 01becd31ca25a6be311544e4f6c7f7131b2f7689
X-Git-Newrev: ab9aca21d026bb7e8e9d63f928d97278a4fabceb
X-Patchwork-Hint: ignore
Message-Id: <20240708210142.61DA683E3D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdisplay-info: bump version to
 0.2.0
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
Content-Type: multipart/mixed; boundary="===============7885105874590748655=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7885105874590748655==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ab9aca21d026bb7e8e9d63f928d97278a4fabceb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch which is included in this release.
Use xz tarball and its sha256 hash, both provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-displayid.c-Include-sys-types.h.patch     | 36 ----------------------
 package/libdisplay-info/libdisplay-info.hash       |  3 +-
 package/libdisplay-info/libdisplay-info.mk         |  6 ++--
 3 files changed, 5 insertions(+), 40 deletions(-)

diff --git a/package/libdisplay-info/0001-displayid.c-Include-sys-types.h.patch b/package/libdisplay-info/0001-displayid.c-Include-sys-types.h.patch
deleted file mode 100644
index 3fa57ee10d..0000000000
--- a/package/libdisplay-info/0001-displayid.c-Include-sys-types.h.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 648c1cb66b571b037976b61363654f39448f5fac Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Sun, 7 May 2023 14:14:48 +0200
-Subject: [PATCH] displayid.c: Include sys/types.h
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes build error
-../displayid.c:377:10: error: ‘ssize_t’ undeclared (first use in this function); did you mean ‘size_t’?
-
-seen with:
-arc-linux-gcc.br_real (Buildroot 2021.11-4428-g6b6741b) 10.2.0
-
-Upstream: https://gitlab.freedesktop.org/emersion/libdisplay-info/-/commit/5c9801a75f2815790ad1ed5500cec2728a36c6ec
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- displayid.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/displayid.c b/displayid.c
-index 398772b..f1749c6 100644
---- a/displayid.c
-+++ b/displayid.c
-@@ -3,6 +3,7 @@
- #include <inttypes.h>
- #include <stdlib.h>
- #include <string.h>
-+#include <sys/types.h>
- 
- #include "bits.h"
- #include "displayid.h"
--- 
-2.39.2
-
diff --git a/package/libdisplay-info/libdisplay-info.hash b/package/libdisplay-info/libdisplay-info.hash
index a0829479a8..cc93a0cf32 100644
--- a/package/libdisplay-info/libdisplay-info.hash
+++ b/package/libdisplay-info/libdisplay-info.hash
@@ -1,3 +1,4 @@
+# From https://gitlab.freedesktop.org/emersion/libdisplay-info/-/releases/0.2.0/downloads/libdisplay-info-0.2.0.tar.xz.sha256sum
+sha256  5a2f002a16f42dd3540c8846f80a90b8f4bdcd067a94b9d2087bc2feae974176  libdisplay-info-0.2.0.tar.xz
 # Locally computed
-sha256  51cdb0362882ca2af62532ab4d95e60d81e9890b339264719fd55f8e3945d695  libdisplay-info-0.1.1.tar.bz2
 sha256  15b396244e58830c5614b9394f4deccfe684970cd507f299383ab57ad339eedd  LICENSE
diff --git a/package/libdisplay-info/libdisplay-info.mk b/package/libdisplay-info/libdisplay-info.mk
index 26a6a9a4d9..b88463849e 100644
--- a/package/libdisplay-info/libdisplay-info.mk
+++ b/package/libdisplay-info/libdisplay-info.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBDISPLAY_INFO_VERSION = 0.1.1
-LIBDISPLAY_INFO_SOURCE = libdisplay-info-$(LIBDISPLAY_INFO_VERSION).tar.bz2
-LIBDISPLAY_INFO_SITE = https://gitlab.freedesktop.org/emersion/libdisplay-info/-/archive/$(LIBDISPLAY_INFO_VERSION)
+LIBDISPLAY_INFO_VERSION = 0.2.0
+LIBDISPLAY_INFO_SOURCE = libdisplay-info-$(LIBDISPLAY_INFO_VERSION).tar.xz
+LIBDISPLAY_INFO_SITE = https://gitlab.freedesktop.org/emersion/libdisplay-info/-/releases/$(LIBDISPLAY_INFO_VERSION)/downloads
 LIBDISPLAY_INFO_LICENSE = MIT
 LIBDISPLAY_INFO_LICENSE_FILES = LICENSE
 LIBDISPLAY_INFO_INSTALL_STAGING = YES

--===============7885105874590748655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7885105874590748655==--
