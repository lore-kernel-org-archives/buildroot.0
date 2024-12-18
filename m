Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A473C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAE36846B1;
	Fri, 28 Feb 2025 16:42:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nvXucjah1pdF; Fri, 28 Feb 2025 16:42:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 763D0844C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 763D0844C7;
	Fri, 28 Feb 2025 16:42:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 108331DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84F694269A
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zLcXNmZB_ohs for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 163F84195D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 163F84195D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1301985E20; Fri, 28 Feb 2025 16:29:43 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 18 Dec 2024 20:59:51 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c583befc8e92d0ae70d4fcb967bf8257ea94d577
X-Git-Newrev: b4bffa0c9bd9521d648d8d8ccad22d1ca3c83bf0
X-Patchwork-Hint: ignore
Message-Id: <20250228162943.1301985E20@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mongodb: remove package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b4bffa0c9bd9521d648d8d8ccad22d1ca3c83bf0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The mongodb package has not been updated in close to 3 years (since commit
49bbf644d4acd "package/mongodb: security bump to version 4.2.18") and the
4.2.x series is EOL since April 2023:

https://www.mongodb.com/legal/support-policy/lifecycles

There are no reverse dependencies, so drop the package.  If a maintainer
steps up to support it, then (a newer version of) the package can be
re-added later.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Julien: remove .checkpackageignore entries to fix check-package errors]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |   2 -
 Config.in.legacy                                   |   6 ++
 DEVELOPERS                                         |   1 -
 package/Config.in                                  |   1 -
 ....cpp-fix-build-with-gcc-7-and-fpermissive.patch |  55 -----------
 ...b-exec-plan_stats.h-fix-build-with-gcc-11.patch |  44 ---------
 package/mongodb/Config.in                          |  42 ---------
 package/mongodb/mongodb.hash                       |   4 -
 package/mongodb/mongodb.mk                         | 104 ---------------------
 9 files changed, 6 insertions(+), 253 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 41c970efa6..1c1d0dab3a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -849,8 +849,6 @@ package/mini-snmpd/0001-linux.c-fix-musl-build.patch lib_patch.Upstream
 package/minidlna/S60minidlnad Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/minissdpd/S50minissdpd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/modem-manager/S44modem-manager Shellcheck lib_sysv.Variables
-package/mongodb/0001-ssl_manager.cpp-fix-build-with-gcc-7-and-fpermissive.patch lib_patch.Upstream
-package/mongodb/0002-src-mongo-db-exec-plan_stats.h-fix-build-with-gcc-11.patch lib_patch.Upstream
 package/mongrel2/0001-Do-not-run-tests.patch lib_patch.Upstream
 package/mongrel2/0002-Fix-Makefiles-for-cross-compilation.patch lib_patch.Upstream
 package/monit/0001-no-force-static.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 2e6dfce5ea..8e037d9170 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2025.02"
 
+config BR2_PACKAGE_MONGODB
+	bool "mongodb has been removed"
+	select BR2_LEGACY
+	help
+	  The mongodb package has been removed as it was unmaintained.
+
 config BR2_PACKAGE_PYTHON_M2CRYPTO
 	bool "python-m2crypto has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index eabbc7eb20..492eb765e0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1060,7 +1060,6 @@ F:	package/mbedtls/
 F:	package/minissdpd/
 F:	package/minizip/
 F:	package/minizip-zlib/
-F:	package/mongodb/
 F:	package/motion/
 F:	package/mutt/
 F:	package/ncmpc/
diff --git a/package/Config.in b/package/Config.in
index 1541c85e53..feb4840a7d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1656,7 +1656,6 @@ menu "Database"
 	source "package/libpqxx/Config.in"
 	source "package/lmdb/Config.in"
 	source "package/mariadb/Config.in"
-	source "package/mongodb/Config.in"
 	source "package/postgresql/Config.in"
 if BR2_PACKAGE_POSTGRESQL
 	source "package/osm2pgsql/Config.in"
