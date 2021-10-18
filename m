Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86271C433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 13:25:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE2D76128A
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 13:25:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AE2D76128A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75DF0403D1;
	Mon, 18 Oct 2021 13:25:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dWLjYXOaMf7j; Mon, 18 Oct 2021 13:25:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E3384040D;
	Mon, 18 Oct 2021 13:25:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B2F7F1BF337
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 13:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1BF7405C6
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 13:25:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t08XEpgM2oj9 for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 13:25:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 034E44055D
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 13:25:51 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPA id 0C5BF24000B;
 Mon, 18 Oct 2021 13:25:47 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 15:25:31 +0200
Message-Id: <20211018132532.814742-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/modsecurity2: new package
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
Cc: Tom Marcuzzi <tom.marcuzzi@orolia.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Matthew Weber <matthew.weber@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
A previous version was submitted but never merged:
  https://lore.kernel.org/buildroot/20191121172845.25958-1-tom.marcuzzi@orolia.com/
The patch was marked "superseeded" probably wrongly with the
introduction of modsecurity v3 (libmodsecurity and its Nginx
connector)

 DEVELOPERS                             |  2 ++
 package/Config.in                      |  5 +++++
 package/modsecurity2/Config.in         | 12 ++++++++++++
 package/modsecurity2/modsecurity2.hash |  3 +++
 package/modsecurity2/modsecurity2.mk   | 21 +++++++++++++++++++++
 5 files changed, 43 insertions(+)
 create mode 100644 package/modsecurity2/Config.in
 create mode 100644 package/modsecurity2/modsecurity2.hash
 create mode 100644 package/modsecurity2/modsecurity2.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 19f6d95270..9a41236705 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1150,6 +1150,7 @@ F:	package/dtbocfg/
 F:	package/libdbi/
 F:	package/libdbi-drivers/
 F:	package/lua-augeas/
+F:	package/modsecurity2/
 F:	support/testing/tests/package/test_dtbocfg.py
 F:	support/testing/tests/package/test_lua_augeas.py
 
@@ -1991,6 +1992,7 @@ F:	package/bmap-tools/
 F:	package/libdbi/
 F:	package/libdbi-drivers/
 F:	package/lua-augeas/
+F:	package/modsecurity2/
 F:	package/php-xdebug/
 F:	package/python-augeas/
 F:	package/python-flask-expects-json/
diff --git a/package/Config.in b/package/Config.in
index 48f365d773..230a976b6b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2097,6 +2097,11 @@ menu "Networking applications"
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
index 0000000000..703cb682b3
--- /dev/null
+++ b/package/modsecurity2/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_MODSECURITY2
+	bool "modsecurity2"
+	depends on BR2_PACKAGE_APACHE
+	select BR2_PACKAGE_LIBXML2
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
index 0000000000..b9a5a93057
--- /dev/null
+++ b/package/modsecurity2/modsecurity2.mk
@@ -0,0 +1,21 @@
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
+MODSECURITY2_DEPENDENCIES = apache libxml2
+MODSECURITY2_AUTORECONF = YES
+
+MODSECURITY2_CONF_OPTS += --with-pcre=$(STAGING_DIR)/usr/bin/pcre-config \
+	--with-libxml=$(STAGING_DIR)/usr \
+	--with-apr=$(STAGING_DIR)/usr/bin/apr-1-config \
+	--with-apu=$(STAGING_DIR)/usr/bin/apu-1-config \
+	--with-apxs=$(STAGING_DIR)/usr/bin/apxs
+
+$(eval $(autotools-package))
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
