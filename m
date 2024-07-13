Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F61C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 20:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5631F81FD9;
	Sat, 13 Jul 2024 20:31:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6CHdVTstZnyJ; Sat, 13 Jul 2024 20:31:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE1CA82051
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE1CA82051;
	Sat, 13 Jul 2024 20:31:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 28D7B1BF86D
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22EB281F46
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:31:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 15pzwWN_04VQ for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 20:31:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A6D181E46
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A6D181E46
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 20:31:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EAE3E86666; Sat, 13 Jul 2024 20:31:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 22:21:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2c73a973615cc6d2be0418cb9d40ec340601a1e5
X-Git-Newrev: c19ba0dfcd91f8846dd415622c71ce35b8c748db
X-Patchwork-Hint: ignore
Message-Id: <20240713203104.EAE3E86666@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ccache: bump version to 4.10.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c19ba0dfcd91f8846dd415622c71ce35b8c748db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://ccache.dev/releasenotes.html#_ccache_4_10_1

This version requires use the system dependencies of host-blake3 and
host-xxhash. The bundled version is not able to build/download.

The ZSTD_FROM_INTERNET and HIREDIS_FROM_INTERNET variables are replaced
in the ccache build system with DEP_ZSTD and DEP_HIREDIS in version 4.10.
For the sake of completeness, all DEP_<xxx> variables were set for external
dependencies.

The generation of documentation has also been switched off.

The LICENSE.adoc was updated regarding the bundled libraries version used
like cpp-httplib, BLAKE3, fmt, nonstd-span, cxxurl.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/ccache/ccache.hash |  4 ++--
 package/ccache/ccache.mk   | 27 +++++++++++++++++----------
 package/pkg-generic.mk     |  2 +-
 3 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index a2537077b6..744e167489 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,4 +1,4 @@
 # sha256 computed locally
-sha256  4c03bc840699127d16c3f0e6112e3f40ce6a230d5873daa78c60a59c7ef59d25  ccache-4.9.1.tar.xz
+sha256  3a43442ce3916ea48bb6ccf6f850891cbff01d1feddff7cd4bbd49c5cf1188f6  ccache-4.10.1.tar.xz
 sha256  80b5112739a423dfac7bed1ca8a1df3cccda3d794425441997d4462b83db4dd5  GPL-3.0.txt
-sha256  a6aea7358a30ded3f8abbff979219bdbe7b7a9aa489a8c70030afd96a83caf84  LICENSE.adoc
+sha256  de4684f5251a0a2c58f3a7ab94d6a8d3443822cbd01abcdadd9250d3d1e0bfe1  LICENSE.adoc
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 0b2c02e8a7..d92608512c 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,20 +4,27 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 4.9.1
+CCACHE_VERSION = 4.10.1
 CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSION)
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
 CCACHE_LICENSE_FILES = LICENSE.adoc GPL-3.0.txt
-HOST_CCACHE_DEPENDENCIES = host-hiredis host-zstd
+HOST_CCACHE_DEPENDENCIES = host-hiredis host-zstd host-xxhash host-blake3
 
 # We are ccache, so we can't use ccache
 HOST_CCACHE_CONF_OPTS += \
 	-UCMAKE_C_COMPILER_LAUNCHER \
 	-UCMAKE_CXX_COMPILER_LAUNCHER \
 	-DCCACHE_DEV_MODE=OFF \
-	-DZSTD_FROM_INTERNET=OFF \
-	-DHIREDIS_FROM_INTERNET=OFF \
+	-DDEP_BLAKE3=SYSTEM \
+	-DDEP_FMT=BUNDLED \
+	-DDEP_CPPHTTPLIB=BUNDLED \
+	-DDEP_HIREDIS=SYSTEM \
+	-DDEP_NONSTDSPAN=BUNDLED \
+	-DDEP_TLEXPECTED=BUNDLED \
+	-DDEP_XXHASH=SYSTEM \
+	-DDEP_ZSTD=SYSTEM \
+	-DENABLE_DOCUMENTATION=OFF \
 	-DENABLE_TESTING=OFF
 
 # Patch host-ccache as follows:
@@ -32,12 +39,12 @@ HOST_CCACHE_CONF_OPTS += \
 HOST_CCACHE_DEFAULT_CCACHE_DIR = $(patsubst $(HOME)/%,%,$(BR_CACHE_DIR))
 
 define HOST_CCACHE_PATCH_CONFIGURATION
-	sed -i 's,getenv("CCACHE_DIR"),getenv("BR_CACHE_DIR"),' $(@D)/src/Config.cpp
-	sed -i 's,".ccache","$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/Config.cpp
-	sed -i 's,"/.cache/ccache","/$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/Config.cpp
-	sed -i 's,"/.config/ccache","/$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/Config.cpp
-	sed -i 's,getenv("XDG_CACHE_HOME"),nullptr,' $(@D)/src/Config.cpp
-	sed -i 's,getenv("XDG_CONFIG_HOME"),nullptr,' $(@D)/src/Config.cpp
+	sed -i 's,getenv("CCACHE_DIR"),getenv("BR_CACHE_DIR"),' $(@D)/src/ccache/Config.cpp
+	sed -i 's,".ccache","$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/ccache/Config.cpp
+	sed -i 's,"/.cache/ccache","/$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/ccache/Config.cpp
+	sed -i 's,"/.config/ccache","/$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/ccache/Config.cpp
+	sed -i 's,getenv("XDG_CACHE_HOME"),nullptr,' $(@D)/src/ccache/Config.cpp
+	sed -i 's,getenv("XDG_CONFIG_HOME"),nullptr,' $(@D)/src/ccache/Config.cpp
 endef
 
 HOST_CCACHE_POST_PATCH_HOOKS += HOST_CCACHE_PATCH_CONFIGURATION
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 132bdb9680..0c9308701b 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -793,7 +793,7 @@ $(2)_EXTRACT_DEPENDENCIES += \
 endif
 
 ifeq ($$(BR2_CCACHE),y)
-ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate host-ccache host-cmake host-hiredis host-pkgconf host-zstd,$(1)),)
+ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate host-ccache host-cmake host-hiredis host-pkgconf host-zstd host-xxhash host-blake3,$(1)),)
 $(2)_DEPENDENCIES += host-ccache
 endif
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
