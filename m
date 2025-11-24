Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE0ECFA466
	for <buildroot@archiver.kernel.org>; Mon, 24 Nov 2025 16:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 900AA83613;
	Mon, 24 Nov 2025 16:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8StCJ5VK3P9a; Mon, 24 Nov 2025 16:00:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 959D283640
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 959D283640;
	Mon, 24 Nov 2025 16:00:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F285F34E
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 16:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE175605BE
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 16:00:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XYM2vmxu7-SK for <buildroot@buildroot.org>;
 Mon, 24 Nov 2025 16:00:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DC96A605BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC96A605BB
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC96A605BB
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 16:00:30 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id F0D272C80043;
 Mon, 24 Nov 2025 17:00:27 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 24 Nov 2025 17:00:28 +0100
Message-ID: <20251124160029.3122459-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1764000028; bh=FkrdkaMoi1V4bCtMBoWzbOzbuTPkp+xk7oS884NX6w0=;
 h=From:To:Cc:Subject:Date;
 b=XpSh45dm2OyuQQutgLWGfWXHzovapRE0Js3LIIvBavmHaotlLshdYovRRbsbbzxoo
 8pgdrbaBUOAM1t8ijuFO7qUpGZaYn3sWvBTTsfNAINlWA8nuBu/A4csKIA9Hdj/Oru
 2bNGMLOVKW+N58TaMK4bys0yuzQBLBDmXKC22gx/BrkHWQhzGmKkAbbMpE4L9E89nS
 ynKOBjVlNjO0jB7ozcdNMXCAqz74+aXFmI1YbZjyG2DYsmvy9ajV1f57+o8BA+b2CG
 Rd313FxTzwZPsIvwuEdkwPiV6/2EGSOncYALG9dMpaPtJ7XIrubHhbbtCXNWtw7OS9
 +TCCpFXE92HzA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=XpSh45dm
Subject: [Buildroot] [PATCH] package/python-fastapi: bump to 0.121.3
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This introduces a new trivial [1] runtime dependency (annotated-doc), so
we add that as a separate package.

Changes:
* https://github.com/fastapi/fastapi/releases/tag/0.120.0
* https://github.com/fastapi/fastapi/releases/tag/0.120.1
* https://github.com/fastapi/fastapi/releases/tag/0.120.2
* https://github.com/fastapi/fastapi/releases/tag/0.120.3
* https://github.com/fastapi/fastapi/releases/tag/0.120.4
* https://github.com/fastapi/fastapi/releases/tag/0.121.0
* https://github.com/fastapi/fastapi/releases/tag/0.121.1
* https://github.com/fastapi/fastapi/releases/tag/0.121.2
* https://github.com/fastapi/fastapi/releases/tag/0.121.3

[1] https://github.com/fastapi/annotated-doc/blob/main/src/annotated_doc/main.py

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 DEVELOPERS                                        |  1 +
 package/Config.in                                 |  1 +
 package/python-annotated-doc/Config.in            |  7 +++++++
 .../python-annotated-doc.hash                     |  5 +++++
 .../python-annotated-doc/python-annotated-doc.mk  | 15 +++++++++++++++
 package/python-fastapi/Config.in                  |  1 +
 package/python-fastapi/python-fastapi.hash        |  4 ++--
 package/python-fastapi/python-fastapi.mk          |  4 ++--
 8 files changed, 34 insertions(+), 4 deletions(-)
 create mode 100644 package/python-annotated-doc/Config.in
 create mode 100644 package/python-annotated-doc/python-annotated-doc.hash
 create mode 100644 package/python-annotated-doc/python-annotated-doc.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 695b738d7e..fe68fda52f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2260,6 +2260,7 @@ N:	Marcus Hoffmann <bubu@bubu1.eu>
 F:	package/nethogs/
 F:	package/pico-sdk/
 F:	package/picotool/
+F:	package/python-annotated-doc/
 F:	package/python-apscheduler/
 F:	package/python-crc/
 F:	package/python-django/
diff --git a/package/Config.in b/package/Config.in
index 2fb9cd8472..c93de7c6a1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -992,6 +992,7 @@ menu "External python modules"
 	source "package/python-alembic/Config.in"
 	source "package/python-alsaaudio/Config.in"
 	source "package/python-aniso8601/Config.in"
