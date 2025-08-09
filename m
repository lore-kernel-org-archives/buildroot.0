Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DBCC87FCB
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 22:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A25560E1D;
	Sat,  9 Aug 2025 22:37:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8quURS358BEO; Sat,  9 Aug 2025 22:37:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8204960E46
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8204960E46;
	Sat,  9 Aug 2025 22:37:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C146154
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 22:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B34F81D72
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 22:37:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dpTQQdvxTx6g for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 22:37:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2BBD381D3D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BBD381D3D
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2BBD381D3D
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 22:37:48 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.119.120]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MiaYJ-1u5EB53saV-00mAnS; Sun, 10
 Aug 2025 00:32:41 +0200
To: buildroot@buildroot.org
Date: Sun, 10 Aug 2025 00:32:24 +0200
Message-ID: <20250809223229.2307960-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250809223229.2307960-1-fiona.klute@gmx.de>
References: <20250809223229.2307960-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Aac7RW+ylMlNICvqtkKZTXJeE5T48zcgNnAlSwZCQtOyW4nO8m6
 9nzwl+tLVkGYc+K9BFfvNw6rU3/UI5aOCl5IOjtLq/CtZ+0AR5hi4q3KFtMq9iv6KhNTyZm
 EP/JV11QsyccmahoY7fwC1EAzybZNu66xdAekicTzEcx5Tko5g5CjADOIH9XrBnGfTEuiTg
 6KAYTCnGpulGPIsnZd8hQ==
UI-OutboundReport: notjunk:1;M01:P0:15mJ5lORFC0=;geaqBbeBDuVKfzo/o80JuyuO7ki
 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
 Z1h0vDNzxOGBQHBCPTOhQ0N+O13Tw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1754779067; x=1755383867; i=fiona.klute@gmx.de;
 bh=9+Wv59L0LDl7dFJufCnkYOVI09s2dHSfl8rX4aeIbvg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=BRHH985FoegJ5tdVILU8jp4rIP/eV8LcMNT3aVx8xQNFXt96OAPpOJsvEkuRyRVY
 TYuSAqNrC0KlsuKEzYL5wGsma/Qc/J6+toxO9C7VaXMIZ6SpHCgwNOypesfeuRf++
 DFQx0rrMNfaIL9S/g0z6PNY59v5pJUkVE5YjsP0PdYx1bh4xDP8yf65dUYbaHv6XQ
 msnKuGVyZxGvRQYCI/TyfRu/b/K8ahV+xriVbwG4300Okx3ZI02dFhb1ZjtAs8BSL
 x/4MZ9/Cc2YJquKXU7GOlOtq077u/wsX8CCaeyrqfxMbS4fFONz5UbjJ3h8lCiyPO
 +Yd/kqM3D9hOtPXxXA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=BRHH985F
Subject: [Buildroot] [PATCH 2/7] package/python-mdurl: new package
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
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/python-mdurl/Config.in         |  7 +++++++
 package/python-mdurl/python-mdurl.hash |  5 +++++
 package/python-mdurl/python-mdurl.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/python-mdurl/Config.in
 create mode 100644 package/python-mdurl/python-mdurl.hash
 create mode 100644 package/python-mdurl/python-mdurl.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 12a41597af..7325e0c5ba 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1120,6 +1120,7 @@ N:	Fiona Klute <fiona.klute@gmx.de>
 F:	package/*/S*
 F:	package/panel-mipi-dbi-firmware/
 F:	package/python-aiomqtt/
+F:	package/python-mdurl/
 F:	package/python-pyasynchat/
 F:	package/python-pyasyncore/
 F:	support/testing/tests/package/sample_python_networkmanager_goi.py
diff --git a/package/Config.in b/package/Config.in
index 137f74ed82..e9ce49e2df 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1235,6 +1235,7 @@ menu "External python modules"
 	source "package/python-matplotlib/Config.in"
 	source "package/python-matplotlib-inline/Config.in"
 	source "package/python-mbstrdecoder/Config.in"
+	source "package/python-mdurl/Config.in"
 	source "package/python-memory-profiler/Config.in"
 	source "package/python-midiutil/Config.in"
 	source "package/python-mimeparse/Config.in"
diff --git a/package/python-mdurl/Config.in b/package/python-mdurl/Config.in
new file mode 100644
index 0000000000..6daf4d39c4
--- /dev/null
+++ b/package/python-mdurl/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_MDURL
+	bool "python-mdurl"
+	help
+	  This is a Python port of the JavaScript mdurl package, used by
+	  markdown-it-py.
+
+	  https://github.com/executablebooks/mdurl
diff --git a/package/python-mdurl/python-mdurl.hash b/package/python-mdurl/python-mdurl.hash
new file mode 100644
index 0000000000..932813e9f6
--- /dev/null
+++ b/package/python-mdurl/python-mdurl.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/mdurl/json
+md5  f18eca6522b438354be2378f216a5a94  mdurl-0.1.2.tar.gz
+sha256  bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba  mdurl-0.1.2.tar.gz
+# Locally computed sha256 checksums
+sha256  7c605df6e28667a9603118e98274f64a49ce3eed0d26fccce9534a345e0ef955  LICENSE
diff --git a/package/python-mdurl/python-mdurl.mk b/package/python-mdurl/python-mdurl.mk
new file mode 100644
index 0000000000..c6ed397438
--- /dev/null
+++ b/package/python-mdurl/python-mdurl.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-mdurl
+#
+################################################################################
+
+PYTHON_MDURL_VERSION = 0.1.2
+PYTHON_MDURL_SOURCE = mdurl-$(PYTHON_MDURL_VERSION).tar.gz
+PYTHON_MDURL_SITE = https://files.pythonhosted.org/packages/d6/54/cfe61301667036ec958cb99bd3efefba235e65cdeb9c84d24a8293ba1d90
+PYTHON_MDURL_SETUP_TYPE = flit
+PYTHON_MDURL_LICENSE = MIT
+PYTHON_MDURL_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
