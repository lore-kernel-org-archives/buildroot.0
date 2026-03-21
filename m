Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA0DF483EC
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 452C840BE8;
	Mon, 23 Mar 2026 19:48:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wRdmabArls6B; Mon, 23 Mar 2026 19:48:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A5EC40BEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295287;
	bh=gh8d6okYi5gaPgdJOykiEftMF+B/i4T0yUnFNYh8Y/Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=omv/F3zwkK4oK6p1tc/yWc8cH2k3Fx+xEc1BLK3jWunlB+kP2TtxiGtzFID8fCedk
	 qBR7EdhDfs9cr1DnANlMqwxg+QBOSbTGNihBHet6ABBfLpkOp4OJrGdcgFVRQixaNJ
	 SbWa9O0SI2CYnGxEWCN2s1I1RqvLBtGzJuIiB5CNbKu8G5ysPtjyB+sD5JnNbB/Cvf
	 GBEB6nciX4XwNyLHusLw2vPucM512iLj64ONo//5XP1Xyqo86l62fpFDKLpIF7uC2x
	 nE6hEf39BMVaG6mfF+zFWo5MYr1wwma+Y4tlu9o7pM5zGBtbldTWWCHhGdLY6jJIJ8
	 lBf7bjV1VL/AA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A5EC40BEA;
	Mon, 23 Mar 2026 19:48:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A5D6F4
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F7EA4027F
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GXUmGMpA8FF2 for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:47:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54AEB40262
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54AEB40262
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B693384BD0; Mon, 23 Mar 2026 19:47:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 21 Mar 2026 21:23:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4f5f360350ec98ebbe775323d50b532e500d9915
X-Git-Newrev: 98d42291fcb2a67ce4eee9dc747338dca63c6df5
X-Patchwork-Hint: ignore
Message-Id: <20260323194745.B693384BD0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gerbera: bump version to 3.2.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/98d42291fcb2a67ce4eee9dc747338dca63c6df5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/gerbera/gerbera/blob/v3.2.0/ReleaseNotes.md

Removed patch which is included in this release.

Added optional dependency to libpqxx which needs to be built with CMake.

Added optional dependency to new libzippp package.

Added cxxopts as new dependency:
https://github.com/gerbera/gerbera/commit/72f7655e86402acac5600a462d429a40ce1aec84

Updated config.xml following a note from the release notes:
"xmlns was renamed to xml-ns for compliance reasons"

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gerbera/0001-fix_fmt_12.patch | 29 -----------------------------
 package/gerbera/Config.in             |  1 +
 package/gerbera/config.xml            |  2 +-
 package/gerbera/gerbera.hash          |  2 +-
 package/gerbera/gerbera.mk            | 17 ++++++++++++++++-
 5 files changed, 19 insertions(+), 32 deletions(-)

