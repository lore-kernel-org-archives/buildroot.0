Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A374FC87FCB
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 22:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 348CF81E17;
	Sat,  9 Aug 2025 22:37:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Te5Im5JS1eOB; Sat,  9 Aug 2025 22:37:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2469381DBF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2469381DBF;
	Sat,  9 Aug 2025 22:37:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BE2F831
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 22:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B00174077C
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 22:37:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8mVSbPecRIF0 for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 22:37:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5EAAE4013D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EAAE4013D
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5EAAE4013D
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 22:37:50 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.119.120]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M5fMY-1ui8IN3z58-009YGF; Sun, 10
 Aug 2025 00:32:42 +0200
To: buildroot@buildroot.org
Date: Sun, 10 Aug 2025 00:32:25 +0200
Message-ID: <20250809223229.2307960-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250809223229.2307960-1-fiona.klute@gmx.de>
References: <20250809223229.2307960-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:vSmPSYHsSHLKEUr5iMDrRcgZ1TB6jssIzsNAX+En+qhklcnN6zl
 9400gjA1wJQTdqTzsbB1+cSj0ujw4b0FCa1SOl0+HKQkOJvLQ823cqzyBv+dMW1eTYQ/8Jr
 WcDZDzvK7VTSRsw1cskcc+dONo5YL7S6M9ABvBt8C173VFDiAUYbwt4IdhaiVfhDzBPUvyd
 Op05tkUEvx8JZ1AwaoHNA==
UI-OutboundReport: notjunk:1;M01:P0:7UlwOvfp73Y=;/kI9oTpNE5Y3poTfAub551V1wia
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1754779068; x=1755383868; i=fiona.klute@gmx.de;
 bh=1+ZFaQLw8d72k+sfn8Ad51sdCz+hQz0exUWAOJj3MgA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Q52f74MORokMx4g2qm1QvWXLr2mZE5whyAgeQbtf4ULURsR6sJOTksq0wcoliHOc
 FRUmrwwYMChrZPPecAJXYqKaCBxyelOJk6aAeOIdGTsz5gujJK5OwXkPLfINY4iJM
 sYNpd/mfiMwgs3I22neEINCyX6PC6Wz2G7wgjQnWMHOTbroo0xmm8FElnHoME4/cn
 inVLUkoMGGHcInvYlZgxwkTRJW0+dL3HO9yhuWYq1tpzPJKOuyafige04Ll59Wewx
 QljQTuYSoVZLH4V6a3F1ynBn0YXTg2HKmHmE46KMKqFXSJ4cGquHEQiRGYopREU1J
 LF+IuaEwHyV9JxjEGA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=Q52f74MO
Subject: [Buildroot] [PATCH 3/7] package/python-markdown-it-py: new package
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
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/python-markdown-it-py/Config.in            |  7 +++++++
 .../python-markdown-it-py.hash                     |  6 ++++++
 .../python-markdown-it-py/python-markdown-it-py.mk | 14 ++++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 package/python-markdown-it-py/Config.in
 create mode 100644 package/python-markdown-it-py/python-markdown-it-py.hash
 create mode 100644 package/python-markdown-it-py/python-markdown-it-py.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 7325e0c5ba..50a02d2171 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1120,6 +1120,7 @@ N:	Fiona Klute <fiona.klute@gmx.de>
 F:	package/*/S*
 F:	package/panel-mipi-dbi-firmware/
 F:	package/python-aiomqtt/
+F:	package/python-markdown-it-py/
 F:	package/python-mdurl/
 F:	package/python-pyasynchat/
 F:	package/python-pyasyncore/
diff --git a/package/Config.in b/package/Config.in
index e9ce49e2df..04041b11f2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1228,6 +1228,7 @@ menu "External python modules"
 	source "package/python-magic-wormhole-transit-relay/Config.in"
 	source "package/python-mako/Config.in"
 	source "package/python-markdown/Config.in"
+	source "package/python-markdown-it-py/Config.in"
 	source "package/python-markdown2/Config.in"
 	source "package/python-markupsafe/Config.in"
 	source "package/python-marshmallow/Config.in"
diff --git a/package/python-markdown-it-py/Config.in b/package/python-markdown-it-py/Config.in
new file mode 100644
index 0000000000..b05a875bc9
--- /dev/null
+++ b/package/python-markdown-it-py/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_MARKDOWN_IT_PY
+	bool "python-markdown-it-py"
+	select BR2_PACKAGE_PYTHON_MDURL # runtime
+	help
+	  Python port of markdown-it. Markdown parsing, done right!
+
+	  https://github.com/executablebooks/markdown-it-py
diff --git a/package/python-markdown-it-py/python-markdown-it-py.hash b/package/python-markdown-it-py/python-markdown-it-py.hash
new file mode 100644
index 0000000000..bc28feea7d
--- /dev/null
+++ b/package/python-markdown-it-py/python-markdown-it-py.hash
@@ -0,0 +1,6 @@
+# md5, sha256 from https://pypi.org/pypi/markdown-it-py/json
+md5  a00d59ed2704f6590fdde0e9bad04c7c  markdown-it-py-3.0.0.tar.gz
+sha256  e3f60a94fa066dc52ec76661e37c851cb232d92f9886b15cb560aaada2df8feb  markdown-it-py-3.0.0.tar.gz
+# Locally computed sha256 checksums
+sha256  4a2260d6e2cd0f5a151a1e86dbfe7d3ed552b1e2beabf9941c1ba5c49cbce484  LICENSE
+sha256  792c48c5a849a15fdf9e37e8bcf9e6d1dd13b32b46c642a748a0a46a9919d473  LICENSE.markdown-it
diff --git a/package/python-markdown-it-py/python-markdown-it-py.mk b/package/python-markdown-it-py/python-markdown-it-py.mk
new file mode 100644
index 0000000000..aac0845185
--- /dev/null
+++ b/package/python-markdown-it-py/python-markdown-it-py.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-markdown-it-py
+#
+################################################################################
+
+PYTHON_MARKDOWN_IT_PY_VERSION = 3.0.0
+PYTHON_MARKDOWN_IT_PY_SOURCE = markdown-it-py-$(PYTHON_MARKDOWN_IT_PY_VERSION).tar.gz
+PYTHON_MARKDOWN_IT_PY_SITE = https://files.pythonhosted.org/packages/38/71/3b932df36c1a044d397a1f92d1cf91ee0a503d91e470cbd670aa66b07ed0
+PYTHON_MARKDOWN_IT_PY_SETUP_TYPE = flit
+PYTHON_MARKDOWN_IT_PY_LICENSE = MIT
+PYTHON_MARKDOWN_IT_PY_LICENSE_FILES = LICENSE LICENSE.markdown-it
+
+$(eval $(python-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
