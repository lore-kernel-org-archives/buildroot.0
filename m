Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F5DAC433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 20:59:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7A70610D0
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 20:59:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A7A70610D0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53F0582B53;
	Thu, 21 Oct 2021 20:59:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bRQrgk4fKDPo; Thu, 21 Oct 2021 20:59:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92C828278F;
	Thu, 21 Oct 2021 20:59:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3B59C1BF9CB
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 20:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3771E401E1
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 20:59:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kDhHMjAjSigI for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 20:58:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C5C6400C9
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 20:58:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D30DC883BB; Thu, 21 Oct 2021 20:55:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 21 Oct 2021 22:37:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b7e8da22a314f0b7e2f15e3d1f1bef22ece17514
X-Git-Newrev: 8c17fd9a5ba8f02e39639b37e75e736bb6316bdb
X-Patchwork-Hint: ignore
Message-Id: <20211021205547.D30DC883BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-xmljson: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8c17fd9a5ba8f02e39639b37e75e736bb6316bdb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package is a dependency for pyndiff

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in                          |  1 +
 package/python-xmljson/Config.in           |  6 ++++++
 package/python-xmljson/python-xmljson.hash |  5 +++++
 package/python-xmljson/python-xmljson.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 08062cdcf1..3ccdf54b74 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1279,6 +1279,7 @@ menu "External python modules"
 	source "package/python-xlsxwriter/Config.in"
 	source "package/python-xlutils/Config.in"
 	source "package/python-xlwt/Config.in"
+	source "package/python-xmljson/Config.in"
 	source "package/python-xmltodict/Config.in"
 	source "package/python-xmodem/Config.in"
 	source "package/python-yarl/Config.in"
diff --git a/package/python-xmljson/Config.in b/package/python-xmljson/Config.in
new file mode 100644
index 0000000000..486f344361
--- /dev/null
+++ b/package/python-xmljson/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_XMLJSON
+	bool "python-xmljson"
+	help
+	  Converts XML into JSON/Python dicts/arrays and vice-versa.
+
+	  https://github.com/sanand0/xmljson
diff --git a/package/python-xmljson/python-xmljson.hash b/package/python-xmljson/python-xmljson.hash
new file mode 100644
index 0000000000..245a74a33e
--- /dev/null
+++ b/package/python-xmljson/python-xmljson.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/xmljson/json
+md5  fc4df2390ad209928ee4311a3540cb17  xmljson-0.2.1.tar.gz
+sha256  b4158e66aa1e62ee39f7f80eb2fe4f767670ba3c0d5de9804420dc53427fdec8  xmljson-0.2.1.tar.gz
+# Locally computed sha256 checksums
+sha256  5ce42ba7d76e81428bdacef83658eb6213dbd1ad4a3b6d380bb6e0e8c73f0fb7  LICENSE
diff --git a/package/python-xmljson/python-xmljson.mk b/package/python-xmljson/python-xmljson.mk
new file mode 100644
index 0000000000..913dce2670
--- /dev/null
+++ b/package/python-xmljson/python-xmljson.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-xmljson
+#
+################################################################################
+
+PYTHON_XMLJSON_VERSION = 0.2.1
+PYTHON_XMLJSON_SOURCE = xmljson-$(PYTHON_XMLJSON_VERSION).tar.gz
+PYTHON_XMLJSON_SITE = https://files.pythonhosted.org/packages/e8/6f/d9f109ba19be510fd3098bcb72143c67ca6743cedb48ac75aef05ddfe960
+PYTHON_XMLJSON_SETUP_TYPE = setuptools
+PYTHON_XMLJSON_LICENSE = MIT
+PYTHON_XMLJSON_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
