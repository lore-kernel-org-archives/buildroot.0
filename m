Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F656D10374
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 20:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1396041D6D;
	Thu, 24 Oct 2024 20:47:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id reF_FOKBiAI3; Thu, 24 Oct 2024 20:47:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4D8E41A10
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4D8E41A10;
	Thu, 24 Oct 2024 20:47:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D12A497A
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB76240C5C
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:47:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uHrdpB8ff9FV for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 20:47:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F31140BA7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F31140BA7
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:47:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8BE69835FA; Thu, 24 Oct 2024 20:47:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Oct 2024 22:46:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 56c0176c17deff21e55e4acd60000ec8885ae2fe
X-Git-Newrev: ca1355d61d9eced2b64da3b9508676c2eedef6d3
X-Patchwork-Hint: ignore
Message-Id: <20241024204750.8BE69835FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/osm2pgsql: bump version to 2.0.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ca1355d61d9eced2b64da3b9508676c2eedef6d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

osm2pgsql now use std::filesystem instead of boost::filesystem. So
drop BR2_PACKAGE_BOOST_SYSTEM, BR2_PACKAGE_BOOST_FILESYSTEM
dependencies and set BR2_TOOLCHAIN_GCC_AT_LEAST_8.
Lua is not optional now. So add lua or luajit as dependencies.
Legacy Proj interface (Proj 4) was dropped and option was renamed
from USE_PROJ_LIB to WITH_PROJ

Release-notes: https://github.com/openstreetmap/osm2pgsql/releases/tag/2.0.0

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/osm2pgsql/Config.in      | 11 ++++-------
 package/osm2pgsql/osm2pgsql.hash |  2 +-
 package/osm2pgsql/osm2pgsql.mk   | 14 ++++++--------
 3 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/package/osm2pgsql/Config.in b/package/osm2pgsql/Config.in
index 439309df95..3b081af616 100644
--- a/package/osm2pgsql/Config.in
+++ b/package/osm2pgsql/Config.in
@@ -2,14 +2,12 @@ config BR2_PACKAGE_OSM2PGSQL
 	bool "osm2pgsql"
 	depends on BR2_ARCH_IS_64
 	depends on BR2_INSTALL_LIBSTDCPP # boost, libosmium, protozero
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++14, filesystem
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost, libosmium
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
 	depends on BR2_USE_WCHAR # boost, libosmium
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
+	depends on BR2_PACKAGE_LUA || BR2_PACKAGE_LUAJIT
 	select BR2_PACKAGE_BOOST
-	select BR2_PACKAGE_BOOST_SYSTEM
-	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
@@ -24,11 +22,10 @@ config BR2_PACKAGE_OSM2PGSQL
 
 	  https://osm2pgsql.org
 
-comment "osm2pgsql needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+comment "osm2pgsql needs a toolchain w/ C++, wchar, threads, gcc >= 8"
 	depends on BR2_ARCH_IS_64
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_TOOLCHAIN_HAS_THREADS
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || !BR2_TOOLCHAIN_HAS_THREADS
 
 comment "osm2pgsql needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_ARCH_IS_64
diff --git a/package/osm2pgsql/osm2pgsql.hash b/package/osm2pgsql/osm2pgsql.hash
index df3302b2c7..cc0d91f98f 100644
--- a/package/osm2pgsql/osm2pgsql.hash
+++ b/package/osm2pgsql/osm2pgsql.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6b46313813b816f15ce906c04cd4108bbb05362740e0a1a8889055f4e25977d2  osm2pgsql-1.11.0.tar.gz
+sha256  05c2355b4a59d03a0f9855b4234a3bdc717b078faee625e73357947d1a82fe89  osm2pgsql-2.0.0.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/osm2pgsql/osm2pgsql.mk b/package/osm2pgsql/osm2pgsql.mk
index 846a4ea242..7b54e4c0d2 100644
--- a/package/osm2pgsql/osm2pgsql.mk
+++ b/package/osm2pgsql/osm2pgsql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OSM2PGSQL_VERSION = 1.11.0
+OSM2PGSQL_VERSION = 2.0.0
 OSM2PGSQL_SITE = $(call github,openstreetmap,osm2pgsql,$(OSM2PGSQL_VERSION))
 OSM2PGSQL_LICENSE = GPL-2.0+
 OSM2PGSQL_LICENSE_FILES = COPYING
@@ -22,19 +22,17 @@ OSM2PGSQL_CONF_OPTS = \
 
 ifeq ($(BR2_PACKAGE_LUAJIT),y)
 OSM2PGSQL_DEPENDENCIES += luajit
-OSM2PGSQL_CONF_OPTS += -DWITH_LUA=ON -DWITH_LUAJIT=ON
-else ifeq ($(BR2_PACKAGE_LUA),y)
-OSM2PGSQL_DEPENDENCIES += lua
-OSM2PGSQL_CONF_OPTS += -DWITH_LUA=ON -DWITH_LUAJIT=OFF
+OSM2PGSQL_CONF_OPTS += -DWITH_LUAJIT=ON
 else
-OSM2PGSQL_CONF_OPTS += -DWITH_LUA=OFF -DWITH_LUAJIT=OFF
+OSM2PGSQL_DEPENDENCIES += lua
+OSM2PGSQL_CONF_OPTS += -DWITH_LUAJIT=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_PROJ),y)
 OSM2PGSQL_DEPENDENCIES += proj
-OSM2PGSQL_CONF_OPTS += -DUSE_PROJ_LIB=auto
+OSM2PGSQL_CONF_OPTS += -DWITH_PROJ=ON
 else
-OSM2PGSQL_CONF_OPTS += -DUSE_PROJ_LIB=off
+OSM2PGSQL_CONF_OPTS += -DWITH_PROJ=OFF
 endif
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
