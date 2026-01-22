Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 763CFD3F083
	for <buildroot@archiver.kernel.org>; Wed, 28 Jan 2026 17:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AABF40ACE;
	Wed, 28 Jan 2026 17:22:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IkwV4KEZqEcy; Wed, 28 Jan 2026 17:21:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3413440A18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769620918;
	bh=M/s2Nn06Uyt+UkcbhXOuKN5zyHJSp0+X5VPzeXRUBwg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hkDqbjZEN0YZwPSho9rK1PsZn2BfpAd6nTgpAnAK54Hg7bz9nOLt1KmlNauwuIUXD
	 hq+Q0/rstjCtTIr8kQ5Rv/Nn2jJVhu/TvxdUbEBrIeuUTOr9qnYZ8B+tCWTJjuSwy1
	 s7rgQJFIC8sr7gOO0nmyI4G9pH+rJUbfs8aukzcB9qYDrdKNnfBIYBCt8R3llQ5l8Z
	 WJ/z+bqAgrT1213KUFqdzPNLjutL1/AcNFMHxGELMgzh3lWEnJ22SWR2Yb4I00KNGI
	 hYAav29JQeGiGVC0ai5qO8W1lUdMWStwOikJSX60zuT5gVQ7Fmq0a4toBhMCGYFgLP
	 7CyW//GovNuPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3413440A18;
	Wed, 28 Jan 2026 17:21:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 280681AD
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B3E240931
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:21:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WjSKXp0hoWAe for <buildroot@buildroot.org>;
 Wed, 28 Jan 2026 17:21:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2638240902
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2638240902
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:21:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 202FC825A0; Wed, 28 Jan 2026 17:21:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Jan 2026 15:51:13 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 8c5bc9a1c63b29c0d94e8c38b9cc8a958fad4890
X-Git-Newrev: d834a1771ba86e0c7258d6578615b7fe1a553fad
X-Patchwork-Hint: ignore
Message-Id: <20260128172152.202FC825A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/cvs: drop package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d834a1771ba86e0c7258d6578615b7fe1a553fad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

The CVS project is no longer maintained upstream. It no longer builds
with GCC 14.x, has been failing to build for months in our
autobuilders with nobody caring about it.

We managed to fix the GCC 14.x build issue, then there are GCC 15.x,
some of them fixed by Debian patches, but some not. Overall, this is
too much effort, while upstream is completely dead.

So let's get rid of cvs entirely.

Fixes:

  https://autobuild.buildroot.net/results/59f6e77106ac98535688ff5b9392b0b3ad3041ae/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 700726db4b21219fbaa9907d1a8525cd3107b0a0)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 Config.in.legacy      |  7 +++++++
 package/Config.in     |  1 -
 package/cvs/Config.in | 24 ---------------------
 package/cvs/cvs.hash  |  8 -------
 package/cvs/cvs.mk    | 58 ---------------------------------------------------
 5 files changed, 7 insertions(+), 91 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 2268e5b1ed..07f87525c2 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.11.2"
 
+config BR2_PACKAGE_CVS
+	bool "cvs has been removed"
+	select BR2_LEGACY
+	help
+	  The cvs project was no longer maintained upstream, broken
+	  with GCC 14.x, so it was removed.
+
 config BR2_PACKAGE_CRIU
 	bool "criu has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 79ce224ace..8418426a33 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -174,7 +174,6 @@ menu "Development tools"
 	source "package/cppunit/Config.in"
 	source "package/cukinia/Config.in"
 	source "package/cunit/Config.in"
-	source "package/cvs/Config.in"
 	source "package/cxxtest/Config.in"
 	source "package/diffutils/Config.in"
 	source "package/dos2unix/Config.in"
