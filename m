Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695F8C433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 20:29:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28D368481D;
	Wed, 23 Mar 2022 20:29:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rIOpG1I1T2L7; Wed, 23 Mar 2022 20:29:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9C92847F9;
	Wed, 23 Mar 2022 20:29:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CD8C71BF48C
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 20:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9147940C71
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 20:27:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hPTOPErngJxX for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 20:27:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22B8340CBD
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 20:27:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 58323854C9; Wed, 23 Mar 2022 20:18:08 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 23 Mar 2022 21:09:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0fd31f073981a2cf586264bcde00ccd17ef9deb3
X-Git-Newrev: 5086d75cc8613a9730150662ca83dfa4592dfef0
X-Patchwork-Hint: ignore
Message-Id: <20220323201808.58323854C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/poco: bump to version 1.11.1
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
Content-Type: multipart/mixed; boundary="===============7666428583812220450=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7666428583812220450==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5086d75cc8613a9730150662ca83dfa4592dfef0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit drop patches, as they are now included upstream or no longer
needed. It also introduces a new patch to fix a build failure for nios2.

MySQL include and library paths can now be provided in variables passed
to the build command. Variables MYSQL_{INC,LIB}DIR are renamed to
POCO_MYSQL_{INCLUDE,LIB}. For PostgreSQL support, variables
POCO_PGSQL_{INCLUDE,LIB} are also passed the same way to the build
command.

This poco version 1.11.1 introduces a new ActiveRecord component.

For changelog, see:
https://raw.githubusercontent.com/pocoproject/poco/poco-1.11.1-release/CHANGELOG

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...OS2-double-conversion-detection-to-fix-co.patch | 36 +++++++++++++++++++
 ...-poco-add-the-staging-path-to-search-path.patch | 40 ----------------------
 .../poco/0002-Add-support-for-m68000-1856.patch    | 32 -----------------
 ...src-utils.h-backport-double-conversion-ch.patch | 34 ------------------
 package/poco/Config.in                             |  4 +++
 package/poco/poco.hash                             |  2 +-
 package/poco/poco.mk                               |  9 +++--
 7 files changed, 47 insertions(+), 110 deletions(-)

