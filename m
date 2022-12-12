Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9E4C4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 20:56:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7DBE60E68;
	Mon, 12 Dec 2022 20:56:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7DBE60E68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ioFdlQYfk7Rn; Mon, 12 Dec 2022 20:56:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CBD460E0A;
	Mon, 12 Dec 2022 20:56:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CBD460E0A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 94B501BF37B
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 20:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7055060E0A
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 20:56:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7055060E0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UM7nWUWvGc9Q for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 20:56:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DB6160C1F
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6DB6160C1F
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 20:56:35 +0000 (UTC)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
 by mailout04.t-online.de (Postfix) with SMTP id 65EACFE7E;
 Mon, 12 Dec 2022 21:56:11 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd85.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p4pqM-2WV1kH0; Mon, 12 Dec 2022 21:56:10 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:43036)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p4pqM-0002g1-1E;
 Mon, 12 Dec 2022 21:56:10 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Mon, 12 Dec 2022 21:56:10 +0100
Message-Id: <20221212205610.1550316-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670878570-2C8B9EA1-9EC914C3/0/0 CLEAN NORMAL
X-TOI-MSGID: 63f28ef6-564a-4cb3-8cd7-a177e12c9b40
Subject: [Buildroot] [PATCH 1/1] package/libdeflate: bump version to 1.15
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
Cc: Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/ebiggers/libdeflate/blob/master/NEWS.md

Switch to cmake.

Added CFLAGS to fix uClibc build:

/home/bernd/buildroot/output/build/libdeflate-1.15/programs/gzip.c:367:10:
 error: 'const struct stat' has no member named 'st_atim'; did you mean 'st_atime'?

/home/bernd/buildroot/output/build/libdeflate-1.15/programs/gzip.c:367:26:
 error: 'const struct stat' has no member named 'st_mtim'; did you mean 'st_mtime'?

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libdeflate/libdeflate.hash |  2 +-
 package/libdeflate/libdeflate.mk   | 27 ++++-----------------------
 2 files changed, 5 insertions(+), 24 deletions(-)

diff --git a/package/libdeflate/libdeflate.hash b/package/libdeflate/libdeflate.hash
index 7dae12921f..79de3439d7 100644
--- a/package/libdeflate/libdeflate.hash
+++ b/package/libdeflate/libdeflate.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ba89fb167a5ab6bbdfa6ee3b1a71636e8140fa8471cce8a311697584948e4d06  libdeflate-1.12.tar.gz
+sha256  58b95040df7383dc0413defb700d9893c194732474283cc4c8f144b00a68154b  libdeflate-1.15.tar.gz
 sha256  5d246dd2537307b80fed9ba5fdddf5d0fe7a8f023393a071182b9daed56b40fe  COPYING
diff --git a/package/libdeflate/libdeflate.mk b/package/libdeflate/libdeflate.mk
index 93ec5909a5..2305af4dc9 100644
--- a/package/libdeflate/libdeflate.mk
+++ b/package/libdeflate/libdeflate.mk
@@ -4,31 +4,12 @@
 #
 ################################################################################
 
-LIBDEFLATE_VERSION = 1.12
+LIBDEFLATE_VERSION = 1.15
 LIBDEFLATE_SITE = $(call github,ebiggers,libdeflate,v$(LIBDEFLATE_VERSION))
 LIBDEFLATE_LICENSE = MIT
 LIBDEFLATE_LICENSE_FILES = COPYING
 LIBDEFLATE_INSTALL_STAGING = YES
+LIBDEFLATE_CONF_OPTS = \
+	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -D_DEFAULT_SOURCE"
 
-ifeq ($(BR2_STATIC_LIBS),y)
-LIBDEFLATE_MAKE_OPTS += DISABLE_SHARED=yes
-endif
-
-define LIBDEFLATE_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
-		$(LIBDEFLATE_MAKE_OPTS)
-endef
-
-define LIBDEFLATE_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
-		$(LIBDEFLATE_MAKE_OPTS) \
-		DESTDIR="$(STAGING_DIR)" PREFIX=/usr install
-endef
-
-define LIBDEFLATE_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
-		$(LIBDEFLATE_MAKE_OPTS) \
-		DESTDIR="$(TARGET_DIR)" PREFIX=/usr install
-endef
-
-$(eval $(generic-package))
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
