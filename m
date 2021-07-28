Return-Path: <SRS0=nMnf=MU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 314DDC4338F
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 21:31:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B02AC6069E
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 21:31:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B02AC6069E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F39B4052B;
	Wed, 28 Jul 2021 21:31:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uoJmUKHaGRVX; Wed, 28 Jul 2021 21:31:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 903CA4035C;
	Wed, 28 Jul 2021 21:31:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DA2171BF5B4
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 21:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C93ED4035C
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 21:31:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t5_hc96GsI_0 for <buildroot@lists.busybox.net>;
 Wed, 28 Jul 2021 21:31:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CD7040337
 for <buildroot@buildroot.org>; Wed, 28 Jul 2021 21:31:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6977F89156; Wed, 28 Jul 2021 20:57:04 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 28 Jul 2021 23:08:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aaf3322c2862a1cea6df1e597bb1774cd5929fef
X-Git-Newrev: 46c42042867e672eb21b386eb5e29747c30e80ca
X-Patchwork-Hint: ignore
Message-Id: <20210728205704.6977F89156@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/osm2pgsql: new package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=46c42042867e672eb21b386eb5e29747c30e80ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

osm2pgsql is a tool for loading OpenStreetMap data into a
PostgreSQL / PostGIS database suitable for applications like
rendering into a map, geocoding with Nominatim, or general analysis.

https://osm2pgsql.org

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/osm2pgsql/Config.in      | 26 ++++++++++++++++++++++++++
 package/osm2pgsql/osm2pgsql.hash |  3 +++
 package/osm2pgsql/osm2pgsql.mk   | 39 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 70 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e8bb9fd54a..6533471736 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1865,6 +1865,7 @@ F:	arch/Config.in.xtensa
 
 N:	Maxim Kochetkov <fido_max@inbox.ru>
 F:	package/libosmium/
+F:	package/osm2pgsql/
 F:	package/postgis/
 F:	package/protozero/
 F:	package/timescaledb/
diff --git a/package/Config.in b/package/Config.in
index 48ddbb63b2..79b58facc3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1421,6 +1421,7 @@ menu "Database"
 	source "package/mysql/Config.in"
 	source "package/postgresql/Config.in"
 if BR2_PACKAGE_POSTGRESQL
+	source "package/osm2pgsql/Config.in"
 	source "package/postgis/Config.in"
 endif
 	source "package/redis/Config.in"
diff --git a/package/osm2pgsql/Config.in b/package/osm2pgsql/Config.in
new file mode 100644
index 0000000000..1f1200cf46
--- /dev/null
+++ b/package/osm2pgsql/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_OSM2PGSQL
+	bool "osm2pgsql"
+	depends on BR2_INSTALL_LIBSTDCPP # boost, fmt, libosmium, protozero
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11, libosmium, protozero
+	depends on BR2_TOOLCHAIN_HAS_THREADS # boost, libosmium
+	depends on BR2_USE_WCHAR # boost, fmt, libosmium
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_SYSTEM
+	select BR2_PACKAGE_BOOST_FILESYSTEM
+	select BR2_PACKAGE_BZIP2
+	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_FMT
+	select BR2_PACKAGE_LIBOSMIUM
+	select BR2_PACKAGE_PROTOZERO
+	select BR2_PACKAGE_ZLIB
+	help
+	  osm2pgsql is a tool for loading OpenStreetMap data into a
+	  PostgreSQL / PostGIS database suitable for applications like
+	  rendering into a map, geocoding with Nominatim,
+	  or general analysis.
+
+	  https://osm2pgsql.org
+
+comment "osm2pgsql needs a toolchain w/ C++,  wchar, threads, gcc >= 4.7"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/osm2pgsql/osm2pgsql.hash b/package/osm2pgsql/osm2pgsql.hash
new file mode 100644
index 0000000000..13e8de4b51
--- /dev/null
+++ b/package/osm2pgsql/osm2pgsql.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  fc68283930ccd468ed9b28685150741b16083fec86800a4b011884ae22eb061c  osm2pgsql-1.4.2.tar.gz
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/osm2pgsql/osm2pgsql.mk b/package/osm2pgsql/osm2pgsql.mk
new file mode 100644
index 0000000000..bb8dba419e
--- /dev/null
+++ b/package/osm2pgsql/osm2pgsql.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# osm2pgsql
+#
+################################################################################
+
+OSM2PGSQL_VERSION = 1.4.2
+OSM2PGSQL_SITE = $(call github,openstreetmap,osm2pgsql,$(OSM2PGSQL_VERSION))
+OSM2PGSQL_LICENSE = GPL-2.0+
+OSM2PGSQL_LICENSE_FILES = COPYING
+OSM2PGSQL_SUPPORTS_IN_SOURCE_BUILD = NO
+
+OSM2PGSQL_DEPENDENCIES = boost bzip2 expat fmt libosmium postgresql protozero zlib
+
+OSM2PGSQL_CONF_OPTS = \
+	-DBUILD_TESTS=OFF \
+	-DBUILD_COVERAGE=OFF \
+	-DEXTERNAL_FMT=ON \
+	-DEXTERNAL_LIBOSMIUM=ON \
+	-DEXTERNAL_PROTOZERO=ON
+
+ifeq ($(BR2_PACKAGE_LUAJIT),y)
+OSM2PGSQL_DEPENDENCIES += luajit
+OSM2PGSQL_CONF_OPTS += -DWITH_LUA=ON -DWITH_LUAJIT=ON
+else ifeq ($(BR2_PACKAGE_LUA),y)
+OSM2PGSQL_DEPENDENCIES += lua
+OSM2PGSQL_CONF_OPTS += -DWITH_LUA=ON -DWITH_LUAJIT=OFF
+else
+OSM2PGSQL_CONF_OPTS += -DWITH_LUA=OFF -DWITH_LUAJIT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_PROJ),y)
+OSM2PGSQL_DEPENDENCIES += proj
+OSM2PGSQL_CONF_OPTS += -DUSE_PROJ_LIB=auto
+else
+OSM2PGSQL_CONF_OPTS += -DUSE_PROJ_LIB=off
+endif
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
