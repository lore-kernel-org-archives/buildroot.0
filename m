Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B25C83F17
	for <buildroot@archiver.kernel.org>; Mon, 28 Jul 2025 13:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4E7040DA9;
	Mon, 28 Jul 2025 13:01:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1eptB6ucggo2; Mon, 28 Jul 2025 13:01:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8162C409B4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8162C409B4;
	Mon, 28 Jul 2025 13:01:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AE1E9D79
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 13:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 948B960777
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 13:01:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FIOZTAf9EFYr for <buildroot@buildroot.org>;
 Mon, 28 Jul 2025 13:01:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=77.55.128.204;
 helo=mail.grinn-global.com; envelope-from=b.bilas@grinn-global.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7C1FA606E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C1FA606E9
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C1FA606E9
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 13:01:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (25)
Received: from bartekk-pc (ip-194.4.60.197.edial.pl [194.4.60.197])
 by server220076.nazwa.pl (Postfix) with ESMTP id C71781BD6FD;
 Mon, 28 Jul 2025 15:01:19 +0200 (CEST)
From: Bartosz Bilas <b.bilas@grinn-global.com>
To: buildroot@buildroot.org
Cc: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Mon, 28 Jul 2025 15:01:14 +0200
Message-ID: <20250728130118.18606-2-b.bilas@grinn-global.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250728130118.18606-1-b.bilas@grinn-global.com>
References: <20250728130118.18606-1-b.bilas@grinn-global.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=grinn-global.com
Subject: [Buildroot] [PATCH 2/6] package/python-markdown-it-py: new package
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
 package/Config.in                                  |  1 +
 package/python-markdown-it-py/Config.in            |  7 +++++++
 .../python-markdown-it-py.hash                     |  5 +++++
 .../python-markdown-it-py/python-markdown-it-py.mk | 14 ++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-markdown-it-py/Config.in
 create mode 100644 package/python-markdown-it-py/python-markdown-it-py.hash
 create mode 100644 package/python-markdown-it-py/python-markdown-it-py.mk

diff --git a/package/Config.in b/package/Config.in
index e9ce49e2df..587f69e678 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1229,6 +1229,7 @@ menu "External python modules"
 	source "package/python-mako/Config.in"
 	source "package/python-markdown/Config.in"
 	source "package/python-markdown2/Config.in"
+	source "package/python-markdown-it-py/Config.in"
 	source "package/python-markupsafe/Config.in"
 	source "package/python-marshmallow/Config.in"
 	source "package/python-marshmallow-sqlalchemy/Config.in"
diff --git a/package/python-markdown-it-py/Config.in b/package/python-markdown-it-py/Config.in
new file mode 100644
index 0000000000..1c435a1f23
--- /dev/null
+++ b/package/python-markdown-it-py/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_MARKDOWN_IT_PY
+	bool "python-markdown-it-py"
+	select BR2_PACKAGE_PYTHON_MDURL # runtime
+	help
+	  Python port of markdown-it. Markdown parsing, done right!.
+
+	  https://github.com/executablebooks/markdown-it-py
diff --git a/package/python-markdown-it-py/python-markdown-it-py.hash b/package/python-markdown-it-py/python-markdown-it-py.hash
new file mode 100644
index 0000000000..4c06b311c1
--- /dev/null
+++ b/package/python-markdown-it-py/python-markdown-it-py.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/markdown-it-py/json
+md5  a00d59ed2704f6590fdde0e9bad04c7c  markdown-it-py-3.0.0.tar.gz
+sha256  e3f60a94fa066dc52ec76661e37c851cb232d92f9886b15cb560aaada2df8feb  markdown-it-py-3.0.0.tar.gz
+# Locally computed sha256 checksums
+sha256  4a2260d6e2cd0f5a151a1e86dbfe7d3ed552b1e2beabf9941c1ba5c49cbce484  LICENSE
diff --git a/package/python-markdown-it-py/python-markdown-it-py.mk b/package/python-markdown-it-py/python-markdown-it-py.mk
new file mode 100644
index 0000000000..ee778c1e5f
--- /dev/null
+++ b/package/python-markdown-it-py/python-markdown-it-py.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-markdown-it-py
+#
+################################################################################
+
+PYTHON_MARKDOWN_IT_PY_VERSION = 3.0.0
+PYTHON_MARKDOWN_IT_PY_SOURCE = markdown-it-py-$(PYTHON_MARKDOWN_IT_PY_VERSION).tar.gz
+PYTHON_MARKDOWN_IT_PY_SITE = https://files.pythonhosted.org/packages/38/71/3b932df36c1a044d397a1f92d1cf91ee0a503d91e470cbd670aa66b07ed0
+PYTHON_MARKDOWN_IT_PY_SETUP_TYPE = flit
+PYTHON_MARKDOWN_IT_PY_LICENSE = MIT
+PYTHON_MARKDOWN_IT_PY_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
