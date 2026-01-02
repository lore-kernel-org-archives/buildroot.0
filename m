Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19AEFA3754
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 17:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13BF440876;
	Fri,  2 Jan 2026 17:16:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v0bZJ-1UgTj3; Fri,  2 Jan 2026 17:16:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA857406E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767374203;
	bh=8l/jxlUztiL5/OpSgkLmwXyuYMKzxM2FUK20mprTlGc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MGfmrVs8hTRbYdqDSxQLyJhWHoJ0wgVQKZyR8GjVvVtd2hHRaotQbk3sAO/L42M0s
	 v4kVB3DdHD+SlleoPupO0YIueRDTtoSBOT4SZc4D65Eqq3jh1WZe/9PjIaSjvJz7E2
	 C1Alkg0XXRTfihJmahu1zJrnjiAQ6B4tMMLUWE9nJaunM7gR0s+psFI1rtDl9Eym9I
	 5S/awe8tFzgO5T0oDBgxmVsKUwQRmRSLRPP8YF1U5DWhJ/ivCaRqv8D8sUUq7Hjki3
	 tMxNCzNl5zoxAt9+D6iAG1QEVgCLxtgTon+7HjYN84ubEV+5V/raImf1CNUvByFJUA
	 sG5onZKdeQMLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA857406E9;
	Fri,  2 Jan 2026 17:16:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 05DA019D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DED8D4000B
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:16:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YXW_3MWA7BJS for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 17:16:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F539401A2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F539401A2
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:16:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C0DC87D4D; Fri,  2 Jan 2026 17:16:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 18:10:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dc115ca708da277b138583caf725375749297e0d
X-Git-Newrev: b672e5dc74f37744114036d87c5a1e40859b5fe8
X-Patchwork-Hint: ignore
Message-Id: <20260102171640.1C0DC87D4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-mdurl: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b672e5dc74f37744114036d87c5a1e40859b5fe8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/python-mdurl/Config.in         |  7 +++++++
 package/python-mdurl/python-mdurl.hash |  5 +++++
 package/python-mdurl/python-mdurl.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a21d443482..176bb167f4 100644
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
index af0760536b..6ad14f006a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1221,6 +1221,7 @@ menu "External python modules"
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
