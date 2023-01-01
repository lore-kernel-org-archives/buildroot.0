Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AEF8C3DA7D
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 18:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E11DD81403;
	Sun,  1 Jan 2023 18:19:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E11DD81403
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YuGCbBdrlWOt; Sun,  1 Jan 2023 18:19:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C15181359;
	Sun,  1 Jan 2023 18:19:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C15181359
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0B3F01BF41A
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 18:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7F1F60ACE
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 18:19:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7F1F60ACE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NLcEbChBoK9m for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 18:19:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25B7A605A6
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 18:19:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25B7A605A6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F62187013; Sun,  1 Jan 2023 18:19:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Jan 2023 19:13:01 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: ddd47436d6d276d0ae12f1eba363b22124cb4847
X-Git-Newrev: 99a9b223775f56a227cfb755d9472571adf2124e
X-Patchwork-Hint: ignore
Message-Id: <20230101181932.0F62187013@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/libdeflate: bump
 version to 1.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=99a9b223775f56a227cfb755d9472571adf2124e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Release notes:
https://github.com/ebiggers/libdeflate/blob/master/NEWS.md

Switch to cmake.

Added CFLAGS to fix uClibc build:

/home/bernd/buildroot/output/build/libdeflate-1.15/programs/gzip.c:367:10:
 error: 'const struct stat' has no member named 'st_atim'; did you mean 'st_atime'?

/home/bernd/buildroot/output/build/libdeflate-1.15/programs/gzip.c:367:26:
 error: 'const struct stat' has no member named 'st_mtim'; did you mean 'st_mtime'?

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c31087182fa545784d9a0a01f0b32715d78c3955)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
