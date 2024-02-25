Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB5FC54E49
	for <buildroot@archiver.kernel.org>; Sun, 25 Feb 2024 23:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A955819E6;
	Sun, 25 Feb 2024 23:09:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lKHdUW5QmfWY; Sun, 25 Feb 2024 23:09:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89CB181BA9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89CB181BA9;
	Sun, 25 Feb 2024 23:09:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 992C81BF3F3
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 23:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8619281BA9
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 23:09:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g90dYavFp8cX for <buildroot@lists.busybox.net>;
 Sun, 25 Feb 2024 23:09:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.154.42;
 helo=esa4.hgst.iphmx.com; envelope-from=prvs=77804f0f4=wilfred.mallawa@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 33647819E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33647819E6
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 33647819E6
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 23:09:34 +0000 (UTC)
X-CSE-ConnectionGUID: JZpd2VctT1m77aUohOPkgw==
X-CSE-MsgGUID: FrPpAQsGRK+SDO1Q4YxQ2g==
X-IronPort-AV: E=Sophos;i="6.06,185,1705334400"; 
   d="scan'208";a="9725037"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 26 Feb 2024 07:09:33 +0800
IronPort-SDR: ybwf2fQXvT0WJujq4PfIlKk7gfDb0FfILXbuSvaErMwHlm2/4qGA4QaXRl+G+aJAY3ed1nq+CM
 Zlh/UuwXe25w==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Feb 2024 14:13:14 -0800
IronPort-SDR: i5TJIZyWLVoIh1qRJjDjwlzYdj8otXwmIIB57SgjLrGXQD9WzVVeymPj9u2o9FnVQJ9QXGWVFW
 bZyu2GCO0YUQ==
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.27])
 by uls-op-cesaip01.wdc.com with ESMTP; 25 Feb 2024 15:09:31 -0800
To: buildroot@buildroot.org
Date: Mon, 26 Feb 2024 09:09:04 +1000
Message-ID: <20240225230903.22005-2-wilfred.mallawa@wdc.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1708902575; x=1740438575;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MYrBy04b/S0Aule+QEcGYRypGE1LdMm5MGPzddcMV4I=;
 b=o8YgyjohSKY1yHGDuJydx8OnBiEQ8Vz6Hrh0MxLXhcDysxLVf8gdVRTc
 NsoGMy0StCzGuswaWmObyfh4xSs/qqW0aL+QGH3YfTRNZWDQTpiVoqV55
 +A/jlboOHBQho5WFtsHXmILsN+dimdqX7AA2OpVxwq4Ktw8ZVgQy6thcg
 yXuZ6aco2m8CBnams7UwIVZtvkQvUR7egp4D/39naicnnhOURhDW3r4gQ
 b/6+BzomkRGQrgHgiNMi6g9dEwNkIG9+jBE058LKe5KeHJ3bMg92lCuo1
 +e1Wyh7Kd9qhtrywIbmnfaZZJ6GHObpU/GCtabOu7xsR9ScGVdIc9XOP7
 w==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256
 header.s=dkim.wdc.com header.b=o8Ygyjoh
Subject: [Buildroot] [PATCH v2 1/1] package/libspdm: bump version to 3.2.0
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
From: Wilfred Mallawa via buildroot <buildroot@buildroot.org>
Reply-To: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair@alistair23.me>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Additionally, add an upstream patch that fixes the configuration for
"NONE" toolchain variant in libspdm. That is, where the build
environment provides compile/link options.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
Changes in V2:
	- Added missing "Upstream" URL to libspdm patch
---
 ...eLists-remove-fixed-options-for-NONE.patch | 52 +++++++++++++++++++
 package/libspdm/libspdm.hash                  |  2 +-
 package/libspdm/libspdm.mk                    |  2 +-
 3 files changed, 54 insertions(+), 2 deletions(-)
 create mode 100644 package/libspdm/0001-CMakeLists-remove-fixed-options-for-NONE.patch

