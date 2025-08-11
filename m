Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7FBECA0ED1
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 16:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EF3C61090;
	Mon, 11 Aug 2025 16:18:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mYAUOuuy9uSk; Mon, 11 Aug 2025 16:18:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 909E861446
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 909E861446;
	Mon, 11 Aug 2025 16:18:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B161E138
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A310383E55
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:18:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gqPP9GtJ-EZ0 for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 16:18:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3B59983E53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B59983E53
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B59983E53
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:18:35 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.127.180]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mel81-1uDoNB2C9t-00l1Wh; Mon, 11
 Aug 2025 18:18:32 +0200
To: buildroot@buildroot.org
Date: Mon, 11 Aug 2025 18:18:05 +0200
Message-ID: <20250811161809.3641323-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811161809.3641323-1-fiona.klute@gmx.de>
References: <20250811161809.3641323-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:6T8D/6DWCKWSQpRQKoyI0qX0cbE769NYFByLFDYbW+itci5yA0V
 yvWhvT7+9y3Hhxf/tdr5JOO0SzWyMAWhAJF29vUNTiBLR/c2DgSKZXFEdYbTR2lXgTBlRKv
 HlMFDeg/BpIxTqoIO2LedRX4+ZycC9NpXSQd0PdNxhOBLVY1RyiIvAiLS9T1ksY6u4mMXk1
 TQHH09eJiCx0Li1q/3BMw==
UI-OutboundReport: notjunk:1;M01:P0:LLUsEwe9OEs=;x/tV7HVqIxLaEuIm2v7l+qbiBxn
 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
 PWINEhz7SlA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1754929112; x=1755533912; i=fiona.klute@gmx.de;
 bh=tFNRmEbLvjYiZcLWprrS9S3c4G9RAgyG9AxQpXTDhRo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=rfPQ+m1Q9ka1CxdJ5SFtNmovNN3szY8KiwSlu46gFLberm+YJSGT2KnmjWGFI6tF
 5wQ3YGHMpumCpH+Zr3RBQ01ka1Uw5G3PNcPG0l5w6gWD6Yw69YY1S5cpe4Er8uZRv
 gm5zqTC/B0plGRU+lTy0OKNHZqxU2RiuBSO3iwFp7SKHMxIPNU+VcEreZOtYXiW/h
 cti57hKt1iM9Tberx7/cSiiMPiybP0K1VAgehRmxEma5TqbWqXZwpO3TAwfBEivKw
 XaMcE08JUMIaO0p3o5Bmy3HUkflc2Go0nvBRUYUbo1l8ysrJUSui0gr48BVrAeafm
 TPKonmBwkHc4KeCLUw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=rfPQ+m1Q
Subject: [Buildroot] [PATCH v2 3/7] package/python-markdown-it-py: new
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
index 8073742940..b4fa35a84c 100644
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
