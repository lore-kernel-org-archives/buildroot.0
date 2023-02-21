Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB0FC636D7
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 21:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67B8980C3B;
	Tue, 21 Feb 2023 21:23:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67B8980C3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1kH-1gbJHwoD; Tue, 21 Feb 2023 21:23:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7996E80E42;
	Tue, 21 Feb 2023 21:23:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7996E80E42
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 82C3A1BF39F
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 21:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D2B441859
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 21:22:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D2B441859
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0T7QgOB2j5bJ for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 21:22:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14BAE41856
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 21:22:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14BAE41856
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F261F8660B; Tue, 21 Feb 2023 21:22:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 21:16:19 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f6c05b47f71a6e140a0743dda276267f653f94f3
X-Git-Newrev: 7087e5286d8419f4625f5f6e52aa84567c6b7ed0
X-Patchwork-Hint: ignore
Message-Id: <20230221212251.F261F8660B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ccache: bump to
 version 4.7.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=7087e5286d8419f4625f5f6e52aa84567c6b7ed0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Migrate to cmake package infrastructure.

Add new host-hiredis host-zstd dependencies.

Add new ccache dependency exclusions to pkg-generic.

Migrate HOST_CCACHE_PATCH_CONFIGURATION to handle updated
source files/format.

License hashes changed due to migrating urls to https:
https://github.com/ccache/ccache/commit/a0f32f161f1b8b9c5d287ca8abe88e3fd1e940a2

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ccache/ccache.hash |  6 +++---
 package/ccache/ccache.mk   | 38 +++++++++++++++++---------------------
 package/pkg-generic.mk     |  2 +-
 3 files changed, 21 insertions(+), 25 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index 16cfad602c..9b11f026ec 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,4 +1,4 @@
 # sha256 computed locally
-sha256  a02f4e8360dc6618bc494ca35b0ae21cea080f804a4898eab1ad3fcd108eb400  ccache-3.7.12.tar.xz
-sha256  ec6b1a326ff93b2cc21df88a697ae470ff6927a55b8929e7e491b315e1563361  GPL-3.0.txt
-sha256  4f63223bcdee822d55a6768cc8399ffe06401d7a03cfe79e1dc305f50dc22c59  LICENSE.adoc
+sha256  df0c64d15d3efaf0b4f6837dd6b1467e40eeaaa807db25ce79c3a08a46a84e36  ccache-4.7.4.tar.xz
+sha256  80b5112739a423dfac7bed1ca8a1df3cccda3d794425441997d4462b83db4dd5  GPL-3.0.txt
+sha256  56cf64f68b7b8150300acd79899941615523ea5c56c120e92f5b175b7cc78e3c  LICENSE.adoc
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 97aa8b1c75..6b7d57b40c 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,27 +4,19 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 3.7.12
+CCACHE_VERSION = 4.7.4
 CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSION)
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
 CCACHE_LICENSE_FILES = LICENSE.adoc GPL-3.0.txt
-
-# Force ccache to use its internal zlib. The problem is that without
-# this, ccache would link against the zlib of the build system, but we
-# might build and install a different version of zlib in $(O)/host
-# afterwards, which ccache will pick up. This might break if there is
-# a version mismatch. A solution would be to add host-zlib has a
-# dependency of ccache, but it would require tuning the zlib .mk file
-# to use HOSTCC_NOCCACHE as the compiler. Instead, we take the easy
-# path: tell ccache to use its internal copy of zlib, so that ccache
-# has zero dependency besides the C library.
-HOST_CCACHE_CONF_OPTS += --with-bundled-zlib
+HOST_CCACHE_DEPENDENCIES = host-hiredis host-zstd
 
 # We are ccache, so we can't use ccache
-HOST_CCACHE_CONF_ENV = \
-	CC="$(HOSTCC_NOCCACHE)" \
-	CXX="$(HOSTCXX_NOCCACHE)"
+HOST_CCACHE_CONF_OPTS += \
+	-UCMAKE_C_COMPILER_LAUNCHER \
+	-UCMAKE_CXX_COMPILER_LAUNCHER \
+	-DZSTD_FROM_INTERNET=OFF \
+	-DHIREDIS_FROM_INTERNET=OFF
 
 # Patch host-ccache as follows:
 #  - Use BR_CACHE_DIR instead of CCACHE_DIR, because CCACHE_DIR
@@ -33,13 +25,17 @@ HOST_CCACHE_CONF_ENV = \
 #    BR2_CCACHE_DIR.
 #  - Change hard-coded last-ditch default to match path in .config, to avoid
 #    the need to specify BR_CACHE_DIR when invoking ccache directly.
-#    CCache replaces "%s" with the home directory of the current user,
-#    So rewrite BR_CACHE_DIR to take that into consideration for SDK purpose
-HOST_CCACHE_DEFAULT_CCACHE_DIR = $(patsubst $(HOME)/%,\%s/%,$(BR_CACHE_DIR))
+#    CCache replaces "home_dir" with the home directory of the current user,
+#    so rewrite BR_CACHE_DIR to take that into consideration for SDK purpose
+HOST_CCACHE_DEFAULT_CCACHE_DIR = $(patsubst $(HOME)/%,%,$(BR_CACHE_DIR))
 
 define HOST_CCACHE_PATCH_CONFIGURATION
-	sed -i 's,getenv("CCACHE_DIR"),getenv("BR_CACHE_DIR"),' $(@D)/src/ccache.c
-	sed -i 's,"%s/.ccache","$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/conf.c
+	sed -i 's,getenv("CCACHE_DIR"),getenv("BR_CACHE_DIR"),' $(@D)/src/Config.cpp
+	sed -i 's,".ccache","$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/Config.cpp
+	sed -i 's,"/.cache/ccache","/$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/Config.cpp
+	sed -i 's,"/.config/ccache","/$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/Config.cpp
+	sed -i 's,getenv("XDG_CACHE_HOME"),nullptr,' $(@D)/src/Config.cpp
+	sed -i 's,getenv("XDG_CONFIG_HOME"),nullptr,' $(@D)/src/Config.cpp
 endef
 
 HOST_CCACHE_POST_PATCH_HOOKS += HOST_CCACHE_PATCH_CONFIGURATION
@@ -62,7 +58,7 @@ endef
 HOST_CCACHE_POST_INSTALL_HOOKS += HOST_CCACHE_DO_INITIAL_SETUP
 endif
 
-$(eval $(host-autotools-package))
+$(eval $(host-cmake-package))
 
 ifeq ($(BR2_CCACHE),y)
 ccache-stats: host-ccache
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 82187d7db9..d460251f48 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -792,7 +792,7 @@ $(2)_EXTRACT_DEPENDENCIES += \
 endif
 
 ifeq ($$(BR2_CCACHE),y)
-ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate host-ccache host-hiredis host-pkgconf host-zstd,$(1)),)
+ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate host-ccache host-cmake host-hiredis host-pkgconf host-zstd,$(1)),)
 $(2)_DEPENDENCIES += host-ccache
 endif
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
