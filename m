Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9EACA0EC4
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 16:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C2E840E0A;
	Mon, 11 Aug 2025 16:18:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ezbphth63lqO; Mon, 11 Aug 2025 16:18:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21CCF41489
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21CCF41489;
	Mon, 11 Aug 2025 16:18:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 28405138
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CAFE40E0A
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:18:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bADFCOXIQMGg for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 16:18:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9B6BB40DD0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B6BB40DD0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B6BB40DD0
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:18:34 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.127.180]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M9Fnj-1uhu3U25fb-00FpR7; Mon, 11
 Aug 2025 18:18:31 +0200
To: buildroot@buildroot.org
Date: Mon, 11 Aug 2025 18:18:04 +0200
Message-ID: <20250811161809.3641323-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811161809.3641323-1-fiona.klute@gmx.de>
References: <20250811161809.3641323-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:zIxUOyfRwD67lE4JpzzQcsjCIBeBdUJxWitq8hiIlzA+QsbYls4
 FU3bJXarvDdk2fnDQT58gTt+8SqsfGN+oGs0H7duu+t/a8zEOUQkOH6ZhHB403C7k980D8Q
 FjYh2haXhNpvz/TkxHLeKOtFBfK9hqAK55wy+envPCyjKBRRJ+6kMpz+YVW+TkFeBu+kLwa
 YscBuBNFSx1r07Yl0xvGA==
UI-OutboundReport: notjunk:1;M01:P0:ZARgrQYOYXA=;8HxqjI3Q8oYWGvf5HU+4qhV0gDo
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1754929111; x=1755533911; i=fiona.klute@gmx.de;
 bh=kABgtgEdsyA75VYOtiZLHYzr2nWtnXiTaD7lBuMRzbc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=G53AymUuchqr0l26NxtaKZ4VTDoyPvV26aQIRt2E3qo34FiS4nX8/hznVD6WtYor
 AjeyfDU61a/NAMWI+uYHyc/P/q6kbpuzXrBfi83vzAhCbjHM7PWrUkJjwzeVps2Qp
 e7OdJiLwj+KzqPAT3gtKN8jn7NMhouxc0XGpdRxcnFfbB0iJyAVA7g8unucRrmmdF
 qlP4tfuHumKBasKtOpkZvFoJkFuv1fpbT2zApKJ9qi7RElU3YNTRUrSHsf2PVTcov
 zqsWew6Wmy6yFmQKNWX6QJgyW0W1FjKyA+HTvy6GJgCV+Nda4Q430lFi6fHL40YdV
 4kpXf7iqJhjIulJFVA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=G53AymUu
Subject: [Buildroot] [PATCH v2 2/7] package/python-mdurl: new package
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
index a28f3e8d57..8073742940 100644
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
