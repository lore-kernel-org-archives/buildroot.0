Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87685C87FCB
	for <buildroot@archiver.kernel.org>; Mon, 28 Jul 2025 13:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E86240E0E;
	Mon, 28 Jul 2025 13:01:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qHCuocoWODtg; Mon, 28 Jul 2025 13:01:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B10D040A49
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B10D040A49;
	Mon, 28 Jul 2025 13:01:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 12E0C151
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 13:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03ED381758
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 13:01:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QnUFnxfEbtEo for <buildroot@buildroot.org>;
 Mon, 28 Jul 2025 13:01:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=77.55.128.204;
 helo=mail.grinn-global.com; envelope-from=b.bilas@grinn-global.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7BE458175C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BE458175C
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7BE458175C
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 13:01:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (25)
Received: from bartekk-pc (ip-194.4.60.197.edial.pl [194.4.60.197])
 by server220076.nazwa.pl (Postfix) with ESMTP id 55EA51BCCB0;
 Mon, 28 Jul 2025 15:01:19 +0200 (CEST)
From: Bartosz Bilas <b.bilas@grinn-global.com>
To: buildroot@buildroot.org
Cc: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Mon, 28 Jul 2025 15:01:13 +0200
Message-ID: <20250728130118.18606-1-b.bilas@grinn-global.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=grinn-global.com
Subject: [Buildroot] [PATCH 1/6] package/python-mdurl: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 package/Config.in                      |  1 +
 package/python-mdurl/Config.in         |  6 ++++++
 package/python-mdurl/python-mdurl.hash |  5 +++++
 package/python-mdurl/python-mdurl.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-mdurl/Config.in
 create mode 100644 package/python-mdurl/python-mdurl.hash
 create mode 100644 package/python-mdurl/python-mdurl.mk

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
index 0000000000..32aaa09d67
--- /dev/null
+++ b/package/python-mdurl/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_MDURL
+	bool "python-mdurl"
+	help
+	  Markdown URL utilities.
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
