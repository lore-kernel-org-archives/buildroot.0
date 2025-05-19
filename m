Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E163C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3310240D37;
	Mon, 19 May 2025 10:15:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i5Yur48Q1im5; Mon, 19 May 2025 10:15:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34D8D40CED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34D8D40CED;
	Mon, 19 May 2025 10:15:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CF460D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE85140D13
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:15:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1L8utK6qURJr for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:15:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5AA5440CDE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AA5440CDE
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5AA5440CDE
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:15:24 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 56BFE2C84559;
 Mon, 19 May 2025 12:15:22 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon, 19 May 2025 12:15:18 +0200
Message-ID: <20250519101521.322507-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1747649722; bh=6RxrmN1LbMvaTilgaFnzDZmq8vv067a8TbfJXMaELHU=;
 h=From:To:Cc:Subject:Date;
 b=sHQWXWj65XleuzNr+FBrpIAX8XMuO96GGmC233BfoyIdJKmfUxcP3qaWZxlWTKNAi
 PjjRTWaIIvYRsXi9ZTZzpOT7YRfYLK8z2SXr3t//kGSbgN8JpNjhVtpV+A746bHnHA
 APTVF9zVvbTDroMhSwE2goAC7FcbUV1ER24Ccr1H9zTsOJsjZWifM2JtCwJzatH3bx
 Za0Z8yEuB/ruH7x9vf1DSxN7TnShv4rxxOYr5HfSNQONfHHRTO9cBuz0RIqZclltxv
 CHuBY7zheY3+smHkJXbLO6tG5SkpYTGSIgSdJUcgItoNWYIvzFO4wer9Trfr4hYLmo
 IjJ4M5w4KeSSw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=sHQWXWj6
Subject: [Buildroot] [PATCH 1/2] package/python-sdbus-modemmanager: new
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/python-sdbus-modemmanager/Config.in        | 12 ++++++++++++
 .../python-sdbus-modemmanager.hash                 |  5 +++++
 .../python-sdbus-modemmanager.mk                   | 14 ++++++++++++++
 5 files changed, 33 insertions(+)
 create mode 100644 package/python-sdbus-modemmanager/Config.in
 create mode 100644 package/python-sdbus-modemmanager/python-sdbus-modemmanager.hash
 create mode 100644 package/python-sdbus-modemmanager/python-sdbus-modemmanager.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c4df675aaf..087500c755 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2282,6 +2282,7 @@ F:	package/python-pydantic-settings/
 F:	package/python-ruamel-yaml-clib/
 F:	package/python-typing-inspection/
 F:	package/python-tzlocal/
+F:	package/python-sdbus-modemmanager/
 F:	package/python-waitress/
 F:	support/testing/tests/package/test_python_fastapi.py
 F:	support/testing/tests/package/test_python_pydantic.py
diff --git a/package/Config.in b/package/Config.in
index 33dc03a28a..1e43738408 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1389,6 +1389,7 @@ menu "External python modules"
 	source "package/python-schedule/Config.in"
 	source "package/python-scipy/Config.in"
 	source "package/python-sdbus/Config.in"
+	source "package/python-sdbus-modemmanager/Config.in"
 	source "package/python-sdbus-networkmanager/Config.in"
 	source "package/python-sdnotify/Config.in"
 	source "package/python-secretstorage/Config.in"
diff --git a/package/python-sdbus-modemmanager/Config.in b/package/python-sdbus-modemmanager/Config.in
new file mode 100644
index 0000000000..bf2759b4fc
--- /dev/null
+++ b/package/python-sdbus-modemmanager/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_SDBUS_MODEMMANAGER
+	bool "python-sdbus-modemmanager"
+	depends on BR2_PACKAGE_SYSTEMD
+	depends on BR2_PACKAGE_MODEM_MANAGER # runtime
+	select BR2_PACKAGE_PYTHON_SDBUS # runtime
+	help
+	  ModemManager bindings for sdbus.
+
+	  https://github.com/zhanglongqi/python-sdbus-modemmanager
+
+comment "python-sdbus-modemmanager needs systemd and modem-manager"
+	depends on !BR2_PACKAGE_SYSTEMD || !BR2_PACKAGE_MODEM_MANAGER
diff --git a/package/python-sdbus-modemmanager/python-sdbus-modemmanager.hash b/package/python-sdbus-modemmanager/python-sdbus-modemmanager.hash
new file mode 100644
index 0000000000..980568cb0d
--- /dev/null
+++ b/package/python-sdbus-modemmanager/python-sdbus-modemmanager.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/sdbus-modemmanager/json
+md5  720d59e444d84d77c184bc73844cfebd  sdbus_modemmanager-1.0.2.tar.gz
+sha256  80ed83a158eeb8d9b0e0c1e5110c5f71307df87523245e4d0e79ebe200932fc6  sdbus_modemmanager-1.0.2.tar.gz
+# Locally computed sha256 checksums
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/python-sdbus-modemmanager/python-sdbus-modemmanager.mk b/package/python-sdbus-modemmanager/python-sdbus-modemmanager.mk
new file mode 100644
index 0000000000..2821453270
--- /dev/null
+++ b/package/python-sdbus-modemmanager/python-sdbus-modemmanager.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-sdbus-modemmanager
+#
+################################################################################
+
+PYTHON_SDBUS_MODEMMANAGER_VERSION = 1.0.2
+PYTHON_SDBUS_MODEMMANAGER_SOURCE = sdbus_modemmanager-$(PYTHON_SDBUS_MODEMMANAGER_VERSION).tar.gz
+PYTHON_SDBUS_MODEMMANAGER_SITE = https://files.pythonhosted.org/packages/af/99/a17942d9abda13ad1f27f39e900e39852a6215b70e30b682b777dfeff818
+PYTHON_SDBUS_MODEMMANAGER_SETUP_TYPE = setuptools
+PYTHON_SDBUS_MODEMMANAGER_LICENSE = LGPL-2.1+
+PYTHON_SDBUS_MODEMMANAGER_LICENSE_FILES = COPYING.LESSER
+
+$(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
