Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 048C1C3ABCC
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 15:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B765C4155A;
	Wed, 14 May 2025 15:13:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h5EW-FDEUXZD; Wed, 14 May 2025 15:13:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7202641549
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7202641549;
	Wed, 14 May 2025 15:13:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AB36212A
 for <buildroot@buildroot.org>; Wed, 14 May 2025 15:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FBAF40F6F
 for <buildroot@buildroot.org>; Wed, 14 May 2025 15:13:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hnnOWotJyMCm for <buildroot@buildroot.org>;
 Wed, 14 May 2025 15:13:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6F754405BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F754405BA
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6F754405BA
 for <buildroot@buildroot.org>; Wed, 14 May 2025 15:13:01 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id EF0182C845D3;
 Wed, 14 May 2025 17:12:58 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed, 14 May 2025 17:12:38 +0200
Message-ID: <20250514151255.2316205-4-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514151255.2316205-1-buildroot@bubu1.eu>
References: <20250514151255.2316205-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1747235579; bh=M4B2fqWucOoOv3DBrBoVOhsgsbE+mfc89I8YVQjq/zk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=gePFARuQQ5udBFRmv8yk86TP+ePZCAukBmxLY3JiABfiPwaIQ3G8MCUM7Gp20PB9N
 GczWqDcwMjL9sxh9epEBGdYobKCrABAJvXQI+eJl81GUaOF8gM+mcLCvp9l4+8L63x
 6MgNtN3zEA3qrq/ohnYnmitzF4uqnxaKSRsPSSrnoVmkiMPVwu9evyShCKKadnXlNf
 z1+RJkaD75GeqLnY22a0vXAUo1o+/4mrYLiEjLc2hicXotHjv7pl1fh/loCErGqx39
 9wifiXXkswzfl/BMQFeei6Y1lxz3WxO3B8sjD0cG+zhDiVY+gRPXvFhYuFmQqJqML5
 86Yfu75D9POYw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=gePFARuQ
Subject: [Buildroot] [PATCH v2 04/12] package/python-typing-inspection: new
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add python-typing-inspection as a newly introduced dependency of
pydantic.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
added in v2
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/python-typing-inspection/Config.in         |  7 +++++++
 .../python-typing-inspection.hash                  |  5 +++++
 .../python-typing-inspection.mk                    | 14 ++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/python-typing-inspection/Config.in
 create mode 100644 package/python-typing-inspection/python-typing-inspection.hash
 create mode 100644 package/python-typing-inspection/python-typing-inspection.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c4d14aa875..bf1d4b4d44 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2274,6 +2274,7 @@ F:	package/picotool/
 F:	package/python-immutabledict/
 F:	package/python-jc/
 F:	package/python-ruamel-yaml-clib/
+F:	package/python-typing-inspection/
 F:	package/python-tzlocal/
 F:	package/python-waitress/
 F:	support/testing/tests/package/test_python_fastapi.py
diff --git a/package/Config.in b/package/Config.in
index a9074ac405..2991b47548 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1466,6 +1466,7 @@ menu "External python modules"
 	source "package/python-types-python-dateutil/Config.in"
 	source "package/python-typing-extensions/Config.in"
 	source "package/python-typing-inspect/Config.in"
+	source "package/python-typing-inspection/Config.in"
 	source "package/python-tzlocal/Config.in"
 	source "package/python-u-msgpack/Config.in"
 	source "package/python-ubjson/Config.in"
diff --git a/package/python-typing-inspection/Config.in b/package/python-typing-inspection/Config.in
new file mode 100644
index 0000000000..bedfb21fbc
--- /dev/null
+++ b/package/python-typing-inspection/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_TYPING_INSPECTION
+	bool "python-typing-inspection"
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
+	help
+	  Runtime typing introspection tools.
+
+	  https://github.com/pydantic/typing-inspection
diff --git a/package/python-typing-inspection/python-typing-inspection.hash b/package/python-typing-inspection/python-typing-inspection.hash
new file mode 100644
index 0000000000..2ed08c1d35
--- /dev/null
+++ b/package/python-typing-inspection/python-typing-inspection.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/typing-inspection/json
+md5  694cee9b0518959cd4b2b7ce2dc5cf2e  typing_inspection-0.4.0.tar.gz
+sha256  9765c87de36671694a67904bf2c96e395be9c6439bb6c87b5142569dcdd65122  typing_inspection-0.4.0.tar.gz
+# Locally computed sha256 checksums
+sha256  4e40cba793a388dd456577b8657175bbe95e4ded2970534b3c59cccc2661a708  LICENSE
diff --git a/package/python-typing-inspection/python-typing-inspection.mk b/package/python-typing-inspection/python-typing-inspection.mk
new file mode 100644
index 0000000000..043ee12090
--- /dev/null
+++ b/package/python-typing-inspection/python-typing-inspection.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-typing-inspection
+#
+################################################################################
+
+PYTHON_TYPING_INSPECTION_VERSION = 0.4.0
+PYTHON_TYPING_INSPECTION_SOURCE = typing_inspection-$(PYTHON_TYPING_INSPECTION_VERSION).tar.gz
+PYTHON_TYPING_INSPECTION_SITE = https://files.pythonhosted.org/packages/82/5c/e6082df02e215b846b4b8c0b887a64d7d08ffaba30605502639d44c06b82
+PYTHON_TYPING_INSPECTION_SETUP_TYPE = hatch
+PYTHON_TYPING_INSPECTION_LICENSE = MIT
+PYTHON_TYPING_INSPECTION_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
