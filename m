Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E39DC87FCF
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 22:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D0B760E30;
	Sat,  9 Aug 2025 22:37:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vj34KYcocKrd; Sat,  9 Aug 2025 22:37:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BF7460E0F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BF7460E0F;
	Sat,  9 Aug 2025 22:37:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A66B31
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 22:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 543C460E11
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 22:37:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hcjLu91ku0UG for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 22:37:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E051C60DF9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E051C60DF9
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E051C60DF9
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 22:37:48 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.119.120]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N9dsb-1uW8jO3r0v-00uSXI; Sun, 10
 Aug 2025 00:32:44 +0200
To: buildroot@buildroot.org
Date: Sun, 10 Aug 2025 00:32:27 +0200
Message-ID: <20250809223229.2307960-6-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250809223229.2307960-1-fiona.klute@gmx.de>
References: <20250809223229.2307960-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:8q8RL3Uh56JnFokgO/O8+zkAK+dF0oRYg/Db7k6JbXsXzes5noz
 WJSZGxk9fnwIWr6+23TTv4IVCbFzlc4Lm9HkaxLaRgppKTxLkqUwBlhuIgmqdNDrHj/eGTN
 6tPFq1lOxvKo+BL07yjwaFmT3r13CyigpgZyF0cPdlPqb85FKjxlHdqzIYVFtIpHeuBdHdj
 6COMbMfMmOkJtkiwQqDDw==
UI-OutboundReport: notjunk:1;M01:P0:5CWGfU+qCVg=;uGR0wHPAe8LqgNhFXSmD27twqq+
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1754779067; x=1755383867; i=fiona.klute@gmx.de;
 bh=s3rX5M/xBrhEhlqTRmsAW9kNtS/bGoj08/FvBkgXmn8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=JdDtg4O0Rt5bShiBBytOc7QGKVTxstSdr2NrX1JcKgh9VahGWyTYVN2jbkJkMjlh
 vKNyB9JojnYx2NA/3uEk8F8hw+BaNpuTU+b//bAB9JECyIFRg8Tp0RJjlC2lKVcq2
 zEU9mk9A8nPaIPGm6edJ1CVuq+eGjaKxMbNO5ISaxseK0He6s37Vc5IBEdX7ng4Vt
 w77BoZUG7eWqBnaIqYV2N36HaxwHhv5QBoZrqC5FL1TxsISRBPvW5XBDmPL6cwtGJ
 av9BFSrIuGt1BAFL8aNCf5vNxduJnUzSjx4GB68qPRX1Gi8l8oSnbsk8vg6Rp9Kjl
 uybCFAGlyrwTX1D+Yg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=JdDtg4O0
Subject: [Buildroot] [PATCH 5/7] package/python-rich: new package
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
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/python-rich/Config.in        |  9 +++++++++
 package/python-rich/python-rich.hash |  5 +++++
 package/python-rich/python-rich.mk   | 14 ++++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 package/python-rich/Config.in
 create mode 100644 package/python-rich/python-rich.hash
 create mode 100644 package/python-rich/python-rich.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 361703b34b..60ce3274aa 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1125,6 +1125,7 @@ F:	package/python-mdurl/
 F:	package/python-platformdirs/
 F:	package/python-pyasynchat/
 F:	package/python-pyasyncore/
+F:	package/python-rich/
 F:	support/testing/tests/package/sample_python_networkmanager_goi.py
 F:	support/testing/tests/package/test_nftables.py
 F:	support/testing/tests/package/test_python_networkmanager_goi.py
diff --git a/package/Config.in b/package/Config.in
index 3d343c3c91..14aab8ad3e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1384,6 +1384,7 @@ menu "External python modules"
 	source "package/python-requests-toolbelt/Config.in"
 	source "package/python-rfc3987/Config.in"
 	source "package/python-rgbmatrix/Config.in"
+	source "package/python-rich/Config.in"
 	source "package/python-rpds-py/Config.in"
 	source "package/python-rpi-gpio/Config.in"
 	source "package/python-rpi-ws281x/Config.in"
diff --git a/package/python-rich/Config.in b/package/python-rich/Config.in
new file mode 100644
index 0000000000..d7f3cdf54a
--- /dev/null
+++ b/package/python-rich/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_RICH
+	bool "python-rich"
+	select BR2_PACKAGE_PYTHON_MARKDOWN_IT_PY # runtime
+	select BR2_PACKAGE_PYTHON_PYGMENTS # runtime
+	help
+	  Render rich text, tables, progress bars, syntax
+	  highlighting, markdown and more to the terminal.
+
+	  https://github.com/Textualize/rich
diff --git a/package/python-rich/python-rich.hash b/package/python-rich/python-rich.hash
new file mode 100644
index 0000000000..87c58f42e3
--- /dev/null
+++ b/package/python-rich/python-rich.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/rich/json
+md5  38baf395e7860be314c6c29fcac8637d  rich-14.1.0.tar.gz
+sha256  e497a48b844b0320d45007cdebfeaeed8db2a4f4bcf49f15e455cfc4af11eaa8  rich-14.1.0.tar.gz
+# Locally computed sha256 checksums
+sha256  deed7c17a4318158190a3ea239cc879a5a50271cebb98ae7025f48fbe58dca15  LICENSE
diff --git a/package/python-rich/python-rich.mk b/package/python-rich/python-rich.mk
new file mode 100644
index 0000000000..e6564347a5
--- /dev/null
+++ b/package/python-rich/python-rich.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-rich
+#
+################################################################################
+
+PYTHON_RICH_VERSION = 14.1.0
+PYTHON_RICH_SOURCE = rich-$(PYTHON_RICH_VERSION).tar.gz
+PYTHON_RICH_SITE = https://files.pythonhosted.org/packages/fe/75/af448d8e52bf1d8fa6a9d089ca6c07ff4453d86c65c145d0a300bb073b9b
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
