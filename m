Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29585CA0EDA
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 16:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F19B861472;
	Mon, 11 Aug 2025 16:18:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jqegJ5XNJ6GQ; Mon, 11 Aug 2025 16:18:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E191F6144A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E191F6144A;
	Mon, 11 Aug 2025 16:18:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D557138
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 806E361459
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:18:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8QSPMw-fWKxu for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 16:18:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D836961090
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D836961090
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D836961090
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:18:38 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.127.180]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQMyf-1uz1je1npx-00Z9VL; Mon, 11
 Aug 2025 18:18:35 +0200
To: buildroot@buildroot.org
Date: Mon, 11 Aug 2025 18:18:08 +0200
Message-ID: <20250811161809.3641323-7-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811161809.3641323-1-fiona.klute@gmx.de>
References: <20250811161809.3641323-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:rmNJbJlDY2+3n/oDXAItH1H8WOTbHSj4OSL/ig/kODe+o3IQ0Lx
 TyqHE9gVx+rPhn3P6Bff59P9dltX9nwJJ6MT0F1/jjx6BQdsTFdU6bxkxOJDITioGvygHEs
 IbfHfZvyUS3MyNZSQaY7TUJ7htXqA9LGfRyywGzoRDv10HRBuRgmtglfDnRW1q+uSnHd11W
 Bx1oE98Wu6HlgyoirHGTg==
UI-OutboundReport: notjunk:1;M01:P0:KllGLBXZv5g=;qKFI3Jx0lg+Y5GZKgbXGx2qv4wE
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1754929115; x=1755533915; i=fiona.klute@gmx.de;
 bh=YYWiqxTophQvKuc7j8IQcFbHo45eRms3tb2D6qN2peE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=OPcje5cp8f3WZ+roKSxOZaOegJBNaCWFUeUTLgbbuSZoViyFbpYwHiSY8Bi7by6+
 ozyZz0Az4qIKzm1MLJL7AuwbW0CEkl17e+nNNODHdihjjysefqakf8GN0XyGw+MHU
 FWsrcgxu+qoKoJ9J2F9YbmEMj5zDX0MJAL9NaZ6J5TUlHG9hVZJbTeQGYnzKAKyUj
 1Bpy8ByrBmcsqLy86nrTpvuHU/UcYfygAX4VlqRSE4ruRhdgl/+5XSt7ezexfIv0q
 v6nTEL5TUlaeN/f9VvzAiXUKX90Txp0KBriKBV1fcvaS3SZCcymLvGXRdA/85IAhZ
 OLD0dB85v+1Bln+UYg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=OPcje5cp
Subject: [Buildroot] [PATCH v2 6/7] package/python-textual: new package
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-textual/Config.in           | 11 +++++++++++
 package/python-textual/python-textual.hash |  5 +++++
 package/python-textual/python-textual.mk   | 14 ++++++++++++++
 5 files changed, 32 insertions(+)
 create mode 100644 package/python-textual/Config.in
 create mode 100644 package/python-textual/python-textual.hash
 create mode 100644 package/python-textual/python-textual.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 757ee138ba..c04a7df05b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1126,6 +1126,7 @@ F:	package/python-platformdirs/
 F:	package/python-pyasynchat/
 F:	package/python-pyasyncore/
 F:	package/python-rich/
+F:	package/python-textual/
 F:	support/testing/tests/package/sample_python_networkmanager_goi.py
 F:	support/testing/tests/package/test_nftables.py
 F:	support/testing/tests/package/test_python_networkmanager_goi.py
diff --git a/package/Config.in b/package/Config.in
index 14aab8ad3e..dfaa2486a5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1451,6 +1451,7 @@ menu "External python modules"
 	source "package/python-termcolor/Config.in"
 	source "package/python-terminaltables/Config.in"
 	source "package/python-texttable/Config.in"
+	source "package/python-textual/Config.in"
 	source "package/python-tftpy/Config.in"
 	source "package/python-thrift/Config.in"
 	source "package/python-tinycss2/Config.in"
diff --git a/package/python-textual/Config.in b/package/python-textual/Config.in
new file mode 100644
index 0000000000..aecf050ec9
--- /dev/null
+++ b/package/python-textual/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_TEXTUAL
+	bool "python-textual"
+	select BR2_PACKAGE_PYTHON_MARKDOWN_IT_PY # runtime
+	select BR2_PACKAGE_PYTHON_PLATFORMDIRS # runtime
+	select BR2_PACKAGE_PYTHON_PYGMENTS # runtime
+	select BR2_PACKAGE_PYTHON_RICH # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
+	help
+	  Modern Text User Interface framework.
+
+	  https://github.com/Textualize/textual
diff --git a/package/python-textual/python-textual.hash b/package/python-textual/python-textual.hash
new file mode 100644
index 0000000000..692e0d757b
--- /dev/null
+++ b/package/python-textual/python-textual.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/textual/json
+md5  cb43b8d6d3903ca171330a626cfa05e5  textual-5.3.0.tar.gz
+sha256  1b6128b339adef2e298cc23ab4777180443240ece5c232f29b22960efd658d4d  textual-5.3.0.tar.gz
+# Locally computed sha256 checksums
+sha256  94f290a762376dfdb7768e42070618b0abfd2a2799eab1b1c097816c3a39eb57  LICENSE
diff --git a/package/python-textual/python-textual.mk b/package/python-textual/python-textual.mk
new file mode 100644
index 0000000000..49cccc299d
--- /dev/null
+++ b/package/python-textual/python-textual.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-textual
+#
+################################################################################
+
+PYTHON_TEXTUAL_VERSION = 5.3.0
+PYTHON_TEXTUAL_SOURCE = textual-$(PYTHON_TEXTUAL_VERSION).tar.gz
+PYTHON_TEXTUAL_SITE = https://files.pythonhosted.org/packages/ba/ce/f0f938d33d9bebbf8629e0020be00c560ddfa90a23ebe727c2e5aa3f30cf
+PYTHON_TEXTUAL_SETUP_TYPE = poetry
+PYTHON_TEXTUAL_LICENSE = MIT
+PYTHON_TEXTUAL_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
