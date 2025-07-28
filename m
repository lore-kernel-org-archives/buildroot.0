Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D192C87FC9
	for <buildroot@archiver.kernel.org>; Mon, 28 Jul 2025 13:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3332E40848;
	Mon, 28 Jul 2025 13:01:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xJPL-1tb_RBF; Mon, 28 Jul 2025 13:01:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 377D54093B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 377D54093B;
	Mon, 28 Jul 2025 13:01:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A39F1151
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 13:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87CEB8175E
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 13:01:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iK8Wcfxk9IBF for <buildroot@buildroot.org>;
 Mon, 28 Jul 2025 13:01:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=77.55.128.204;
 helo=mail.grinn-global.com; envelope-from=b.bilas@grinn-global.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7BBFB81758
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BBFB81758
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7BBFB81758
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 13:01:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (25)
Received: from bartekk-pc (ip-194.4.60.197.edial.pl [194.4.60.197])
 by server220076.nazwa.pl (Postfix) with ESMTP id 4F5DA1BC938;
 Mon, 28 Jul 2025 15:01:20 +0200 (CEST)
From: Bartosz Bilas <b.bilas@grinn-global.com>
To: buildroot@buildroot.org
Cc: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Mon, 28 Jul 2025 15:01:15 +0200
Message-ID: <20250728130118.18606-3-b.bilas@grinn-global.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250728130118.18606-1-b.bilas@grinn-global.com>
References: <20250728130118.18606-1-b.bilas@grinn-global.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=grinn-global.com
Subject: [Buildroot] [PATCH 3/6] package/python-rich: new package
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
 package/Config.in                    |  1 +
 package/python-rich/Config.in        | 11 +++++++++++
 package/python-rich/python-rich.hash |  5 +++++
 package/python-rich/python-rich.mk   | 14 ++++++++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 package/python-rich/Config.in
 create mode 100644 package/python-rich/python-rich.hash
 create mode 100644 package/python-rich/python-rich.mk

diff --git a/package/Config.in b/package/Config.in
index 587f69e678..0f5e3def99 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1383,6 +1383,7 @@ menu "External python modules"
 	source "package/python-requests-toolbelt/Config.in"
 	source "package/python-rfc3987/Config.in"
 	source "package/python-rgbmatrix/Config.in"
+	source "package/python-rich/Config.in"
 	source "package/python-rpds-py/Config.in"
 	source "package/python-rpi-gpio/Config.in"
 	source "package/python-rpi-ws281x/Config.in"
diff --git a/package/python-rich/Config.in b/package/python-rich/Config.in
new file mode 100644
index 0000000000..e8cc4327e2
--- /dev/null
+++ b/package/python-rich/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_RICH
+	bool "python-rich"
+	select BR2_PACKAGE_PYTHON_MARKDOWN_IT_PY # runtime
+	select BR2_PACKAGE_PYTHON_PYGMENTS # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
+	select BR2_PACKAGE_PYTHON_MARKDOWN_IT_PY # runtime
+	help
+	  Render rich text, tables, progress bars, syntax
+	  highlighting, markdown and more to the terminal.
+
+	  https://github.com/Textualize/rich
diff --git a/package/python-rich/python-rich.hash b/package/python-rich/python-rich.hash
new file mode 100644
index 0000000000..9e6e954c9f
--- /dev/null
+++ b/package/python-rich/python-rich.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/rich/json
+md5  79410a24ae5dd52f3b89c6f0e4eadc5f  rich-14.0.0.tar.gz
+sha256  82f1bc23a6a21ebca4ae0c45af9bdbc492ed20231dcb63f297d6d1021a9d5725  rich-14.0.0.tar.gz
+# Locally computed sha256 checksums
+sha256  deed7c17a4318158190a3ea239cc879a5a50271cebb98ae7025f48fbe58dca15  LICENSE
diff --git a/package/python-rich/python-rich.mk b/package/python-rich/python-rich.mk
new file mode 100644
index 0000000000..ddac9686fb
--- /dev/null
+++ b/package/python-rich/python-rich.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-rich
+#
+################################################################################
+
+PYTHON_RICH_VERSION = 14.0.0
+PYTHON_RICH_SOURCE = rich-$(PYTHON_RICH_VERSION).tar.gz
+PYTHON_RICH_SITE = https://files.pythonhosted.org/packages/a1/53/830aa4c3066a8ab0ae9a9955976fb770fe9c6102117c8ec4ab3ea62d89e8
+PYTHON_RICH_SETUP_TYPE = poetry
+PYTHON_RICH_LICENSE = MIT
+PYTHON_RICH_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