diff --git a/package/poco/0001-Add-back-NIOS2-double-conversion-detection-to-fix-co.patch b/package/poco/0001-Add-back-NIOS2-double-conversion-detection-to-fix-co.patch
new file mode 100644
index 0000000000..7b31729347
--- /dev/null
+++ b/package/poco/0001-Add-back-NIOS2-double-conversion-detection-to-fix-co.patch
@@ -0,0 +1,36 @@
+From d328829e9cb8b9fde9e70b07f2b991972cf474d1 Mon Sep 17 00:00:00 2001
+From: Julien Olivain <ju.o@free.fr>
+Date: Sat, 12 Mar 2022 10:34:04 +0100
+Subject: [PATCH] Add back NIOS2 double conversion detection to fix compile
+ errors
+
+The commit
+https://github.com/pocoproject/poco/commit/558324f672d824300498060aff63356bc6bb8097
+
+removed the nios2 support, which was originally added in
+https://github.com/pocoproject/poco/commit/e7b91e8125d6910b53f94de5be4bb53f38dc77c1
+
+This commit add it back.
+
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ Foundation/src/utils.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Foundation/src/utils.h b/Foundation/src/utils.h
+index 4328344d7..0a222c77d 100644
+--- a/Foundation/src/utils.h
++++ b/Foundation/src/utils.h
+@@ -102,7 +102,8 @@ int main(int argc, char** argv) {
+     defined(__AARCH64EL__) || defined(__aarch64__) || defined(__AARCH64EB__) || \
+     defined(__riscv) || \
+     defined(__or1k__) || defined(__arc__) || \
+-    defined(__EMSCRIPTEN__)
++    defined(__EMSCRIPTEN__) || \
++    defined(nios2) || defined(__nios2) || defined(__nios2__)
+ #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
+ #elif defined(__mc68000__) || \
+     defined(__pnacl__) || defined(__native_client__)
+-- 
+2.35.1
+
diff --git a/package/poco/0001-poco-add-the-staging-path-to-search-path.patch b/package/poco/0001-poco-add-the-staging-path-to-search-path.patch
deleted file mode 100644
index fbabfc8f26..0000000000
--- a/package/poco/0001-poco-add-the-staging-path-to-search-path.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From a53f3fd64a0f36ec9bc1307d7e66cdc2dee4aeaa Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 4 Aug 2015 10:14:00 +0200
-Subject: [PATCH] poco: add the staging path to search path
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Add the mysql headers and client libraries to the search path of the
-preprocessor and the linker. The $MYSQL_LIBDIR / $MYSQL_INCIDR variables
-must be set from the make command line.
-
-[Peter: Remove host dirs, add MYSQL_INCDIR]
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-[Jörg: Update to version 1.6.1 from github]
-Signed-off-by: Jörg Krause <joerg.krause@embedded.rocks>
-[Julien: Rebased on version 1.10.1]
-Signed-off-by: Julien Olivain <juju@cotds.org>
----
- Data/MySQL/Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Data/MySQL/Makefile b/Data/MySQL/Makefile
-index 64a7d3f82..955fee2d4 100644
---- a/Data/MySQL/Makefile
-+++ b/Data/MySQL/Makefile
-@@ -6,8 +6,8 @@
- 
- include $(POCO_BASE)/build/rules/global
- 
--SYSLIBS += -L/usr/local/lib -L/usr/local/lib$(LIB64SUFFIX)/mysql -L/usr/lib$(LIB64SUFFIX)/mysql -L/usr/mysql/lib$(LIB64SUFFIX) -L/usr/mysql/lib$(LIB64SUFFIX)/mysql -L/usr/local/mysql/lib$(LIB64SUFFIX) -lmysqlclient
--INCLUDE += -I/usr/local/include/mysql/ -I/usr/include/mysql/ -I/usr/mysql/include/mysql -I/usr/local/mysql/include
-+SYSLIBS += -L$(MYSQL_LIBDIR) -lmysqlclient
-+INCLUDE += -I$(MYSQL_INCDIR)
- SYSFLAGS += -DTHREADSAFE -DNO_TCL
- 
- objects = Binder Extractor SessionImpl Connector \
--- 
-2.26.2
-
diff --git a/package/poco/0002-Add-support-for-m68000-1856.patch b/package/poco/0002-Add-support-for-m68000-1856.patch
deleted file mode 100644
index bc04a9bf69..0000000000
--- a/package/poco/0002-Add-support-for-m68000-1856.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 221e308ad452035f4c1dc25e194f817a30f38f7b Mon Sep 17 00:00:00 2001
-From: Jochen Sprickerhof <github@jochen.sprickerhof.de>
-Date: Wed, 23 Aug 2017 16:50:51 +0200
-Subject: [PATCH] Add support for m68000 (#1856)
-
-Originally taken from
-
-https://github.com/google/double-conversion/commit/da11179623145f53b204105a93b8bbca431141da
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-[Julien: rebased on version 1.10.1]
-Signed-off-by: Julien Olivain <juju@cotds.org>
----
- Foundation/src/utils.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/Foundation/src/utils.h b/Foundation/src/utils.h
-index c87cee13c..e891c0f10 100644
---- a/Foundation/src/utils.h
-+++ b/Foundation/src/utils.h
-@@ -66,6 +66,8 @@
- 	defined(__AARCH64EL__) || \
-     defined(nios2) || defined(__nios2) || defined(__nios2__)
- #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
-+#elif defined(__mc68000__)
-+#undef DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS
- #elif defined(_M_IX86) || defined(__i386__) || defined(__i386)
- #if defined(_WIN32)
- // Windows uses a 64bit wide floating point stack.
--- 
-2.26.2
-
diff --git a/package/poco/0003-Foundation-src-utils.h-backport-double-conversion-ch.patch b/package/poco/0003-Foundation-src-utils.h-backport-double-conversion-ch.patch
deleted file mode 100644
index c06eebe8b0..0000000000
--- a/package/poco/0003-Foundation-src-utils.h-backport-double-conversion-ch.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From fe7d230da03a35725ef768c07ce064324f941863 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sun, 1 Jul 2018 15:37:47 +0200
-Subject: [PATCH] Foundation/src/utils.h: backport double-conversion change for
- AArch64 BE support
-
-This commit, identical to upstream double-conversion commit
-https://github.com/google/double-conversion/commit/cb2beeb6771025377c665d1c3ea08388bc6e619a
-allows Poco to build on AArch64 big-endian.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream: https://github.com/pocoproject/poco/pull/2378
-[Julien: rebased on version 1.10.1]
-Signed-off-by: Julien Olivain <juju@cotds.org>
----
- Foundation/src/utils.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Foundation/src/utils.h b/Foundation/src/utils.h
-index e891c0f10..892f7db18 100644
---- a/Foundation/src/utils.h
-+++ b/Foundation/src/utils.h
-@@ -63,7 +63,7 @@
-     defined(__SH4__) || defined(__alpha__) || \
-     defined(_MIPS_ARCH_MIPS32R2) || \
-     defined(__riscv) || \
--	defined(__AARCH64EL__) || \
-+	defined(__AARCH64EL__) || defined(__aarch64__) || \
-     defined(nios2) || defined(__nios2) || defined(__nios2__)
- #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
- #elif defined(__mc68000__)
--- 
-2.26.2
-
diff --git a/package/poco/Config.in b/package/poco/Config.in
index 714e40f447..699495a241 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -28,6 +28,10 @@ if BR2_PACKAGE_POCO
 
 comment "poco components"
 
+config BR2_PACKAGE_POCO_ACTIVERECORD
+	bool "ActiveRecord"
+	select BR2_PACKAGE_POCO_XML
+
 config BR2_PACKAGE_POCO_CPP_PARSER
 	bool "CppParser"
 
diff --git a/package/poco/poco.hash b/package/poco/poco.hash
index 2a2629733d..78d7d0b96e 100644
--- a/package/poco/poco.hash
+++ b/package/poco/poco.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  44592a488d2830c0b4f3bfe4ae41f0c46abbfad49828d938714444e858a00818  poco-1.10.1.tar.gz
+sha256  2412a5819a239ff2ee58f81033bcc39c40460d7a8b330013a687c8c0bd2b4ac0  poco-1.11.1.tar.gz
 sha256  c4b1e1e5f36d8331737231fefcc30f5714326aec7c387ad59a8115eb0ba7d6b5  LICENSE
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 119711f3fd..fcf480c2a8 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POCO_VERSION = 1.10.1
+POCO_VERSION = 1.11.1
 POCO_SITE = $(call github,pocoproject,poco,poco-$(POCO_VERSION)-release)
 POCO_LICENSE = BSL-1.0
 POCO_LICENSE_FILES = LICENSE
@@ -20,6 +20,7 @@ POCO_DEPENDENCIES = pcre zlib \
 	$(if $(BR2_PACKAGE_POCO_XML),expat)
 
 POCO_OMIT = Data/ODBC PageCompiler \
+	$(if $(BR2_PACKAGE_POCO_ACTIVERECORD),,ActiveRecord) \
 	$(if $(BR2_PACKAGE_POCO_CPP_PARSER),,CppParser) \
 	$(if $(BR2_PACKAGE_POCO_CRYPTO),,Crypto) \
 	$(if $(BR2_PACKAGE_POCO_DATA),,Data) \
@@ -74,8 +75,10 @@ endef
 # Use $(MAKE1) to avoid failures on heavilly parallel machines (e.g. -j25)
 define POCO_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) POCO_TARGET_OSARCH=$(ARCH) CROSS_COMPILE=$(TARGET_CROSS) \
-		MYSQL_LIBDIR=$(STAGING_DIR)/usr/lib/mysql \
-		MYSQL_INCDIR=$(STAGING_DIR)/usr/include/mysql \
+		POCO_MYSQL_INCLUDE=$(STAGING_DIR)/usr/include/mysql \
+		POCO_MYSQL_LIB=$(STAGING_DIR)/usr/lib/mysql \
+		POCO_PGSQL_INCLUDE=$(STAGING_DIR)/usr/include/postgresql \
+		POCO_PGSQL_LIB=$(STAGING_DIR)/usr/lib/postgresql \
 		DEFAULT_TARGET=$(POCO_MAKE_TARGET) -C $(@D)
 endef
 

--===============7666428583812220450==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7666428583812220450==--
