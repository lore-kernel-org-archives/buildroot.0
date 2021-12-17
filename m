Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF59C433F5
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 20:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 298B261173;
	Fri, 17 Dec 2021 20:46:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sEVGzyOTTK_V; Fri, 17 Dec 2021 20:46:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 577E161170;
	Fri, 17 Dec 2021 20:46:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1F6711BF2F0
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 20:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CFDB421E0
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 20:46:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zqLhX-rTTec3 for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 20:46:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19958421DD
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 20:46:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 22E5C81D80; Fri, 17 Dec 2021 20:41:06 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 17 Dec 2021 21:39:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 34ed9dae4d6ba7597ce0fef43bd81d3acdbb2d19
X-Git-Newrev: 0d1da42fcc6976de77bcdf6ad75d17186abc320b
X-Patchwork-Hint: ignore
Message-Id: <20211217204106.22E5C81D80@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/modsecurity2: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=0d1da42fcc6976de77bcdf6ad75d17186abc320b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The modsecurity2 package provides an Apache module implementing
a web application firewall (WAF) module.

Based on initial work from Tom Marcuzzi <tom.marcuzzi@orolia.com>
and Nicolas Carrier <nicolas.carrier@orolia.com>

modsecurity2 will be superseeded sooner or later by modsecurity v3
ie. libmodsecurity [1] and its Apache connector [2]. libmodsecurity
is already supported in Buildroot with its Nginx connector.
According to the Apache connector web page and the discussion [3],
the Apache connector is not ready for production use.

  [1] https://github.com/SpiderLabs/ModSecurity
  [2] https://github.com/SpiderLabs/ModSecurity-apache
  [3] https://github.com/SpiderLabs/ModSecurity-apache/issues/80

The best we can do now is to still use modsecurity2 (v2.9.x) for
Apache:
  https://github.com/SpiderLabs/ModSecurity/tree/v2/master

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                             |  2 ++
 package/Config.in                      |  5 +++++
 package/modsecurity2/Config.in         | 13 +++++++++++++
 package/modsecurity2/modsecurity2.hash |  3 +++
 package/modsecurity2/modsecurity2.mk   | 26 ++++++++++++++++++++++++++
 5 files changed, 49 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d64c1b063a..8d9c492c43 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1160,6 +1160,7 @@ F:	package/dtbocfg/
 F:	package/libdbi/
 F:	package/libdbi-drivers/
 F:	package/lua-augeas/
+F:	package/modsecurity2/
 F:	support/testing/tests/package/test_dtbocfg.py
 F:	support/testing/tests/package/test_lua_augeas.py
 
@@ -2019,6 +2020,7 @@ F:	package/bmap-tools/
 F:	package/libdbi/
 F:	package/libdbi-drivers/
 F:	package/lua-augeas/
+F:	package/modsecurity2/
 F:	package/php-pecl-dbus/
 F:	package/php-xdebug/
 F:	package/python-augeas/
diff --git a/package/Config.in b/package/Config.in
index a73e1fb38f..bcf20bf849 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2114,6 +2114,11 @@ menu "Networking applications"
 	source "package/aircrack-ng/Config.in"
 	source "package/aoetools/Config.in"
 	source "package/apache/Config.in"
+if BR2_PACKAGE_APACHE
+menu "External Apache modules"
+	source "package/modsecurity2/Config.in"
+endmenu
+endif
 	source "package/argus/Config.in"
 	source "package/arp-scan/Config.in"
 	source "package/arptables/Config.in"
diff --git a/package/modsecurity2/Config.in b/package/modsecurity2/Config.in
new file mode 100644
index 0000000000..2870386a99
--- /dev/null
+++ b/package/modsecurity2/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_MODSECURITY2
+	bool "modsecurity2"
+	depends on BR2_PACKAGE_APACHE
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_PCRE
+	help
+	  ModSecurity is an open source, cross-platform web application
+	  firewall (WAF) module. Known as the "Swiss Army Knife" of
+	  WAFs, it enables web application defenders to gain visibility
+	  into HTTP(S) traffic and provides a power rules language and
+	  API to implement advanced protections.
+
+	  https://github.com/SpiderLabs/ModSecurity
diff --git a/package/modsecurity2/modsecurity2.hash b/package/modsecurity2/modsecurity2.hash
new file mode 100644
index 0000000000..1501b5642e
--- /dev/null
+++ b/package/modsecurity2/modsecurity2.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  686695c650449a338757711254ea78c67dedb1d258e03e5c8686f869388fff8c  modsecurity2-2.9.4.tar.gz
+sha256  2c564f5a67e49e74c80e5a7dcacd1904e7408f1fd6a95218b38c04f012d94cb9  LICENSE
diff --git a/package/modsecurity2/modsecurity2.mk b/package/modsecurity2/modsecurity2.mk
new file mode 100644
index 0000000000..52ae6f4c31
--- /dev/null
+++ b/package/modsecurity2/modsecurity2.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# modsecurity2
+#
+################################################################################
+
+MODSECURITY2_VERSION = 2.9.4
+MODSECURITY2_SITE = $(call github,SpiderLabs,ModSecurity,v$(MODSECURITY2_VERSION))
+MODSECURITY2_LICENSE = Apache-2.0
+MODSECURITY2_LICENSE_FILES = LICENSE
+MODSECURITY2_INSTALL_STAGING = YES
+MODSECURITY2_DEPENDENCIES = apache libxml2 pcre
+MODSECURITY2_AUTORECONF = YES
+
+MODSECURITY2_CONF_OPTS = \
+	--with-pcre=$(STAGING_DIR)/usr/bin/pcre-config \
+	--with-libxml=$(STAGING_DIR)/usr \
+	--with-apr=$(STAGING_DIR)/usr/bin/apr-1-config \
+	--with-apu=$(STAGING_DIR)/usr/bin/apu-1-config \
+	--with-apxs=$(STAGING_DIR)/usr/bin/apxs \
+	--without-curl \
+	--without-lua \
+	--without-yajl \
+	--without-ssdeep
+
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
