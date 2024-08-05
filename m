Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6D8C3DA7F
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 07:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CB8D81086;
	Mon,  5 Aug 2024 07:02:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4n3xISHoMRg4; Mon,  5 Aug 2024 07:02:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C4DA8109C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C4DA8109C;
	Mon,  5 Aug 2024 07:01:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C7361BF3B5
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 07:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A45C400F8
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 07:01:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E-S68WbY35F0 for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 07:01:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A5BC4026F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A5BC4026F
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 07:01:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 57DE484016; Mon,  5 Aug 2024 07:01:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Aug 2024 09:01:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8009fee0f82fda9e2b3b45d93204a3c6004a6e72
X-Git-Newrev: f0e4448e7c38d604152b6e727dcd6fb6d23c286f
X-Patchwork-Hint: ignore
Message-Id: <20240805070146.57DE484016@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libspdm: bump version to 3.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=f0e4448e7c38d604152b6e727dcd6fb6d23c286f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

`libspdm 3.3.0` and later support the SPDM event capability, however
this patch disables support for EVENT_CAP as it is optional,
and requires additional functionality implemented at link time.

`libspdm 3.4.0` also introduces SPDM1.3 measurement extention log (MEL).
Leave this off by default for the same reason as above.

The license file has changed, for two reasons:

- The copyright years have been updated

- The license was simplified to be really a pure BSD 3 Clause license,
  instead of a modified license that had some special patent
  disclaimer/clauses. See https://github.com/DMTF/libspdm/issues/2682
  for more details. We don't need to change LIBSPDM_LICENSE because it
  was already only saying BSD-3-Clause (which was slightly wrong)

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-CMakeLists-remove-fixed-options-for-NONE.patch | 52 ----------------------
 package/libspdm/libspdm.hash                       |  4 +-
 package/libspdm/libspdm.mk                         | 10 ++++-
 3 files changed, 10 insertions(+), 56 deletions(-)

