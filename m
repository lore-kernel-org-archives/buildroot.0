Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94AF9CA0ED3
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 16:18:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AA8F4152F;
	Mon, 11 Aug 2025 16:18:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9UD3xTU0WZq6; Mon, 11 Aug 2025 16:18:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5B79415D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5B79415D8;
	Mon, 11 Aug 2025 16:18:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D5B75154
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7BBE61090
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:18:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id myFB_AMLunMY for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 16:18:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5049F61446
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5049F61446
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5049F61446
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:18:37 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.127.180]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MDQeU-1uusdL28jm-002NAS; Mon, 11
 Aug 2025 18:18:33 +0200
To: buildroot@buildroot.org
Date: Mon, 11 Aug 2025 18:18:06 +0200
Message-ID: <20250811161809.3641323-5-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811161809.3641323-1-fiona.klute@gmx.de>
References: <20250811161809.3641323-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:s2JFN0orHBOgU15RgtwKdqMgHeyQ+9iKuSxsa9M0Zntjq8/3jpy
 N7yR9Kf8Ju3X/iqY4z/DzrW2Ig+DhFABqag34Awc5SNnG2wjk+VxZLLrqKOT7aAixsvNpKu
 cB39TZyA5pIVQsBdwNwANP27kCZlfJUoyZb0orSpzAlKj3W4LelwDMGhJ3l8MhQ8Y/bvAZ1
 y3JNfK9V/3Uqn4NaTgWIQ==
UI-OutboundReport: notjunk:1;M01:P0:GJ1xXiDiViw=;5e0ftO1MawaMO5pCVqxP7zyZiki
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1754929113; x=1755533913; i=fiona.klute@gmx.de;
 bh=HS/S59+P+uwpHqh3yKqCtESo6GSKxK1JYVGYbBcOxU8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Byl2e8157GBSujaDvmolmdYQ8k0nhPgcEEJ6AiCfQ9GbpU3bxGDdCDWVcX0cjBq8
 6eQGJ9hvvZAgpgfM7VWsA8tXvbUuCu5T3LDLBK5tkJ5WEaLAWR9bsFd9tucIMhUUc
 rOUezQbkTt6knGO2Z11dfqa4TnwRcE92uwQb22TSkHkjQuAO4i7pvZJj0fmZf84Wj
 JMDt1iMiDhzwBN2ZSrOTaVgk1c23uQEgIxjN/r4F0lA9qVZiYUUUaVAOAtcGNLHP2
 0CfO0j1zp0MRRmk98SE8skvh8okQnTudA9DQgbu4TomteiRa+Q989S4BsZVMGYGw4
 cM6KyaX1mfUWiuIxWw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=Byl2e815
Subject: [Buildroot] [PATCH v2 4/7] package/python-platformdirs: new package
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
Changes v1 -> v2:
* add missing dependency on host-python-hatch-vcs

 DEVELOPERS                                        |  1 +
 package/Config.in                                 |  1 +
 package/python-platformdirs/Config.in             |  7 +++++++
 .../python-platformdirs/python-platformdirs.hash  |  5 +++++
 .../python-platformdirs/python-platformdirs.mk    | 15 +++++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 package/python-platformdirs/Config.in
 create mode 100644 package/python-platformdirs/python-platformdirs.hash
 create mode 100644 package/python-platformdirs/python-platformdirs.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b4fa35a84c..91cae6cf2e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1122,6 +1122,7 @@ F:	package/panel-mipi-dbi-firmware/
 F:	package/python-aiomqtt/
 F:	package/python-markdown-it-py/
 F:	package/python-mdurl/
+F:	package/python-platformdirs/
 F:	package/python-pyasynchat/
 F:	package/python-pyasyncore/
 F:	support/testing/tests/package/sample_python_networkmanager_goi.py
diff --git a/package/Config.in b/package/Config.in
index 04041b11f2..3d343c3c91 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1285,6 +1285,7 @@ menu "External python modules"
 	source "package/python-pigpio/Config.in"
 	source "package/python-pillow/Config.in"
 	source "package/python-pip/Config.in"
+	source "package/python-platformdirs/Config.in"
 	source "package/python-pluggy/Config.in"
 	source "package/python-ply/Config.in"
 	source "package/python-portend/Config.in"
diff --git a/package/python-platformdirs/Config.in b/package/python-platformdirs/Config.in
new file mode 100644
index 0000000000..b0cde72585
--- /dev/null
+++ b/package/python-platformdirs/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_PLATFORMDIRS
+	bool "python-platformdirs"
+	help
+	  A small Python package for determining appropriate
+	  platform-specific dirs, e.g. a "user data dir".
+
+	  https://github.com/tox-dev/platformdirs
diff --git a/package/python-platformdirs/python-platformdirs.hash b/package/python-platformdirs/python-platformdirs.hash
new file mode 100644
index 0000000000..b35d10dba1
--- /dev/null
+++ b/package/python-platformdirs/python-platformdirs.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/platformdirs/json
+md5  90aef8202386996ce2e4b560a9f1d3e6  platformdirs-4.3.8.tar.gz
+sha256  3d512d96e16bcb959a814c9f348431070822a6496326a4be0911c40b5a74c2bc  platformdirs-4.3.8.tar.gz
+# Locally computed sha256 checksums
+sha256  29e0fd62e929850e86eb28c3fdccf0cefdf4fa94879011cffb3d0d4bed6d4db6  LICENSE
diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
new file mode 100644
index 0000000000..b24d6d78d8
--- /dev/null
+++ b/package/python-platformdirs/python-platformdirs.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-platformdirs
+#
+################################################################################
+
+PYTHON_PLATFORMDIRS_VERSION = 4.3.8
+PYTHON_PLATFORMDIRS_SOURCE = platformdirs-$(PYTHON_PLATFORMDIRS_VERSION).tar.gz
+PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/fe/8b/3c73abc9c759ecd3f1f7ceff6685840859e8070c4d947c93fae71f6a0bf2
+PYTHON_PLATFORMDIRS_SETUP_TYPE = hatch
+PYTHON_PLATFORMDIRS_LICENSE = MIT
+PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE
+PYTHON_PLATFORMDIRS_DEPENDENCIES = host-python-hatch-vcs
+
+$(eval $(python-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
