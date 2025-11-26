Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556A5D111A8
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 20:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2912D6175C;
	Thu, 27 Nov 2025 20:08:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z05CUuk1u8kt; Thu, 27 Nov 2025 20:08:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D41261B50
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D41261B50;
	Thu, 27 Nov 2025 20:08:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AC082A9
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9016A8442D
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:07:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9S6nBkjyQZQa for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 20:07:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E45584417
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E45584417
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:07:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C79B848DA; Thu, 27 Nov 2025 20:07:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Nov 2025 09:19:46 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 94dae0d30eed499957b3d0c5ad27b3da4ffdc7f7
X-Git-Newrev: 35d3f91669f119638a2a91f47b6b1cd829832db5
X-Patchwork-Hint: ignore
Message-Id: <20251127200756.8C79B848DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/mongrel2: remove
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=35d3f91669f119638a2a91f47b6b1cd829832db5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

mongrel2 is incompatible with MbedTLS 3.6 and was removed from Debian
stable/testing:
https://tracker.debian.org/pkg/mongrel2
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1075866

Upstream report from 2023 exists:
https://github.com/mongrel2/mongrel2/issues/359
but went unanswered, the last upstream commit was in Dec 2021:
https://github.com/mongrel2/mongrel2/commits/master/

Since no other package uses mongrel2 we can safely remove this
unmaintained package.

Fixes:
https://autobuild.buildroot.net/results/6c1/6c17827d21135886b1f4822174a4a963ca6325bf/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c41af1dcc09427e9a4a71e98cccc3aca7b5e0554)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                                |  2 -
 Config.in.legacy                                   |  6 ++
 DEVELOPERS                                         |  3 -
 package/Config.in                                  |  1 -
 package/mongrel2/0001-Do-not-run-tests.patch       | 45 -------------
 .../0002-Fix-Makefiles-for-cross-compilation.patch | 78 ----------------------
 package/mongrel2/0003-fix-build-with-gcc-4.8.patch | 62 -----------------
 package/mongrel2/Config.in                         | 33 ---------
 package/mongrel2/mongrel2.hash                     |  6 --
 package/mongrel2/mongrel2.mk                       | 26 --------
 10 files changed, 6 insertions(+), 256 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index b986e6fce8..5e5b11883b 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -754,8 +754,6 @@ package/mini-snmpd/0001-linux.c-fix-musl-build.patch lib_patch.Upstream
 package/minidlna/S60minidlnad Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/minissdpd/S50minissdpd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/modem-manager/S44modem-manager Shellcheck lib_sysv.Variables
-package/mongrel2/0001-Do-not-run-tests.patch lib_patch.Upstream
-package/mongrel2/0002-Fix-Makefiles-for-cross-compilation.patch lib_patch.Upstream
 package/monit/0001-Do-not-force-building-a-statically-linked-binary.patch lib_patch.Upstream
 package/mono-gtksharp3/0001-Fixes-MONO_PROFILE_ENTER_LEAVE-undeclared.patch lib_patch.Upstream
 package/mono-gtksharp3/0002-Mono-compilation-error-branch.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 81006945a7..18e5fed951 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2025.02.9"
 
+config BR2_PACKAGE_MONGREL2
+	bool "mongrel2 has been removed"
+	select BR2_LEGACY
+	help
+	  mongrel2 is incompatible with MbedTLS 3.6 and has been removed
+
 config BR2_PACKAGE_BCTOOLBOX
 	bool "bctoolbox has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index a8d4392b10..e972d165d2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2091,9 +2091,6 @@ F:	package/python-gunicorn/
 F:	support/testing/tests/package/sample_python_flask.py
 F:	support/testing/tests/package/test_python_flask.py
 
-N:	Lionel Orry <lionel.orry@gmail.com>
-F:	package/mongrel2/
-
 N:	Lothar Felten <lothar.felten@gmail.com>
 F:	board/bananapi/bananapi-m2-ultra/
 F:	board/beagleboard/beaglebone/
diff --git a/package/Config.in b/package/Config.in
index ec08acebf8..4ebfab7a82 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2536,7 +2536,6 @@ endif
 	source "package/minissdpd/Config.in"
 	source "package/mjpg-streamer/Config.in"
 	source "package/modem-manager/Config.in"
-	source "package/mongrel2/Config.in"
 	source "package/mosh/Config.in"
 	source "package/mosquitto/Config.in"
 	source "package/mrouted/Config.in"
