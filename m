Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608D9C3DA6E
	for <buildroot@archiver.kernel.org>; Mon, 25 Dec 2023 20:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1630E40636;
	Mon, 25 Dec 2023 20:43:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1630E40636
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zR2xcirhjpVB; Mon, 25 Dec 2023 20:43:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F322140649;
	Mon, 25 Dec 2023 20:43:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F322140649
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3A1F31BF954
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 20:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F41840488
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 20:42:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F41840488
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w_lYhaJlDy_z for <buildroot@lists.busybox.net>;
 Mon, 25 Dec 2023 20:42:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 696CB40528
 for <buildroot@buildroot.org>; Mon, 25 Dec 2023 20:42:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 696CB40528
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A4F381662; Mon, 25 Dec 2023 20:42:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 25 Dec 2023 21:25:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d743c1027a5c633926f27d6edc801c569f7b953
X-Git-Newrev: ae9137661bc11aeb037f0c941d122b1511495729
X-Patchwork-Hint: ignore
Message-Id: <20231225204212.5A4F381662@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-httpx: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=ae9137661bc11aeb037f0c941d122b1511495729
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                      |  1 +
 package/python-httpx/Config.in         | 11 +++++++++++
 package/python-httpx/python-httpx.hash |  5 +++++
 package/python-httpx/python-httpx.mk   | 17 +++++++++++++++++
 4 files changed, 34 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index f9867bf2ca..98653ff29d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1115,6 +1115,7 @@ menu "External python modules"
 	source "package/python-html5lib/Config.in"
 	source "package/python-httpcore/Config.in"
 	source "package/python-httplib2/Config.in"
+	source "package/python-httpx/Config.in"
 	source "package/python-huepy/Config.in"
 	source "package/python-humanize/Config.in"
 	source "package/python-hwdata/Config.in"
diff --git a/package/python-httpx/Config.in b/package/python-httpx/Config.in
new file mode 100644
index 0000000000..592cd559cd
--- /dev/null
+++ b/package/python-httpx/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_HTTPX
+	bool "python-httpx"
+	select BR2_PACKAGE_PYTHON_ANYIO # runtime
+	select BR2_PACKAGE_PYTHON_CERTIFI # runtime
+	select BR2_PACKAGE_PYTHON_HTTPCORE # runtime
+	select BR2_PACKAGE_PYTHON_IDNA # runtime
+	select BR2_PACKAGE_PYTHON_SNIFFIO # runtime
+	help
+	  The next generation HTTP client.
+
+	  https://github.com/encode/httpx
diff --git a/package/python-httpx/python-httpx.hash b/package/python-httpx/python-httpx.hash
new file mode 100644
index 0000000000..fc4a68cf51
--- /dev/null
+++ b/package/python-httpx/python-httpx.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/httpx/json
+md5  f4dcf1002b2116c634a53534ce9d6776  httpx-0.25.2.tar.gz
+sha256  8b8fcaa0c8ea7b05edd69a094e63a2094c4efcb48129fb757361bc423c0ad9e8  httpx-0.25.2.tar.gz
+# Locally computed sha256 checksums
+sha256  4ec59d544f12b5f539a3a716fd321ac58ccd8030b465221f2c880200cdf28d8d  LICENSE.md
diff --git a/package/python-httpx/python-httpx.mk b/package/python-httpx/python-httpx.mk
new file mode 100644
index 0000000000..4227acec59
--- /dev/null
+++ b/package/python-httpx/python-httpx.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python-httpx
+#
+################################################################################
+
+PYTHON_HTTPX_VERSION = 0.25.2
+PYTHON_HTTPX_SOURCE = httpx-$(PYTHON_HTTPX_VERSION).tar.gz
+PYTHON_HTTPX_SITE = https://files.pythonhosted.org/packages/8c/23/911d93a022979d3ea295f659fbe7edb07b3f4561a477e83b3a6d0e0c914e
+PYTHON_HTTPX_SETUP_TYPE = pep517
+PYTHON_HTTPX_LICENSE = BSD-3-Clause
+PYTHON_HTTPX_LICENSE_FILES = LICENSE.md
+PYTHON_HTTPX_DEPENDENCIES = \
+	host-python-hatchling \
+	host-python-hatch-fancy-pypi-readme
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
