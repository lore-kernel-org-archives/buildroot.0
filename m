Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66AADC87FCE
	for <buildroot@archiver.kernel.org>; Mon, 28 Jul 2025 13:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A61C40E8F;
	Mon, 28 Jul 2025 13:01:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UksirZnkwfdk; Mon, 28 Jul 2025 13:01:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3613340E1B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3613340E1B;
	Mon, 28 Jul 2025 13:01:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A2DEF151
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 13:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94EDC4003A
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 13:01:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VyojgxrcF-ag for <buildroot@buildroot.org>;
 Mon, 28 Jul 2025 13:01:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=77.55.128.204;
 helo=mail.grinn-global.com; envelope-from=b.bilas@grinn-global.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5ED0140327
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5ED0140327
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5ED0140327
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 13:01:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (25)
Received: from bartekk-pc (ip-194.4.60.197.edial.pl [194.4.60.197])
 by server220076.nazwa.pl (Postfix) with ESMTP id E8C1C1BC3B5;
 Mon, 28 Jul 2025 15:01:21 +0200 (CEST)
From: Bartosz Bilas <b.bilas@grinn-global.com>
To: buildroot@buildroot.org
Cc: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Mon, 28 Jul 2025 15:01:18 +0200
Message-ID: <20250728130118.18606-6-b.bilas@grinn-global.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250728130118.18606-1-b.bilas@grinn-global.com>
References: <20250728130118.18606-1-b.bilas@grinn-global.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=grinn-global.com
Subject: [Buildroot] [PATCH 6/6] package/python-esptool: bump version to
 5.0.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 .../0001-Fix-running-with-click-8.2.1.patch   | 37 +++++++++++++++++++
 package/python-esptool/Config.in              |  1 +
 package/python-esptool/python-esptool.hash    |  4 +-
 package/python-esptool/python-esptool.mk      |  4 +-
 4 files changed, 42 insertions(+), 4 deletions(-)
 create mode 100644 package/python-esptool/0001-Fix-running-with-click-8.2.1.patch

diff --git a/package/python-esptool/0001-Fix-running-with-click-8.2.1.patch b/package/python-esptool/0001-Fix-running-with-click-8.2.1.patch
new file mode 100644
index 0000000000..9010d1bfd3
--- /dev/null
+++ b/package/python-esptool/0001-Fix-running-with-click-8.2.1.patch
@@ -0,0 +1,37 @@
+From 0779a019603129d92833b3d275e82074b4a49ac4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Fauberteau?= <frederic@fauberteau.org>
+Date: Mon, 21 Jul 2025 09:35:27 +0200
+Subject: [PATCH] Fix running with click-8.2.1
+
+The pkgsrc framework provides devel/py-click in version 8.2.1. The
+dependency "click<8.2.0" cannot be respected in this framework.
+Therefore esptool must be patched to update it to its last release.
+---
+ esptool/cli_util.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/esptool/cli_util.py b/esptool/cli_util.py
+index 647c011..8a40b56 100644
+--- a/esptool/cli_util.py
++++ b/esptool/cli_util.py
+@@ -155,7 +155,7 @@ class AddrFilenamePairType(click.Path):
+ 
+     name = "addr-filename-pair"
+ 
+-    def get_metavar(self, param):
++    def get_metavar(self, param, ctx=None):
+         return "<address> <filename>"
+ 
+     def convert(
+@@ -294,7 +294,7 @@ class OptionEatAll(click.Option):
+         self._eat_all_parser = None
+         # Set the metavar dynamically based on the type's metavar
+         if self.type and hasattr(self.type, "name"):
+-            self.metavar = f"[{self.type.get_metavar(None) or self.type.name.upper()}]"
++            self.metavar = f"[{self.type.get_metavar(None, None) or self.type.name.upper()}]"
+ 
+     def add_to_parser(self, parser, ctx):
+         def parser_process(value, state):
+-- 
+2.50.1
+
diff --git a/package/python-esptool/Config.in b/package/python-esptool/Config.in
index 5095454aa1..e1471f1170 100644
--- a/package/python-esptool/Config.in
+++ b/package/python-esptool/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_PYTHON_ESPTOOL
 	select BR2_PACKAGE_PYTHON_REEDSOLO # runtime
 	select BR2_PACKAGE_PYTHON_SERIAL # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB
+	select BR2_PACKAGE_PYTHON_RICH_CLICK # runtime
 	help
 	  A serial utility to communicate & flash code to Espressif
 	  ESP8266 & ESP32 chips.
diff --git a/package/python-esptool/python-esptool.hash b/package/python-esptool/python-esptool.hash
index 6eab790901..1e3cc363e1 100644
--- a/package/python-esptool/python-esptool.hash
+++ b/package/python-esptool/python-esptool.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/esptool/json
-md5  c7d41d4c89ffa0fa0a9d490439358b27  esptool-4.8.1.tar.gz
-sha256  dc4ef26b659e1a8dcb019147c0ea6d94980b34de99fbe09121c7941c8b254531  esptool-4.8.1.tar.gz
+md5  17c0e50e4017f1acab0c26e2b28b09ae  esptool-5.0.1.tar.gz
+sha256  2ad7cae469e4356a2a3087c385343ade7b0c0cd68ffe5b934d9e595d74e3bac9  esptool-5.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/python-esptool/python-esptool.mk b/package/python-esptool/python-esptool.mk
index a4922c1e5b..1f8c961f33 100644
--- a/package/python-esptool/python-esptool.mk
+++ b/package/python-esptool/python-esptool.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ESPTOOL_VERSION = 4.8.1
+PYTHON_ESPTOOL_VERSION = 5.0.1
 PYTHON_ESPTOOL_SOURCE = esptool-$(PYTHON_ESPTOOL_VERSION).tar.gz
-PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/5c/6b/3ce9bb7f36bdef3d6ae71646a1d3b7d59826a478f3ed8a783a93a2f8f537
+PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/7e/94/4f3057d92c8e16db8c48ade626dcabb172031756bcee3a29c4bd614f4ff3
 PYTHON_ESPTOOL_SETUP_TYPE = setuptools
 PYTHON_ESPTOOL_LICENSE = GPL-2.0+
 PYTHON_ESPTOOL_LICENSE_FILES = LICENSE
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