diff --git a/package/mongrel2/0001-Do-not-run-tests.patch b/package/mongrel2/0001-Do-not-run-tests.patch
deleted file mode 100644
index 3b72aef3c5..0000000000
--- a/package/mongrel2/0001-Do-not-run-tests.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 3cbef2195533f357c8a80c2840108662461273b7 Mon Sep 17 00:00:00 2001
-From: Lionel Orry <lionel.orry@gmail.com>
-Date: Wed, 27 Mar 2013 14:48:19 +0100
-Subject: [PATCH] Do not run tests.
-
-This patch is specific to cross-compiled environments and avoids running
-the tests on the host. It is not meant to be applied upstream.
-
-Signed-off-by: Lionel Orry <lionel.orry@gmail.com>
-[Dario: make the patch to be applied with fuzz factor 0]
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
----
- Makefile            | 2 +-
- tools/m2sh/Makefile | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 7dc4089..ca72630 100644
---- a/Makefile
-+++ b/Makefile
-@@ -18,7 +18,7 @@
- TESTS=$(patsubst %.c,%,${TEST_SRC})
- MAKEOPTS=OPTFLAGS="${CFLAGS} ${NOEXTCFLAGS} ${OPTFLAGS}" LDFLAGS="${LDFLAGS}" LIBS="${LIBS}" DESTDIR="${DESTDIR}" PREFIX="${PREFIX}"
- 
--all: bin/mongrel2 tests m2sh procer
-+all: bin/mongrel2 m2sh procer filters config_modules
- 
- ${OBJECTS_NOEXT}: CFLAGS += ${NOEXTCFLAGS}
- ${OBJECTS}: | builddirs
-diff --git a/tools/m2sh/Makefile b/tools/m2sh/Makefile
-index b50d8a0..334e4da 100644
---- a/tools/m2sh/Makefile
-+++ b/tools/m2sh/Makefile
-@@ -12,7 +12,7 @@
- 
- $(RAGEL_OBJECTS): CFLAGS += -Wno-unused-const-variable -Wimplicit-fallthrough=0 -Wno-unused-parameter
- 
--all: ../lemon/lemon tests build/m2sh
-+all: ../lemon/lemon build/m2sh
- 
- dev: CFLAGS=-g -Wall -Wextra -Isrc -I../../src $(OPTFLAGS)
- dev: all
--- 
-1.8.1.4
-
diff --git a/package/mongrel2/0002-Fix-Makefiles-for-cross-compilation.patch b/package/mongrel2/0002-Fix-Makefiles-for-cross-compilation.patch
deleted file mode 100644
index 1961f128ed..0000000000
--- a/package/mongrel2/0002-Fix-Makefiles-for-cross-compilation.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 298356c44a7df2b34c4e307c531d2010e2cb4b79 Mon Sep 17 00:00:00 2001
-From: Lionel Orry <lionel.orry@gmail.com>
-Date: Wed, 27 Mar 2013 15:56:56 +0100
-Subject: [PATCH] Fix Makefiles for cross-compilation
-
-The CFLAGS handling in mongrel2 is really messy and it is hard to make
-it behave correctly with cross-compiling environments. This patch
-restricts the Makefiles syntax to GNU Make, but help cross-compiling.
-
-This is not meant to be applied upstream.
-
-Signed-off-by: Lionel Orry <lionel.orry@gmail.com>
-[Fabrice: refresh for 1.12.2]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- Makefile                      | 2 +-
- tools/config_modules/Makefile | 2 +-
- tools/filters/Makefile        | 2 +-
- tools/m2sh/Makefile           | 2 +-
- tools/procer/Makefile         | 2 +-
- 5 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 4e89c33..2f549a8 100644
---- a/Makefile
-+++ b/Makefile
-@@ -1,5 +1,5 @@
- CFLAGS?=-g -O2
--CFLAGS += -Wall -Wextra -Wno-implicit-fallthrough -Wno-unused-const-variable -I./src -DNDEBUG -D_FILE_OFFSET_BITS=64 -pthread
-+override CFLAGS += -Wall -Wextra -Wno-implicit-fallthrough -Wno-unused-const-variable -I./src -DNDEBUG -D_FILE_OFFSET_BITS=64 -pthread
- CFLAGS += ${OPTFLAGS}
- LIBS+=-lzmq -ldl -lsqlite3 -lmbedtls -lmbedx509 -lmbedcrypto
- PREFIX?=/usr/local
-diff --git a/tools/config_modules/Makefile b/tools/config_modules/Makefile
-index c2680d1..ada3169 100644
---- a/tools/config_modules/Makefile
-+++ b/tools/config_modules/Makefile
-@@ -1,5 +1,5 @@
- PREFIX?=/usr/local
--CFLAGS=-I../../src -I../../src/mbedtls/include $(OPTFLAGS) -fPIC -shared -nostartfiles -L../../build
-+override CFLAGS=-I../../src -I../../src/mbedtls/include $(OPTFLAGS) -fPIC -shared -nostartfiles -L../../build
- LDFLAGS=$(OPTLIBS)
- 
- MONGO_SRC = mongo-c-driver/src/bson.c \
-diff --git a/tools/filters/Makefile b/tools/filters/Makefile
-index 6505ad5..a968ef6 100644
---- a/tools/filters/Makefile
-+++ b/tools/filters/Makefile
-@@ -1,5 +1,5 @@
- PREFIX?=/usr/local
--CFLAGS=-I../../src -I../../src/mbedtls/include $(OPTFLAGS) -g -fPIC -shared -nostartfiles -L../../build
-+override CFLAGS=-I../../src -I../../src/mbedtls/include $(OPTFLAGS) -g -fPIC -shared -nostartfiles -L../../build
- LDFLAGS=$(OPTLIBS)
- 
- all: null.so rewrite.so sendfile.so
-diff --git a/tools/m2sh/Makefile b/tools/m2sh/Makefile
-index b50d8a0..cc00062 100644
---- a/tools/m2sh/Makefile
-+++ b/tools/m2sh/Makefile
-@@ -1,4 +1,4 @@
--CFLAGS=-DNDEBUG -DNO_LINENOS -pthread -g -I../../src -Isrc -Wall $(OPTFLAGS)
-+override CFLAGS=-DNDEBUG -DNO_LINENOS -pthread -g -I../../src -Isrc -Wall $(OPTFLAGS)
- LIBS=-lzmq -lsqlite3 ../../build/libm2.a $(OPTLIBS)
- 
- PREFIX?=/usr/local
-diff --git a/tools/procer/Makefile b/tools/procer/Makefile
-index bb9aa31..d377f7f 100644
---- a/tools/procer/Makefile
-+++ b/tools/procer/Makefile
-@@ -1,4 +1,4 @@
--CFLAGS=-DNDEBUG -pthread -g -I../../src -Wall $(OPTFLAGS)
-+override CFLAGS=-DNDEBUG -pthread -g -I../../src -Wall $(OPTFLAGS)
- PREFIX?=/usr/local
- LIBS?=-lzmq 
- SOURCES=$(wildcard *.c)
--- 
-2.27.0
-
diff --git a/package/mongrel2/0003-fix-build-with-gcc-4.8.patch b/package/mongrel2/0003-fix-build-with-gcc-4.8.patch
deleted file mode 100644
index 996cd3246b..0000000000
--- a/package/mongrel2/0003-fix-build-with-gcc-4.8.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From cc2dd3995dc9a9e6f0e705e11e791f3f3c7d7326 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 18 Jan 2022 22:41:36 +0100
-Subject: [PATCH] fix build with gcc 4.8
-
-Drop "-Wno-unused-const-variable -Wimplicit-fallthrough=0" as
-"-Wno-implicit-fallthrough -Wno-unused-const-variable" is already set in
-CFLAGS. This will avoid the following build failure with gcc 4.8 raised
-since version 1.13.0 and
-https://github.com/mongrel2/mongrel2/commit/725209578599bd7784753d86aee34f6441ff78a5:
-
-arm-none-linux-gnueabi-gcc: error: unrecognized command line option '-Wimplicit-fallthrough=0'
-
-Fixes:
- - http://autobuild.buildroot.org/results/de324b733e09057c87352220069fe65f6e535eb8
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/mongrel2/mongrel2/pull/354
-[Dario: make the patch to be applied with fuzz factor 0]
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
----
- Makefile            | 1 -
- tools/m2sh/Makefile | 4 ++--
- 2 files changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index f6627ed..fb8d028 100644
---- a/Makefile
-+++ b/Makefile
-@@ -22,7 +22,6 @@ all: bin/mongrel2 tests m2sh procer
- 
- ${OBJECTS_NOEXT}: CFLAGS += ${NOEXTCFLAGS}
- ${OBJECTS}: | builddirs
--$(RAGEL_OBJECTS): CFLAGS += -Wno-unused-const-variable -Wimplicit-fallthrough=0
- 
- .PHONY: builddirs
- builddirs:
-diff --git a/tools/m2sh/Makefile b/tools/m2sh/Makefile
-index 83e7ae4..86364af 100644
---- a/tools/m2sh/Makefile
-+++ b/tools/m2sh/Makefile
-@@ -10,7 +10,7 @@
- LIB_OBJ=$(filter-out src/m2sh.o,${OBJECTS})
- RAGEL_OBJECTS=src/lexer.o src/cli.o
- 
--$(RAGEL_OBJECTS): CFLAGS += -Wno-unused-const-variable -Wimplicit-fallthrough=0 -Wno-unused-parameter
-+$(RAGEL_OBJECTS): CFLAGS += -Wno-unused-parameter
- 
- all: ../lemon/lemon build/m2sh
- 
-@@ -20,7 +20,7 @@
- install: build/m2sh
- 	install build/m2sh ${DESTDIR}${PREFIX}/bin
- 
--src/parser.o: CFLAGS += -Wno-unused-const-variable -Wno-unused-parameter
-+src/parser.o: CFLAGS += -Wno-unused-parameter
- 
- build/libm2sh.a: ${LIB_OBJ}
- 	mkdir -p build
--- 
-2.34.1
-
diff --git a/package/mongrel2/Config.in b/package/mongrel2/Config.in
deleted file mode 100644
index 60fee6f96d..0000000000
--- a/package/mongrel2/Config.in
+++ /dev/null
@@ -1,33 +0,0 @@
-# mongrel2 uses {get,make,swap}context() functions, which are
-# available in glibc for all architectures and in uClibc only for a
-# subset of the architectures
-config BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS
-	bool
-	default y if BR2_TOOLCHAIN_USES_GLIBC
-	default y if BR2_TOOLCHAIN_USES_UCLIBC && \
-		(BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || BR2_sparc || BR2_x86_64)
-
-comment "mongrel2 needs a uClibc or glibc toolchain w/ C++, threads, dynamic library"
-	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
-		!BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS
-
-config BR2_PACKAGE_MONGREL2
-	bool "mongrel2"
-	depends on BR2_INSTALL_LIBSTDCPP # zeromq
-	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
-	depends on !BR2_STATIC_LIBS # uses dlopen()
-	depends on BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS
-	select BR2_PACKAGE_MBEDTLS
-	select BR2_PACKAGE_SQLITE
-	select BR2_PACKAGE_ZEROMQ
-	help
-	  Mongrel2 is an application, language, and network architecture
-	  agnostic web server that focuses on web applications using
-	  modern browser technologies.
-
-	  Mongrel2 supports 17 languages and platforms, HTTP, Flash
-	  sockets, WebSockets, Long Polling, and many ways to deploy
-	  and hack on it.
-
-	  http://www.mongrel2.org
diff --git a/package/mongrel2/mongrel2.hash b/package/mongrel2/mongrel2.hash
deleted file mode 100644
index f4f094ea03..0000000000
--- a/package/mongrel2/mongrel2.hash
+++ /dev/null
@@ -1,6 +0,0 @@
-# From https://mongrel2.org
-sha1  6057f9cbfae41e2cdef1e0f715df3c1a4d3a1884  mongrel2-v1.13.0.tar.bz2
-
-# Locally computed
-sha256  b6f1f50c9f65b605342d8792b1cc8a1c151105339030313b9825b6a68d400c10  mongrel2-v1.13.0.tar.bz2
-sha256  eb6e2a2baa637d06f6aa762886fbc8939934eb5fdb0b3a5b3882f2a61e9a4357  LICENSE
diff --git a/package/mongrel2/mongrel2.mk b/package/mongrel2/mongrel2.mk
deleted file mode 100644
index 07914ad0fe..0000000000
--- a/package/mongrel2/mongrel2.mk
+++ /dev/null
@@ -1,26 +0,0 @@
-################################################################################
-#
-# mongrel2
-#
-################################################################################
-
-MONGREL2_VERSION = 1.13.0
-MONGREL2_SOURCE = mongrel2-v$(MONGREL2_VERSION).tar.bz2
-# Do not use the github helper here, the generated tarball is *NOT* the same
-# as the one uploaded by upstream for the release.
-MONGREL2_SITE = https://github.com/mongrel2/mongrel2/releases/download/v$(MONGREL2_VERSION)
-MONGREL2_LICENSE = BSD-3-Clause
-MONGREL2_LICENSE_FILES = LICENSE
-MONGREL2_DEPENDENCIES = mbedtls sqlite zeromq
-
-define MONGREL2_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
-		PREFIX=/usr all
-endef
-
-define MONGREL2_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
-		PREFIX=/usr DESTDIR=$(TARGET_DIR) install
-endef
-
-$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
