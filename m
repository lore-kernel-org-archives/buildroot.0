Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF55D4337C
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 243B181B69;
	Fri, 12 Dec 2025 07:59:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZV6_W3hv4Dp6; Fri, 12 Dec 2025 07:59:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6A338436D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526344;
	bh=DWXfw9FOKbFDb6if2OxD19vx1xXNnsEpGnlG+V3Uqp0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oORfoGyC7PwmRn68lF4k3WIy+/HMEdiy1WUMryigyjEQD3iriICXF0Vscl0IfxYRz
	 1tU28NHQqz4gh0cjqbzIpkAt//JjoJk/FgCrprmQGut5cL7KIG7yooms4PELrGNEeW
	 aepx4bmtMdHalQsiDFP0MUCEfALPkTo80QfhaJWVhIN+9FGQZUA2fr1tlXZB9bz8pb
	 VBb7+eKJ4SqWdmHCnJC8XQOQulMYmIc28XFjFaiqk8BMah/FLFC08Y3sTM/z6J8lp6
	 EQcXCveDMEHeImLoblfGF6aH9BhoZ8Hqvlcarkl1esKWhpZl1ZVbWcc92pJB90Dr04
	 t2Im2iIf3bdYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6A338436D;
	Fri, 12 Dec 2025 07:59:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B8769E7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5C4D4118C
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6fvApA2g1KGs for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 005D441195
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 005D441195
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F39AA807F9; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Dec 2025 19:24:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c6e914819774212e79be19f62706f653b9646f11
X-Git-Newrev: 1a9e812d24c4e609c65e3dc39813e0c61b20966f
X-Patchwork-Hint: ignore
Message-Id: <20251212075538.F39AA807F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcorrect: bump version,
 fix cmake 4 compatibility
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1a9e812d24c4e609c65e3dc39813e0c61b20966f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For changes, see:
https://git.openwrt.org/?p=project/libubox.git;a=shortlog;h=ecddb31dc34d89be5c9dc4595a4c58070eb090e4

Removed patch 0001 which is included in this release.

Added new patch 0001 which fixes build with cmake 4.

Added Upstream: tag to patch 0002.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: add link to upstream commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  1 -
 ...MakeLists.txt-conditionally-use-Wpedantic.patch | 42 ----------------------
 ...s.txt-conditionally-use-fsanitize-address.patch |  2 ++
 package/libcorrect/libcorrect.hash                 |  2 +-
 package/libcorrect/libcorrect.mk                   |  2 +-
 5 files changed, 4 insertions(+), 45 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 5d3d63d71f..704680c911 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -532,7 +532,6 @@ package/libcdaudio/0001-libcdaudio-enable-autoreconf.patch lib_patch.Upstream
 package/libcgi/0001-CMakeLists.txt-honour-BUILD_TESTING.patch lib_patch.Upstream
 package/libcgicc/0001-disable-documentation-option.patch lib_patch.Sob lib_patch.Upstream
 package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch lib_patch.Upstream
-package/libcorrect/0002-CMakeLists.txt-conditionally-use-fsanitize-address.patch lib_patch.Upstream
 package/libcuefile/0001-fix-static-link.patch lib_patch.Upstream
 package/libdaemon/0001-testd-use-unistd-h-instead-of-sys-unistd-h.patch lib_patch.Upstream
 package/libdnet/0001-python-makefile.patch lib_patch.Upstream
diff --git a/package/libcorrect/0001-CMakeLists.txt-conditionally-use-Wpedantic.patch b/package/libcorrect/0001-CMakeLists.txt-conditionally-use-Wpedantic.patch
deleted file mode 100644
index 77e29ad833..0000000000
--- a/package/libcorrect/0001-CMakeLists.txt-conditionally-use-Wpedantic.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 8fc28b4c4c01581b25220fdbc1eeda196e399256 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Wed, 10 Oct 2018 09:28:00 +0200
-Subject: [PATCH] CMakeLists.txt: conditionally use -Wpedantic
-
--Wpedantic is only provided by gcc >= 4.8. Since showing pedantic
-warnings is not really mandatory, let's only use this option when the
-compiler supports it.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream: https://github.com/quiet/libcorrect/pull/25
----
- CMakeLists.txt | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 193f311..e570198 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -3,13 +3,18 @@ project(Correct C)
- include(CheckLibraryExists)
- include(CheckIncludeFiles)
- include(CheckCSourceCompiles)
-+include(CheckCCompilerFlag)
- 
- if(MSVC)
- set(LIBM "")
- set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} /W4")
- else(MSVC)
- set(LIBM "m")
--set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fPIC -std=c99 -Wpedantic -Wall")
-+set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fPIC -std=c99 -Wall")
-+check_c_compiler_flag(-Wpedantic COMPILER_SUPPORTS_WPEDANTIC)
-+if(COMPILER_SUPPORTS_WPEDANTIC)
-+set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wpedantic")
-+endif()
- if(CMAKE_BUILD_TYPE STREQUAL "Debug")
-     set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -g3 -O0 -fsanitize=address")
-     set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,-no_pie,")
--- 
-2.14.4
-
diff --git a/package/libcorrect/0002-CMakeLists.txt-conditionally-use-fsanitize-address.patch b/package/libcorrect/0002-CMakeLists.txt-conditionally-use-fsanitize-address.patch
index 82e4f13e66..dc0c18e063 100644
--- a/package/libcorrect/0002-CMakeLists.txt-conditionally-use-fsanitize-address.patch
+++ b/package/libcorrect/0002-CMakeLists.txt-conditionally-use-fsanitize-address.patch
@@ -8,6 +8,8 @@ Check that compiler supports -fsanitize=address before using it
 Fixes:
  - http://autobuild.buildroot.net/results/221d6a418e75b39fe645c3a56cee676518d2cff6
 
+Upstream: https://github.com/quiet/libcorrect/pull/26
+
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  CMakeLists.txt | 6 +++++-
diff --git a/package/libcorrect/libcorrect.hash b/package/libcorrect/libcorrect.hash
index 4c6289fb82..0385abeb8c 100644
--- a/package/libcorrect/libcorrect.hash
+++ b/package/libcorrect/libcorrect.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  79861750540fb3a1cc501ee217cb4d1febc4855f3fb82e5eb60906eec5379890  libcorrect-ce6c17f1f988765ae3695315d7cce1f2a2e6cf0d.tar.gz
+sha256  5a4305aabe6c7d5b58f6677c41c54ad5e8d9003f7a5998f7344d93534e4c5760  libcorrect-f5a28c74fba7a99736fe49d3a5243eca29517ae9.tar.gz
 sha256  135138cd4304aa637836758dc5edfb5f21b7d09ecc637d25288d206b151a5768  LICENSE
diff --git a/package/libcorrect/libcorrect.mk b/package/libcorrect/libcorrect.mk
index 0a84aa5c26..9f2beb1d4a 100644
--- a/package/libcorrect/libcorrect.mk
+++ b/package/libcorrect/libcorrect.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCORRECT_VERSION = ce6c17f1f988765ae3695315d7cce1f2a2e6cf0d
+LIBCORRECT_VERSION = f5a28c74fba7a99736fe49d3a5243eca29517ae9
 LIBCORRECT_SITE = $(call github,quiet,libcorrect,$(LIBCORRECT_VERSION))
 LIBCORRECT_LICENSE = BSD-3-Clause
 LIBCORRECT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
