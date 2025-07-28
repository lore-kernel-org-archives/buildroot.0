Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E33C87FC9
	for <buildroot@archiver.kernel.org>; Mon, 28 Jul 2025 13:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE7A281839;
	Mon, 28 Jul 2025 13:01:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xNV_y8CHsVjP; Mon, 28 Jul 2025 13:01:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1520817AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1520817AA;
	Mon, 28 Jul 2025 13:01:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C8E57151
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 13:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE3A7606E9
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 13:01:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8zkOWNxIET4n for <buildroot@buildroot.org>;
 Mon, 28 Jul 2025 13:01:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=77.55.128.204;
 helo=mail.grinn-global.com; envelope-from=b.bilas@grinn-global.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DE92F6060E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE92F6060E
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE92F6060E
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 13:01:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (25)
Received: from bartekk-pc (ip-194.4.60.197.edial.pl [194.4.60.197])
 by server220076.nazwa.pl (Postfix) with ESMTP id DA6D91BD730;
 Mon, 28 Jul 2025 15:01:20 +0200 (CEST)
From: Bartosz Bilas <b.bilas@grinn-global.com>
To: buildroot@buildroot.org
Cc: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Mon, 28 Jul 2025 15:01:16 +0200
Message-ID: <20250728130118.18606-4-b.bilas@grinn-global.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250728130118.18606-1-b.bilas@grinn-global.com>
References: <20250728130118.18606-1-b.bilas@grinn-global.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=grinn-global.com
Subject: [Buildroot] [PATCH 4/6] package/python-importlib-metadata: new
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 package/Config.in                                 |  1 +
 package/python-importlib-metadata/Config.in       |  8 ++++++++
 .../python-importlib-metadata.hash                |  5 +++++
 .../python-importlib-metadata.mk                  | 15 +++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/python-importlib-metadata/Config.in
 create mode 100644 package/python-importlib-metadata/python-importlib-metadata.hash
 create mode 100644 package/python-importlib-metadata/python-importlib-metadata.mk

diff --git a/package/Config.in b/package/Config.in
index 0f5e3def99..08872aee84 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1176,6 +1176,7 @@ menu "External python modules"
 	source "package/python-idna/Config.in"
 	source "package/python-ifaddr/Config.in"
 	source "package/python-immutabledict/Config.in"
+	source "package/python-importlib-metadata/Config.in"
 	source "package/python-incremental/Config.in"
 	source "package/python-inflect/Config.in"
 	source "package/python-inflection/Config.in"
diff --git a/package/python-importlib-metadata/Config.in b/package/python-importlib-metadata/Config.in
new file mode 100644
index 0000000000..6d9dd8ae21
--- /dev/null
+++ b/package/python-importlib-metadata/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_IMPORTLIB_METADATA
+	bool "python-importlib-metadata"
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
+	select BR2_PACKAGE_PYTHON_ZIPP # runtime
+	help
+          Library to access the metadata for a Python package.
+
+          https://github.com/python/importlib_metadata
diff --git a/package/python-importlib-metadata/python-importlib-metadata.hash b/package/python-importlib-metadata/python-importlib-metadata.hash
new file mode 100644
index 0000000000..97ae8d7c7f
--- /dev/null
+++ b/package/python-importlib-metadata/python-importlib-metadata.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/importlib-metadata/json
+md5  4be81d3e32fd72eac56559be49ccb920  importlib_metadata-8.7.0.tar.gz
+sha256  d13b81ad223b890aa16c5471f2ac3056cf76c5f10f82d6f9292f0b415f389000  importlib_metadata-8.7.0.tar.gz
+# Locally computed sha256 checksums
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-importlib-metadata/python-importlib-metadata.mk b/package/python-importlib-metadata/python-importlib-metadata.mk
new file mode 100644
index 0000000000..707852398a
--- /dev/null
+++ b/package/python-importlib-metadata/python-importlib-metadata.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-importlib-metadata
+#
+################################################################################
+
+PYTHON_IMPORTLIB_METADATA_VERSION = 8.7.0
+PYTHON_IMPORTLIB_METADATA_SOURCE = importlib_metadata-$(PYTHON_IMPORTLIB_METADATA_VERSION).tar.gz
+PYTHON_IMPORTLIB_METADATA_SITE = https://files.pythonhosted.org/packages/76/66/650a33bd90f786193e4de4b3ad86ea60b53c89b669a5c7be931fac31cdb0
+PYTHON_IMPORTLIB_METADATA_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_IMPORTLIB_METADATA_SETUP_TYPE = setuptools
+PYTHON_IMPORTLIB_METADATA_LICENSE = Apache-2.0
+PYTHON_IMPORTLIB_METADATA_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