diff --git a/package/libspdm/0001-CMakeLists-remove-fixed-options-for-NONE.patch b/package/libspdm/0001-CMakeLists-remove-fixed-options-for-NONE.patch
deleted file mode 100644
index 0de0ad0079..0000000000
--- a/package/libspdm/0001-CMakeLists-remove-fixed-options-for-NONE.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From d4d6b138d727e484fa9d0fef476ca181681d0695 Mon Sep 17 00:00:00 2001
-From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
-Date: Mon, 19 Feb 2024 09:56:14 +1000
-Subject: [PATCH] CMakeLists: remove fixed options for NONE
-
-The use of the NONE toolchain option is such that we can provide at the
-build project level (buildroot etc...). However, the changes introduced
-in 811f2b596def04b3a36368cf2098546d7907767f set certain compiler/linker
-option that does not comply with the definition of the options as
-specified in [1]. This change removes those options.
-
-[1] https://github.com/DMTF/libspdm/blob/main/doc/build.md#linux-builds-inside-build-environments
-
-Upstream: https://github.com/DMTF/libspdm/commit/d4d6b138d727e484fa9d0fef476ca181681d0695
-Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
----
- CMakeLists.txt | 19 -------------------
- 1 file changed, 19 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 9c300cc817..f6cf17d269 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -618,25 +618,6 @@ if(CMAKE_SYSTEM_NAME MATCHES "Linux")
-         SET(CMAKE_EXE_LINKER_FLAGS "")
- 
-         SET(CMAKE_C_LINK_EXECUTABLE "")
--
--    elseif(TOOLCHAIN STREQUAL "NONE")
--        ADD_COMPILE_OPTIONS(-fshort-wchar -fno-strict-aliasing -Wall -Werror -Wno-array-bounds -ffunction-sections -fdata-sections -fno-common -Wno-address -fpie -fno-asynchronous-unwind-tables -flto -DUSING_LTO  -Wno-maybe-uninitialized -Wno-uninitialized  -Wno-builtin-declaration-mismatch -Wno-nonnull-compare -Werror-implicit-function-declaration)
--        if(CMAKE_BUILD_TYPE STREQUAL "Debug")
--            ADD_COMPILE_OPTIONS(-g)
--        endif()
--        if(GCOV STREQUAL "ON")
--        ADD_COMPILE_OPTIONS(--coverage -fprofile-arcs -ftest-coverage)
--        endif()
--        SET(OPENSSL_FLAGS -include base.h -Wno-error=maybe-uninitialized -Wno-error=format -Wno-format -Wno-error=unused-but-set-variable -Wno-cast-qual -Wno-error=implicit-function-declaration)
--        SET(CMOCKA_FLAGS -std=gnu99 -Wpedantic -Wall -Wshadow -Wmissing-prototypes -Wcast-align -Werror=address -Wstrict-prototypes -Werror=strict-prototypes -Wwrite-strings -Werror=write-strings -Werror-implicit-function-declaration -Wpointer-arith -Werror=pointer-arith -Wdeclaration-after-statement -Werror=declaration-after-statement -Wreturn-type -Werror=return-type -Wuninitialized -Werror=uninitialized -Werror=strict-overflow -Wstrict-overflow=2 -Wno-format-zero-length -Wmissing-field-initializers -Wformat-security -Werror=format-security -fno-common -Wformat -fno-common -fstack-protector-strong -Wno-cast-qual)
--
--        SET(CMAKE_LINKER ${CMAKE_C_COMPILER})
--        SET(CMAKE_EXE_LINKER_FLAGS "-flto -Wno-error -no-pie" )
--        if(GCOV STREQUAL "ON")
--        SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS}  --coverage -lgcov -fprofile-arcs -ftest-coverage")
--        endif()
--        SET(CMAKE_C_LINK_EXECUTABLE "<CMAKE_LINKER> <CMAKE_C_LINK_FLAGS> <LINK_FLAGS> <OBJECTS> -o <TARGET> -Wl,--start-group <LINK_LIBRARIES> -Wl,--end-group")
--
-     endif()
- 
-     if(NOT TOOLCHAIN STREQUAL "NIOS2_GCC")
--- 
-2.43.2
-
diff --git a/package/libspdm/libspdm.hash b/package/libspdm/libspdm.hash
index 32415bcfce..93a8d933cc 100644
--- a/package/libspdm/libspdm.hash
+++ b/package/libspdm/libspdm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0ee460c0ce5c4d126ca65f9c4bdabd5725b87cec7160b2d06721169df58f3a95  libspdm-3.2.0.tar.gz
-sha256  7dc072bff163df39209bbb63e0916f4667c2a84cf3c36ccc84ec7425bc3e4779  LICENSE.md
+sha256  44f967aeb0c481676affe59069615252854bc0c072368ce4b26b6809a54daff5  libspdm-3.4.0.tar.gz
+sha256  c6ffa7e6889e63893078cb21b89594070183f7e2cf5b4ea01a4fb23eac59ed32  LICENSE.md
diff --git a/package/libspdm/libspdm.mk b/package/libspdm/libspdm.mk
index 2ec35be0ac..e86a79ed67 100644
--- a/package/libspdm/libspdm.mk
+++ b/package/libspdm/libspdm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSPDM_VERSION = 3.2.0
+LIBSPDM_VERSION = 3.4.0
 LIBSPDM_SITE = $(call github,DMTF,libspdm,$(LIBSPDM_VERSION))
 LIBSPDM_LICENSE = BSD-3-Clause
 LIBSPDM_LICENSE_FILES = LICENSE.md
@@ -17,6 +17,11 @@ LIBSPDM_DEPENDENCIES = openssl
 
 LIBSPDM_TARGET_CPU_FAMILY = $(call qstrip,$(BR2_PACKAGE_LIBSPDM_CPU_FAMILY))
 
+LIBSPDM_CFLAGS = \
+	$(TARGET_CFLAGS) \
+	-DLIBSPDM_ENABLE_CAPABILITY_EVENT_CAP=0 \
+	-DLIBSPDM_ENABLE_CAPABILITY_MEL_CAP=0
+
 LIBSPDM_CONF_OPTS = \
 	-DARCH=$(LIBSPDM_TARGET_CPU_FAMILY) \
 	-DTOOLCHAIN=NONE \
@@ -27,7 +32,8 @@ LIBSPDM_CONF_OPTS = \
 	-DCOMPILED_LIBSSL_PATH=/usr/lib/ \
 	-DDISABLE_TESTS=1 \
 	-DDISABLE_EDDSA=1 \
-	-DLINK_FLAGS=$(STAGING_DIR)
+	-DLINK_FLAGS=$(STAGING_DIR) \
+	-DCMAKE_C_FLAGS="$(LIBSPDM_CFLAGS)"
 
 define LIBSPDM_INSTALL_STAGING_CMDS
 	mkdir -p $(STAGING_DIR)/usr/lib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