diff --git a/package/mongodb/0001-ssl_manager.cpp-fix-build-with-gcc-7-and-fpermissive.patch b/package/mongodb/0001-ssl_manager.cpp-fix-build-with-gcc-7-and-fpermissive.patch
deleted file mode 100644
index b4b1746682..0000000000
--- a/package/mongodb/0001-ssl_manager.cpp-fix-build-with-gcc-7-and-fpermissive.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 362be06fc16a5ad0f9e9aa90cc763c5242e8e35c Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 9 Feb 2019 12:41:45 +0100
-Subject: [PATCH] ssl_manager.cpp: fix build with gcc 7 and -fpermissive
-
-Change prototype of DERToken::parse function from
-parse(ConstDataRange cdr, size_t* outLength);
-to parse(ConstDataRange cdr, uint64_t* outLength);
-
-Otherwise, we got the following error:
-
-src/mongo/util/net/ssl_manager.cpp: In static member function 'static mongo::StatusWith<mongo::{anonymous}::DERToken> mongo::{anonymous}::DERToken::parse(mongo::ConstDataRange, size_t*)':
-src/mongo/util/net/ssl_manager.cpp:575:79: error: invalid conversion from 'size_t* {aka unsigned int*}' to 'long unsigned int*' [-fpermissive]
-  if (mongoUnsignedAddOverflow64(tagAndLengthByteCount, derLength, outLength) ||
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/mongodb/mongo/pull/1296]
----
- src/mongo/util/net/ssl_manager.cpp | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/mongo/util/net/ssl_manager.cpp b/src/mongo/util/net/ssl_manager.cpp
-index b93ebe84a4..3511eb5d99 100644
---- a/src/mongo/util/net/ssl_manager.cpp
-+++ b/src/mongo/util/net/ssl_manager.cpp
-@@ -782,7 +782,7 @@ public:
-      *
-      * Returns a DERToken which consists of the (tag, length, value) tuple.
-      */
--    static StatusWith<DERToken> parse(ConstDataRange cdr, size_t* outLength);
-+    static StatusWith<DERToken> parse(ConstDataRange cdr, uint64_t* outLength);
- 
- private:
-     DERType _type{DERType::EndOfContent};
-@@ -799,7 +799,7 @@ struct DataType::Handler<DERToken> {
-                        size_t length,
-                        size_t* advanced,
-                        std::ptrdiff_t debug_offset) {
--        size_t outLength;
-+        uint64_t outLength;
- 
-         auto swPair = DERToken::parse(ConstDataRange(ptr, length), &outLength);
- 
-@@ -844,7 +844,7 @@ StatusWith<std::string> readDERString(ConstDataRangeCursor& cdc) {
- }
- 
- 
--StatusWith<DERToken> DERToken::parse(ConstDataRange cdr, size_t* outLength) {
-+StatusWith<DERToken> DERToken::parse(ConstDataRange cdr, uint64_t* outLength) {
-     const size_t kTagLength = 1;
-     const size_t kTagLengthAndInitialLengthByteLength = kTagLength + 1;
- 
--- 
-2.14.1
-
diff --git a/package/mongodb/0002-src-mongo-db-exec-plan_stats.h-fix-build-with-gcc-11.patch b/package/mongodb/0002-src-mongo-db-exec-plan_stats.h-fix-build-with-gcc-11.patch
deleted file mode 100644
index e96a65252c..0000000000
--- a/package/mongodb/0002-src-mongo-db-exec-plan_stats.h-fix-build-with-gcc-11.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 0941e560850d54160c24778fa66b605714fd5012 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 9 Aug 2021 21:18:50 +0200
-Subject: [PATCH] src/mongo/db/exec/plan_stats.h: fix build with gcc
- 11
-
-Fix the following build failure with gcc 11:
-
-In file included from src/mongo/db/query/plan_cache.h:36,
-                 from src/mongo/db/catalog/collection_info_cache.h:33,
-                 from src/mongo/db/catalog/collection.h:42,
-                 from src/mongo/db/exec/requires_collection_stage.h:32,
-                 from src/mongo/db/exec/delete.h:32,
-                 from src/mongo/db/query/internal_plans.h:33,
-                 from src/mongo/db/query/internal_plans.cpp:32:
-src/mongo/db/exec/plan_stats.h:214:10: error: 'optional' in namespace 'std' does not name a template type
-  214 |     std::optional<std::string> replanReason;
-      |          ^~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/8c0875fa413923504515a83d8b679366418c2444
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: already fixed by
-https://github.com/mongodb/mongo/commit/e78b2bf6eaa0c43bd76dbb841add167b443d2bb0]
----
- src/mongo/db/exec/plan_stats.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/mongo/db/exec/plan_stats.h b/src/mongo/db/exec/plan_stats.h
-index 43053e27be..813e4edc9e 100644
---- a/src/mongo/db/exec/plan_stats.h
-+++ b/src/mongo/db/exec/plan_stats.h
-@@ -31,6 +31,7 @@
- 
- #include <cstdint>
- #include <cstdlib>
-+#include <optional>
- #include <string>
- #include <vector>
- 
--- 
-2.30.2
-
diff --git a/package/mongodb/Config.in b/package/mongodb/Config.in
deleted file mode 100644
index 1ea4282573..0000000000
--- a/package/mongodb/Config.in
+++ /dev/null
@@ -1,42 +0,0 @@
-# from https://docs.mongodb.com/manual/installation/#supported-platforms
-config BR2_PACKAGE_MONGODB_ARCH_SUPPORTS
-	bool
-	# ARM needs LDREX/STREX, so ARMv6+
-	default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
-	default y if BR2_aarch64 || BR2_x86_64
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
-
-config BR2_PACKAGE_MONGODB
-	bool "mongodb"
-	depends on BR2_PACKAGE_MONGODB_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_USES_GLIBC # needs glibc malloc_usable_size
-	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
-	select BR2_PACKAGE_BOOST
-	select BR2_PACKAGE_BOOST_FILESYSTEM
-	select BR2_PACKAGE_BOOST_IOSTREAMS
-	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
-	select BR2_PACKAGE_BOOST_SYSTEM
-	select BR2_PACKAGE_PCRE
-	select BR2_PACKAGE_PCRE_UTF # runtime
-	select BR2_PACKAGE_SNAPPY
-	select BR2_PACKAGE_SQLITE
-	select BR2_PACKAGE_YAML_CPP
-	select BR2_PACKAGE_ZLIB
-	help
-	  MongoDB is a cross-platform document-oriented database
-	  (NoSQL).
-
-	  It uses JSON-like documents with dynamic schemas (BSON),
-	  making the integration of data in certain types of
-	  applications easier and faster.
-
-	  https://www.mongodb.org/
-
-comment "mongodb needs a glibc toolchain w/ wchar, threads, C++, gcc >= 7"
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_GLIBC || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
-	depends on BR2_PACKAGE_MONGODB_ARCH_SUPPORTS
diff --git a/package/mongodb/mongodb.hash b/package/mongodb/mongodb.hash
deleted file mode 100644
index 02da8ad452..0000000000
--- a/package/mongodb/mongodb.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# Locally computed:
-sha256  5bbb9567cc1f358ac7d9f37d9fe749862728bdf9f742d1dfc5e35a8b6c2985ba  mongodb-src-r4.2.18.tar.gz
-sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  APACHE-2.0.txt
-sha256  09d99ca61eb07873d5334077acba22c33e7f7d0a9fa08c92734e0ac8430d6e27  LICENSE-Community.txt
diff --git a/package/mongodb/mongodb.mk b/package/mongodb/mongodb.mk
deleted file mode 100644
index 9f6c7d31b8..0000000000
--- a/package/mongodb/mongodb.mk
+++ /dev/null
@@ -1,104 +0,0 @@
-################################################################################
-#
-# mongodb
-#
-################################################################################
-
-MONGODB_VERSION = 4.2.18
-MONGODB_SITE = https://fastdl.mongodb.org/src
-MONGODB_SOURCE = mongodb-src-r$(MONGODB_VERSION).tar.gz
-
-MONGODB_LICENSE = Apache-2.0 (drivers), SSPL (database)
-MONGODB_LICENSE_FILES = APACHE-2.0.txt LICENSE-Community.txt
-
-MONGODB_CPE_ID_VENDOR = mongodb
-MONGODB_SELINUX_MODULES = mongodb
-
-MONGODB_DEPENDENCIES = \
-	boost \
-	host-python-cheetah \
-	host-python-psutil \
-	host-python-pyyaml \
-	host-python-regex \
-	host-python-requests \
-	host-scons \
-	pcre \
-	snappy \
-	sqlite \
-	yaml-cpp \
-	zlib
-
-MONGODB_SCONS_TARGETS = mongod mongos
-
-MONGODB_SCONS_ENV = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" \
-	-j"$(PARALLEL_JOBS)"
-
-MONGODB_SCONS_OPTS = \
-	--disable-minimum-compiler-version-enforcement \
-	--disable-warnings-as-errors \
-	--use-system-boost \
-	--use-system-pcre \
-	--use-system-snappy \
-	--use-system-sqlite \
-	--use-system-yaml \
-	--use-system-zlib
-
-# need to pass mongo version when not building from git repo
-MONGODB_SCONS_OPTS += MONGO_VERSION=$(MONGODB_VERSION)-
-
-# WiredTiger database storage engine only supported on 64 bits
-ifeq ($(BR2_ARCH_IS_64),y)
-MONGODB_SCONS_OPTS += --wiredtiger=on
-else
-MONGODB_SCONS_OPTS += --wiredtiger=off
-endif
-
-# JavaScript scripting engine and tcmalloc supported only on
-# x86/x86-64 systems. Mongo target is a shell interface that
-# depends on the javascript engine, so it will also only be
-# built on x86/x86-64 systems.
-ifeq ($(BR2_i386)$(BR2_x86_64),y)
-MONGODB_SCONS_OPTS += --js-engine=mozjs --allocator=tcmalloc
-MONGODB_SCONS_TARGETS += mongo
-else
-MONGODB_SCONS_OPTS += --js-engine=none --allocator=system
-endif
-
-ifeq ($(BR2_PACKAGE_LIBCURL),y)
-MONGODB_DEPENDENCIES += libcurl
-MONGODB_SCONS_OPTS += \
-	--enable-free-mon=on \
-	--enable-http-client=on
-else
-MONGODB_SCONS_OPTS += \
-	--enable-free-mon=off \
-	--enable-http-client=off
-endif
-
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-MONGODB_DEPENDENCIES += openssl
-MONGODB_SCONS_OPTS += \
-	--ssl=on \
-	--ssl-provider=openssl
-else
-MONGODB_SCONS_OPTS += --ssl=off
-endif
-
-define MONGODB_BUILD_CMDS
-	(cd $(@D); \
-		$(SCONS) \
-		$(MONGODB_SCONS_ENV) \
-		$(MONGODB_SCONS_OPTS) \
-		$(MONGODB_SCONS_TARGETS))
-endef
-
-define MONGODB_INSTALL_TARGET_CMDS
-	(cd $(@D); \
-		$(SCONS) \
-		$(MONGODB_SCONS_ENV) \
-		$(MONGODB_SCONS_OPTS) \
-		--prefix=$(TARGET_DIR)/usr \
-		install)
-endef
-
-$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