diff --git a/package/libspdm/0001-CMakeLists-remove-fixed-options-for-NONE.patch b/package/libspdm/0001-CMakeLists-remove-fixed-options-for-NONE.patch
new file mode 100644
index 0000000000..0de0ad0079
--- /dev/null
+++ b/package/libspdm/0001-CMakeLists-remove-fixed-options-for-NONE.patch
@@ -0,0 +1,52 @@
+From d4d6b138d727e484fa9d0fef476ca181681d0695 Mon Sep 17 00:00:00 2001
+From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
+Date: Mon, 19 Feb 2024 09:56:14 +1000
+Subject: [PATCH] CMakeLists: remove fixed options for NONE
+
+The use of the NONE toolchain option is such that we can provide at the
+build project level (buildroot etc...). However, the changes introduced
+in 811f2b596def04b3a36368cf2098546d7907767f set certain compiler/linker
+option that does not comply with the definition of the options as
+specified in [1]. This change removes those options.
+
+[1] https://github.com/DMTF/libspdm/blob/main/doc/build.md#linux-builds-inside-build-environments
+
+Upstream: https://github.com/DMTF/libspdm/commit/d4d6b138d727e484fa9d0fef476ca181681d0695
+Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
+---
+ CMakeLists.txt | 19 -------------------
+ 1 file changed, 19 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 9c300cc817..f6cf17d269 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -618,25 +618,6 @@ if(CMAKE_SYSTEM_NAME MATCHES "Linux")
+         SET(CMAKE_EXE_LINKER_FLAGS "")
+ 
+         SET(CMAKE_C_LINK_EXECUTABLE "")
+-
+-    elseif(TOOLCHAIN STREQUAL "NONE")
+-        ADD_COMPILE_OPTIONS(-fshort-wchar -fno-strict-aliasing -Wall -Werror -Wno-array-bounds -ffunction-sections -fdata-sections -fno-common -Wno-address -fpie -fno-asynchronous-unwind-tables -flto -DUSING_LTO  -Wno-maybe-uninitialized -Wno-uninitialized  -Wno-builtin-declaration-mismatch -Wno-nonnull-compare -Werror-implicit-function-declaration)
+-        if(CMAKE_BUILD_TYPE STREQUAL "Debug")
+-            ADD_COMPILE_OPTIONS(-g)
+-        endif()
+-        if(GCOV STREQUAL "ON")
+-        ADD_COMPILE_OPTIONS(--coverage -fprofile-arcs -ftest-coverage)
+-        endif()
+-        SET(OPENSSL_FLAGS -include base.h -Wno-error=maybe-uninitialized -Wno-error=format -Wno-format -Wno-error=unused-but-set-variable -Wno-cast-qual -Wno-error=implicit-function-declaration)
+-        SET(CMOCKA_FLAGS -std=gnu99 -Wpedantic -Wall -Wshadow -Wmissing-prototypes -Wcast-align -Werror=address -Wstrict-prototypes -Werror=strict-prototypes -Wwrite-strings -Werror=write-strings -Werror-implicit-function-declaration -Wpointer-arith -Werror=pointer-arith -Wdeclaration-after-statement -Werror=declaration-after-statement -Wreturn-type -Werror=return-type -Wuninitialized -Werror=uninitialized -Werror=strict-overflow -Wstrict-overflow=2 -Wno-format-zero-length -Wmissing-field-initializers -Wformat-security -Werror=format-security -fno-common -Wformat -fno-common -fstack-protector-strong -Wno-cast-qual)
+-
+-        SET(CMAKE_LINKER ${CMAKE_C_COMPILER})
+-        SET(CMAKE_EXE_LINKER_FLAGS "-flto -Wno-error -no-pie" )
+-        if(GCOV STREQUAL "ON")
+-        SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS}  --coverage -lgcov -fprofile-arcs -ftest-coverage")
+-        endif()
+-        SET(CMAKE_C_LINK_EXECUTABLE "<CMAKE_LINKER> <CMAKE_C_LINK_FLAGS> <LINK_FLAGS> <OBJECTS> -o <TARGET> -Wl,--start-group <LINK_LIBRARIES> -Wl,--end-group")
+-
+     endif()
+ 
+     if(NOT TOOLCHAIN STREQUAL "NIOS2_GCC")
+-- 
+2.43.2
+
diff --git a/package/libspdm/libspdm.hash b/package/libspdm/libspdm.hash
index 23faba1c4b..32415bcfce 100644
--- a/package/libspdm/libspdm.hash
+++ b/package/libspdm/libspdm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  84d4a755f57b17775c63b5c8be646d518ce34d5d1b85994b6150ebce9d31b183  libspdm-3.1.1.tar.gz
+sha256  0ee460c0ce5c4d126ca65f9c4bdabd5725b87cec7160b2d06721169df58f3a95  libspdm-3.2.0.tar.gz
 sha256  7dc072bff163df39209bbb63e0916f4667c2a84cf3c36ccc84ec7425bc3e4779  LICENSE.md
diff --git a/package/libspdm/libspdm.mk b/package/libspdm/libspdm.mk
index 34dbb457c4..2ec35be0ac 100644
--- a/package/libspdm/libspdm.mk
+++ b/package/libspdm/libspdm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSPDM_VERSION = 3.1.1
+LIBSPDM_VERSION = 3.2.0
 LIBSPDM_SITE = $(call github,DMTF,libspdm,$(LIBSPDM_VERSION))
 LIBSPDM_LICENSE = BSD-3-Clause
 LIBSPDM_LICENSE_FILES = LICENSE.md
-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
