Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7940EFA3728
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 17:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28E9340593;
	Fri,  2 Jan 2026 17:16:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ALS1kdMN3uba; Fri,  2 Jan 2026 17:16:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DF614086B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767374205;
	bh=7RpCJmgiWlklluV08R53yFqCPcdALlIxt1alJ5E/IAk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kwoeHEhzfUZdxgCY3I7Acz8WNk0zu9wmTEctMDQbaFWw3+/xrvweVdJJU8tVvzBGv
	 ePznLxfESbL1U6fPryE9Boj+TPCpSjlQ7uxmS2eT8+u6IAE3EMajiQA/Iq5vXas1wh
	 vh9OJKD3/VPNE6FWiVR7qmi8fOAGp8YO6tlyoRotqeuisVcJ82/mIN/ctWzDaXQcWG
	 CTtb5olJUweb1b3Fcsml+851dmdVhKHzYP+IPE70umsImA2IC6xNFLMx9FJJspfY1X
	 y0JPboBI/labIiSiwpWquxdfWYM20Mk9UawZrfbRxVYpsO8rkAMIoRkM4hf3G/60o3
	 Pr2a0NrrXv+Kg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DF614086B;
	Fri,  2 Jan 2026 17:16:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 13CA4351
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF0C480E91
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:16:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sIqmxRH5Lrer for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 17:16:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D4EE80E63
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D4EE80E63
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:16:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 356FB8775A; Fri,  2 Jan 2026 17:16:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 18:11:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a8c7517320ca682a4e5383100d1afb13792a8ff2
X-Git-Newrev: 26bc4b51a808d73c09598035aa94f9c37b273218
X-Patchwork-Hint: ignore
Message-Id: <20260102171641.356FB8775A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-rich: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=26bc4b51a808d73c09598035aa94f9c37b273218
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/python-rich/Config.in        |  9 +++++++++
 package/python-rich/python-rich.hash |  5 +++++
 package/python-rich/python-rich.mk   | 14 ++++++++++++++
 5 files changed, 30 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 50fd6dd119..3b89a7c481 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1125,6 +1125,7 @@ F:	package/python-mdurl/
 F:	package/python-platformdirs/
 F:	package/python-pyasynchat/
 F:	package/python-pyasyncore/
+F:	package/python-rich/
 F:	support/testing/tests/package/sample_python_networkmanager_goi.py
 F:	support/testing/tests/package/sample_python_pyroute2.py
 F:	support/testing/tests/package/test_nftables.py
diff --git a/package/Config.in b/package/Config.in
index 6aadb3481b..f4a2a3bb95 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1371,6 +1371,7 @@ menu "External python modules"
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