diff --git a/package/gerbera/0001-fix_fmt_12.patch b/package/gerbera/0001-fix_fmt_12.patch
deleted file mode 100644
index a10b78dae6..0000000000
--- a/package/gerbera/0001-fix_fmt_12.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From f8e158bc72986e46b93d05358c29db0c10f2fe9f Mon Sep 17 00:00:00 2001
-From: Karlchen <k_straussberger@netzland.net>
-Date: Wed, 17 Sep 2025 21:18:49 +0200
-Subject: [PATCH] Update to fmt 12.0.0
-
-Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
-Upstream: https://github.com/gerbera/gerbera/commit/f8e158bc72986e46b93d05358c29db0c10f2fe9f
-[buildroot@heine.tech: removed all patch content not patching actual code]
-
----
- src/web/config_load.cc            | 4 ++++
- 1 files changed, 4 insertions(+), 0 deletions(-)
-
-diff --git a/src/web/config_load.cc b/src/web/config_load.cc
-index 8b296c43e0..4259ae3331 100644
---- a/src/web/config_load.cc
-+++ b/src/web/config_load.cc
-@@ -150,7 +150,11 @@ void Web::ConfigLoad::addNewValue(
- template <typename T>
- void Web::ConfigLoad::setValue(Json::Value& item, const T& value)
- {
-+#if FMT_VERSION >= 120000
-+    static_assert(fmt::is_formattable<T, fmt::format_context>::value, "T must be formattable");
-+#else
-     static_assert(fmt::has_formatter<T, fmt::format_context>::value, "T must be formattable");
-+#endif
-     item[CONFIG_LOAD_VALUE] = fmt::to_string(value);
- }
- 
diff --git a/package/gerbera/Config.in b/package/gerbera/Config.in
index c5f7cf9cd1..3078d2017f 100644
--- a/package/gerbera/Config.in
+++ b/package/gerbera/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_GERBERA
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR # fmt
+	select BR2_PACKAGE_CXXOPTS
 	select BR2_PACKAGE_FMT
 	select BR2_PACKAGE_ICU
 	select BR2_PACKAGE_JSONCPP
diff --git a/package/gerbera/config.xml b/package/gerbera/config.xml
index e6261f25d0..6d2d63c789 100644
--- a/package/gerbera/config.xml
+++ b/package/gerbera/config.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0" encoding="UTF-8"?>
-<config version="2" xmlns="http://mediatomb.cc/config/2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://mediatomb.cc/config/2 http://mediatomb.cc/config/2.xsd">
+<config version="2" xmlns="http://mediatomb.cc/config/2" xml-ns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://mediatomb.cc/config/2 http://mediatomb.cc/config/2.xsd">
   <!--
      See https://gerbera.io or read the docs for more
      information on creating and using config.xml configuration files.
diff --git a/package/gerbera/gerbera.hash b/package/gerbera/gerbera.hash
index 3056ff11ac..a60017e8db 100644
--- a/package/gerbera/gerbera.hash
+++ b/package/gerbera/gerbera.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  6a7ed1c73bd86bdddd76bcb6c4bcd2e42788a20eb1f3165e0ea9f456abccd3ed  gerbera-2.6.1.tar.gz
+sha256  c55ec5cddc952e2563586ac76014be072c9dedb5094c6675889afa90b8df23e2  gerbera-3.2.0.tar.gz
 sha256  cae4138373be41fd2be75faf41ce7efbcf49fb17d0e05ad1c51cc01ac335b9b6  LICENSE.md
diff --git a/package/gerbera/gerbera.mk b/package/gerbera/gerbera.mk
index d2d68db686..1f7a0d48ff 100644
--- a/package/gerbera/gerbera.mk
+++ b/package/gerbera/gerbera.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-GERBERA_VERSION = 2.6.1
+GERBERA_VERSION = 3.2.0
 GERBERA_SITE = $(call github,gerbera,gerbera,v$(GERBERA_VERSION))
 GERBERA_LICENSE = GPL-2.0
 GERBERA_LICENSE_FILES = LICENSE.md
 GERBERA_DEPENDENCIES = \
+	cxxopts \
 	fmt \
 	icu \
 	jsoncpp \
@@ -91,6 +92,13 @@ GERBERA_DEPENDENCIES += libupnp
 GERBERA_CONF_OPTS += -DWITH_NPUPNP=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBPQXX),y)
+GERBERA_DEPENDENCIES += libpqxx
+GERBERA_CONF_OPTS += -DWITH_PGSQL=ON
+else
+GERBERA_CONF_OPTS += -DWITH_PGSQL=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_MARIADB),y)
 GERBERA_DEPENDENCIES += mariadb
 GERBERA_CONF_OPTS += -DWITH_MYSQL=ON
@@ -112,6 +120,13 @@ else
 GERBERA_CONF_OPTS += -DWITH_TAGLIB=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBZIPPP),y)
+GERBERA_DEPENDENCIES += libzip libzippp
+GERBERA_CONF_OPTS += -DWITH_ZIP=ON
+else
+GERBERA_CONF_OPTS += -DWITH_ZIP=OFF
+endif
+
 # gerbera does not provide a default configuration file, it can be
 # created during run time through --create-config:
 # http://docs.gerbera.io/en/latest/config-overview.html#generating-configuration
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