diff --git a/package/cvs/Config.in b/package/cvs/Config.in
deleted file mode 100644
index e8f0606ecc..0000000000
--- a/package/cvs/Config.in
+++ /dev/null
@@ -1,24 +0,0 @@
-config BR2_PACKAGE_CVS
-	bool "cvs"
-	depends on BR2_USE_WCHAR
-	# needs fork()
-	depends on BR2_USE_MMU
-	select BR2_PACKAGE_NCURSES
-	help
-	  Concurrent Versions System - source code revision control
-	  tools.
-
-	  http://www.nongnu.org/cvs/
-
-if BR2_PACKAGE_CVS
-
-config BR2_PACKAGE_CVS_SERVER
-	bool "server support"
-	help
-	  Enable cvs server code
-
-endif
-
-comment "cvs needs a toolchain w/ wchar"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR
diff --git a/package/cvs/cvs.hash b/package/cvs/cvs.hash
deleted file mode 100644
index 7b03a552d0..0000000000
--- a/package/cvs/cvs.hash
+++ /dev/null
@@ -1,8 +0,0 @@
-# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/c/cvs/cvs_1.12.13-12%2Bsqueeze1.dsc
-sha256  b5961c2476b996e5758fa5e22b60af085adca41164cac0d8f68a1d3b49d4e4f1  cvs_1.12.13.orig.tar.gz
-sha256  d52a9232d9cf36302a150d782fc7e5b6f92f8115505ae8a7dc6acfc83e809d2f  cvs_1.12.13-12+squeeze1.diff.gz
-
-# Hash for license files, locally computed
-sha256  569c5b876327d899cf444b2277fe910128a38ca71d90755fe4125dd44f8ece02  COPYING
-sha256  da0e282103fb508894e78db519aab255e36971ce0bc87de585e3b05014b83b1e  COPYING.LIB
-sha256  ee9a2fbdb626c0ac57fd8e569f357eb2e6d6c80cc6f41efa8bd126d5ea589d72  lib/glob-libc.h
diff --git a/package/cvs/cvs.mk b/package/cvs/cvs.mk
deleted file mode 100644
index cf9127fc3a..0000000000
--- a/package/cvs/cvs.mk
+++ /dev/null
@@ -1,58 +0,0 @@
-################################################################################
-#
-# cvs
-#
-################################################################################
-
-CVS_VERSION = 1.12.13
-CVS_SOURCE = cvs_$(CVS_VERSION).orig.tar.gz
-CVS_PATCH = cvs_$(CVS_VERSION)-12+squeeze1.diff.gz
-CVS_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/c/cvs
-CVS_LICENSE = GPL-1.0+, LGPL-2.0+, LGPL-2.1+ (glob)
-CVS_LICENSE_FILES = COPYING COPYING.LIB lib/glob-libc.h
-CVS_CPE_ID_VENDOR = gnu
-CVS_SELINUX_MODULES = apache cvs
-CVS_DEPENDENCIES = ncurses
-
-CVS_CONF_ENV = \
-	ac_cv_func_working_mktime=yes \
-	cvs_cv_func_printf_ptr=yes
-
-CVS_CONF_OPTS = \
-	--disable-old-info-format-support \
-	--with-editor=/bin/vi
-ifeq ($(BR2_PACKAGE_CVS_SERVER),y)
-CVS_CONF_OPTS += --enable-server
-else
-CVS_CONF_OPTS += --disable-server
-endif
-ifeq ($(BR2_PACKAGE_ZLIB),y)
-CVS_CONF_OPTS += --with-external-zlib
-endif
-
-define CVS_BZIP_UNPACK
-	$(BZCAT) $(@D)/cvs-$(CVS_VERSION).tar.bz2 | $(TAR) -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	rm -f $(@D)/cvs-$(CVS_VERSION).tar.bz2
-endef
-
-CVS_POST_PATCH_HOOKS += CVS_BZIP_UNPACK
-
-ifneq ($(CVS_PATCH),)
-define CVS_DEBIAN_PATCHES
-	if [ -d $(@D)/debian/patches ]; then \
-		(cd $(@D)/debian/patches && for i in *; \
-		 do $(SED) 's,^\+\+\+ .*cvs-$(CVS_VERSION)/,+++ cvs-$(CVS_VERSION)/,' $$i; \
-		 done; \
-		); \
-		$(APPLY_PATCHES) $(@D) $(@D)/debian/patches \*; \
-	fi
-endef
-endif
-
-CVS_POST_PATCH_HOOKS += CVS_DEBIAN_PATCHES
-
-define CVS_INSTALL_TARGET_CMDS
-	$(INSTALL) -D $(@D)/src/cvs $(TARGET_DIR)/usr/bin/cvs
-endef
-
-$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
