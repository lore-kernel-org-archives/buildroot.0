Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A1ECA0ED1
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 16:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D8AA414B8;
	Mon, 11 Aug 2025 16:18:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GJ6L5aYeFgez; Mon, 11 Aug 2025 16:18:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F5CB415E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F5CB415E4;
	Mon, 11 Aug 2025 16:18:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D9F5154
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DED636143E
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:18:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jYSpeKGuIrhW for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 16:18:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7039761458
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7039761458
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7039761458
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:18:37 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.127.180]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MiacR-1u8qI11xiB-00ot8f; Mon, 11
 Aug 2025 18:18:34 +0200
To: buildroot@buildroot.org
Date: Mon, 11 Aug 2025 18:18:07 +0200
Message-ID: <20250811161809.3641323-6-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811161809.3641323-1-fiona.klute@gmx.de>
References: <20250811161809.3641323-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:oimmBJZDrdMqRPARtKTfaQMuuOyZrfX17ECbqW8iCImrl48E0go
 SJ6wNFDRfF0Ro0bLo6AGWI8AoVfYgaj42/SOLFO2x5EVxATp0Pr+28H+fVUGmQu04TUJPNL
 jsal5SAlmFffB11M3PJtPrhy2oEZ7UR0ASorSYjKRtM9ON0HIH1Eeb6p5YfPdZU3stY67g3
 3/yYNny2LvfsD5VkmFjsg==
UI-OutboundReport: notjunk:1;M01:P0:rOlMhc6l+F0=;P7gNDc/1R/l0aV1lx/2P1UPWm3E
 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
 qVbSLAl85Lw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1754929114; x=1755533914; i=fiona.klute@gmx.de;
 bh=K9o4yyWA0R3MLpKgRZWRDoIoyGTp5LYpKGmU+I0T1V0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=YYDRmxd0+bqGNK2R/Ko5zcKrNxhBOCEe9laTZBLuz+d768JoP1k3zzHdofltGg2x
 SvSiu52JCf2NPlS6n7X2Y9wRsJtff6a6NAU0koM7wGS+9MyvJFDFRDrcmsipt3YwP
 UPXENgsf5obvPO8rIZPuQnEzTb3ThWCAMasXBhYWHkamG7Gxo+3EUb5x5FqqB/7bC
 /rcEmtGjt2yO5DuZ/3CPhfWdi5Y2iKVg9/Xt6J0Mud7j3IMScay4gYhPC1Gw8BDA9
 m8CeZNqOGRVVEAixGolHZxdftPIq79TsNNcMtPJS9uWR19oQH3+7v1seDccbsfrd+
 hue7dVHGoAzPlm40fw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=YYDRmxd0
Subject: [Buildroot] [PATCH v2 5/7] package/python-rich: new package
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
index 91cae6cf2e..757ee138ba 100644
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
