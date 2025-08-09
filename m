Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E8B9C87FCF
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 22:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45E51605AE;
	Sat,  9 Aug 2025 22:37:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0eFukXnBvAIA; Sat,  9 Aug 2025 22:37:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57C5F60640
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57C5F60640;
	Sat,  9 Aug 2025 22:37:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 29A0E31
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 22:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49BD881D34
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 22:37:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QEGG-8t-jZBz for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 22:37:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0A43181DA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A43181DA0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A43181DA0
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 22:37:49 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.119.120]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MatRT-1uCuD13qSB-00nGjW; Sun, 10
 Aug 2025 00:32:45 +0200
To: buildroot@buildroot.org
Date: Sun, 10 Aug 2025 00:32:28 +0200
Message-ID: <20250809223229.2307960-7-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250809223229.2307960-1-fiona.klute@gmx.de>
References: <20250809223229.2307960-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:UxcktJ+ZUOKxbUCMRc3qGgXaJmoB8udrVwdfx8gNeYtJQo28mmP
 YV4xf7aDRGLoP/kLm/iaMLKIzJqr+UAnc8OJBAB3R3hf7OLrz0gclixp1ApgG+Qrd9O4VTF
 tjBNAj/N0YZuCmBTwk358+Gvf9dQztMSra/SzjJn933bl3fth3DApnUZdsQKI/Hg8+t1LuO
 8CaKQfCj0bJNpY0zfOm0Q==
UI-OutboundReport: notjunk:1;M01:P0:zIEDK4adukw=;ufi7W+MdAHjmEENo2UYxbfbTru1
 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
 eLw0/akivMKI21nqqHuQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1754779068; x=1755383868; i=fiona.klute@gmx.de;
 bh=Qa+GlZ8fCwqoLIf90gffbtFhsO3zfKRJF+CFcyVpU6Q=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=fpGRrzitjE14J08GB+zpeabfH9qRVBVTjJ4Uwxsu+h0mAM6soasHXA75WcMvJCXv
 x282kNP8IZqGq0bvho0rT3GioYBL00VW3KAGH9Xl9g/V1NLonqMgOdgvmZe4jHhwY
 onpEIphxg7H5x4ONLuTeN8U2qGrURfpjV2ZuNFf4lahHQ+PNcQHdYp0cdzWYNH2Wv
 A9KMyIsgyENGIQPdNXmBMmw+Gw2CBr0rp8e0dxcAnRFSeW74DfeUnZhcvbtmPWzPV
 CeSpyfwXX3a/3DRkESQy2+gO12C2PWSjYEXzIunD3AYDQd2krB7xh0VfuECujeT3M
 Z68rFyvPf0d6vL5ghA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=fpGRrzit
Subject: [Buildroot] [PATCH 6/7] package/python-textual: new package
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
index 60ce3274aa..aeb4206543 100644
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
