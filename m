Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09D2EEAA62
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 19:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1178941DA9;
	Thu, 14 Sep 2023 19:17:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1178941DA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xaF1FEvnlnCb; Thu, 14 Sep 2023 19:17:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCAA941DB5;
	Thu, 14 Sep 2023 19:17:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCAA941DB5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CC6061BF410
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 19:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A527A83A9B
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 19:17:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A527A83A9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gm6P-JrjK5yP for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 19:17:30 +0000 (UTC)
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5841683A9A
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 19:17:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5841683A9A
Received: from localhost.localdomain ([146.241.100.148])
 by Aruba Outgoing Smtp  with ESMTPSA
 id grqBq83xPesCHgrqBqWbxG; Thu, 14 Sep 2023 21:17:28 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 21:17:26 +0200
Message-Id: <20230914191726.28670-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfA65cg/VzEK9FFhJuXt6jCKqSonMY7tkxLvPjzxIsOS2wxX7GlQ67DQrWPiCMzdg3e8rzk5GEn4yFvEGc6suGXm/Qbji48O7ymCUx7b2x2DhcX9m/lHo
 18qQSfns6URJBbVucjHVRcD+PMPbx97Qv9hFU3LTGYTFiSr8pnv06aGe5Td6TWY96ayaD1j8HCuvSkJMZ28q9LSTx3XpJKFVaL9T5Q+oQ/fUm9GoqhPdfQgA
 cU3Kcb6SkN/BePNUxRLwcVrcZqtBPVDK/OZPCIYxBMY+4iFU7PZuTCuy3r28jj8xKBBVGNlfT/L/FmzVOpH591AM3RXtAa3r8UWBXfno7yLk9XpsXjHs/Ly4
 YG9RNliJyW9lUrZMwSSHt1Qzx7PO5jLUyZ0Th1gKFsqch1TXSPd4S4LAiBMbO9ok0Sa6XbRzJiU+VibllVh9p7lnT0lwOux+mNJkYwNd9fwZNdMA+fD+RIJh
 D6RvyEfQWi8GzFPX
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1694719048; bh=CUARcAI5YCeq5KKQYVxF/eN+26Z1hAo4xL6i1UL2QyA=;
 h=From:To:Subject:Date:MIME-Version;
 b=W4tOPNTVnePyifah6S1bwtcsu/bLbngVgIDfFE1U257i2K5uYw2qI/dBXWls9PRhn
 HmsN7KjFTTi10VKfnXLi8G7ekeriQ3EQNX2AmLpGv25DeFkjTpOAE8wOdBF+llA8Jt
 nILs6s1M1VBscimSQjfCdC9JyBKRH8FqxCqQAqEk00EY5bFgnOlYoXTL5kUZt1n3qN
 tsVizk9vKVgOjX/5NU/pzi/bsB9dqRc9IvWXKXxfeFKe9wpXFiaojuxZq0o1m96FHF
 18FsBi+LQnha7VoFQtEvCHaGb3dwgiijcR76fkDBbejRXT+GBe2kLI1/GsKKUlo8x7
 AKZLhJtc+4e9A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=W4tOPNTV
Subject: [Buildroot] [PATCH] package/apache-utils: new package
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
Cc: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>,
 James Autry <jautry@tekvox.com>, Matthew Maron <matthewm@tekvox.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jim Reinhart <jimr@tekvox.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>

Build htdigest and htpasswd utilities only without building entire Apache
package.

Cc: Jim Reinhart <jimr@tekvox.com>
Cc: James Autry <jautry@tekvox.com>
Cc: Matthew Maron <matthewm@tekvox.com>
Signed-off-by: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 .../apache-utils/0001-nios2_is_not_os2.patch  | 19 ++++++++++
 package/apache-utils/Config.in                | 15 ++++++++
 package/apache-utils/apache-utils.hash        |  5 +++
 package/apache-utils/apache-utils.mk          | 37 +++++++++++++++++++
 6 files changed, 78 insertions(+)
 create mode 100644 package/apache-utils/0001-nios2_is_not_os2.patch
 create mode 100644 package/apache-utils/Config.in
 create mode 100644 package/apache-utils/apache-utils.hash
 create mode 100644 package/apache-utils/apache-utils.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f0c6f9cb52..806429f433 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1196,6 +1196,7 @@ F:	configs/freescale_imx6ullevk_defconfig
 F:	configs/imx6ullevk_defconfig
 F:	configs/imxrt1050-evk_defconfig
 F:	configs/olimex_a*
+F:	package/apache-utils/
 F:	package/at/
 F:	package/binutils/
 F:	package/cryptsetup/
