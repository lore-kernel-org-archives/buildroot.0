Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417E6C47074
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 21:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED274615D6;
	Thu,  4 Jan 2024 21:35:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED274615D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KX8JyG2wR0Dq; Thu,  4 Jan 2024 21:35:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34E3961AC7;
	Thu,  4 Jan 2024 21:35:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34E3961AC7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 026331BF977
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA2EB42E35
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:35:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA2EB42E35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jVd4wdI2CE9G for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 21:35:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EDBE842E2F
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 21:35:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDBE842E2F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C6F0B84150; Thu,  4 Jan 2024 21:35:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jan 2024 22:35:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f6cf18303119f5c481a135abaee67867b03d8d54
X-Git-Newrev: 206a9c11ac09d4264539b11ed0d45e6089d001a1
X-Patchwork-Hint: ignore
Message-Id: <20240104213553.C6F0B84150@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-trafaret: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=206a9c11ac09d4264539b11ed0d45e6089d001a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                            |  1 +
 package/python-trafaret/Config.in            |  7 +++++++
 package/python-trafaret/python-trafaret.hash |  5 +++++
 package/python-trafaret/python-trafaret.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 38c36428b9..a2cc80aa27 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1375,6 +1375,7 @@ menu "External python modules"
 	source "package/python-tomli/Config.in"
 	source "package/python-tornado/Config.in"
 	source "package/python-tqdm/Config.in"
+	source "package/python-trafaret/Config.in"
 	source "package/python-traitlets/Config.in"
 	source "package/python-treq/Config.in"
 	source "package/python-trio/Config.in"
diff --git a/package/python-trafaret/Config.in b/package/python-trafaret/Config.in
new file mode 100644
index 0000000000..73c7216b1e
--- /dev/null
+++ b/package/python-trafaret/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_TRAFARET
+	bool "python-trafaret"
+	help
+	  Ultimate transformation library that supports validation,
+	  contexts and aiohttp.
+
+	  https://github.com/Deepwalker/trafaret/
diff --git a/package/python-trafaret/python-trafaret.hash b/package/python-trafaret/python-trafaret.hash
new file mode 100644
index 0000000000..d0d54c9ff2
--- /dev/null
+++ b/package/python-trafaret/python-trafaret.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/trafaret/json
+md5  85085fe18dd133d3622a2f7a3b0acf6a  trafaret-2.1.1.tar.gz
+sha256  d9d00800318fbd343fdfb3353e947b2ebb5557159c844696c5ac24846f76d41c  trafaret-2.1.1.tar.gz
+# Locally computed sha256 checksums
+sha256  724f8da8a7161f07d9448aa37d1d5c4eb44b14727021c3b5d60a50ecf9a24771  LICENSE.txt
diff --git a/package/python-trafaret/python-trafaret.mk b/package/python-trafaret/python-trafaret.mk
new file mode 100644
index 0000000000..74d87a3d13
--- /dev/null
+++ b/package/python-trafaret/python-trafaret.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-trafaret
+#
+################################################################################
+
+PYTHON_TRAFARET_VERSION = 2.1.1
+PYTHON_TRAFARET_SOURCE = trafaret-$(PYTHON_TRAFARET_VERSION).tar.gz
+PYTHON_TRAFARET_SITE = https://files.pythonhosted.org/packages/c9/ed/aac034e566f8846aee6472dcc90da6011a0b1829e3ffc768407df519a3b0
+PYTHON_TRAFARET_SETUP_TYPE = setuptools
+PYTHON_TRAFARET_LICENSE = BSD-2-Clause
+PYTHON_TRAFARET_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