+	source "package/python-annotated-doc/Config.in"
 	source "package/python-annotated-types/Config.in"
 	source "package/python-ansicolors/Config.in"
 	source "package/python-anyio/Config.in"
diff --git a/package/python-annotated-doc/Config.in b/package/python-annotated-doc/Config.in
new file mode 100644
index 0000000000..3bd240f211
--- /dev/null
+++ b/package/python-annotated-doc/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_ANNOTATED_DOC
+	bool "python-annotated-doc"
+	help
+	  Document parameters, class attributes, return types, and
+	  variables inline, with Annotated.
+
+	  https://github.com/fastapi/annotated-doc
diff --git a/package/python-annotated-doc/python-annotated-doc.hash b/package/python-annotated-doc/python-annotated-doc.hash
new file mode 100644
index 0000000000..8ffdae9b5d
--- /dev/null
+++ b/package/python-annotated-doc/python-annotated-doc.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/annotated-doc/json
+md5  825f2ecff1f182cd942ea09907ebafdb  annotated_doc-0.0.4.tar.gz
+sha256  fbcda96e87e9c92ad167c2e53839e57503ecfda18804ea28102353485033faa4  annotated_doc-0.0.4.tar.gz
+# Locally computed sha256 checksums
+sha256  fff170779a6acbf65abdb405c087f1cee1786691e4a96a4034517e4a504a0cdf  LICENSE
diff --git a/package/python-annotated-doc/python-annotated-doc.mk b/package/python-annotated-doc/python-annotated-doc.mk
new file mode 100644
index 0000000000..23e0ccd358
--- /dev/null
+++ b/package/python-annotated-doc/python-annotated-doc.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-annotated-doc
+#
+################################################################################
+
+
+PYTHON_ANNOTATED_DOC_VERSION = 0.0.4
+PYTHON_ANNOTATED_DOC_SOURCE = annotated_doc-$(PYTHON_ANNOTATED_DOC_VERSION).tar.gz
+PYTHON_ANNOTATED_DOC_SITE = https://files.pythonhosted.org/packages/57/ba/046ceea27344560984e26a590f90bc7f4a75b06701f653222458922b558c
+PYTHON_ANNOTATED_DOC_SETUP_TYPE = pep517
+PYTHON_ANNOTATED_DOC_LICENSE = MIT
+PYTHON_ANNOTATED_DOC_LICENSE_FILES = LICENSE
+PYTHON_ANNOTATED_DOC_DEPENDENCIES = host-python-pdm-backend
+$(eval $(python-package))
diff --git a/package/python-fastapi/Config.in b/package/python-fastapi/Config.in
index 21997daf9a..0dd4499a3f 100644
--- a/package/python-fastapi/Config.in
+++ b/package/python-fastapi/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_FASTAPI
 	bool "python-fastapi"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pydantic -> python-pydantic-core
+	select BR2_PACKAGE_PYTHON_ANNOTATED_DOC # runtime
 	select BR2_PACKAGE_PYTHON_PYDANTIC # runtime
 	select BR2_PACKAGE_PYTHON_STARLETTE # runtime
 	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index 34bfe22c87..35a4ffd065 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  5d539db8065d3579430ed00577e8a86b  fastapi-0.119.1.tar.gz
-sha256  a5e3426edce3fe221af4e1992c6d79011b247e3b03cc57999d697fe76cbf8ae0  fastapi-0.119.1.tar.gz
+md5  a62694a0a9a111fc76178e02707573b7  fastapi-0.121.3.tar.gz
+sha256  0055bc24fe53e56a40e9e0ad1ae2baa81622c406e548e501e717634e2dfbc40b  fastapi-0.121.3.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index 4a067494a7..40493dc6bf 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.119.1
+PYTHON_FASTAPI_VERSION = 0.121.3
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/a6/f4/152127681182e6413e7a89684c434e19e7414ed7ac0c632999c3c6980640
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/80/f0/086c442c6516195786131b8ca70488c6ef11d2f2e33c9a893576b2b0d3f7
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