diff --git a/package/Config.in b/package/Config.in
index e8dbadadf3..f5c9f9d321 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2278,6 +2278,7 @@ menu "Networking applications"
 	source "package/alfred/Config.in"
 	source "package/aoetools/Config.in"
 	source "package/apache/Config.in"
+	source "package/apache-utils/Config.in"
 if BR2_PACKAGE_APACHE
 menu "External Apache modules"
 	source "package/modsecurity2/Config.in"
diff --git a/package/apache-utils/0001-nios2_is_not_os2.patch b/package/apache-utils/0001-nios2_is_not_os2.patch
new file mode 100644
index 0000000000..ac9b3fb373
--- /dev/null
+++ b/package/apache-utils/0001-nios2_is_not_os2.patch
@@ -0,0 +1,19 @@
+Fix nios2 detection.
+
+Apache treats nios2 as OS/2.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+Signed-off-by: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
+
+diff -uNr httpd-2.4.12.org/configure.in httpd-2.4.12/configure.in
+--- httpd-2.4.12.org/configure.in	2015-01-22 18:33:07.000000000 +0100
++++ httpd-2.4.12/configure.in	2015-04-02 22:01:32.851102219 +0200
+@@ -268,7 +268,7 @@
+ AC_MSG_NOTICE([])
+ 
+ case $host in
+-  *os2*)
++  *-os2*)
+       # Use a custom made libtool replacement
+       echo "using aplibtool"
+       LIBTOOL="$abs_srcdir/srclib/apr/build/aplibtool"
diff --git a/package/apache-utils/Config.in b/package/apache-utils/Config.in
new file mode 100644
index 0000000000..d83874c9ea
--- /dev/null
+++ b/package/apache-utils/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_APACHE_UTILS
+	bool "apache-utils"
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # apr
+	select BR2_PACKAGE_APR_UTIL
+	select BR2_PACKAGE_PCRE2
+	help
+	  Apache utilities htdigest and htpasswd
+
+	  https://httpd.apache.org
+
+comment "apache-utils needs a toolchain w/ dynamic library, threads"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/apache-utils/apache-utils.hash b/package/apache-utils/apache-utils.hash
new file mode 100644
index 0000000000..1f0020f65a
--- /dev/null
+++ b/package/apache-utils/apache-utils.hash
@@ -0,0 +1,5 @@
+# From https://archive.apache.org/dist/httpd/httpd-2.4.57.tar.bz2.{sha256,sha512}
+sha256  dbccb84aee95e095edfbb81e5eb926ccd24e6ada55dcd83caecb262e5cf94d2a  httpd-2.4.57.tar.bz2
+sha512  4d1e0a274ee90bdfb5f38d4a7d73a7367ed1c6388e26280e640014e49abc0df03683705b88dcfe2ec2da313dda4c7b4a3b86daffa1911f58e224eba89d82d155  httpd-2.4.57.tar.bz2
+# Locally computed
+sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
diff --git a/package/apache-utils/apache-utils.mk b/package/apache-utils/apache-utils.mk
new file mode 100644
index 0000000000..f632eaec24
--- /dev/null
+++ b/package/apache-utils/apache-utils.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# apache-utils
+#
+################################################################################
+
+APACHE_UTILS_VERSION = 2.4.57
+APACHE_UTILS_SOURCE = httpd-$(APACHE_UTILS_VERSION).tar.bz2
+APACHE_UTILS_SITE = https://downloads.apache.org/httpd
+APACHE_UTILS_LICENSE = Apache-2.0
+APACHE_UTILS_LICENSE_FILES = LICENSE
+# We have a patch touching configure.in and Makefile.in,
+# so we need to autoreconf:
+APACHE_UTILS_AUTORECONF = YES
+APACHE_UTILS_DEPENDENCIES = apr apr-util pcre2
+
+APACHE_UTILS_CONF_ENV= \
+	ap_cv_void_ptr_lt_long=no \
+	PCRE_CONFIG=$(STAGING_DIR)/usr/bin/pcre2-config
+
+APACHE_UTILS_CONF_OPTS = \
+	--with-apr=$(STAGING_DIR)/usr \
+	--with-apr-util=$(STAGING_DIR)/usr \
+	--with-pcre=$(STAGING_DIR)/usr/bin/pcre2-config \
+	--with-static-htdigest \
+	--with-static-htpasswd
+
+define APACHE_UTILS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/support htdigest htpasswd
+endef
+
+define APACHE_UTILS_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/support/htdigest $(TARGET_DIR)/usr/bin/htdigest
+	$(INSTALL) -m 0755 -D $(@D)/support/htpasswd $(TARGET_DIR)/usr/bin/htpasswd
+endef
+
+$(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
