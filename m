Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59E7C433EF
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 21:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D6A683126;
	Wed, 26 Jan 2022 21:04:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pfUaukN_bFyJ; Wed, 26 Jan 2022 21:04:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 870F783EE2;
	Wed, 26 Jan 2022 21:04:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B16C1BF9B9
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A0ED60FB5
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:04:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 26YNwfqqFK0C for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 21:04:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF5F360F93
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 21:04:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7118C82386; Wed, 26 Jan 2022 20:57:32 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 21:58:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0ed2b74717a4557c4ffd822326530b73b7506524
X-Git-Newrev: c2b90b94894366fa81eac0767a0f4ad42289cd6a
X-Patchwork-Hint: ignore
Message-Id: <20220126205732.7118C82386@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lighttpd: reorder alphabetically
 options
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c2b90b94894366fa81eac0767a0f4ad42289cd6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lighttpd/Config.in   | 32 ++++++++++++++++----------------
 package/lighttpd/lighttpd.mk | 36 ++++++++++++++++++------------------
 2 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index 99a09e9766..59c1e0b2a6 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -21,6 +21,18 @@ config BR2_PACKAGE_LIGHTTPD
 
 if BR2_PACKAGE_LIGHTTPD
 
+config BR2_PACKAGE_LIGHTTPD_BZIP2
+	bool "bzip2 support"
+	select BR2_PACKAGE_BZIP2
+	help
+	  Enable bzip2 support for lighttpd mod_deflate.
+
+config BR2_PACKAGE_LIGHTTPD_LUA
+	bool "lua support"
+	depends on BR2_PACKAGE_LUA
+	help
+	  Enable Lua support. Needed to support mod_magnet
+
 config BR2_PACKAGE_LIGHTTPD_OPENSSL
 	bool "openssl support"
 	select BR2_PACKAGE_OPENSSL
@@ -34,18 +46,6 @@ config BR2_PACKAGE_LIGHTTPD_PAM
 	help
 	  Enable PAM authentication support for lighttpd.
 
-config BR2_PACKAGE_LIGHTTPD_ZLIB
-	bool "zlib support"
-	select BR2_PACKAGE_ZLIB
-	help
-	  Enable zlib support for lighttpd mod_deflate.
-
-config BR2_PACKAGE_LIGHTTPD_BZIP2
-	bool "bzip2 support"
-	select BR2_PACKAGE_BZIP2
-	help
-	  Enable bzip2 support for lighttpd mod_deflate.
-
 config BR2_PACKAGE_LIGHTTPD_PCRE
 	bool "pcre support"
 	select BR2_PACKAGE_PCRE2
@@ -59,10 +59,10 @@ config BR2_PACKAGE_LIGHTTPD_WEBDAV
 	help
 	  Enable webdav support. Needed to support mod_webdav
 
-config BR2_PACKAGE_LIGHTTPD_LUA
-	bool "lua support"
-	depends on BR2_PACKAGE_LUA
+config BR2_PACKAGE_LIGHTTPD_ZLIB
+	bool "zlib support"
+	select BR2_PACKAGE_ZLIB
 	help
-	  Enable Lua support. Needed to support mod_magnet
+	  Enable zlib support for lighttpd mod_deflate.
 
 endif
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 2a05071209..bdbf75191c 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -37,6 +37,20 @@ LIGHTTPD_CONF_OPTS = \
 	-Dbuild_static=false \
 	-Dmoduledir=lib/lighttpd
 
+ifeq ($(BR2_PACKAGE_LIGHTTPD_BZIP2),y)
+LIGHTTPD_DEPENDENCIES += bzip2
+LIGHTTPD_CONF_OPTS += -Dwith_bzip=true
+else
+LIGHTTPD_CONF_OPTS += -Dwith_bzip=false
+endif
+
+ifeq ($(BR2_PACKAGE_LIGHTTPD_LUA),y)
+LIGHTTPD_DEPENDENCIES += lua
+LIGHTTPD_CONF_OPTS += -Dwith_lua=true
+else
+LIGHTTPD_CONF_OPTS += -Dwith_lua=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIGHTTPD_OPENSSL),y)
 LIGHTTPD_DEPENDENCIES += openssl
 LIGHTTPD_CONF_OPTS += -Dwith_openssl=true
@@ -51,20 +65,6 @@ else
 LIGHTTPD_CONF_OPTS += -Dwith_pam=false
 endif
 
-ifeq ($(BR2_PACKAGE_LIGHTTPD_ZLIB),y)
-LIGHTTPD_DEPENDENCIES += zlib
-LIGHTTPD_CONF_OPTS += -Dwith_zlib=true
-else
-LIGHTTPD_CONF_OPTS += -Dwith_zlib=false
-endif
-
-ifeq ($(BR2_PACKAGE_LIGHTTPD_BZIP2),y)
-LIGHTTPD_DEPENDENCIES += bzip2
-LIGHTTPD_CONF_OPTS += -Dwith_bzip=true
-else
-LIGHTTPD_CONF_OPTS += -Dwith_bzip=false
-endif
-
 ifeq ($(BR2_PACKAGE_LIGHTTPD_PCRE),y)
 LIGHTTPD_DEPENDENCIES += pcre2
 LIGHTTPD_CONF_OPTS += -Dwith_pcre2=true
@@ -85,11 +85,11 @@ else
 LIGHTTPD_CONF_OPTS += -Dwith_webdav_props=false -Dwith_webdav_locks=false
 endif
 
-ifeq ($(BR2_PACKAGE_LIGHTTPD_LUA),y)
-LIGHTTPD_DEPENDENCIES += lua
-LIGHTTPD_CONF_OPTS += -Dwith_lua=true
+ifeq ($(BR2_PACKAGE_LIGHTTPD_ZLIB),y)
+LIGHTTPD_DEPENDENCIES += zlib
+LIGHTTPD_CONF_OPTS += -Dwith_zlib=true
 else
-LIGHTTPD_CONF_OPTS += -Dwith_lua=false
+LIGHTTPD_CONF_OPTS += -Dwith_zlib=false
 endif
 
 define LIGHTTPD_INSTALL_CONFIG
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
